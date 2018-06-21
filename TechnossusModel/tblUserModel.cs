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
		public string Address { get; set; }
		public string Skill { get; set; }
	}
	public class JsonUserModel
	{
		public string SkillIds { get; set; }
		public string Name { get; set; }
		public string Address { get; set; }
		
	}
}
