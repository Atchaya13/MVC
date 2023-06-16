using AssertManagementRepository.AssertModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssertManagementRepository.ViewModel
{
    public class DisplayViewModel
    {
        public List<Asset> AssetList { get; set; }
        public List<User> UserList { get; set; }
    }
    public class UserModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
    }
}
