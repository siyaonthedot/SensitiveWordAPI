using System.Collections.Generic;
using System.Threading.Tasks;
using SensitiveWordsAPI.DAL.Entities;

namespace SensitiveWordsAPI.DAL.Repository
{
    public interface IWordsRepostitory 
    {
        List<SensitiveWord> GetAllSensitiveWords(string connString);
        SensitiveWord GetSensitiveWord(int Id,string connString);
        string SaveSensitiveWord(SensitiveWord model, string connString);
        string UpdateSensitiveWord(SensitiveWord model, string connString);
        string DeleteSensitiveWord(int id, string connString);
    }
}
