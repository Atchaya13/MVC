using AssertManagementRepository.AssertModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssertManagementRepository.ViewModel
{
    public class AddAssetView
    {
        public Asset Asset { get; set; }
        public Category category { get; set; }
        public Brand Brand { get; set; }
       
    }
}
