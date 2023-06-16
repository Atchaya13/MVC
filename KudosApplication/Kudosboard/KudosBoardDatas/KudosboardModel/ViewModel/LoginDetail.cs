using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KudosBoardDatas.KudosboardModel.ViewModel
{
    public class LoginDetail
    {
        [Required(ErrorMessage = "Enter Your User name")]
        public string UserName { get; set; }
    }
}
