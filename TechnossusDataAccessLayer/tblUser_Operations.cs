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
		public List<tblUser> getUserList()
		{
			
			var lst= from tu in dbEntities.tblUsers join tul in dbEntities.tblUserSkillLinks on tu.Id equals tul.userId 
			return
		}
	}
}
