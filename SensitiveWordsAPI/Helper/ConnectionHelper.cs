using Microsoft.Extensions.Configuration;
using StackExchange.Redis;
using System;
using System.Configuration;

namespace SensitiveWordsAPI.Helper
{
    public class ConnectionHelper
    {
        static ConnectionHelper()
        {
            lazyConnection = new Lazy<ConnectionMultiplexer>(() =>
            {
                return ConnectionMultiplexer.Connect(ConfigurationManager.AppSetting["RedisURL"]);
            });
        }
        private static Lazy<ConnectionMultiplexer> lazyConnection;
        public static ConnectionMultiplexer Connection
        {
            get
            {
                return lazyConnection.Value;
            }
        }
    }
}
