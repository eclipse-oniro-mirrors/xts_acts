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

#include "RelationStoreBucketsTest.h"
#include "napi/native_api.h"
#include <database/data/oh_data_values_buckets.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

int g_bucketsInvalidParamCode = 14800001;

void AddRelationStoreBucketsTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testDestroyInvalidParamA", nullptr, TestDestroyInvalidParamA, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testPutRowInvalidParam", nullptr, TestPutRowInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testPutRowsInvalidParam", nullptr, TestPutRowsInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testRowCountInvalidParam", nullptr, TestRowCountInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

napi_value TestDestroyInvalidParamA(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_VBuckets *buckets = nullptr;
    int ret = OH_VBuckets_Destroy(buckets);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_bucketsInvalidParamCode : 1, &result);
    return result;
}

napi_value TestPutRowInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_VBuckets *buckets = nullptr;
    OH_VBucket *row = OH_Rdb_CreateValuesBucket();
    int ret = OH_VBuckets_PutRow(buckets, row);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_bucketsInvalidParamCode : 1, &result);
    row->destroy(row);
    return result;
}

napi_value TestPutRowsInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_VBuckets *buckets = nullptr;
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    int ret = OH_VBuckets_PutRows(buckets, rows);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_bucketsInvalidParamCode : 1, &result);
    OH_VBuckets_Destroy(rows);
    return result;
}

napi_value TestRowCountInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Data_VBuckets *buckets = nullptr;
    size_t count = 0;
    int ret = OH_VBuckets_RowCount(buckets, &count);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_bucketsInvalidParamCode : 1, &result);
    return result;
}