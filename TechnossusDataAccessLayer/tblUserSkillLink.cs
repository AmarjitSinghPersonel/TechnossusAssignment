//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TechnossusDataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblUserSkillLink
    {
        public int Id { get; set; }
        public int userId { get; set; }
        public int skillId { get; set; }
    
        public virtual tblSkill tblSkill { get; set; }
        public virtual tblUser tblUser { get; set; }
    }
}