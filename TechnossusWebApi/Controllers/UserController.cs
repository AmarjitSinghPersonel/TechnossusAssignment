using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TechnossusDataAccessLayer;
using TechnossusModel;
using Newtonsoft.Json;
using System.Web.Http.Cors;


namespace TechnossusWebApi.Controllers
{
	//[Authorize]
	[EnableCors(origins: "http://localhost:8119", headers: "*", methods: "*")]
	public class UserController : ApiController
    {
		tblUser_Operations tblusr = new tblUser_Operations();
		// GET api/values
		[Route("Api/TechnosusApi/Get")]
		
		public string Get()
        {
			
			List<tblUserModel> lst	= tblusr.getUserList("", "");
			JsonSerializer serializer = new JsonSerializer();
			string output = JsonConvert.SerializeObject(lst);
			
			return output;
        }

		// GET api/values/5
		[Route("Api/TechnosusApi/GetFilter/{Name}/{skill}")]
		
		public string Get(string Name,string skill)
        {
			List<tblUserModel> lst = tblusr.getUserList(Name, skill);
			JsonSerializer serializer = new JsonSerializer();
			string output = JsonConvert.SerializeObject(lst);

			return output;
		}
		[Route("Api/TechnosusApi/GetSkill")]
		public string GetSkill()
		{

			List<tblSkillModel> lst = tblusr.getSkillSet();
			JsonSerializer serializer = new JsonSerializer();
			string output = JsonConvert.SerializeObject(lst);

			return output;
		}
		// POST api/values
		[Route("Api/TechnosusApi/SaveUser")]
		public void Post(JsonUserModel value)
        {
			tblusr.saveUser(value);
		}

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
