using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KudosBoardDatas.KudosboardModel.ViewModel
{

    public class BoardVM
    {
        public int Id { get; set; }
        public int userId { get; set; }
        public string Name { get; set; }
        public string CreatedBy { get; set; }
        public string Receipient { get; set; }

    }
    //public class BoardViewModel
    //{
    //    public List<BoardVM> Boards { get; set; }
    //    public List<string> Receipient { get; set; }
    //}
}
