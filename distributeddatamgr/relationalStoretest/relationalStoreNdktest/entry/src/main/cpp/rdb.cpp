/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "oh_cursor.h"
#include "oh_predicates.h"
#include "oh_value_object.h"
#include "oh_values_bucket.h"
#include "relational_store.h"
#include <js_native_api_types.h>

#define E_BASE 14800000
#define DATATWO 12800
#define DATATHREE 100.1
#define DATAFOUR 13800
#define DATAFIVE 200.1
#define PARAM_2 2
#define PARAM_1 1
#define MPARAM_1 (-1)
int g_rdbEInvalidArgs = E_BASE + 1;
int g_invalidFile = E_BASE + 11;
OH_Rdb_Config GetConfig()
{
    static OH_Rdb_Config config;
    config.dataBaseDir = "/data/storage/el2/base/files/";
    config.storeName = "RdbTest.db";
    config.bundleName = "xxx";
    config.moduleName = "xxx";
    config.securityLevel = OH_Rdb_SecurityLevel::S1;
    config.isEncrypt = false;
    config.selfSize = sizeof(OH_Rdb_Config);
    return config;
}

int errCode = 0;
char table[] = "test";
char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
    "data3 FLOAT, data4 BLOB, data5 TEXT);";

OH_VBucket *GetValueBucket()
{
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", DATATWO);
    valueBucket->putReal(valueBucket, "data3", DATATHREE);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABC");
    return valueBucket;
}

static napi_value CreateValueObject(napi_env env, napi_callback_info)
{
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    napi_value result = nullptr;
    napi_create_int32(env, valueObject != nullptr, &result);
    return result;
}

static napi_value CreateValuesBucket(napi_env env, napi_callback_info)
{
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    napi_value result = nullptr;
    napi_create_int32(env, valueBucket != nullptr, &result);
    return result;
}

static napi_value CreatePredicatesOne(napi_env env, napi_callback_info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    napi_value result = nullptr;
    napi_create_int32(env, predicates != nullptr, &result);
    return result;
}

static napi_value CreatePredicatesTwo(napi_env env, napi_callback_info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, predicates == nullptr, &result);
    return result;
}
static napi_value CreatePredicatesThree(napi_env env, napi_callback_info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(0);
    napi_value result = nullptr;
    napi_create_int32(env, predicates == nullptr, &result);
    return result;
}

static napi_value GetOrOpenOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    napi_value result = nullptr;
    napi_create_int32(env, predicatesTestRdbStore != nullptr, &result);
    return result;
}

static napi_value GetOrOpenTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(nullptr, &errCode);
    napi_value result = nullptr;
    napi_create_int32(env, predicatesTestRdbStore == nullptr, &result);
    return result;
}

static napi_value GetOrOpenThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, predicatesTestRdbStore == nullptr, &result);
    return result;
}
static napi_value GetOrOpenFour(napi_env env, napi_callback_info)
{
    static OH_Rdb_Config config;
    config.dataBaseDir = "";
    config.storeName = "RdbTest.db";
    config.bundleName = "xxx";
    config.moduleName = "xxx";
    config.securityLevel = OH_Rdb_SecurityLevel::S1;
    config.isEncrypt = false;
    config.selfSize = sizeof(OH_Rdb_Config);
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    napi_value result = nullptr;
    napi_create_int32(env, predicatesTestRdbStore == nullptr, &result);
    return result;
}

static napi_value CloseStoreOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_CloseStore(predicatesTestRdbStore);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value CloseStoreTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(nullptr, &errCode);
    int returnValue = OH_Rdb_CloseStore(predicatesTestRdbStore);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}
static napi_value CloseStoreThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_CloseStore(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value DeleteStoreOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    int returnValue = OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value DeleteStoreTwo(napi_env env, napi_callback_info)
{
    int returnValue = OH_Rdb_DeleteStore(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value DeleteStoreThree(napi_env env, napi_callback_info)
{
    static OH_Rdb_Config config;
    int returnValue = OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value InsertOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    int returnValue = OH_Rdb_Insert(predicatesTestRdbStore, table, GetValueBucket());
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 1, &result);
    return result;
}

static napi_value InsertTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    int returnValue = OH_Rdb_Insert(nullptr, table, GetValueBucket());
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value InsertThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    int returnValue = OH_Rdb_Insert(predicatesTestRdbStore, table, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value InsertFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    int returnValue = OH_Rdb_Insert(predicatesTestRdbStore, nullptr, GetValueBucket());
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value InsertFive(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    int returnValueOne = OH_Rdb_Insert(predicatesTestRdbStore, table, GetValueBucket());
    int returnValueTwo = OH_Rdb_Insert(predicatesTestRdbStore, table, GetValueBucket());
    OH_VBucket *valueBucket = GetValueBucket();
    valueBucket->putInt64(valueBucket, "id", PARAM_2);
    int returnValueThree = OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, ((returnValueOne == PARAM_1) && (returnValueTwo == MPARAM_1)) &&
        (returnValueThree == PARAM_2), &result);
    return result;
}

static napi_value UpdateOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Update(predicatesTestRdbStore, valueBucket, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 1, &result);
    return result;
}

static napi_value UpdateTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("null");
    int returnValue = OH_Rdb_Update(predicatesTestRdbStore, valueBucket, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == -1, &result);
    return result;
}

