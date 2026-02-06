/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ValuesBucketTest.h"
#include "napi/native_api.h"
#include <cstdint>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <database/rdb/oh_values_bucket.h>
#include <database/data/data_asset.h>

int g_vBInvalidParamCode = 14800001;

void AddValuesBucketTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testPutAssetInvalidParam", nullptr, TestPutAssetInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testPutAssetSuccess", nullptr, TestPutAssetSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testPutAssetsInvalidParam", nullptr, TestPutAssetsInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testPutAssetsSuccess", nullptr, TestPutAssetsSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testPutFloatVectorInvalidParam", nullptr, TestPutFloatVectorInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testPutUnlimitedIntInvalidParam", nullptr, TestPutUnlimitedIntInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

napi_value TestPutAssetInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = nullptr;

    Data_Asset *asset1 = OH_Data_Asset_CreateOne();

    int ret = OH_VBucket_PutAsset(vBucket, "data", asset1);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_vBInvalidParamCode : -1, &result);
    
    OH_Data_Asset_DestroyOne(asset1);
    return result;
}

napi_value TestPutAssetSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = OH_Rdb_CreateValuesBucket();

    Data_Asset *asset1 = OH_Data_Asset_CreateOne();
    
    OH_Data_Asset_SetName(asset1, "test_asset");
    
    int ret = OH_VBucket_PutAsset(vBucket, "data", asset1);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    OH_Data_Asset_DestroyOne(asset1);

    vBucket->destroy(vBucket);
    return result;
}

napi_value TestPutAssetsInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = nullptr;
    
    Data_Asset *assets[2];
    
    assets[0] = OH_Data_Asset_CreateOne();
    assets[1] = OH_Data_Asset_CreateOne();
    
    OH_Data_Asset_SetName(assets[0], "test_asset");
    OH_Data_Asset_SetStatus(assets[1], Data_AssetStatus::ASSET_NORMAL);
    
    uint32_t cnt = 2;
    int ret = OH_VBucket_PutAssets(vBucket, "data", assets, cnt);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_vBInvalidParamCode : -1, &result);
    
    OH_Data_Asset_DestroyOne(assets[0]);
    OH_Data_Asset_DestroyOne(assets[1]);
    return result;
}

napi_value TestPutAssetsSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = OH_Rdb_CreateValuesBucket();
    
    Data_Asset *assets[2];
    
    assets[0] = OH_Data_Asset_CreateOne();
    assets[1] = OH_Data_Asset_CreateOne();
    
    OH_Data_Asset_SetName(assets[0], "test_asset");
    OH_Data_Asset_SetStatus(assets[1], Data_AssetStatus::ASSET_NORMAL);
    
    uint32_t cnt = 2;
    int ret = OH_VBucket_PutAssets(vBucket, "data", assets, cnt);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    
    OH_Data_Asset_DestroyOne(assets[0]);
    OH_Data_Asset_DestroyOne(assets[1]);
    vBucket->destroy(vBucket);
    return result;
}

napi_value TestPutFloatVectorInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = nullptr;
    
    float arr[] = {1.0, 2.0, 3.0};
    
    size_t arrLen = sizeof(arr) / sizeof(arr[0]);
    
    int ret = OH_VBucket_PutFloatVector(vBucket, "data1", arr, arrLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_vBInvalidParamCode : -1, &result);
    
    return result;
}

napi_value TestPutUnlimitedIntInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VBucket *vBucket = nullptr;
    int sign = 0;
    uint64_t arr[] = {1, 2, 3};
    size_t arrLen = sizeof(arr) / sizeof(arr[0]);
    int ret = OH_VBucket_PutUnlimitedInt(vBucket, "data1", sign, arr, arrLen);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_vBInvalidParamCode : -1, &result);
    return result;
}