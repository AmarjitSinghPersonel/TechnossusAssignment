using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnossusModel
{
    public class tblUserModel
    {
		public int Id { get; set; }
		public string Name { get; set; }
		public List<tblSkillModel> Skill { get; set; }
	}
}
