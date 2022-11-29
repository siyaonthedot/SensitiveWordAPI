using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using SensitiveWordsAPI.Model;
using SensitiveWordsAPI.DAL.Utility;
using SensitiveWordsAPI.DAL.Repository;
using SensitiveWordsAPI.BL.Service;
using System;
using Microsoft.AspNetCore.Cors;
using SensitiveWordsAPI.DAL.Entities;
using AutoMapper;
using System.Collections.Generic;
using System.Collections;
using System.Threading.Tasks;

namespace SensitiveWordsAPI.Controllers
{
    [Produces("application/json")]
    [Route("api/SensitiveWord")]

    public class SensitiveWordController : Controller
    {

        private readonly IOptions<AppSettings> appSettings;
        private readonly ISensiveWordsService _sensiveWordsService;
        private readonly ICacheService _cacheService;
        private readonly IWordsRepostitory _wordsRepostitory;
        private readonly IMapper _mapper;


        public SensitiveWordController(IOptions<AppSettings> appSettings,
            ISensiveWordsService sensiveWordsService, IWordsRepostitory wordsRepostitory,
            IMapper mapper, ICacheService cacheService)
        {
            this.appSettings = appSettings;
            this._sensiveWordsService = sensiveWordsService;
            this._wordsRepostitory = wordsRepostitory;
            this._mapper = mapper;
            _cacheService = cacheService;
        }

        [HttpPost]
        [Route("MaskSensitiveWords")]
        public IActionResult MaskSensitiveWords(string textMessage)
        {    
            var data = _sensiveWordsService.MaskSensitiveWords(textMessage, appSettings.Value.DbConn);

            if (data.Contains("*"))
            {
                return Ok(data);

            }
            return NotFound(data);
        }
        [EnableCors("AllowOrigin")]
        [HttpGet]
        [Route("GetAllSensitiveWords")]
        public IActionResult GetAllSensitiveWords()
        {
 
            var data = _wordsRepostitory.GetAllSensitiveWords(appSettings.Value.DbConn);
            var expirationTime = DateTimeOffset.Now.AddMinutes(1.0);

            return Ok(data);
        }
        [EnableCors("AllowOrigin")]
        [HttpGet]
        [Route("GetSensitiveWordByID")]
        public IActionResult GetSensitiveWordByID(int Id)
        {
            var data = _wordsRepostitory.GetSensitiveWord(Id,appSettings.Value.DbConn);
            var expirationTime = DateTimeOffset.Now.AddMinutes(1.0);
            return Ok(data);
        }


        [EnableCors("AllowOrigin")]
        [HttpPost]
        [Route("SaveSensitiveWord")]
        public IActionResult SaveSensitiveWord([FromBody] SensitiveWordsModel model)
        {
            var commandModel = _mapper.Map<SensitiveWord>(model);
            var data = _wordsRepostitory.SaveSensitiveWord(commandModel, appSettings.Value.DbConn);

            if (data == "C200")
            {
                return Ok(data);
            }
  
            return NotFound(data);
        }

        [EnableCors("AllowOrigin")]
        [HttpPut]
        [Route("UpdateSensitiveWord")]
        public IActionResult UpdateSensitiveWord([FromBody] SensitiveWordsModel model)
        {
            var commandModel = _mapper.Map<SensitiveWord>(model);
            var data = _wordsRepostitory.UpdateSensitiveWord(commandModel, appSettings.Value.DbConn);
            if (data == "C200")
            {
                return Ok(data);
            }

            return NotFound(data);
      
        }

        [EnableCors("AllowOrigin")]
        [HttpDelete]
        [Route("DeleteSensitiveWord")]
        public IActionResult DeleteSensitiveWord(int id)
        {
            var data = _wordsRepostitory.DeleteSensitiveWord(id, appSettings.Value.DbConn);
            if (data == "C200")
            {
                return Ok(data);
            }
            return NotFound(data);
        }


    }
}
