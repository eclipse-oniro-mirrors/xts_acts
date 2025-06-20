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
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <string>
#include <string.h>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "napi/native_api.h"
#include "common.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_cursor.h"
#include "database/rdb/oh_predicates.h"
#include "database/rdb/oh_value_object.h"
#include "database/rdb/oh_values_bucket.h"

char *RDB_TEST_PATH =  NULL;
char RDB_STORE_NAME[] =  "rdb_store_encrypt_test.db";
char RDB_STORE_NAME2[] =  "Encrypt.db";
char BUNDLE_NAME[] =  "com.acts.relationalstorenapiTest";
char MODULE_NAME[] =  "com.acts.relationalstorenapiTest";


OH_Rdb_Store *storeEncryptTestRdbStore_ = NULL;
OH_Rdb_Store *storeEncryptTestRdbStore2_ = NULL;
static OH_Rdb_Config config_;
static OH_Rdb_Config config1_;
static OH_Rdb_Config config2_;
static OH_Rdb_Config config3_;
static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
    config_.storeName = RDB_STORE_NAME;
    config_.bundleName = BUNDLE_NAME;
    config_.moduleName = MODULE_NAME;
    config_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_.isEncrypt = false;
    config_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig1()
{
    config1_.dataBaseDir = RDB_TEST_PATH;
    config1_.storeName = RDB_STORE_NAME;
    config1_.bundleName = BUNDLE_NAME;
    config1_.moduleName = MODULE_NAME;
    config1_.securityLevel = OH_Rdb_SecurityLevel::S2;
    config1_.isEncrypt = false;
    config1_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig2()
{
    config2_.dataBaseDir = RDB_TEST_PATH;
    config2_.storeName = RDB_STORE_NAME2;
    config2_.bundleName = BUNDLE_NAME;
    config2_.moduleName = MODULE_NAME;
    config2_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config2_.isEncrypt = true;
    config2_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig3()
{
    config3_.dataBaseDir = RDB_TEST_PATH;
    config3_.storeName = RDB_STORE_NAME2;
    config3_.bundleName = BUNDLE_NAME;
    config3_.moduleName = MODULE_NAME;
    config3_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config3_.isEncrypt = false;
    config3_.selfSize = sizeof(OH_Rdb_Config);
}

static napi_value RdbFilePath(napi_env env, napi_callback_info info) {
    int errCode = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    size_t bufferSize = 0;
    napi_get_value_string_latin1(env, args[0], nullptr, 0, &bufferSize);

    char *buffer = (char*)malloc((bufferSize) + 1);
    napi_get_value_string_utf8(env, args[0], buffer, bufferSize+1, &bufferSize);  

    RDB_TEST_PATH = (char*)malloc((bufferSize) + 1);
    sprintf(RDB_TEST_PATH, "%s", buffer);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_ENCRYPT_0100(napi_env env, napi_callback_info info) {
    InitRdbConfig2();
    mkdir(config2_.dataBaseDir, 0770);
    
    InitRdbConfig3();
    mkdir(config3_.dataBaseDir, 0770);        
    
    int errCode = 0;
    storeEncryptTestRdbStore_ = OH_Rdb_GetOrOpen(&config2_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeEncryptTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config2 is fail.");
    
    storeEncryptTestRdbStore2_ = OH_Rdb_GetOrOpen(&config3_, &errCode);
    NAPI_ASSERT(env, storeEncryptTestRdbStore2_ != NULL, "OH_Rdb_GetOrOpen config3 is success.");
    
    errCode = OH_Rdb_CloseStore(storeEncryptTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");
    storeEncryptTestRdbStore_ = NULL;
    storeEncryptTestRdbStore2_ = NULL;
    
    errCode = OH_Rdb_DeleteStore(&config2_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail.");
    
    errCode = OH_Rdb_DeleteStore(&config3_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


static napi_value SUB_DDM_RDB_ENCRYPT_0200(napi_env env, napi_callback_info info) {

    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);
        
    InitRdbConfig1();
    mkdir(config1_.dataBaseDir, 0770);  
    
    int errCode = 0;
    storeEncryptTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeEncryptTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");
    
    storeEncryptTestRdbStore2_ = OH_Rdb_GetOrOpen(&config1_, &errCode);
    NAPI_ASSERT(env, storeEncryptTestRdbStore2_ != NULL, "OH_Rdb_GetOrOpen config1 is fail.");
    
    errCode = OH_Rdb_CloseStore(storeEncryptTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");
    storeEncryptTestRdbStore_ = NULL;
    storeEncryptTestRdbStore2_ = NULL;
    errCode = OH_Rdb_DeleteStore(&config1_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
    {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr}, 
    {"SUB_DDM_RDB_ENCRYPT_0100", nullptr, SUB_DDM_RDB_ENCRYPT_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SUB_DDM_RDB_ENCRYPT_0200", nullptr, SUB_DDM_RDB_ENCRYPT_0200, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "encrypt",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
