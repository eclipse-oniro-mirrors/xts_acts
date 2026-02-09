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

#include "RelationStoreValuesTest.h"
#include "napi/native_api.h"
#include <database/data/oh_data_values.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <cstdint>
#include <vector>

int g_valuesInvalidParamCode = 14800001;
int g_valuesTypeNull = 14800063;
int g_valuesTypeMismatch = 14800064;

void AddRelationStoreValuesTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testDestroyInvalidParam", nullptr, TestDestroyInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutNullInvalidParam", nullptr, TestPutNullInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testPutIntInvalidParam", nullptr, TestPutIntInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testPutRealInvalidParam", nullptr, TestPutRealInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutTextInvalidParam", nullptr, TestPutTextInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutBlobInvalidParam", nullptr, TestPutBlobInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutAssetInvalidParam", nullptr, TestPutAssetInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutAssetsInvalidParam", nullptr, TestPutAssetsInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testPutUnlimitedIntInvalidParam", nullptr, TestPutUnlimitedIntInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"testCountInvalidParam", nullptr, TestCountInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetTypeInvalidParam", nullptr, TestGetTypeInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetInvalidParam", nullptr, TestGetInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testIsNullInvalidParam", nullptr, TestIsNullInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddRelationStoreValuesTest2(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testGetIntInvalidParamA", nullptr, TestGetIntInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetIntTypeMismatchA", nullptr, TestGetIntTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetIntTypeNullA", nullptr, TestGetIntTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetRealInvalidParamA", nullptr, TestGetRealInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetRealTypeMismatchA", nullptr, TestGetRealTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetRealTypeNullA", nullptr, TestGetRealTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetTextInvalidParamA", nullptr, TestGetTextInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetTextTypeMismatchA", nullptr, TestGetTextTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetTextTypeNullA", nullptr, TestGetTextTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetBlobInvalidParamA", nullptr, TestGetBlobInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetBlobTypeMismatchA", nullptr, TestGetBlobTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetBlobTypeNullA", nullptr, TestGetBlobTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetAssetInvalidParamA", nullptr, TestGetAssetInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetTypeMismatchA", nullptr, TestGetAssetTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetTypeMismatchA", nullptr, TestGetAssetTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetAssetTypeNullA", nullptr, TestGetAssetTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddRelationStoreValuesTest3(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testGetAssetsCountInvalidParamA", nullptr, TestGetAssetsCountInvalidParamA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetAssetsCountTypeMismatchA", nullptr, TestGetAssetsCountTypeMismatchA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetAssetsCountTypeNullA", nullptr, TestGetAssetsCountTypeNullA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetsInvalidParamA", nullptr, TestGetAssetsInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetAssetsTypeMismatchA", nullptr, TestGetAssetsTypeMismatchA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetAssetsTypeNullA", nullptr, TestGetAssetsTypeNullA, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountInvalidParamA", nullptr, TestGetFloatVectorCountInvalidParamA, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountTypeMismatchA", nullptr, TestGetFloatVectorCountTypeMismatchA, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorCountTypeNullA", nullptr, TestGetFloatVectorCountTypeNullA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorInvalidParamA", nullptr, TestGetFloatVectorInvalidParamA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorTypeMismatchA", nullptr, TestGetFloatVectorTypeMismatchA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetFloatVectorTypeNullA", nullptr, TestGetFloatVectorTypeNullA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandInvalidParamA", nullptr, TestGetUnlimitedIntBandInvalidParamA, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandTypeMismatchA", nullptr, TestGetUnlimitedIntBandTypeMismatchA, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntBandTypeNullA", nullptr, TestGetUnlimitedIntBandTypeNullA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntInvalidParamA", nullptr, TestGetUnlimitedIntInvalidParamA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntTypeMismatchA", nullptr, TestGetUnlimitedIntTypeMismatchA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetUnlimitedIntTypeNullA", nullptr, TestGetUnlimitedIntTypeNullA, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

void AddRelationStoreValuesTest(std::vector<napi_property_descriptor>& descData)
{
    AddRelationStoreValuesTest1(descData);
    AddRelationStoreValuesTest2(descData);
    AddRelationStoreValuesTest3(descData);
}

napi_value TestDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int ret = OH_Values_Destroy(values);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutNullInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int ret = OH_Values_PutNull(values);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutIntInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int64_t val = 0;
    int ret = OH_Values_PutInt(values, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutRealInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    double val = 0;
    int ret = OH_Values_PutReal(values, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutTextInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    const char *val = "aaa";
    int ret = OH_Values_PutText(values, val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutBlobInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    unsigned char val[] = {1, 2};
    size_t length = sizeof(val);
    int ret = OH_Values_PutBlob(values, val, length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutAssetInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    
    int ret = OH_Values_PutAsset(values, asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    OH_Data_Asset_DestroyOne(asset);
    return result;
}

napi_value TestPutAssetsInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    Data_Asset **asset = OH_Data_Asset_CreateMultiple(2);
    size_t length = 2;
    int ret = OH_Values_PutAssets(values, asset, length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutUnlimitedIntInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int sign = 0;
    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    size_t length = sizeof(bigInt) / sizeof(bigInt[0]);
    int ret = OH_Values_PutUnlimitedInt(values, sign, bigInt, length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestCountInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    size_t cnt = 0;
    int ret = OH_Values_Count(values, &cnt);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetTypeInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    OH_ColumnType columnType;
    int ret = OH_Values_GetType(values, 0, &columnType);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    return result;
}

napi_value TestGetInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    OH_Data_Value *val = OH_Value_Create();
    int ret = OH_Values_Get(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    OH_Value_Destroy(val);
    return result;
}

napi_value TestIsNullInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    bool val;
    int ret = OH_Values_IsNull(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetIntInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    int64_t val;
    int ret = OH_Values_GetInt(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetIntTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    char *strVal = "str";
    OH_Values_PutText(values, strVal);
    
    int index = 0;
    int64_t val;
    int ret = OH_Values_GetInt(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetIntTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    int64_t val;
    int ret = OH_Values_GetInt(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull :1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetRealInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    double val;
    int ret = OH_Values_GetReal(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetRealTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    char *strVal = "str";
    OH_Values_PutText(values, strVal);
    
    int index = 0;
    double val;
    int ret = OH_Values_GetReal(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetRealTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    double  val;
    int ret = OH_Values_GetReal(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetTextInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    const char *val;
    int ret = OH_Values_GetText(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetTextTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    int64_t intVal = 123;
    OH_Values_PutInt(values, intVal);
    
    int index = 0;
    const char *val;
    int ret = OH_Values_GetText(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetTextTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    const char *val;
    int ret = OH_Values_GetText(values, index, &val);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetBlobInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    const uint8_t *val = nullptr;
    size_t length;
    int ret = OH_Values_GetBlob(values, index, &val, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetBlobTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    int64_t intVal = 123;
    OH_Values_PutInt(values, intVal);
    
    int index = 0;
    const uint8_t *val;
    size_t length;
    int ret = OH_Values_GetBlob(values, index, &val, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetBlobTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    const uint8_t *val;
    size_t length;
    int ret = OH_Values_GetBlob(values, index, &val, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetAssetInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    int ret = OH_Values_GetAsset(values, index, asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    OH_Data_Asset_DestroyOne(asset);
    return result;
}

napi_value TestGetAssetTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    int64_t intVal = 123;
    OH_Values_PutInt(values, intVal);
    
    int index = 0;
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    int ret = OH_Values_GetAsset(values, index, asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    OH_Data_Asset_DestroyOne(asset);
    return result;
}

napi_value TestGetAssetTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    int ret = OH_Values_GetAsset(values, index, asset);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    OH_Data_Asset_DestroyOne(asset);
    return result;
}

napi_value TestGetAssetsCountInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetAssetsCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetAssetsCountTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    int64_t intVal = 123;
    OH_Values_PutInt(values, intVal);
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetAssetsCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetAssetsCountTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetAssetsCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetAssetsInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    Data_Asset **val = OH_Data_Asset_CreateMultiple(2);
    int index = 0;
    size_t inLen = 0;
    size_t outLen = 0;
    int ret = OH_Values_GetAssets(values, index, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    uint32_t cnt = 2;
    OH_Data_Asset_DestroyMultiple(val, cnt);
    return result;
}

napi_value TestGetAssetsTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    const char *str = "sss";
    OH_Values_PutText(values, str);
    
    Data_Asset **val = OH_Data_Asset_CreateMultiple(2);
    int index = 0;
    size_t inLen = 0;
    size_t outLen = 0;
    int ret = OH_Values_GetAssets(values, index, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    uint32_t cnt = 2;
    OH_Data_Asset_DestroyMultiple(val, cnt);
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetAssetsTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    Data_Asset **val = OH_Data_Asset_CreateMultiple(2);
    int index = 0;
    size_t inLen = 0;
    size_t outLen = 0;
    int ret = OH_Values_GetAssets(values, index, val, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    uint32_t cnt = 2;
    OH_Data_Asset_DestroyMultiple(val, cnt);
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetFloatVectorCountInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetFloatVectorCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetFloatVectorCountTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    const char *val = "sss";
    OH_Values_PutText(values, val);
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetFloatVectorCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetFloatVectorCountTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();

    OH_Values_PutNull(values);
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetFloatVectorCount(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetFloatVectorInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    float arr[10];
    size_t inLen = 10;
    size_t outLen;
    int ret = OH_Values_GetFloatVector(values, index, arr, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetFloatVectorTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    int64_t intData = 111;
    OH_Values_PutInt(values, intData);
    
    int index = 0;
    float arr[10];
    size_t inLen = 10;
    size_t outLen;
    int ret = OH_Values_GetFloatVector(values, index, arr, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetFloatVectorTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();

    OH_Values_PutNull(values);
    
    int index = 0;
    float arr[10];
    size_t inLen = 10;
    size_t outLen;
    int ret = OH_Values_GetFloatVector(values, index, arr, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetUnlimitedIntBandInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetUnlimitedIntBand(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetUnlimitedIntBandTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    const char *strVal = "sss";
    OH_Values_PutText(values, strVal);
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetUnlimitedIntBand(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetUnlimitedIntBandTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    OH_Values_PutNull(values);
    
    int index = 0;
    size_t length = 0;
    int ret = OH_Values_GetUnlimitedIntBand(values, index, &length);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetUnlimitedIntInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = nullptr;
    
    int index = 0;
    int sign = 0;
    uint64_t data[5];
    size_t inLen = 5;
    size_t outLen;
    int ret = OH_Values_GetUnlimitedInt(values, index, &sign, data, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_valuesInvalidParamCode : 1, &result);
    
    return result;
}

napi_value TestGetUnlimitedIntTypeMismatchA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    
    double val = 1.2;
    OH_Values_PutReal(values, val);
    
    int index = 0;
    int sign = 0;
    uint64_t data[5];
    size_t inLen = 5;
    size_t outLen;
    int ret = OH_Values_GetUnlimitedInt(values, index, &sign, data, inLen, &outLen);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_TYPE_MISMATCH ? g_valuesTypeMismatch : 1, &result);
    
    OH_Values_Destroy(values);
    return result;
}

napi_value TestGetUnlimitedIntTypeNullA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutNull(values);
    int index = 0;
    int sign = 0;
    uint64_t data[5];
    size_t inLen = 5;
    size_t outLen;
    int ret = OH_Values_GetUnlimitedInt(values, index, &sign, data, inLen, &outLen);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_DATA_TYPE_NULL ? g_valuesTypeNull : 1, &result);
    OH_Values_Destroy(values);
    return result;
}