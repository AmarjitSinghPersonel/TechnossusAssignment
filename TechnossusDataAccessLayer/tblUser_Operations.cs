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
		//Same funvction will work for search and get All User List
		public List<tblUserModel> getUserList(string name = "", string skill = "")
		{
			try
			{
				#region FunctionBody
				dynamic lst;
				List<tblUserModel> usrLst = new List<tblUserModel>();
				if (name != "" && skill != "")
				{
					lst = from tu in dbEntities.tblUsers
						  join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId
						  join ts in dbEntities.tblSkills on tul.skillId equals ts.Id
						  where tu.Name.Contains("%/" + name + "/%") && ts.skill.Contains("%/" + skill + "/%")
						  select new { tu.Id, tu.Name, ts.skill, tu.Address };
				}
				else if (name != "")
				{
					lst = from tu in dbEntities.tblUsers
						  join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId
						  join ts in dbEntities.tblSkills on tul.skillId equals ts.Id
						  where tu.Name.Contains("%/" + name + "/%")
						  select new { tu.Id, tu.Name, ts.skill, tu.Address };
				}
				else if (skill != "")
				{
					lst = from tu in dbEntities.tblUsers
						  join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId
						  join ts in dbEntities.tblSkills on tul.skillId equals ts.Id
						  where ts.skill.Contains("%/" + skill + "/%")
						  select new { tu.Id, tu.Name, ts.skill, tu.Address };
				}
				else
				{
					lst = from tu in dbEntities.tblUsers
						  join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId
						  join ts in dbEntities.tblSkills on tul.skillId equals ts.Id
						  select new { tu.Id, tu.Name, ts.skill,tu.Address };
				}

				//We can also achive the same with a complex sql query or stored procedure
				foreach (var t in lst)
				{
					tblSkillModel obj = new tblSkillModel();
					tblUserModel objUsr = new tblUserModel();
					
					obj.Id = t.Id;
					obj.Skill = t.skill;
					if (usrLst.Any(a => a.Id == t.Id))
					{
						var tempObj = usrLst.Where(a => a.Id == t.Id).FirstOrDefault();
						tempObj.Skill = tempObj.Skill + "," + t.skill;
					}
					else {
						// We can also achive this by creating constructer in class tblUserModel
						objUsr.Id = t.Id;
						objUsr.Name = t.Name;
						objUsr.Skill = t.skill;
						objUsr.Address = t.Address;
						usrLst.Add(objUsr);
					}

				}
				return usrLst;
				#endregion
			}
			catch (Exception ex)
			{

				throw;
			}
		}
	}
}
