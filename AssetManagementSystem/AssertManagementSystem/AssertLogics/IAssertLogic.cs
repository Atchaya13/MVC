﻿using AssertManagementRepository.AssertModel;
using AssertManagementRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssertLogics
{
    public interface IAssertLogic
    {
        bool CheckAsserts();
        List<Asset> FetchAsset();
        void AddAsset(AddAssetView addAssetView);
        Asset FetchAssetDetail(int? id);
        void UpdateAsset(Asset UpdateAsset);
        void DeleteAsset(int? assetId);
        void IncreseTotalQuantity(int? assetId);
        void DecreaseTotalQuantity(int? assetId);
        DisplayViewModel FetchAllDetail();
        List<User> FetchUser(int? id);
        bool AssignAsset(int? value, int? id);

    }
}
