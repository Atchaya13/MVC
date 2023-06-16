using AssertManagementRepository.AssertModel;
using AssertManagementRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace AssertManagementRepository
{
    public class AssertRepository: IAssertRepository
    {
        AssetManagementEntitiesNew assetManagementEntities = new AssetManagementEntitiesNew();
        public List<Asset> FetchAsserts()
        {
            List<Asset> assets=new List<Asset>();
            try
            {
                assets = assetManagementEntities.Assets.ToList();
            }
            catch(Exception exception)
            {
                Console.WriteLine(exception);
            }
            return assets;

        }
        public void AddAsset(AddAssetView addAssetView)
        {
            try
            {
                assetManagementEntities.Assets.Add(addAssetView.Asset);
                assetManagementEntities.SaveChanges();
            }
            catch(Exception exception)
            {
                Console.WriteLine(exception);
            }
           
        }
        public Asset FetchAssetDetail(int? id)
        {
            var asset = assetManagementEntities.Assets.Where(x => x.Id ==  id).FirstOrDefault();
            return asset;
        }
        public void UpdateAsset(Asset asset)
        {

            assetManagementEntities.Assets.AddOrUpdate(asset);
            try
            {
                assetManagementEntities.SaveChanges();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
            }
        }
        public void DeleteAsset(int? id)
        {
            var asset = assetManagementEntities.Assets.Find(id);
            if (asset != null)
            {
                assetManagementEntities.Assets.Remove(asset);
                try
                {
                    assetManagementEntities.SaveChanges();
                }
                catch(Exception exception)
                {
                    Console.WriteLine(exception);
                }

            }
        }
        public void IncreseTotalQuantity(int? assetId)
        {
            var asset = assetManagementEntities.Assets.Find(assetId);
            if(asset!=null)
            {
                asset.TotalCount = asset.TotalCount + 1;
                assetManagementEntities.Assets.AddOrUpdate(asset);
                try
                {
                    assetManagementEntities.SaveChanges();
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception);
                }
            }
        }
        public void DecreaseTotalQuantity(int? assetId)
        {
            var asset = assetManagementEntities.Assets.Find(assetId);
            if (asset != null)
            {
                
                if ( asset.TotalCount > asset.AvailableCount)
                {
                    asset.TotalCount = asset.TotalCount - 1;
                }
               
                assetManagementEntities.Assets.AddOrUpdate(asset);
                try
                {
                    assetManagementEntities.SaveChanges();
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception);
                }
            }
        }
        public DisplayViewModel FetchAllDetail()
        {
            DisplayViewModel sample = new DisplayViewModel();
            List<Asset> assets = new List<Asset>();
            List<User> user = new List<User>();
            try
            {
                assets = assetManagementEntities.Assets.ToList();
                user = assetManagementEntities.Users.ToList();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
            }
            return sample;
        }
        public List<User> FetchUser(int? id)
		{
			List<User> userList = assetManagementEntities.Users.ToList();
			List<AssetUserMapping> users = assetManagementEntities.AssetUserMappings.ToList();
			List<AssetUserMapping> validUsers = new List<AssetUserMapping>();
			foreach (var i in users)
			{
				if (i.AssetId == id)
				{
					validUsers.Add(i);
				}
			}
			var result = userList.Where(p => validUsers.All(p2 => p2.UserId != p.Id)).ToList();
            return result;
		}
        public bool AssignAsset(int? value, int? id)
        {
            AssetUserMapping assetUserMapping = new AssetUserMapping();
            assetUserMapping.UserId = Convert.ToInt32(value);
            assetUserMapping.AssetId = Convert.ToInt32(id);
            assetManagementEntities.AssetUserMappings.Add(assetUserMapping);
            try
            {
                assetManagementEntities.SaveChanges();
                return true;
            }
            catch(Exception exception)
            {
                return false;
            }
           
        }
    }
	
}

