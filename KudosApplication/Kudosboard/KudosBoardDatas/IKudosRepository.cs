using KudosBoardDatas.KudosboardModel.ViewModel;
using KudosBoardDatas.KudosboardModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KudosBoardDatas
{
    public interface IKudosRepository
    {
        User CheckUser(LoginDetail loginDetail);
        List<BoardVM> GetBoards();
        List<Occation> GetOccation();
        int AddKudos(Kudo kudo);
        User CheckRecepient(string name);
        void AddReceipient(KudoRecipient kudoRecipient);
        Kudo GetKudoTitle(int kudoId);
        void AddPost(Post post);
        List<Post> GetPosts(int kudoId);
    }
}