static napi_value UpdateThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Update(nullptr, valueBucket, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value UpdateFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Update(predicatesTestRdbStore, nullptr, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value UpdateFive(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Update(predicatesTestRdbStore, valueBucket, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value UpdateSix(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    int insertReturnValueOne = OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_VBucket *valueBucket2 = OH_Rdb_CreateValuesBucket();
    valueBucket2->putInt64(valueBucket2, "id", PARAM_2);
    valueBucket2->putText(valueBucket2, "data2", "zhangSan");
    valueBucket2->putText(valueBucket2, "data3", "lisi");
    int insertReturnValueTwo = OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket2);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *dataValue = "zhangSan";
    valueObject->putText(valueObject, dataValue);
    predicates->equalTo(predicates, "data1", valueObject);
    int updateReturnValueOne = OH_Rdb_Update(predicatesTestRdbStore, valueBucket, predicates);
    valueBucket2->clear(valueBucket2);
    valueBucket2->putText(valueBucket2, "data2", "wangwu");
    OH_Predicates *predicatesTwo = OH_Rdb_CreatePredicates(table);
    OH_VObject *valueObjectTwo = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObjectTwo->putText(valueObjectTwo, data1Value);
    predicatesTwo->equalTo(predicatesTwo, "data2", valueObjectTwo);
    int updateReturnValueTwo = OH_Rdb_Update(predicatesTestRdbStore, valueBucket2, predicatesTwo);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env,
        (insertReturnValueOne == PARAM_1) && (insertReturnValueTwo == PARAM_2) && (updateReturnValueOne == PARAM_1) &&
        (updateReturnValueTwo == PARAM_1),
        &result);
    return result;
}

static napi_value UpdateSeven(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, nullptr, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    int returnValue = OH_Rdb_Update(predicatesTestRdbStore, valueBucket, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value DeleteOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "zhangSan";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Delete(predicatesTestRdbStore, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 1, &result);
    return result;
}

static napi_value DeleteTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "zhangSan";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Delete(nullptr, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value DeleteThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "zhangSan";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Delete(predicatesTestRdbStore, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value DeleteFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("null");
    int returnValue = OH_Rdb_Delete(predicatesTestRdbStore, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == -1, &result);
    return result;
}

static napi_value DeleteFive(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "zhangSan";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "data1", valueObject);
    int returnValue = OH_Rdb_Delete(predicatesTestRdbStore, predicates);
    int returnValueTwo = OH_Rdb_Delete(predicatesTestRdbStore, predicates);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, ((returnValue == 1) && (returnValueTwo == 0)), &result);
    return result;
}

static napi_value QueryOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"NAME", "AGE"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore, predicates, columnNames, len);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor != nullptr, &result);
    return result;
}

static napi_value QueryTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"NAME", "AGE"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(nullptr, predicates, columnNames, len);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor == nullptr, &result);
    return result;
}

static napi_value QueryThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", DATAFOUR);
    valueBucket->putReal(valueBucket, "data3", DATAFIVE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"NAME", "AGE"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore, nullptr, columnNames, len);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor == nullptr, &result);
    return result;
}

static napi_value QueryFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Insert(predicatesTestRdbStore, table, valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"NAME", "AGE"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore, predicates, nullptr, len);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor != nullptr, &result);
    return result;
}

static napi_value ExecuteOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value ExecuteTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_Execute(predicatesTestRdbStore, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value ExecuteThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_Execute(nullptr, createTableSql);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value ExecuteFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    char createTableSqlError[] = "error";
    int returnValue = OH_Rdb_Execute(predicatesTestRdbStore, createTableSqlError);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == -1, &result);
    return result;
}

static napi_value ExecuteQueryOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(predicatesTestRdbStore, querySql);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor != nullptr, &result);
    return result;
}

static napi_value ExecuteQueryTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(nullptr, querySql);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor == nullptr, &result);
    return result;
}

static napi_value ExecuteQueryThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(predicatesTestRdbStore, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, cursor == nullptr, &result);
    return result;
}

static napi_value ExecuteQueryFour(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(predicatesTestRdbStore, 0);
    napi_value result = nullptr;
    napi_create_int32(env, cursor == nullptr, &result);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    return result;
}

