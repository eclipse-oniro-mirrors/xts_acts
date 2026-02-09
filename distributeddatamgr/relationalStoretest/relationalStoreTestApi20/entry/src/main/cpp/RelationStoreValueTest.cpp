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

#include "RelationStoreValueTest.h"
#include "napi/native_api.h"
#include <cstddef>
#include <cstdint>
#include <database/data/oh_data_value.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

int g_valueInvalidParamCode = 14800001;
int g_valueTypeNull = 14800063;
int g_valueTypeMismatch = 14800064;

void AddRelationStoreValueTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testGetAssetsInvalidParam", nullptr, TestGetAssetsInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetsTypeMismatch", nullptr, TestGetAssetsTypeMismatch, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetsDataTypeNull", nullptr, TestGetAssetsDataTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountInvalidParam", nullptr, TestGetFloatVectorCountInvalidParam, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountTypeMismatch", nullptr, TestGetFloatVectorCountTypeMismatch, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountTypeNull", nullptr, TestGetFloatVectorCountTypeNull, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorInvalidParam", nullptr, TestGetFloatVectorInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorTypeMismatch", nullptr, TestGetFloatVectorTypeMismatch, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorTypeNull", nullptr, TestGetFloatVectorTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandInvalidParam", nullptr, TestGetUnlimitedIntBandInvalidParam, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandTypeMismatch", nullptr, TestGetUnlimitedIntBandTypeMismatch, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandTypeNull", nullptr, TestGetUnlimitedIntBandTypeNull, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntInvalidParam", nullptr, TestGetUnlimitedIntInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntTypeMismatch", nullptr, TestGetUnlimitedIntTypeMismatch, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntTypeNull", nullptr, TestGetUnlimitedIntTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

void AddRelationStoreValueTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"destroy", nullptr, Destroy, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putNull", nullptr, PutNull, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putReal", nullptr, PutReal, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putText", nullptr, PutText, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putBlob", nullptr, PutBlob, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putAsset", nullptr, PutAsset, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putAssets", nullptr, PutAssets, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"putUnlimitedInt", nullptr, PutUnlimitedInt, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getType", nullptr, GetType, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"isNull", nullptr, IsNull, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetIntInvalidParam", nullptr, TestGetIntInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetIntTypeMismatch", nullptr, TestGetIntTypeMismatch, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetIntDataTypeNull", nullptr, TestGetIntDataTypeNull, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetRealInvalidParam", nullptr, TestGetRealInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetTextInvalidParam", nullptr, TestGetTextInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetTextTypeMismatch", nullptr, TestGetTextTypeMismatch, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetTextDataTypeNull", nullptr, TestGetTextDataTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetBlobInvalidParam", nullptr, TestGetBlobInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetBlobTypeMismatch", nullptr, TestGetBlobTypeMismatch, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetBlobDataTypeNull", nullptr, TestGetBlobDataTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetInvalidParam", nullptr, TestGetAssetInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetTypeMismatch", nullptr, TestGetAssetTypeMismatch, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetDataTypeNull", nullptr, TestGetAssetDataTypeNull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetsCountInvalidParam", nullptr, TestGetAssetsCountInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetAssetsCountTypeMismatch", nullptr, TestGetAssetsCountTypeMismatch, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetAssetsCountDataTypeNull", nullptr, TestGetAssetsCountDataTypeNull, nullptr, nullptr,
                        nullptr, napi_default, nullptr});

    AddRelationStoreValueTest1(descData);
}

