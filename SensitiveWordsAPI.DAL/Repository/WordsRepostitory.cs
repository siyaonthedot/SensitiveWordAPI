using SensitiveWordsAPI.DAL.Utility;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using SensitiveWordsAPI.DAL.Entities;
using SensitiveWordsAPI.DAL.Translators;
using System.Linq;
using System.Threading.Tasks;

namespace SensitiveWordsAPI.DAL.Repository
{
    public class WordsRepostitory : IWordsRepostitory
    {

        public List<SensitiveWord> GetAllSensitiveWords(string connString)
        {
        
            return SqlHelper.ExtecuteProcedureReturnData<List<SensitiveWord>>(connString,
                "GetSensitiveWords", r => r.TranslateAsSensitiveWordList());
        }

        public SensitiveWord GetSensitiveWord( int Id, string connString)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", Id)
                          
            };
            return SqlHelper.ExtecuteProcedureReturnData<List<SensitiveWord>>(connString,
                "GetSensitiveWords", r => r.TranslateAsSensitiveWordList()).Where(w => w.Id == Id).FirstOrDefault(); 
        }

        public string SaveSensitiveWord(SensitiveWord model, string connString)
        {
            var outParam = new SqlParameter("@ReturnCode", SqlDbType.NVarChar, 20)
            {
                Direction = ParameterDirection.Output
            };
            SqlParameter[] param = {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@WordContext",model.WordContext),
        
                outParam
            };
            SqlHelper.ExecuteProcedureReturnString(connString, "SaveSensitiveWord", param);
            return (string)outParam.Value;
        }

        public string UpdateSensitiveWord(SensitiveWord model, string connString)
        {
            var outParam = new SqlParameter("@ReturnCode", SqlDbType.NVarChar, 20)
            {
                Direction = ParameterDirection.Output
            };
            SqlParameter[] param = {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@WordContext",model.WordContext),

                outParam
            };
            SqlHelper.ExecuteProcedureReturnString(connString, "UpdatedSensitiveWord", param);
            return (string)outParam.Value;
        }

        public string DeleteSensitiveWord(int Id, string connString)
        {
            var outParam = new SqlParameter("@ReturnCode", SqlDbType.NVarChar, 20)
            {
                Direction = ParameterDirection.Output
            };
            SqlParameter[] param = {
                new SqlParameter("@Id",Id),            
                outParam
            };
            SqlHelper.ExecuteProcedureReturnString(connString, "DeletSensitiveWord", param);
            return (string)outParam.Value;
        }

    }
}
