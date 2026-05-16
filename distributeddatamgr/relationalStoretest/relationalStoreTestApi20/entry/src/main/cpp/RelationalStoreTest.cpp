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

#include "RelationalStoreTest.h"
#include "napi/native_api.h"
#include <database/data/data_asset.h>
#include <database/rdb/relational_store.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <database/rdb/relational_store_error_code.h>
#include <sys/stat.h>

#define DIRMODE 0770
static const char *RDB_TEST_PATH = "/data/storage/el2/database/com.acts.actsrelationalstoretest/entry/";

void AddRelationalStoreTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"getURISuccess", nullptr, GetURISuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getPathSuccess", nullptr, GetPathSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"getCreateTimeSuccess", nullptr, GetCreateTimeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"getModifyTimeSuccess", nullptr, GetModifyTimeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getSizeSuccess", nullptr, GetSizeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"getStatusSuccess", nullptr, GetStatusSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"getDestroyOneSuccess", nullptr, GetDestroyOneSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"OHRdbExecuteByTrxId", nullptr, OHRdbExecuteByTrxId, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value GetURISuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    char uri[10] = "";
    size_t length = 10;
    int ret = OH_Data_Asset_GetUri(readData5, uri, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetPathSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    char path[10] = "";
    size_t length = 10;
    int ret = OH_Data_Asset_GetPath(readData5, path, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetCreateTimeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    int64_t createTime = 0;
    int ret = OH_Data_Asset_GetCreateTime(readData5, &createTime);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetModifyTimeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    int64_t modifyTime = 0;
    int ret = OH_Data_Asset_GetModifyTime(readData5, &modifyTime);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetSizeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    size_t size = 0;
    int ret = OH_Data_Asset_GetSize(readData5, &size);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetStatusSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    Data_AssetStatus status = Data_AssetStatus::ASSET_NORMAL;
    int ret = OH_Data_Asset_GetStatus(readData5, &status);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

napi_value GetDestroyOneSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    
    int ret = OH_Data_Asset_DestroyOne(asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : 1, &result);
    return result;
}

static void InitRdbConfigV2(OH_Rdb_ConfigV2 *configV2)
{
    OH_Rdb_SetDatabaseDir(configV2, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.actsrelationalstoretest");
    OH_Rdb_SetModuleName(configV2, "module");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
}

napi_value OHRdbExecuteByTrxId(napi_env env, napi_callback_info info)
{
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    int64_t trxId = 0;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, createTableSql);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    return ret;
}