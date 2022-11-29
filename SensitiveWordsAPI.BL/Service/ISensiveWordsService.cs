namespace SensitiveWordsAPI.BL.Service
{
    public interface ISensiveWordsService
    {
        public string MaskSensitiveWords(string sensitiiveText, string connction);
    }
      
}
