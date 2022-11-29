using SensitiveWordsAPI.DAL.Utility;
using System.Collections.Generic;
using System.Data.SqlClient;
using SensitiveWordsAPI.DAL.Entities;

namespace SensitiveWordsAPI.DAL.Translators
{
    public  static class SensitiveWordsTranslator
    {
        public static SensitiveWord TranslateAsSensitiveWord(this SqlDataReader reader, bool isList = false)
        {
            if (!isList)
            {
                if (!reader.HasRows)
                    return null;
                reader.Read();
            }
            var item = new SensitiveWord();
            if (reader.IsColumnExists("Id"))
                item.Id = SqlHelper.GetNullableInt32(reader, "Id");

            if (reader.IsColumnExists("WordContext"))
                item.WordContext = SqlHelper.GetNullableString(reader, "WordContext");

        

            return item;
        }


        public static List<SensitiveWord> TranslateAsSensitiveWordList(this SqlDataReader reader)
        {
            var list = new List<SensitiveWord>();
            while (reader.Read())
            {
                list.Add(TranslateAsSensitiveWord(reader, true));
            }
            return list;
        }

        public static SensitiveWord TranslateAsSensitiveWord(this SqlDataReader reader)
        {    
            
            return TranslateAsSensitiveWord(reader, true);
        }
    }
}
