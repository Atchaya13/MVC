﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineQuestionnaireApplication.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class QuestionnaireApplicationEntities7 : DbContext
    {
        public QuestionnaireApplicationEntities7()
            : base("name=QuestionnaireApplicationEntities7")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AnswerDetail> AnswerDetails { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<ResultDetail> ResultDetails { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
    }
}