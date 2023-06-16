using KudosBoardDatas.KudosboardModel.ViewModel;
using KudosBoardDatas.KudosboardModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography.X509Certificates;
using System.Data;
using System.Globalization;
using System.Xml.Linq;

namespace KudosBoardDatas
{
    public class KudosRepository:IKudosRepository
    {
        KudosDBEntitiesNew KudosDBEntities = new KudosDBEntitiesNew();
        public  User CheckUser(LoginDetail loginDetail)
        {
            var userData = KudosDBEntities.Users.Where(x => x.FirstName == loginDetail.UserName).FirstOrDefault();
            return userData;
        }
        public List<BoardVM> GetBoards()
        {
            var boardDatas = KudosDBEntities.Kudos.Join(KudosDBEntities.Users, kudos => kudos.CreatedByUserId, user => user.Id, (kudos, user) => new { kudos, user }).
              Select(s => new
            {
                  kudoId=s.kudos.Id,
                  userId=s.kudos.CreatedByUserId,
                name=s.kudos.Title,
                creater=s.user.FirstName
               
            }).OrderBy(x=>x.kudoId).ToList();

            var boardDatas1 = KudosDBEntities.KudoRecipients.Join(KudosDBEntities.Users, kudos => kudos.UserId, user => user.Id, (kudos, user) => new { kudos, user }).
             Select(s => new
             {
                 kudoId = s.kudos.KudoId,
                 recepient = s.user.FirstName
             }) 
             .OrderBy(x => x.kudoId).ToList();

            List<BoardVM> boardVM = new List<BoardVM>();
            List<string> recepients = new List<string>();
            string recepient = null;
            for(int i=0;i< boardDatas.Count;i++)
            {
                for(int j=0;j< boardDatas1.Count;j++)
                {
                    if (boardDatas[i].kudoId== boardDatas1[j].kudoId)
                    {
                       
                        if(recepient==null)
                        {
                            recepient = boardDatas1[j].recepient;
                        }
                        else
                        {
                            recepient = recepient + "," + boardDatas1[j].recepient;
                        }
                    }
                   
                }
               if(recepient!=null)
                {
                    recepients.Add(recepient);
                    recepient = null;
                }
                else
                {
                    recepients.Add("NO RECEPIENTS");
                }
            }
            List<BoardVM> result = new List<BoardVM>();
            for (int i = 0; i < boardDatas.Count; i++)
            {
                result.Add(new BoardVM() { Id = boardDatas[i].kudoId, Name = boardDatas[i].name, CreatedBy = boardDatas[i].creater, userId = boardDatas[i].userId ,Receipient= recepients[i]});
            }
            return result;
           
        }
        public List<Occation> GetOccation()
        {
            List<Occation> occations = KudosDBEntities.Occations.ToList();
            return occations;
        }
        public int AddKudos(Kudo kudo)
        {
          
            KudosDBEntities.Kudos.Add(kudo);
            KudosDBEntities.SaveChanges();

            int id = kudo.Id;
            return id;
        }
        public  User CheckRecepient(string name)
        {
            var userData = KudosDBEntities.Users.Where(x => x.FirstName == name).FirstOrDefault();
            return userData;
        }
        public void AddReceipient(KudoRecipient kudoRecipient)
        {
            KudosDBEntities.KudoRecipients.Add(kudoRecipient);
            KudosDBEntities.SaveChanges();
        }
        public Kudo GetKudoTitle(int kudoId)
        {
            var kudo = KudosDBEntities.Kudos.Where(x => x.Id == kudoId).FirstOrDefault();
            return kudo;
        }
        public void AddPost(Post post)
        {
            KudosDBEntities.Posts.Add(post);
            KudosDBEntities.SaveChanges();
        }
        public List<Post> GetPosts(int kudoId)
        {
             var post= KudosDBEntities.Posts.Where(x => x.KudoId == kudoId).ToList();
            return post;
        }
    }
}
