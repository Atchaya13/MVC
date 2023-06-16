using AssertManagementRepository;
using AssertManagementRepository.AssertModel;
using AssertManagementRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssertLogics
{
    public class AssertLogic: IAssertLogic
    {
        private IAssertRepository _IAsserRepository;
        public AssertLogic(IAssertRepository assert)
        {
            _IAsserRepository = assert;
        }
        static List<Asset> asset;
        public bool CheckAsserts()
        {
             asset = _IAsserRepository.FetchAsserts();
            if(asset!=null)
            {
              return  true;
            }
            else
            {
              return  false;
            }
        }
        public List<Asset> FetchAsset()
        {
            asset = _IAsserRepository.FetchAsserts();
            return asset;
        }
        public void AddAsset(AddAssetView addAssetView)
        {
            _IAsserRepository.AddAsset(addAssetView);
        }
        public Asset FetchAssetDetail(int? id)
        {
            Asset asset= _IAsserRepository.FetchAssetDetail(id);
            return asset;
        }
        public void UpdateAsset(Asset UpdateAsset)
        {
            _IAsserRepository.UpdateAsset(UpdateAsset);
        }
        public void DeleteAsset(int? id)
        {
            _IAsserRepository.DeleteAsset(id);
        }
        public void IncreseTotalQuantity(int? assetId)
        {
            _IAsserRepository.IncreseTotalQuantity(assetId);
        }
        public void DecreaseTotalQuantity(int? assetId)
        {
            _IAsserRepository.DecreaseTotalQuantity(assetId);
        }
        public DisplayViewModel FetchAllDetail()
        {
            DisplayViewModel allDetails = _IAsserRepository.FetchAllDetail();
            return allDetails;
        }
        public List<User> FetchUser(int? id)
       {
            List<User> userList = _IAsserRepository.FetchUser(id);
            return userList;
       }
        public bool AssignAsset(int? value, int? id)
        {
            bool result = _IAsserRepository.AssignAsset(value, id);
            if(result)
            {
                return true;
            }
            return false;
        }
    }
}
