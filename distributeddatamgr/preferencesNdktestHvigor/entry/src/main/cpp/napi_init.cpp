/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "hilog/log.h"
#include <string>
#include "database/preferences/oh_preferences_option.h"
#include "database/preferences/oh_preferences.h"
#include "database/preferences/oh_preferences_err_code.h"
#include "database/preferences/oh_preferences_value.h"
#include "common.h"
#include <iostream>
#include <ctime>
#include <condition_variable>
#include <cstdint>
#include <functional>
#include <list>
#include <map>
#include <memory>
#include <mutex>
#include <thread>
#include <vector>
#include <random>
#include <chrono>
#include <sys/stat.h>
#include <sys/types.h>

const char *TAG = "testLog";
const std::string TEST_PATH = "/data/test/";
static std::vector< OH_PreferencesPair *> changedData;
static OH_PreferencesPair *g_pairs = nullptr;
static bool IsFileExist(const std::string &path)
{
    struct stat buffer;
    return (stat(path.c_str(), &buffer) == 0);
}

int g_changeNum = 0;
void DataChangeObserverCallback(void *context, const OH_PreferencesPair *pairs, uint32_t count) {
    g_changeNum = 0;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "DataChangeObserverCallback count= %{public}d", count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "DataChangeObserverCallback g_changeNum= %{public}d", g_changeNum);

    for (uint32_t i = 0; i < count; i++) {
        const char *keyRet = OH_PreferencesPair_GetKey(pairs, i);
        const OH_PreferencesValue *pValue = OH_PreferencesPair_GetPreferencesValue(pairs, i);
        Preference_ValueType type = OH_PreferencesValue_GetValueType(pValue);
        if (type == Preference_ValueType::PREFERENCE_TYPE_INT) {
            int intV = 0;
            OH_PreferencesValue_GetInt(pValue, &intV);
        } else if (type == Preference_ValueType::PREFERENCE_TYPE_BOOL) {
            bool boolV = false;
            OH_PreferencesValue_GetBool(pValue, &boolV);
        } else if (type == Preference_ValueType::PREFERENCE_TYPE_STRING) {
            char *stringV = nullptr;
            uint32_t len = 0;
            OH_PreferencesValue_GetString(pValue, &stringV, &len);
            OH_Preferences_FreeString(stringV);
        } else if (type == Preference_ValueType::PREFERENCE_TYPE_NULL) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "Preference_ValueType::Preference_TYPE_NULL");
        } else if (type == Preference_ValueType::PREFERENCE_TYPE_BUTT) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "Preference_ValueType::TYPE_BUTT");
        }
        g_changeNum++;
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "DataChangeObserverCallback count= %{public}d", count);
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "DataChangeObserverCallback g_changeNum= %{public}d", g_changeNum);
    }
}


std::map<std::string, int> intDataMap = {{"ndktest_int_key_1", -2147483648},
                                         {"ndktest_int_key_2", -1},
                                         {"ndktest_int_key_3", 0},
                                         {"ndktest_int_key_4", 1},
                                         {"ndktest_int_key_5", 2147483647}};
std::map<std::string, std::string> stringDataMap = {
    {"ndktest_string_key_1", "2679b2c70120214984b3aec34fc849dc996f40e3cdb60f3b3eaf8abe2559439a"},
    {"ndktest_string_key_2", "+88780079687688"},
    {"ndktest_string_key_3", "/data/storage/el2/base/files/Thumbnail_1717209543267.jpg"},
    {"ndktest_string_key_4", "688"},
    {"ndktest_string_key_5", "https://upfile-drcn.platform.hicloud.com/"}};
std::map<std::string, bool> boolDataMap = {{"ndktest_bool_key_1", true},
                                           {"ndktest_bool_key_2", false},
                                           {"ndktest_bool_key_3", false},
                                           {"ndktest_bool_key_4", true},
                                           {"ndktest_bool_key_5", true}};