napi_value Destroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_Value_Destroy(nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_Value_PutNull(nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutReal(napi_env env, napi_callback_info info)
{
    napi_value result;
    double value = 1.2;
    int ret = OH_Value_PutReal(nullptr, value);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutText(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_Value_PutText(nullptr, "test");

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutBlob(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    unsigned char arr[1024] = {1, 2, 3};

    size_t length = sizeof(arr);

    int ret = OH_Value_PutBlob(value, arr, length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutAsset(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    Data_Asset *asset = OH_Data_Asset_CreateOne();

    int ret = OH_Value_PutAsset(value, asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutAssets(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    Data_Asset **asset1 = OH_Data_Asset_CreateMultiple(2);
    int assetsLen = 2;
    int ret = OH_Value_PutAssets(value, asset1, assetsLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value PutUnlimitedInt(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    size_t length = sizeof(bigInt);
    int ret = OH_Value_PutUnlimitedInt(value, 0, bigInt, length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value GetType(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    OH_ColumnType type = OH_ColumnType::TYPE_ASSET;
    int ret = OH_Value_GetType(value, &type);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value IsNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    bool val = true;
    int ret = OH_Value_IsNull(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetIntInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    int64_t val;
    int ret = OH_Value_GetInt(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetIntTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();
    OH_Value_PutText(value, "str");

    int64_t val;
    int ret = OH_Value_GetInt(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetIntDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();
    OH_Value_PutNull(value);

    int64_t val;
    int ret = OH_Value_GetInt(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetRealInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    double val;
    int ret = OH_Value_GetReal(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetTextInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    const char *val = nullptr;
    int ret = OH_Value_GetText(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetTextTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t data = 100;
    OH_Value_PutInt(value, data);

    const char *val;
    int ret = OH_Value_GetText(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetTextDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();
    OH_Value_PutNull(value);

    const char *val;
    int ret = OH_Value_GetText(value, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetBlobInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    const uint8_t *val = nullptr;
    size_t valLength = sizeof(*val);
    int ret = OH_Value_GetBlob(value, &val, &valLength);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetBlobTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    double doubleData = 1.23;
    OH_Value_PutReal(value, doubleData);

    const uint8_t *val = nullptr;
    size_t valLength = sizeof(*val);
    int ret = OH_Value_GetBlob(value, &val, &valLength);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetBlobDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    const uint8_t *val = nullptr;
    size_t valLength = sizeof(*val);
    int ret = OH_Value_GetBlob(value, &val, &valLength);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetAssetInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    Data_Asset *val = nullptr;
    int ret = OH_Value_GetAsset(value, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetAssetTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t intData = 123;
    OH_Value_PutInt(value, intData);

    Data_Asset *val = OH_Data_Asset_CreateOne();
    int ret = OH_Value_GetAsset(value, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Value_Destroy(value);
    OH_Data_Asset_DestroyOne(val);
    return result;
}

napi_value TestGetAssetDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    Data_Asset *val = OH_Data_Asset_CreateOne();
    int ret = OH_Value_GetAsset(value, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);
    OH_Value_Destroy(value);
    OH_Data_Asset_DestroyOne(val);
    return result;
}

napi_value TestGetAssetsCountInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    size_t length;
    int ret = OH_Value_GetAssetsCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetAssetsCountTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t intData = 123;
    OH_Value_PutInt(value, intData);

    size_t length;
    int ret = OH_Value_GetAssetsCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetAssetsCountDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    size_t length;
    int ret = OH_Value_GetAssetsCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetAssetsInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    uint32_t count = 2;
    Data_Asset **val = OH_Data_Asset_CreateMultiple(count);

    size_t inLen = 2;
    size_t outLen;
    int ret = OH_Value_GetAssets(value, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    OH_Data_Asset_DestroyMultiple(val, count);
    return result;
}

napi_value TestGetAssetsTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t intData = 123;
    OH_Value_PutInt(value, intData);

    uint32_t count = 2;
    Data_Asset **val = OH_Data_Asset_CreateMultiple(count);

    size_t inLen = 2;
    size_t outLen;
    int ret = OH_Value_GetAssets(value, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);
    OH_Data_Asset_DestroyMultiple(val, count);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetAssetsDataTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    uint32_t count = 2;
    Data_Asset **val = OH_Data_Asset_CreateMultiple(count);

    size_t inLen = 2;
    size_t outLen;
    int ret = OH_Value_GetAssets(value, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);

    OH_Data_Asset_DestroyMultiple(val, count);
    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetFloatVectorCountInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    size_t length;
    int ret = OH_Value_GetFloatVectorCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetFloatVectorCountTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t intData = 123;
    OH_Value_PutInt(value, intData);

    size_t length;
    int ret = OH_Value_GetFloatVectorCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetFloatVectorCountTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    size_t length;
    int ret = OH_Value_GetFloatVectorCount(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetFloatVectorInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    float array[10];
    size_t inLen = 10;
    size_t outLen;
    int ret = OH_Value_GetFloatVector(value, array, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetFloatVectorTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    int64_t intData = 123;
    OH_Value_PutInt(value, intData);

    float array[10];
    size_t inLen = 10;
    size_t outLen;

    int ret = OH_Value_GetFloatVector(value, array, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetFloatVectorTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    float array[10];
    size_t inLen = 10;
    size_t outLen;

    int ret = OH_Value_GetFloatVector(value, array, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetUnlimitedIntBandInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;

    size_t length = 0;
    int ret = OH_Value_GetUnlimitedIntBand(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);

    return result;
}

napi_value TestGetUnlimitedIntBandTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    const char *val = "str";
    OH_Value_PutText(value, val);

    size_t length = 0;
    int ret = OH_Value_GetUnlimitedIntBand(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetUnlimitedIntBandTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    size_t length = 0;
    int ret = OH_Value_GetUnlimitedIntBand(value, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetUnlimitedIntInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = nullptr;
    
    int readDataSign = 0;
    uint64_t readData[5];
    size_t inLen = 5;
    size_t outLen;
    
    int ret = OH_Value_GetUnlimitedInt(value, &readDataSign, readData, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valueInvalidParamCode : 1, &result);

    return result;
}

napi_value TestGetUnlimitedIntTypeMismatch(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    const char *val = "str";
    OH_Value_PutText(value, val);

    int readDataSign = 0;
    uint64_t readData[5];
    size_t inLen = 5;
    size_t outLen;
    int ret = OH_Value_GetUnlimitedInt(value, &readDataSign, readData, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valueTypeMismatch : 1, &result);

    OH_Value_Destroy(value);
    return result;
}

napi_value TestGetUnlimitedIntTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Value *value = OH_Value_Create();

    OH_Value_PutNull(value);

    int readDataSign = 0;
    uint64_t readData[5];
    size_t inLen = 5;
    size_t outLen;
    int ret = OH_Value_GetUnlimitedInt(value, &readDataSign, readData, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valueTypeNull : 1, &result);

    OH_Value_Destroy(value);
    return result;
}