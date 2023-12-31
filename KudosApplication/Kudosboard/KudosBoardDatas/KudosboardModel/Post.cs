//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KudosBoardDatas.KudosboardModel
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using System.ComponentModel.DataAnnotations;

    public partial class Post
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public Nullable<int> PostOwnerId { get; set; }
        public Nullable<int> KudoId { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public string ImageName { get; set; }
        public byte[] ImageData { get; set; }
        public virtual Kudo Kudo { get; set; }
        public virtual User User { get; set; }
    }
}