void SetAllValuesWithCheck(OH_Preferences *pref) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "SetAllValuesWithCheck ");
    for (auto &[key, value] : intDataMap) {
        OH_Preferences_SetInt(pref, key.c_str(), value);
        int res;
        OH_Preferences_GetInt(pref, key.c_str(), &res);
    }
    for (auto &[key, value] : stringDataMap) {
        OH_Preferences_SetString(pref, key.c_str(), value.c_str());
        char *res = nullptr;
        uint32_t len = 0;
        OH_Preferences_GetString(pref, key.c_str(), &res, &len);
        OH_Preferences_FreeString(res);
    }
    for (auto &[key, value] : boolDataMap) {
        OH_Preferences_SetBool(pref, key.c_str(), value);
        bool res;
        OH_Preferences_GetBool(pref, key.c_str(), &res);
    }
}

static napi_value OH_PreferencesOption_Create_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Create_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    int errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Create_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}
 
static napi_value OH_PreferencesOption_SetFilePath_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    int errcode = OH_PreferencesOption_SetFileName(option, "test.db");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");

    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_SetFilePath_0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0200 ------------- ");
    int rettest = 0;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    int errcode = OH_PreferencesOption_SetFileName(option, "");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFileName(option, "") errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetFileName(option, "") is fail.");

    errcode = OH_PreferencesOption_SetFileName(option, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFileName(option, nullptr)  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetFileName(option, nullptr) is fail.");

    errcode = OH_PreferencesOption_SetFileName(option, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFileName(option, NULL)  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetFileName(option, NULL)  is fail.");

    errcode = OH_PreferencesOption_SetFileName(nullptr, "test.db");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFilePath(nullptr  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetFilePath(nullptr  is fail.");

    errcode = OH_PreferencesOption_SetFileName(NULL, "test.db");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFilePath(NULL  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetFilePath(NULL is fail.");

    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, rettest, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_SetBundleName_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    int errcode = OH_PreferencesOption_SetBundleName(option, "test");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    
    errcode = OH_PreferencesOption_SetBundleName(option, "");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");

    std::string bName("V_*%^=&*_~!@$%^&*()_<>?:+(%$+-*/");
    errcode = OH_PreferencesOption_SetBundleName(option, bName.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetBundleName bName is fail.");

    std::string bName2(50, 'a');
    errcode = OH_PreferencesOption_SetBundleName(option, bName2.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetBundleName bName2 is fail.");

    std::string bName3(60, 'b');
    errcode = OH_PreferencesOption_SetBundleName(option, bName3.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetBundleName bName3 is fail.");
    
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetFilePath_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_SetBundleName_0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetBundleName_0200 ------------- ");
    int rettest = 0;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();

    int errcode = OH_PreferencesOption_SetBundleName(option, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetBundleName2 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetBundleName is fail.");

    errcode = OH_PreferencesOption_SetBundleName(option, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetBundleName3 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetBundleName is fail.");
    
    errcode = OH_PreferencesOption_SetBundleName(nullptr, "test");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetBundleName4 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetBundleName is fail.");

    errcode = OH_PreferencesOption_SetBundleName(NULL, "test");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetBundleName5 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetBundleName is fail.");

    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetBundleName_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, rettest, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_SetDataGroupId_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetDataGroupId_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();

    int errcode = OH_PreferencesOption_SetDataGroupId(option, "");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetDataGroupId is fail.");
    
    errcode = OH_PreferencesOption_SetDataGroupId(option, "id");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetDataGroupId is fail.");
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, pref == nullptr, "OH_Preferences_Open is fail.");

    errcode = OH_PreferencesOption_SetDataGroupId(option, "123456");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetDataGroupId is fail.");
    OH_Preferences *pref2 = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, pref2 == nullptr, "OH_Preferences_Open 2 is fail.");
    
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetDataGroupId_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_SetDataGroupId_0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetDataGroupId_0200 ------------- ");
    int rettest = 0;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();

    int errcode = OH_PreferencesOption_SetDataGroupId(option, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetDataGroupId errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetDataGroupId is fail.");

    errcode = OH_PreferencesOption_SetDataGroupId(option, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetDataGroupId errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetDataGroupId is fail.");

    errcode = OH_PreferencesOption_SetDataGroupId(nullptr, "test");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetDataGroupId errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetDataGroupId is fail.");

    errcode = OH_PreferencesOption_SetDataGroupId(NULL, "test");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetDataGroupId errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_SetDataGroupId is fail.");

    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_SetDataGroupId_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, rettest, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_Destroy_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Destroy_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    
    int errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Destroy_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_PreferencesOption_Destroy_0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Destroy_0200 ------------- ");
    int err = 0;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    int errcode = OH_PreferencesOption_Destroy(NULL);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_Destroy is fail.");
    
    errcode = OH_PreferencesOption_Destroy(nullptr);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_PreferencesOption_Destroy_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, err, &ret);
    return ret;
}

static napi_value OH_Preferences_Open_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Close is fail.");

    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_Open_0200(napi_env env, napi_callback_info info) 
{
    int testry = 0;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0200 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "func OH_Preferences_Open_0200  111------------- ");
    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(NULL, &errcode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_OpenNULL  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open 1 is fail.");

    OH_Preferences *pref2 = OH_Preferences_Open(nullptr, &errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open 2 is fail.");
    
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_Close_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_Close(nullptr);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Close is fail.");

    errcode = OH_Preferences_Close(NULL);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Close is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Open_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetInt_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetInt_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_Open  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open 1 is fail.");

    errcode = OH_Preferences_SetInt(pref, "key", 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 2 is fail.");
    
    errcode = OH_Preferences_SetInt(pref, " ", 123);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_SetInt 3 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 3 is fail.");
    
    errcode = OH_Preferences_SetInt(nullptr, "key", 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetInt err 1 is fail.");

    errcode = OH_Preferences_SetInt(NULL, "key", 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetInt err 2  is fail.");
    
    errcode = OH_Preferences_SetInt(pref, "", 123);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_SetInt 5 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "H_Preferences_SetInt err 3 is fail.");
    
    errcode = OH_Preferences_SetInt(pref, nullptr, 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "H_Preferences_SetInt err 4 is fail.");

    errcode = OH_Preferences_SetInt(pref, NULL, 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "H_Preferences_SetInt err 5 is fail.");
    
    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    pref = nullptr;

    errcode = OH_Preferences_SetInt(pref, "keyclose", 123);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_SetInt keyclose errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open 2 is fail.");
    
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetInt_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetGetInt_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetGetInt_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_Open  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open 1 is fail.");

    errcode = OH_Preferences_SetInt(pref, "key", 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 2 is fail.");
    int resGet;
    errcode = OH_Preferences_GetInt(pref, "key", &resGet);
    NAPI_ASSERT(env, resGet == 123, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    bool resGetbool;
    errcode = OH_Preferences_GetBool(pref, "key", &resGetbool);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetInt3 is fail.");

    //=========SetInt-GetInt
    std::string string1024Key(1024, 'a');
    std::string string1025Key(1025, 'a');
    errcode = OH_Preferences_SetInt(pref, string1024Key.c_str(), 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 4 is fail.");

    errcode = OH_Preferences_GetInt(pref, string1024Key.c_str(), &resGet);
    NAPI_ASSERT(env, resGet == 123, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_SetInt(pref, string1025Key.c_str(), 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetInt 5 is fail.");
    errcode = OH_Preferences_GetInt(pref, string1025Key.c_str(), &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_SetInt(pref, "keyV0", 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 4 is fail.");
    errcode = OH_Preferences_GetInt(pref, "keyV0", &resGet);
    NAPI_ASSERT(env, resGet == 0, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    int valueMax = 1024*1024*1024*2;
    errcode = OH_Preferences_SetInt(pref, "keyV1024", valueMax);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 4 is fail.");
    errcode = OH_Preferences_GetInt(pref, "keyV1024", &resGet);
    NAPI_ASSERT(env, resGet == valueMax, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_SetInt(pref, "key*%^&*(%$#@", 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt 4 is fail.");
    errcode = OH_Preferences_GetInt(pref, "key*%^&*(%$#@", &resGet);
    NAPI_ASSERT(env, resGet == 0, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetInt_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetGetString_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetGetString_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_Open  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open 1 is fail.");
    
    //=========SetString-GetString
    std::string string1024Key(1024, 'a');
    std::string string1025Key(1025, 'a');
    errcode = OH_Preferences_SetString(pref, string1024Key.c_str(), "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString string1024Key is fail.");
    char *resGet = nullptr;
    uint32_t len = 0;
    errcode = OH_Preferences_GetString(pref, string1024Key.c_str(), &resGet, &len);
    NAPI_ASSERT(env, strcmp(resGet, "str") == 0, "OH_Preferences_GetString string1024Key is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetString string1024Key is fail.");
    OH_Preferences_FreeString(resGet);
    errcode = OH_Preferences_Delete(pref, string1024Key.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Delete string1024Key is fail.");

    errcode = OH_Preferences_SetString(pref, string1025Key.c_str(), "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetString string1025Key is fail.");
    errcode = OH_Preferences_GetString(pref, string1025Key.c_str(), &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetString string1025Key is fail.");

    errcode = OH_Preferences_Delete(pref, string1025Key.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Delete string1025Key is fail.");

    errcode = OH_Preferences_SetString(pref, "", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetString "" is fail.");
    errcode = OH_Preferences_Delete(pref, "");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Delete "" is fail.");

    errcode = OH_Preferences_SetString(pref, " ", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString " " is fail.");
    errcode = OH_Preferences_Delete(pref, " ");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Delete " " is fail.");
    
    len = 0;
    errcode = OH_Preferences_SetString(pref, "keyV0", " ");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString keyV0  is fail.");
    errcode = OH_Preferences_GetString(pref, "keyV0", &resGet, &len);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetString keyV0  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetString keyV0 is fail.");
    NAPI_ASSERT(env, strcmp(resGet, " ") == 0, "OH_Preferences_GetString keyV0 111 is fail.");
    OH_Preferences_FreeString(resGet);
    
    len = 0;
    errcode = OH_Preferences_SetString(pref, "keyVStr00", "");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_SetString keyVStr00 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString keyVStr00  is fail.");
    errcode = OH_Preferences_GetString(pref, "keyVStr00", &resGet, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetString keyVStr00 1 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetString keyVStr00 1 is fail.");
    
    errcode = OH_Preferences_GetString(pref, "keyVStr00", &resGet, &len);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetString keyVStr00 2 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetString keyVStr00 2 is fail.");
    OH_Preferences_FreeString(resGet); 

    std::string string1024Value(1024 * 1024 * 16, 'v');
    std::string string1025Value(1024 * 1024 * 16 +1, 'v');

    errcode = OH_Preferences_SetString(pref, "keyVStr1024", string1024Value.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString keyVStr1024 is fail.");
    errcode = OH_Preferences_GetString(pref, "keyVStr1024", &resGet, &len);
    NAPI_ASSERT(env, resGet == string1024Value, "OH_Preferences_GetString  keyVStr1024 is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetString keyVStr1024 is fail.");
    OH_Preferences_FreeString(resGet); 
    
    errcode = OH_Preferences_SetString(pref, "keyVStr1025", string1025Value.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetString keyVStr1025 is fail.");
    errcode = OH_Preferences_GetString(pref, "keyVStr1025", &resGet, &len);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetString keyVStr1025 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetString keyVStr1025 is fail.");
    
    std::string stringSpecialValue("V_*%^=&*_~!@$%^&*()_<>?:+(%$+-*/");
    errcode = OH_Preferences_SetString(pref, "key_*%^&*(%$#@", stringSpecialValue.c_str());
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetString key_*%^&*(%$#@ is fail.");
    errcode = OH_Preferences_GetString(pref, "key_*%^&*(%$#@", &resGet,  &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetString key_*%^&*(%$#@ is fail.");
    NAPI_ASSERT(env, strcmp(resGet, stringSpecialValue.c_str()) == 0, "OH_Preferences_GetString key_*%^&*(%$#@ is fail.");
    OH_Preferences_FreeString(resGet); 

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetGetString_0100 -end------------ ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetGetBool_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetGetBool_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_Open  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open 1 is fail.");

    errcode = OH_Preferences_SetBool(pref, "key", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt2 is fail.");
    
    bool resGet;
    errcode = OH_Preferences_GetBool(pref, "key", &resGet);
    NAPI_ASSERT(env, resGet == true, "OH_Preferences_GetInt is fail.");
    
    //=========SetInt-GetInt
    std::string string1024Key(1024, 'a');
    std::string string1025Key(1025, 'a');
    errcode = OH_Preferences_SetBool(pref, string1024Key.c_str(), false);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetBool 4 is fail.");
    errcode = OH_Preferences_GetBool(pref, string1024Key.c_str(), &resGet);
    NAPI_ASSERT(env, resGet == false, "OH_Preferences_GetBool is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetBool is fail.");

    errcode = OH_Preferences_SetBool(pref, string1025Key.c_str(), false);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetBool 5 is fail.");
    errcode = OH_Preferences_GetBool(pref, string1025Key.c_str(), &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetBool is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetGetBool_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetString_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetString_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open1 is fail.");

    errcode = OH_Preferences_SetString(pref, "key", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open2 is fail.");

    errcode = OH_Preferences_SetString(nullptr, "key", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open3 is fail.");

    errcode = OH_Preferences_SetString(NULL, "key", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open4 is fail.");

    errcode = OH_Preferences_SetString(pref, "", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open5 is fail.");

    errcode = OH_Preferences_SetString(pref, " ", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open6 is fail.");
    
    errcode = OH_Preferences_SetString(pref, nullptr, "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open7 is fail.");

    errcode = OH_Preferences_SetString(pref, NULL, "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open8 is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetString_0100 ------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_SetBool_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetBool_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open1 is fail.");

    errcode = OH_Preferences_SetBool(pref, "key", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open2 is fail.");

    errcode = OH_Preferences_SetBool(nullptr, "key", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open3 is fail.");

    errcode = OH_Preferences_SetBool(NULL, "key", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open4 is fail.");

    errcode = OH_Preferences_SetBool(pref, "", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open5 is fail.");

    errcode = OH_Preferences_SetBool(pref, " ", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open6 is fail.");
    
    errcode = OH_Preferences_SetBool(pref, nullptr, true);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open7 is fail.");

    errcode = OH_Preferences_SetBool(pref, NULL, true);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open8 is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetBool_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_GetInt_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open1 is fail.");

    errcode = OH_Preferences_SetInt(pref, "key", 123);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt2 is fail.");
    errcode = OH_Preferences_SetInt(pref, " ", 12345);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt2 is fail.");

    int resGet;
    errcode = OH_Preferences_GetInt(pref, "key", &resGet);
    NAPI_ASSERT(env, resGet == 123, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_GetInt(nullptr, "key", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt4 is fail.");

    errcode = OH_Preferences_GetInt(NULL, "key", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt5 is fail.");

    errcode = OH_Preferences_GetInt(pref, "", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt6 is fail.");

    errcode = OH_Preferences_GetInt(pref, "key123456", &resGet);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,"OH_Preferences_GetInt key123456  errcode= %{public}d",errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetInt61 is fail.");
    
    errcode = OH_Preferences_GetInt(pref, " ", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt7 is fail.");
    
    errcode = OH_Preferences_GetInt(pref, nullptr, &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt8 is fail.");

    errcode = OH_Preferences_GetInt(pref, NULL, &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt9 is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 end------------- ");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_GetString_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetString_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");
    
    errcode = OH_Preferences_SetString(pref, "key", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");
    errcode = OH_Preferences_SetString(pref, " ", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");

    char *resGet = nullptr;
    uint32_t len = 0;
    errcode = OH_Preferences_GetString(pref, "key", &resGet, &len);
    NAPI_ASSERT(env, strcmp(resGet, "str") == 0, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt1 is fail.");
    OH_Preferences_FreeString(resGet);
    
    errcode = OH_Preferences_GetString(nullptr, "key", &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt2 is fail.");

    errcode = OH_Preferences_GetString(NULL, "key", &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt3 is fail.");

    errcode = OH_Preferences_GetString(pref, "", &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt4 is fail.");

    errcode = OH_Preferences_GetString(pref, "key123456",  &resGet, &len);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetString key123456  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetInt61 is fail.");

    errcode = OH_Preferences_GetString(pref, " ", &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt5 is fail.");
    OH_Preferences_FreeString(resGet); 
    
    errcode = OH_Preferences_GetString(pref, nullptr, &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt6 is fail.");
    
    errcode = OH_Preferences_GetString(pref, NULL, &resGet, &len);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt7 is fail.");
 
    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetString_0100 end------------- ");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_GetBool_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetBool_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open1 is fail.");

    errcode = OH_Preferences_SetBool(pref, "key", true);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt2 is fail.");
    errcode = OH_Preferences_SetBool(pref, " ", false);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt2 is fail.");
    
    bool resGet;
    errcode = OH_Preferences_GetBool(pref, "key", &resGet);
    NAPI_ASSERT(env, resGet == true, "OH_Preferences_GetInt is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt3 is fail.");
    
    errcode = OH_Preferences_GetBool(nullptr, "key", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt4 is fail.");

    errcode = OH_Preferences_GetBool(NULL, "key", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt5 is fail.");

    errcode = OH_Preferences_GetBool(pref, "", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt6 is fail.");

    errcode = OH_Preferences_GetBool(pref, "key123456", &resGet);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_GetBool key123456  errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetInt61 is fail.");
    
    errcode = OH_Preferences_GetBool(pref, " ", &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt7 is fail.");
    
    errcode = OH_Preferences_GetBool(pref, nullptr, &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt8 is fail.");

    errcode = OH_Preferences_GetBool(pref, NULL, &resGet);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetInt9 is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetBool_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_FreeString(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_SetString(pref, "key", "str");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");

    char *resGet = nullptr;
    uint32_t len = 0;
    errcode = OH_Preferences_GetString(pref, "key", &resGet, &len);
    NAPI_ASSERT(env, strcmp(resGet, "str") == 0, "OH_Preferences_GetString is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_GetInt is fail.");
    OH_Preferences_FreeString(resGet);

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_Delete(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");
    
    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetInt_0100 end------------- ");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_RegisterDataObserver_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0100 ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "DBDataObserver001.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    SetAllValuesWithCheck(pref);

    g_changeNum = 0;
    const char *keys[] = {"ndktest_int_key_1", "ndktest_string_key_1", "ndktest_bool_key_1"};
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_RegisterDataObserver(pref, NULL, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_RegisterDataObserver(nullptr, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_RegisterDataObserver(NULL, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, nullptr, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, NULL, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, DataChangeObserverCallback, nullptr, 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, DataChangeObserverCallback, NULL, 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0100 end------------- ");

    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Preferences_UnregisterDataObserver_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_UnregisterDataObserver ------------- ");
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "DBDataObserver002.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");

    int errcode = 1;
    OH_Preferences *pref = OH_Preferences_Open(option, &errcode);
    NAPI_ASSERT(env, pref != nullptr, "OH_Preferences_Open is fail.");
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_Open is fail.");

    SetAllValuesWithCheck(pref);

    g_changeNum = 0;
    const char *keys[] = {"ndktest_int_key_1", "ndktest_string_key_1", "ndktest_bool_key_1"};
    errcode = OH_Preferences_RegisterDataObserver(pref, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_RegisterDataObserver is fail.");

    errcode = OH_Preferences_UnregisterDataObserver(pref, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_Preferences_UnRegisterDataObserver is fail.");

    errcode = OH_Preferences_UnregisterDataObserver(nullptr, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_UnregisterDataObserver(NULL, nullptr, DataChangeObserverCallback, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_UnregisterDataObserver(pref, nullptr, nullptr, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_UnregisterDataObserver(pref, nullptr, NULL, keys, 3);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_UnregisterDataObserver(pref, nullptr, DataChangeObserverCallback, nullptr, 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");
    errcode = OH_Preferences_UnregisterDataObserver(pref, nullptr, DataChangeObserverCallback, NULL, 0);
    NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Open is fail.");

    errcode = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_SetFilePath is fail.");
    errcode = OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errcode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_UnregisterDataObserver end------------- ");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_PreferencesPair_0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0200 ------------- ");
    int result = 0;
     const char *pkey = OH_PreferencesPair_GetKey(NULL, 0);
     NAPI_ASSERT(env, pkey == nullptr, "OH_PreferencesPair_GetKey 1 is fail.");
     const char *pkey2 = OH_PreferencesPair_GetKey(nullptr, 0);
     NAPI_ASSERT(env, pkey2 == nullptr, "OH_PreferencesPair_GetKey 2 is fail.");
     const char *pkey3 = OH_PreferencesPair_GetKey(g_pairs, -1);
     NAPI_ASSERT(env, pkey3 == nullptr, "OH_PreferencesPair_GetKey 3 is fail.");

     const OH_PreferencesValue *pValue = OH_PreferencesPair_GetPreferencesValue(NULL, 0);
     NAPI_ASSERT(env, pValue == nullptr, "OH_PreferencesPair_GetPreferencesValue is fail.");
     const OH_PreferencesValue *pValue2 = OH_PreferencesPair_GetPreferencesValue(nullptr, 0);
     NAPI_ASSERT(env, pValue2 == nullptr, "OH_PreferencesPair_GetPreferencesValue is fail.");

     int intV = 0;
     int errcode = OH_PreferencesValue_GetInt(NULL, &intV);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesPair_GetKey is fail.");
     errcode = OH_PreferencesValue_GetInt(nullptr, &intV);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesPair_GetKey is fail.");

     bool boolV = false;
     errcode = OH_PreferencesValue_GetBool(NULL, &boolV);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBool is fail.");
     errcode = OH_PreferencesValue_GetBool(nullptr, &boolV);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBool is fail.");

     char *stringV = nullptr;
     uint32_t len = 0;
     errcode = OH_PreferencesValue_GetString(NULL, &stringV, &len);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBool is fail.");
     errcode = OH_PreferencesValue_GetString(nullptr, &stringV, &len);
     NAPI_ASSERT(env, errcode == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBool is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0200 end------------- ");

    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
   
}

static napi_value OH_Preferences_ErrCode_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0200 ------------- ");
    int result = 0;
    OH_Preferences_ErrCode errcode = PREFERENCES_OK;
    NAPI_ASSERT(env, errcode == 0, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_INVALID_PARAM;
    NAPI_ASSERT(env, errcode == 401, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_NOT_SUPPORTED;
    NAPI_ASSERT(env, errcode == 801, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_BASE;
    NAPI_ASSERT(env, errcode == 15500000, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_DELETE_FILE;
    NAPI_ASSERT(env, errcode == 15500010, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_STORAGE;
    NAPI_ASSERT(env, errcode == 15500011, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_MALLOC;
    NAPI_ASSERT(env, errcode == 15500012, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_KEY_NOT_FOUND;
    NAPI_ASSERT(env, errcode == 15500013, "PREFERENCES_OK is fail.");
    errcode = PREFERENCES_ERROR_GET_DATAOBSMGRCLIENT;
    NAPI_ASSERT(env, errcode == 15500019, "PREFERENCES_OK is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_RegisterDataObserver_0200 end------------- ");
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value OH_Preferences_IsStorageTypeSupported0500(napi_env env, napi_callback_info info)
{
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    const char *fileName = "CStorageTypeTest005";
    NAPI_ASSERT(env, OH_PreferencesOption_SetFileName(option, fileName) == PREFERENCES_OK, "OH_PreferencesOption_Create is fail.");
    bool isEnhance = false;
    int errCode = OH_Preferences_IsStorageTypeSupported(Preferences_StorageType::PREFERENCES_STORAGE_GSKV, &isEnhance);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_Preferences_IsStorageTypeSupported is fail.");
    if (isEnhance) {
        NAPI_ASSERT(env, OH_PreferencesOption_SetStorageType(option, Preferences_StorageType::PREFERENCES_STORAGE_GSKV) ==
         PREFERENCES_OK, "OH_Preferences_IsStorageTypeSupported is fail.");
        OH_Preferences *pref = OH_Preferences_Open(option, &errCode);
        NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, OH_Preferences_SetInt(pref, "key", 2) == PREFERENCES_OK, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, OH_Preferences_Close(pref) == PREFERENCES_OK, "OH_Preferences_Open  dropTableSql is fail.");
        NAPI_ASSERT(env, IsFileExist(TEST_PATH + std::string(fileName) + ".db") == true, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, IsFileExist(TEST_PATH + std::string(fileName)) == false, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, OH_PreferencesOption_SetFileName(option, fileName) == PREFERENCES_OK, "OH_Preferences_Open is fail.");
    } else {
        NAPI_ASSERT(env, OH_PreferencesOption_SetStorageType(option, Preferences_StorageType::PREFERENCES_STORAGE_GSKV) ==
         PREFERENCES_OK, "OH_Preferences_IsStorageTypeSupported is fail.");
        (void)OH_Preferences_Open(option, &errCode);
        NAPI_ASSERT(env, errCode == PREFERENCES_ERROR_NOT_SUPPORTED, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, IsFileExist(TEST_PATH + std::string(fileName) + ".db") == false, "OH_Preferences_Open is fail.");
        NAPI_ASSERT(env, IsFileExist(TEST_PATH + std::string(fileName)) == false, "OH_Preferences_Open is fail.");
    }
    (void)OH_PreferencesOption_Destroy(option);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) 
{
    napi_property_descriptor desc[] = {

        {"OH_PreferencesOption_Create_0100", nullptr, OH_PreferencesOption_Create_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_PreferencesOption_SetFilePath_0100", nullptr, OH_PreferencesOption_SetFilePath_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_SetFilePath_0200", nullptr, OH_PreferencesOption_SetFilePath_0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_SetBundleName_0100", nullptr, OH_PreferencesOption_SetBundleName_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_SetBundleName_0200", nullptr, OH_PreferencesOption_SetBundleName_0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_SetDataGroupId_0100", nullptr, OH_PreferencesOption_SetDataGroupId_0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_SetDataGroupId_0200", nullptr, OH_PreferencesOption_SetDataGroupId_0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PreferencesOption_Destroy_0100", nullptr, OH_PreferencesOption_Destroy_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_PreferencesOption_Destroy_0200", nullptr, OH_PreferencesOption_Destroy_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Preferences_Open_0100", nullptr, OH_Preferences_Open_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_Open_0200", nullptr, OH_Preferences_Open_0200, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_Close_0100", nullptr, OH_Preferences_Close_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_SetInt_0100", nullptr, OH_Preferences_SetInt_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_SetGetInt_0100", nullptr, OH_Preferences_SetGetInt_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Preferences_SetGetString_0100", nullptr, OH_Preferences_SetGetString_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Preferences_SetGetBool_0100", nullptr, OH_Preferences_SetGetBool_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},

        {"OH_Preferences_SetString_0100", nullptr, OH_Preferences_SetString_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Preferences_SetBool_0100", nullptr, OH_Preferences_SetBool_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},

        {"OH_Preferences_GetInt_0100", nullptr, OH_Preferences_GetInt_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_GetString_0100", nullptr, OH_Preferences_GetString_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Preferences_GetBool_0100", nullptr, OH_Preferences_GetBool_0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},

        {"OH_Preferences_FreeString", nullptr, OH_Preferences_FreeString, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Preferences_Delete", nullptr, OH_Preferences_Delete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_RegisterDataObserver_0100", nullptr, OH_Preferences_RegisterDataObserver_0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_UnregisterDataObserver_0100", nullptr, OH_Preferences_UnregisterDataObserver_0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PreferencesPair_0200", nullptr, OH_PreferencesPair_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_ErrCode_0100", nullptr, OH_Preferences_ErrCode_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_IsStorageTypeSupported0500", nullptr, OH_Preferences_IsStorageTypeSupported0500, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
