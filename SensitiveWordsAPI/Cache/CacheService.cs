using Newtonsoft.Json;
//using SensitiveWordsAPI.Service;
using StackExchange.Redis;
using System;
using System.Text.Json.Serialization;
using SensitiveWordsAPI.DAL.Utility;
using System.Text;
using System.Collections.Generic;
using SensitiveWordsAPI.DAL.Entities;
using System.Linq;

namespace SensitiveWordsAPI.BL.Service
{
    public class CacheService : ICacheService
    {
        private IDatabase _db;
        public CacheService()
        {
            ConfigureRedis();
        }
        private void ConfigureRedis()
        {
            _db = ConnectionHelper.Connection.GetDatabase();
        }
        public T GetData<T>(string key)
        {
            var value = _db.StringGet(key);
            if (!string.IsNullOrEmpty(value))
            {
                return JsonConvert.DeserializeObject<T>(value);
            }
            return default;
        }
        public bool SetData<T>(string key, T value, DateTimeOffset expirationTime)
        {
            TimeSpan expiryTime = expirationTime.DateTime.Subtract(DateTime.Now);
            var isSet = _db.StringSet(key, JsonConvert.SerializeObject(value), expiryTime);
            return isSet;
        }
        public object RemoveData(string key)
        {
            bool _isKeyExist = _db.KeyExists(key);
            if (_isKeyExist == true)
            {
                return _db.KeyDelete(key);
            }
            return false;
        }

        public string CachedMaskSensitiveWords(string sensitriveText, IEnumerable<SensitiveWord> data)
        {
            var sensitriveTextWords = sensitriveText.Split(" ");
            StringBuilder maskWord = new StringBuilder();

            List<string> wordsList = new List<string>();
            foreach (var item in sensitriveTextWords)
            {

                var word = data.Where(x => x.WordContext == item.ToUpper()).FirstOrDefault()?.WordContext;

                if (word != null)
                {
                    maskWord.Append(word.Mask(0, word.Length));
                    maskWord.Append(" ");
                }
                else
                {
                    maskWord.Append(item);
                    maskWord.Append(" ");
                }
            }

            return maskWord.ToString();

        }

    }
}
