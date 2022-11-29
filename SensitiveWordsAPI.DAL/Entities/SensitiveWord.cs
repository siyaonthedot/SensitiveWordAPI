using System.Runtime.Serialization;
using System.Xml.Linq;

namespace SensitiveWordsAPI.DAL.Entities
{

    public class SensitiveWord
    {


        public int Id { get; set; }
        public string WordContext { get; set; }

    }
}
