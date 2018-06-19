using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnossusModel;

namespace TechnossusDataAccessLayer
{
	public class tblUser_Operations
	{
		TechnossusDbEntities dbEntities = new TechnossusDbEntities();
		public tblUserModel getUser(Int32 userId)
		{
			tblUserModel usr = new tblUserModel();
			return usr;
		}
		public List<tblUserModel> getUserList()
		{
			List<tblUserModel> usrLst = new List<tblUserModel>();
			var lst = from tu in dbEntities.tblUsers
					  join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId
					  join ts in dbEntities.tblSkills on tul.skillId equals ts.Id
					  select new { tu.Id, tu.Name, ts.skill };
			//We can also achive the same with a complex sql query or stored procedure
			foreach (var t in lst)
			{
				tblSkillModel obj = new tblSkillModel();
				tblUserModel objUsr = new tblUserModel();
				if (usrLst.Count>0)
				{
					// We can also achive this by creating constructer in class tblSkillModel
					obj.Id = t.Id;
					obj.Skill = t.skill;
					// We can also achive this by creating constructer in class tblUserModel
					objUsr.Id = t.Id;
					objUsr.Name = t.Name;
					objUsr.Skill.Add(obj);
					usrLst.Add(objUsr);
				}
				else
				{
					if(usrLst.Any(a=>a.Id==t.Id))
					{				
						
						usrLst.Where(a => a.Id == t.Id).FirstOrDefault().Skill.Add(obj);						
					}
					else
					{
						// We can also achive this by creating constructer in class tblSkillModel
						obj.Id = t.Id;
						obj.Skill = t.skill;
						// We can also achive this by creating constructer in class tblUserModel
						objUsr.Id = t.Id;
						objUsr.Name = t.Name;
						objUsr.Skill.Add(obj);
						usrLst.Add(objUsr);
					}
				}
			}
			return usrLst;
		}
	}
}
