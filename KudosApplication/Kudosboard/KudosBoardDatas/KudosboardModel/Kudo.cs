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
    
    public partial class Kudo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kudo()
        {
            this.KudoRecipients = new HashSet<KudoRecipient>();
            this.Posts = new HashSet<Post>();
        }
    
        public int Id { get; set; }
        public int Occasion { get; set; }
        public int CreatedByUserId { get; set; }
        public string Title { get; set; }
        public string ReceipientName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KudoRecipient> KudoRecipients { get; set; }
        public virtual Occation Occation { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Post> Posts { get; set; }
    }
}