static napi_value BeginTransactionOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_BeginTransaction(predicatesTestRdbStore);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value BeginTransactionTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_BeginTransaction(nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value RollBackOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    OH_VBucket *valueBucket = GetValueBucket();
    OH_Rdb_Execute(predicatesTestRdbStore, createTableSql);
    OH_Rdb_BeginTransaction(predicatesTestRdbStore);
    OH_Rdb_Insert(predicatesTestRdbStore, "test", valueBucket);
    int returnValue = OH_Rdb_RollBack(predicatesTestRdbStore);
    OH_Rdb_Commit(predicatesTestRdbStore);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value RollBackTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_RollBack(nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value CommitOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_Commit(predicatesTestRdbStore);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value CommitTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_Commit(nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value BackupOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "backup.db";
    int returnValue = OH_Rdb_Backup(predicatesTestRdbStore, backupPath);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value BackupTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "backup.db";
    int returnValue = OH_Rdb_Backup(nullptr, backupPath);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value BackupThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "";
    int returnValue = OH_Rdb_Backup(predicatesTestRdbStore, backupPath);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_invalidFile, &result);
    return result;
}

static napi_value RestoreOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "backup.db";
    OH_Rdb_Backup(predicatesTestRdbStore, backupPath);
    int returnValue = OH_Rdb_Restore(predicatesTestRdbStore, backupPath);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value RestoreTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "backup.db";
    OH_Rdb_Backup(predicatesTestRdbStore, backupPath);
    int returnValue = OH_Rdb_Restore(nullptr, backupPath);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value RestoreThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    const char *backupPath = "backup.db";
    OH_Rdb_Backup(predicatesTestRdbStore, backupPath);
    int returnValue = OH_Rdb_Restore(predicatesTestRdbStore, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value GetVersionOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int version = 0;
    int returnValue = OH_Rdb_GetVersion(predicatesTestRdbStore, &version);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value GetVersionTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int version = 0;
    int returnValue = OH_Rdb_GetVersion(nullptr, &version);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value GetVersionThree(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int returnValue = OH_Rdb_GetVersion(predicatesTestRdbStore, nullptr);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}

static napi_value SetVersionOne(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int version = 0;
    int returnValue = OH_Rdb_SetVersion(predicatesTestRdbStore, version);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == 0, &result);
    return result;
}

static napi_value SetVersionTwo(napi_env env, napi_callback_info)
{
    OH_Rdb_Config config = GetConfig();
    OH_Rdb_Store *predicatesTestRdbStore = nullptr;
    predicatesTestRdbStore = OH_Rdb_GetOrOpen(&config, &errCode);
    int version = 0;
    int returnValue = OH_Rdb_SetVersion(nullptr, version);
    OH_Rdb_CloseStore(predicatesTestRdbStore);
    OH_Rdb_DeleteStore(&config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == g_rdbEInvalidArgs, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createValueObject", nullptr, CreateValueObject, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createValuesBucket", nullptr, CreateValuesBucket, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPredicatesOne", nullptr, CreatePredicatesOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPredicatesTwo", nullptr, CreatePredicatesTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPredicatesThree", nullptr, CreatePredicatesThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOrOpenOne", nullptr, GetOrOpenOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOrOpenTwo", nullptr, GetOrOpenTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOrOpenThree", nullptr, GetOrOpenThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOrOpenFour", nullptr, GetOrOpenFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closeStoreOne", nullptr, CloseStoreOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closeStoreTwo", nullptr, CloseStoreTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closeStoreThree", nullptr, CloseStoreThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteStoreOne", nullptr, DeleteStoreOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteStoreTwo", nullptr, DeleteStoreTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteStoreThree", nullptr, DeleteStoreThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insertOne", nullptr, InsertOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insertTwo", nullptr, InsertTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insertThree", nullptr, InsertThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insertFour", nullptr, InsertFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insertFive", nullptr, InsertFive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateOne", nullptr, UpdateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateTwo", nullptr, UpdateTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateThree", nullptr, UpdateThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateFour", nullptr, UpdateFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateFive", nullptr, UpdateFive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateSix", nullptr, UpdateSix, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateSeven", nullptr, UpdateSeven, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteOne", nullptr, DeleteOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteTwo", nullptr, DeleteTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteThree", nullptr, DeleteThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteFour", nullptr, DeleteFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deleteFive", nullptr, DeleteFive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"queryOne", nullptr, QueryOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"queryTwo", nullptr, QueryTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"queryThree", nullptr, QueryThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"queryFour", nullptr, QueryFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeOne", nullptr, ExecuteOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeTwo", nullptr, ExecuteTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeThree", nullptr, ExecuteThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeFour", nullptr, ExecuteFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeQueryOne", nullptr, ExecuteQueryOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeQueryTwo", nullptr, ExecuteQueryTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeQueryThree", nullptr, ExecuteQueryThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"executeQueryFour", nullptr, ExecuteQueryFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"beginTransactionOne", nullptr, BeginTransactionOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"beginTransactionTwo", nullptr, BeginTransactionTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rollBackOne", nullptr, RollBackOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rollBackTwo", nullptr, RollBackTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commitOne", nullptr, CommitOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commitTwo", nullptr, CommitTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"backupOne", nullptr, BackupOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"backupTwo", nullptr, BackupTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"backupThree", nullptr, BackupThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restoreOne", nullptr, RestoreOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restoreTwo", nullptr, RestoreTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"restoreThree", nullptr, RestoreThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getVersionOne", nullptr, GetVersionOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getVersionTwo", nullptr, GetVersionTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getVersionThree", nullptr, GetVersionThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setVersionOne", nullptr, SetVersionOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setVersionTwo", nullptr, SetVersionTwo, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "librdb",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
