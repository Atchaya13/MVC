using KudosBoardDatas;
using KudosBoardDatas.KudosboardModel.ViewModel;
using KudosBoardDatas.KudosboardModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KudosService
{
   
    public class KudosLogics:IKudosLogics
    {
        private KudosRepository _IKudosData;
        public KudosLogics(KudosRepository kudos)
        {
            _IKudosData = kudos;
        }
        public User CheckUser(LoginDetail loginDetail)
        {
            User user=_IKudosData.CheckUser(loginDetail);
            return user;
        }
        public List<BoardVM> GetBoard()
        {
            List<BoardVM> boardView =  _IKudosData.GetBoards();
          return boardView;
        }
        public List<Occation> GetOccation()
        {
            List<Occation> occations= _IKudosData.GetOccation();
            return occations;
        }
        public int AddKudos(Kudo kudo)
        {
          int id=  _IKudosData.AddKudos(kudo);
            return id;
        }
        public User CheckRecepient(string name)
        {
         User recepient=   _IKudosData.CheckRecepient(name);
            return recepient;
        }
        public void AddReceipient(KudoRecipient kudoRecipient)
        {
            _IKudosData.AddReceipient(kudoRecipient);
        }
        public Kudo GetKudoTitle(int kudoId)
        {
            Kudo kudo = _IKudosData.GetKudoTitle(kudoId);
            return kudo;
        }
        public void AddPost(Post post)
        {
            _IKudosData.AddPost(post);
        }
        public List<Post> GetPosts(int kudoId)
        {
            List<Post> posts= _IKudosData.GetPosts(kudoId);
            return posts;
        }
    }
}
