using SensitiveWordsAPI.Model;
using AutoMapper;
using SensitiveWordsAPI.DAL.Entities;

namespace SensitiveWordsAPI.DTO
{

    public class SensitiveWordProfile : Profile
    {

        public SensitiveWordProfile()
        {
            CreateMap<SensitiveWordsModel, SensitiveWord>();
        }

    }
}
