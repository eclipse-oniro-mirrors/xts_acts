/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "common.h"
#include "hilog/log.h"
#include <condition_variable>
#include <cstdint>
#include <filesystem>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>
#include <vector>
#include "database/preferences/oh_preferences_value.h"
#include "database/preferences/oh_preferences_err_code.h"
#include "database/preferences/oh_preferences.h"
#include <map>
#include "database/preferences/oh_preferences_option.h"

const char *TAG = "Preference_Ndk_Test";
int g_changeNum = 0;

void CreateDirectoryRecursively(const std::string &path)
{
    std::string::size_type pos = path.find_last_of('/');
    if (pos == std::string::npos || path.front() != '/') {
        printf("path can not be relative path.\n");
    }
    std::string dir = path.substr(0, pos);

    std::string tempDirectory = dir;
    std::vector<std::string> directories;

    pos = tempDirectory.find('/');
    while (pos != std::string::npos) {
        std::string directory = tempDirectory.substr(0, pos);
        if (!directory.empty()) {
            directories.push_back(directory);
        }
        tempDirectory = tempDirectory.substr(pos + 1);
        pos = tempDirectory.find('/');
    }
    directories.push_back(tempDirectory);

    std::string databaseDirectory;
    for (const std::string& directory : directories) {
        databaseDirectory = databaseDirectory + "/" + directory;
    }
}

std::map<std::string, int> g_intDataMap = {
    {"ndktest_int_key_1", -2147483648},
    {"ndktest_int_key_2", -1},
    {"ndktest_int_key_3", 0},
    {"ndktest_int_key_4", 1},
    {"ndktest_int_key_5", 2147483647}
};

std::map<std::string, std::string> g_stringDataMap = {
    {"ndktest_string_key_1", "2679b2c70120214984b3aec34fc849dc996f40e3cdb60f3b3eaf8abe2559439a"},
    {"ndktest_string_key_2", "+88780079687688"},
    {"ndktest_string_key_3", "/data/storage/el2/base/files/Thumbnail_1717209543267.jpg"},
    {"ndktest_string_key_4", "A NEW PHONE"},
    {"ndktest_string_key_5", "https://upfile-drcn.platform.hicloud.com/"}
};

std::map<std::string, bool> g_boolDataMap = {
    {"ndktest_bool_key_1", true},
    {"ndktest_bool_key_2", false},
    {"ndktest_bool_key_3", false},
    {"ndktest_bool_key_4", true},
    {"ndktest_bool_key_5", true}
};






void DataChangeObserverCallback(void *context, const OH_PreferencesPair *pairs, uint32_t count)
{
    for (uint32_t i = 0; i < count; i++) {
        const OH_PreferencesValue *pValue = OH_PreferencesPair_GetPreferencesValue(pairs, i);
        Preference_ValueType type = OH_PreferencesValue_GetValueType(pValue);
        const char *pKey = OH_PreferencesPair_GetKey(pairs, i);
        if (pKey == nullptr) {
            return;
        }
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
        }
        g_changeNum++;
    }
}

void SetAllValuesWithCheck(OH_Preferences *pref)
{
    for (auto &[key, value] : g_intDataMap) {
        int errCode = OH_Preferences_SetInt(pref, key.c_str(), value);
        int res = 0;
        int errCode1 = OH_Preferences_GetInt(pref, key.c_str(), &res);
    }
    for (auto &[key, value] : g_stringDataMap) {
        int errCode = OH_Preferences_SetString(pref, key.c_str(), value.c_str());
        char *res = nullptr;
        uint32_t len = 0;
        int errCode1 = OH_Preferences_GetString(pref, key.c_str(), &res, &len);
        int ret = strcmp(res, value.c_str());
        OH_Preferences_FreeString(res);
    }
    for (auto &[key, value] : g_boolDataMap) {
        int errCode = OH_Preferences_SetBool(pref, key.c_str(), value);
        bool res;
        int errCode1 = OH_Preferences_GetBool(pref, key.c_str(), &res);
    }
}

static napi_value SetUpTestCase(napi_env env, napi_callback_info info)
{
    CreateDirectoryRecursively("/data/test/");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value SetUp(napi_env env, napi_callback_info info)
{
   CreateDirectoryRecursively("/data/test/");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}





static napi_value OH_Preferences_Delete_Value0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Delete_Value0100 start------------- ");
    int ret = OH_Preferences_DeletePreferences(nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_DeletePreferences ret is fail1.");
    OH_PreferencesOption* option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create options is fail.");
    NAPI_ASSERT(env, OH_PreferencesOption_SetBundleName(option, "com.test") == PREFERENCES_OK, "OH_PreferencesOption_Create  is fail.");
    ret = OH_Preferences_DeletePreferences(option);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_DeletePreferences ret is fail2.");
    (void)OH_PreferencesOption_Destroy(option);
    OH_Preferences_DeletePreferences(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Delete_Value0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_Delete_Value0200(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Delete_Value0200 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Preferences_Open errcode= %{public}d", errCode);
    
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_Preferences_Open is fail.");
    int errCode1 = OH_Preferences_SetInt(pref, "test_key", 123);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    int ret = OH_Preferences_DeletePreferences(option);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_Preferences_DeletePreferences is fail.");
    (void)OH_PreferencesOption_Destroy(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_Delete_Value0200 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_SetValue_0100(napi_env env, napi_callback_info info) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_0100 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int errCode1 = 1;
    errCode1 = OH_Preferences_SetValue(nullptr, "key", value);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetValue is fail1.");
    errCode1 = OH_Preferences_SetValue(pref, nullptr, value);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetValue is fail2.");
    errCode1 = OH_Preferences_SetValue(pref, "key", nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_SetValue is fail3.");
    OH_PreferencesValue* outValue = nullptr;
    errCode1 = OH_Preferences_GetValue(nullptr, "key", &outValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetValue is fail1.");
    errCode1 = OH_Preferences_GetValue(pref, nullptr, &outValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetValue is fail2.");
    errCode1 = OH_Preferences_GetValue(pref, "key", nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetValue is fail3.");
    OH_PreferencesValue_Destroy(value);
    int ret = OH_Preferences_Close(pref);
    OH_Preferences_DeletePreferences(option);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_SetValue_Int_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_Int_0100 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int errCode1 =1;
    OH_PreferencesValue* intValue = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, intValue != nullptr, "OH_PreferencesValue_Create is fail.");
    errCode1 = OH_PreferencesValue_SetInt(intValue, 456);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_PreferencesValue_SetInt is fail.");
    errCode1 = OH_Preferences_SetValue(pref, "int_key", intValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetValue is fail.");
    OH_PreferencesValue* getIntValue = OH_PreferencesValue_Create();
    errCode1 = OH_Preferences_GetValue(pref, "int_key", &getIntValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_GetValue is fail.");
    NAPI_ASSERT(env, getIntValue != nullptr, "OH_PreferencesValue_Create is fail.");
    int intVal = 0;
    errCode1 = OH_PreferencesValue_GetInt(getIntValue, &intVal);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_PreferencesValue_GetInt is fail.");
    NAPI_ASSERT(env, intVal == 456, "intVal is fail.");
    OH_PreferencesValue_Destroy(getIntValue);
    OH_PreferencesValue_Destroy(intValue);
    errCode1 = OH_Preferences_Close(pref);
    OH_Preferences_DeletePreferences(option);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_Int_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}
    
static napi_value OH_Preferences_SetValue_String_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_String_0100 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int errCode1 =1;
    OH_PreferencesValue* stringValue = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, stringValue != nullptr, "OH_PreferencesValue_Create is fail.");
    errCode1 = OH_PreferencesValue_SetString(stringValue, "test_string");
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_PreferencesValue_SetString is fail.");
    errCode1 = OH_Preferences_SetValue(pref, "string_key", stringValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetValue is fail.");
    
    OH_PreferencesValue* getStringValue = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, getStringValue != nullptr, "OH_PreferencesValue_Create is fail.");
    errCode1 = OH_Preferences_GetValue(pref, "string_key", &getStringValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_GetValue is fail.");
    char* strVal = nullptr;
    uint32_t len = 0;
    errCode1 = OH_PreferencesValue_GetString(stringValue, &strVal, &len);
    NAPI_ASSERT(env, getStringValue != nullptr, "OH_PreferencesValue_GetString is fail2.");
    OH_Preferences_FreeString(strVal);
    OH_PreferencesValue_Destroy(stringValue);
    OH_PreferencesValue_Destroy(getStringValue);
    errCode1 = OH_Preferences_Close(pref);
    OH_Preferences_DeletePreferences(option);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_String_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_SetValue_Bool_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_Bool_0100 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int errCode1 =1;
    OH_PreferencesValue* boolValue = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, boolValue != nullptr, "OH_PreferencesValue_Create is fail.");
    errCode1 = OH_PreferencesValue_SetBool(boolValue, true);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail.");
    errCode1 = OH_Preferences_SetValue(pref, "bool_key", boolValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetValue is fail.");
    OH_PreferencesValue* getBoolValue = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, getBoolValue != nullptr, "OH_PreferencesValue_GetString is fail2.");
    errCode1 = OH_Preferences_GetValue(pref, "bool_key", &getBoolValue);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_GetValue is fail.");
    OH_PreferencesValue_Destroy(boolValue);
    OH_PreferencesValue_Destroy(getBoolValue);
    errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_SetValue_Bool_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
    
}

static napi_value OH_Preferences_GetValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetValue_0100 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int errCode1 = 1;
    errCode1 = OH_Preferences_GetValue(pref, "non_existent_key", &value);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_GetValue is fail.");
    errCode1 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, errCode1 == PREFERENCE_TYPE_NULL, "OH_PreferencesValue_GetValueType is fail.");
    OH_PreferencesValue_Destroy(value);
    errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetValue_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_GetAllValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0100 start------------- ");
    OH_PreferencesPair* pairs = nullptr;
    uint32_t count = 0;
    int errCode1 = 1;
    errCode1 = OH_Preferences_GetAll(nullptr, &pairs, &count);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetAll is fail.");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    errCode1 = OH_Preferences_GetAll(pref, &pairs, nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetAll is fail1.");
    errCode1 = OH_Preferences_GetAll(pref, &pairs, nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_GetAll is fail2.");
    errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0100 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_GetAllValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0200 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test1.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    OH_PreferencesPair* pairs = nullptr;
    uint32_t count = 0;
    int ret = OH_Preferences_GetAll(pref, &pairs, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_Preferences_GetAll is fail.");
    NAPI_ASSERT(env, count == 0u, "count is fail.");
    int errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0200 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_GetAllValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0300 start------------- ");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test2.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    SetAllValuesWithCheck(pref);
    OH_PreferencesPair* pairs = nullptr;
    uint32_t count = 0;
    int ret = OH_Preferences_GetAll(pref, &pairs, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_Preferences_GetAll is fail.");
    NAPI_ASSERT(env, pairs != nullptr, "pairs is fail.");
    NAPI_ASSERT(env, count > 0u, "pairs is fail.");
    uint32_t expectedCount = g_intDataMap.size() + g_stringDataMap.size() + g_boolDataMap.size();
    NAPI_ASSERT(env, count == expectedCount, "pairs is fail.");
    if (pairs != nullptr) {
        OH_PreferencesPair_Destroy(pairs, count);
    }
    int errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    OH_PreferencesPair_Destroy(nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func OH_Preferences_GetAllValue_0300 end------------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_Preferences_HasKeyValue_0100(napi_env env, napi_callback_info info)
{
    bool result = OH_Preferences_HasKey(nullptr, "test_key");
    NAPI_ASSERT(env, result == false, "OH_Preferences_HasKey is fail.");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    result = OH_Preferences_HasKey(pref, nullptr);
    NAPI_ASSERT(env, result == false, "OH_Preferences_HasKey is fail2.");
    int errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_HasKeyValue_0200(napi_env env, napi_callback_info info)
{
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    bool result = OH_Preferences_HasKey(pref, "non_existent_key");
    NAPI_ASSERT(env, result == false, "OH_Preferences_HasKey is fail2.");
    int errCode1 = OH_Preferences_SetInt(pref, "test_key", 123);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");
    result = OH_Preferences_HasKey(pref, "test_key");
    NAPI_ASSERT(env, result == true, "OH_Preferences_HasKey is fail2.");
    result = OH_Preferences_HasKey(pref, "TEST_KEY");
    NAPI_ASSERT(env, result == false, "OH_Preferences_HasKey is fail3.");
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_FlushValue_0100(napi_env env, napi_callback_info info)
{
    int errCode1 = OH_Preferences_Flush(nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_Flush is fail.");
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_FlushValue_0200(napi_env env, napi_callback_info info)
{
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int errCode1 = 1;
    errCode1 = OH_Preferences_SetInt(pref, "flush_test_key", 789);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_SetInt is fail.");
    errCode1 = OH_Preferences_Flush(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Flush is fail.");
    errCode1 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_Close is fail.");
    OH_PreferencesOption *option1 = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option1, "test.db");
    OH_PreferencesOption_SetBundleName(option1, "test");
    OH_PreferencesOption_SetDataGroupId(option1, "");
    pref = OH_Preferences_Open(option1, &errCode);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_Preferences_Open is fail.");
    (void)OH_PreferencesOption_Destroy(option1);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail2.");
    int value = 0;
    errCode1 = OH_Preferences_GetInt(pref, "flush_test_key", &value);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_GetInt is fail2.");
    NAPI_ASSERT(env, value == 789, "value is fail2.");
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail2.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_ClearCache_0100(napi_env env, napi_callback_info info)
{
    int errCode2 = OH_Preferences_ClearCache(nullptr);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_ClearCache is fail2.");
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_ClearCache_0200(napi_env env, napi_callback_info info)
{
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    SetAllValuesWithCheck(pref);
    int errCode1 = OH_Preferences_ClearCache(pref);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    for (auto &[key, value] : g_intDataMap) {
        int errCode2 = OH_Preferences_HasKey(pref, key.c_str());
        NAPI_ASSERT(env, errCode2 == false, "OH_PreferencesOption_Destroy is fail.");
    }
    int errCode3 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode3 == PREFERENCES_OK, "OH_Preferences_Close is fail2.");
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_MultiProcessObserver_0100(napi_env env, napi_callback_info info)
{
    int errCode1 = 1;
    errCode1 = OH_Preferences_RegisterMultiProcessDataObserver(nullptr, nullptr, DataChangeObserverCallback);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_RegisterMultiProcessDataObserver is fail.");
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    errCode1 = OH_Preferences_RegisterMultiProcessDataObserver(pref, nullptr, nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_RegisterMultiProcessDataObserver is fail2.");
    errCode1 = OH_Preferences_UnregisterMultiProcessDataObserver(nullptr, nullptr, DataChangeObserverCallback);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_UnregisterMultiProcessDataObserver is fail.");
    errCode1 = OH_Preferences_UnregisterMultiProcessDataObserver(pref, nullptr, nullptr);
    NAPI_ASSERT(env, errCode1 == PREFERENCES_ERROR_INVALID_PARAM, "OH_Preferences_UnregisterMultiProcessDataObserver is fail.");
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail2.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_MultiProcessObserver_0200(napi_env env, napi_callback_info info)
{
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int ret = OH_Preferences_RegisterMultiProcessDataObserver(pref, nullptr, DataChangeObserverCallback);
    NAPI_ASSERT(env, ret == PREFERENCES_OK || ret == PREFERENCES_ERROR_STORAGE, "OH_Preferences_RegisterMultiProcessDataObserver is fail.");
    if (ret == PREFERENCES_OK) {
        int errCode1 = OH_Preferences_UnregisterMultiProcessDataObserver(pref, nullptr, DataChangeObserverCallback);
        NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_UnregisterMultiProcessDataObserver is fail.");
    }
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail2.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_Preferences_MultiProcessObserver_0300(napi_env env, napi_callback_info info)
{
    int errCode = PREFERENCES_OK;
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    NAPI_ASSERT(env, option != nullptr, "OH_PreferencesOption_Create is fail.");
    OH_PreferencesOption_SetFileName(option, "test.db");
    OH_PreferencesOption_SetBundleName(option, "test");
    OH_PreferencesOption_SetDataGroupId(option, "");
    OH_Preferences* pref = OH_Preferences_Open(option, &errCode);
    (void)OH_PreferencesOption_Destroy(option);
    NAPI_ASSERT(env, errCode == PREFERENCES_OK, "OH_PreferencesOption_Destroy is fail.");
    int contextData = 42;
    int ret = OH_Preferences_RegisterMultiProcessDataObserver(pref, &contextData, DataChangeObserverCallback);
    if (ret == PREFERENCES_OK) {
        int errCode1 = 1;
        errCode1 = OH_Preferences_UnregisterMultiProcessDataObserver(pref, &contextData, DataChangeObserverCallback);
        NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_UnregisterMultiProcessDataObserver is fail.");
        int differentContext = 100;
        errCode1 = OH_Preferences_UnregisterMultiProcessDataObserver(pref, &differentContext, DataChangeObserverCallback);
        NAPI_ASSERT(env, errCode1 == PREFERENCES_OK, "OH_Preferences_UnregisterMultiProcessDataObserver is fail2.");
    }
    int errCode2 = OH_Preferences_Close(pref);
    NAPI_ASSERT(env, errCode2 == PREFERENCES_OK, "OH_Preferences_Close is fail2.");
    OH_Preferences_DeletePreferences(option);
    int returnCode = 0;
    napi_value resultSet;
    napi_create_int32(env, returnCode, &resultSet);
    return resultSet;
}

static napi_value OH_PreferencesValue_Create_Value_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "---------- func OH_PreferencesValue_Create_Value_0100 start---------- ");
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    OH_PreferencesValue_Destroy(value);
    OH_PreferencesValue_Destroy(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "---------- func OH_PreferencesValue_Create_Value_0100 end---------- ");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetBasic_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int ret = OH_PreferencesValue_SetInt(nullptr, 123);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetInt(value, 456);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetInt is fail2.");
    int intVal = 0;
    ret = OH_PreferencesValue_GetInt(value, &intVal);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetInt is fail2.");
    NAPI_ASSERT(env, intVal == 456, "intVal is fail2.");
    ret = OH_PreferencesValue_SetBool(nullptr, true);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetBool is fail.");
    ret = OH_PreferencesValue_SetBool(value, true);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    bool boolVal = false;
    ret = OH_PreferencesValue_GetBool(value, &boolVal);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetBool is fail2.");
    NAPI_ASSERT(env, boolVal == true, "intVal is fail2.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetOperations_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int ret = OH_PreferencesValue_SetString(nullptr, "test");
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetString(value, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetString(value, "hello world");
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    uint32_t len = 0;
    char* strVal = nullptr;
    ret = OH_PreferencesValue_GetString(value, &strVal, &len);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    std::string strIn(strVal);
    std::string strOut("hello world");
    NAPI_ASSERT(env, strIn == strOut, "OH_PreferencesValue_SetBool is fail2.");
    NAPI_ASSERT(env, len > 0u, "OH_PreferencesValue_SetBool is fail2.");
    OH_Preferences_FreeString(strVal);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetInt64_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int ret = OH_PreferencesValue_SetInt64(nullptr, 123456789LL);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetInt64(value, 9876543210LL);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetInt64 is fail2.");
    int64_t int64Val = 0;
    ret = OH_PreferencesValue_GetInt64(nullptr, &int64Val);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetInt64 is fail.");
    ret = OH_PreferencesValue_GetInt64(value, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetInt64 is fail2.");
    ret = OH_PreferencesValue_GetInt64(value, &int64Val);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetInt64 is fail3.");
    NAPI_ASSERT(env, int64Val == 9876543210LL, "int64Val is fail3.");
    OH_PreferencesValue_SetString(value, "not int64");
    ret = OH_PreferencesValue_GetInt64(value, &int64Val);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_PreferencesValue_GetInt64 is fail3.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetDouble_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int ret = OH_PreferencesValue_SetDouble(nullptr, 3.14159);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetDouble(value, 2.71828);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    double doubleVal = 0.0;
    ret = OH_PreferencesValue_GetDouble(nullptr, &doubleVal);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetDouble is fail.");
    ret = OH_PreferencesValue_GetDouble(value, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetDouble is fail2.");
    ret = OH_PreferencesValue_GetDouble(value, &doubleVal);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    NAPI_ASSERT(env, doubleVal == 2.71828, "doubleVal is fail2.");
    OH_PreferencesValue_SetBool(value, true);
    ret = OH_PreferencesValue_GetDouble(value, &doubleVal);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_PreferencesValue_GetDouble is fail3.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetIntArray_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int intArray[] = {1, 2, 3, 4, 5};
    int ret = OH_PreferencesValue_SetIntArray(nullptr, intArray, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetIntArray is fail.");
    ret = OH_PreferencesValue_SetIntArray(value, nullptr, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetIntArray is fail2.");
    ret = OH_PreferencesValue_SetIntArray(value, intArray, 0);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetIntArray is fail3.");
    ret = OH_PreferencesValue_SetIntArray(value, intArray, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetIntArray is fail4.");
    int* outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetIntArray(nullptr, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetIntArray is fail.");
    ret = OH_PreferencesValue_GetIntArray(value, nullptr, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetIntArray is fail2.");
    ret = OH_PreferencesValue_GetIntArray(value, &outArray, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetIntArray is fail3.");
    ret = OH_PreferencesValue_GetIntArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetIntArray is fail4.");
    NAPI_ASSERT(env, count == 5u, "count is fail4.");
    for (uint32_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, outArray[i] == intArray[i], "outArray is fail4.");
    }
    free(outArray);
    OH_PreferencesValue_SetString(value, "not array");
    ret = OH_PreferencesValue_GetIntArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_PreferencesValue_GetIntArray is fail5.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetBoolArray_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    bool boolArray[] = {true, false, true, false};
    int ret = OH_PreferencesValue_SetBoolArray(nullptr, boolArray, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetBoolArray is fail.");
    ret = OH_PreferencesValue_SetBoolArray(value, nullptr, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetBoolArray is fail2.");
    ret = OH_PreferencesValue_SetBoolArray(value, boolArray, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBoolArray is fail3.");
    bool* outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetBoolArray(nullptr, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBoolArray is fail.");
    ret = OH_PreferencesValue_GetBoolArray(value, nullptr, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBoolArray is fail2.");
    ret = OH_PreferencesValue_GetBoolArray(value, &outArray, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetBoolArray is fail3.");
    ret = OH_PreferencesValue_GetBoolArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetBoolArray is fail4.");
    NAPI_ASSERT(env, count == 4u, "count is fail4.");
    for (uint32_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, outArray[i] == boolArray[i], "outArray is fail4.");
    }
    free(outArray);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetStringArray_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    const char* strArray[] = {"hello", "world", "test"};
    int ret = OH_PreferencesValue_SetStringArray(nullptr, strArray, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetStringArray is fail.");
    ret = OH_PreferencesValue_SetStringArray(value, nullptr, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetStringArray is fail2.");
    const char* invalidStrArray[] = {"valid", nullptr, "test"};
    ret = OH_PreferencesValue_SetStringArray(value, invalidStrArray, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetStringArray is fail3.");
    ret = OH_PreferencesValue_SetStringArray(value, strArray, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetStringArray is fail4.");
    char** outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetStringArray(nullptr, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetStringArray is fail.");
    ret = OH_PreferencesValue_GetStringArray(value, nullptr, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetStringArray is fail2.");
    ret = OH_PreferencesValue_GetStringArray(value, &outArray, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetStringArray is fail3.");
    ret = OH_PreferencesValue_GetStringArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetStringArray is fail4.");
    NAPI_ASSERT(env, count == 3u, "count is fail4.");
    for (uint32_t i = 0; i < count; ++i) {
        std::string strOut(outArray[i]);
        std::string strIn(strArray[i]);
        NAPI_ASSERT(env, strOut == strIn, "outArray is fail4.");
    }
    for (uint32_t i = 0; i < count; ++i) {
        free(outArray[i]);
    }
    free(outArray);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetInt64Array_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int64_t int64Array[] = {1234567890LL, 9876543210LL, -1234567890LL};
    int ret = OH_PreferencesValue_SetInt64Array(nullptr, int64Array, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt64Array is fail.");
    ret = OH_PreferencesValue_SetInt64Array(value, nullptr, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt64Array is fail2.");
    ret = OH_PreferencesValue_SetInt64Array(value, int64Array, 0);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt64Array is fail3.");
    ret = OH_PreferencesValue_SetInt64Array(value, int64Array, 3);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetInt64Array is fail4.");
    int64_t* outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetInt64Array(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetInt64Array is fail.");
    ret = OH_PreferencesValue_GetInt64Array(nullptr, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetInt64Array invalid is fail.");
    NAPI_ASSERT(env, count == 3u, "count is fail4.");
    for (uint32_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, outArray[i] == int64Array[i], "outArray is fail4.");
    }
    free(outArray);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetDoubleArray_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    double doubleArray[] = {1.1, 2.2, 3.3, 4.4};
    int ret = OH_PreferencesValue_SetDoubleArray(nullptr, doubleArray, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetDoubleArray is fail.");
    ret = OH_PreferencesValue_SetDoubleArray(value, nullptr, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetDoubleArray is fail2.");
    ret = OH_PreferencesValue_SetDoubleArray(value, doubleArray, 4);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetDoubleArray is fail3.");
    double* outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetDoubleArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_GetDoubleArray is fail.");
    ret = OH_PreferencesValue_GetDoubleArray(nullptr, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_GetDoubleArray invalid is fail.");
    NAPI_ASSERT(env, count == 4u, "count is fail4.");
    for (uint32_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, outArray[i] == doubleArray[i], "outArray is fail4.");
    }
    free(outArray);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_SetGetBlob_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    uint8_t blobData[] = {0x01, 0x02, 0x03, 0x04, 0x05};
    int ret = OH_PreferencesValue_SetBlob(nullptr, blobData, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetBlob(value, nullptr, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_SetBlob(value, blobData, 5);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    uint8_t* outBlob = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetBlob(nullptr, &outBlob, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_GetBlob(value, nullptr, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_GetBlob(value, &outBlob, nullptr);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    ret = OH_PreferencesValue_GetBlob(value, &outBlob, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    NAPI_ASSERT(env, count == 5u, "count == 5u is fail.");
    for (uint32_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, outBlob[i] == blobData[i], "outBlob is fail4.");
    }
    free(outBlob);
    OH_PreferencesValue_SetInt(value, 123);
    ret = OH_PreferencesValue_GetBlob(value, &outBlob, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_KEY_NOT_FOUND, "OH_PreferencesValue_GetBlob is fail.");
    OH_PreferencesValue_Destroy(value);
    
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_EdgeCases_Value_0100(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    const char* emptyArray[] = {};
    int ret = OH_PreferencesValue_SetStringArray(value, emptyArray, 0);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    char** outArray = nullptr;
    uint32_t count = 0;
    ret = OH_PreferencesValue_GetStringArray(value, &outArray, &count);
    NAPI_ASSERT(env, ret == PREFERENCES_ERROR_INVALID_PARAM, "OH_PreferencesValue_SetInt is fail.");
    NAPI_ASSERT(env, count == 0u, "count == 0u is fail.");
    OH_PreferencesValue_Destroy(value);
    value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    std::vector<int> largeArray(1000);
    for (size_t i = 0; i < largeArray.size(); ++i) {
        largeArray[i] = static_cast<int>(i);
    }
    ret = OH_PreferencesValue_SetIntArray(value, largeArray.data(), static_cast<uint32_t>(largeArray.size()));
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    int* outLargeArray = nullptr;
    uint32_t largeCount = 0;
    ret = OH_PreferencesValue_GetIntArray(value, &outLargeArray, &largeCount);
    NAPI_ASSERT(env, ret == PREFERENCES_OK, "OH_PreferencesValue_SetBool is fail2.");
    NAPI_ASSERT(env, largeCount == 1000u, "largeCount is fail2.");
    free(outLargeArray);
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0100(napi_env env, napi_callback_info info)
{
    Preference_ValueType type = OH_PreferencesValue_GetValueType(nullptr);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_NULL, "largeCount is fail2.");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0200(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    OH_PreferencesValue_SetInt(value, 123);
    Preference_ValueType type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_INT, "PREFERENCE_TYPE_INT is fail2.");
    OH_PreferencesValue_SetBool(value, true);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_BOOL, "PREFERENCE_TYPE_BOOL is fail2.");
    OH_PreferencesValue_SetString(value, "test string");
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_STRING, "PREFERENCE_TYPE_STRING is fail2.");
    OH_PreferencesValue_SetInt64(value, 1234567890LL);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_INT64, "PREFERENCE_TYPE_INT64 is fail2.");
    OH_PreferencesValue_SetDouble(value, 3.14159);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_DOUBLE, "PREFERENCE_TYPE_DOUBLE is fail2.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0300(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int intArray[] = {1, 2, 3};
    OH_PreferencesValue_SetIntArray(value, intArray, 3);
    Preference_ValueType type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_INT_ARRAY, "PREFERENCE_TYPE_INT64 is fail.");
    bool boolArray[] = {true, false, true};
    OH_PreferencesValue_SetBoolArray(value, boolArray, 3);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_BOOL_ARRAY, "PREFERENCE_TYPE_INT64 is fail.");
    const char* strArray[] = {"hello", "world"};
    OH_PreferencesValue_SetStringArray(value, strArray, 2);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_STRING_ARRAY, "PREFERENCE_TYPE_INT64 is fail.");
    double doubleArray[] = {1.1, 2.2, 3.3};
    OH_PreferencesValue_SetDoubleArray(value, doubleArray, 3);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_DOUBLE_ARRAY, "PREFERENCE_TYPE_INT64 is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0400(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    uint8_t blobData[] = {0x01, 0x02, 0x03};
    OH_PreferencesValue_SetBlob(value, blobData, 3);
    Preference_ValueType type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_BLOB, "PREFERENCE_TYPE_BLOB is fail.");
    int64_t int64Array[] = {1234567890LL, 9876543210LL};
    OH_PreferencesValue_SetInt64Array(value, int64Array, 2);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_INT64_ARRAY, "PREFERENCE_TYPE_BLOB is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0500(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    Preference_ValueType type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_NULL, "PREFERENCE_TYPE_NULL is fail.");
    const char* emptyStrArray[] = {};
    OH_PreferencesValue_SetStringArray(value, emptyStrArray, 0);
    type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_STRING_ARRAY, "PREFERENCE_TYPE_NULL is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0600(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    Preference_ValueType type = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type == PREFERENCE_TYPE_NULL, "PREFERENCE_TYPE_NULL is fail.");
    OH_PreferencesValue_SetInt(value, 100);
    Preference_ValueType type1 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type1 == PREFERENCE_TYPE_INT, "PREFERENCE_TYPE_NULL is fail.");
    OH_PreferencesValue_SetString(value, "transition test");
    Preference_ValueType type2 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type2 == PREFERENCE_TYPE_STRING, "PREFERENCE_TYPE_STRING is fail.");
    OH_PreferencesValue_SetBool(value, false);
    Preference_ValueType type3 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type3 == PREFERENCE_TYPE_BOOL, "PREFERENCE_TYPE_BOOL is fail.");
    double doubleArray[] = {1.5, 2.5};
    OH_PreferencesValue_SetDoubleArray(value, doubleArray, 2);
    Preference_ValueType type4 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type4 == PREFERENCE_TYPE_DOUBLE_ARRAY, "PREFERENCE_TYPE_DOUBLE_ARRAY is fail.");
    bool boolArray[] = {true};
    OH_PreferencesValue_SetBoolArray(value, boolArray, 1);
    Preference_ValueType type5 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type5 == PREFERENCE_TYPE_BOOL_ARRAY, "PREFERENCE_TYPE_DOUBLE_ARRAY is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0700(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    std::string largeString(1024, 'A');
    OH_PreferencesValue_SetString(value, largeString.c_str());
    Preference_ValueType type1 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type1 == PREFERENCE_TYPE_STRING, "PREFERENCE_TYPE_STRING is fail.");
    std::vector<int> largeArray(100);
    for (size_t i = 0; i < largeArray.size(); ++i) {
        largeArray[i] = static_cast<int>(i);
    }
    OH_PreferencesValue_SetIntArray(value, largeArray.data(), static_cast<uint32_t>(largeArray.size()));
    Preference_ValueType type2 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type2 == PREFERENCE_TYPE_INT_ARRAY, "PREFERENCE_TYPE_INT_ARRAY is fail.");
    std::vector<uint8_t> largeBlob(500);
    for (size_t i = 0; i < largeBlob.size(); ++i) {
        largeBlob[i] = static_cast<uint8_t>(i % 256);
    }
    OH_PreferencesValue_SetBlob(value, largeBlob.data(), static_cast<uint32_t>(largeBlob.size()));
    Preference_ValueType type3 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type3 == PREFERENCE_TYPE_BLOB, "PREFERENCE_TYPE_BLOB is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_PreferencesValue_GetValueType_Value_0800(napi_env env, napi_callback_info info)
{
    OH_PreferencesValue* value = OH_PreferencesValue_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_PreferencesValue_Create is fail.");
    int singleIntArray[] = {42};
    OH_PreferencesValue_SetIntArray(value, singleIntArray, 1);
    Preference_ValueType type1 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type1 == PREFERENCE_TYPE_INT_ARRAY, "PREFERENCE_TYPE_INT_ARRAY is fail.");
    const char* singleStrArray[] = {"single"};
    OH_PreferencesValue_SetStringArray(value, singleStrArray, 1);
    Preference_ValueType type2 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type2 == PREFERENCE_TYPE_STRING_ARRAY, "PREFERENCE_TYPE_STRING_ARRAY is fail.");
    bool singleBoolArray[] = {true};
    OH_PreferencesValue_SetBoolArray(value, singleBoolArray, 1);
    Preference_ValueType type3 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type3 == PREFERENCE_TYPE_BOOL_ARRAY, "PREFERENCE_TYPE_BOOL_ARRAY is fail.");
    double singleDoubleArray[] = {3.14};
    OH_PreferencesValue_SetDoubleArray(value, singleDoubleArray, 1);
    Preference_ValueType type4 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type4 == PREFERENCE_TYPE_DOUBLE_ARRAY, "PREFERENCE_TYPE_DOUBLE_ARRAY is fail.");
    int64_t singleInt64Array[] = {123456789LL};
    OH_PreferencesValue_SetInt64Array(value, singleInt64Array, 1);
    Preference_ValueType type5 = OH_PreferencesValue_GetValueType(value);
    NAPI_ASSERT(env, type5 == PREFERENCE_TYPE_INT64_ARRAY, "PREFERENCE_TYPE_INT64_ARRAY is fail.");
    OH_PreferencesValue_Destroy(value);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "SetUpTestCase", nullptr, SetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetUp", nullptr, SetUp, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"OH_Preferences_Delete_Value0100", nullptr, OH_Preferences_Delete_Value0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_Delete_Value0200", nullptr, OH_Preferences_Delete_Value0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_SetValue_0100", nullptr, OH_Preferences_SetValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_SetValue_Int_0100", nullptr, OH_Preferences_SetValue_Int_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_SetValue_String_0100", nullptr, OH_Preferences_SetValue_String_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_SetValue_Bool_0100", nullptr, OH_Preferences_SetValue_Bool_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_GetValue_0100", nullptr, OH_Preferences_GetValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_GetAllValue_0100", nullptr, OH_Preferences_GetAllValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_GetAllValue_0200", nullptr, OH_Preferences_GetAllValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_GetAllValue_0300", nullptr, OH_Preferences_GetAllValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_HasKeyValue_0100", nullptr, OH_Preferences_HasKeyValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_HasKeyValue_0200", nullptr, OH_Preferences_HasKeyValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_FlushValue_0100", nullptr, OH_Preferences_FlushValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_FlushValue_0200", nullptr, OH_Preferences_FlushValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_ClearCache_0100", nullptr, OH_Preferences_ClearCache_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_ClearCache_0200", nullptr, OH_Preferences_ClearCache_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_MultiProcessObserver_0100", nullptr, OH_Preferences_MultiProcessObserver_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_MultiProcessObserver_0200", nullptr, OH_Preferences_MultiProcessObserver_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Preferences_MultiProcessObserver_0300", nullptr, OH_Preferences_MultiProcessObserver_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "OH_PreferencesValue_Create_Value_0100", nullptr, OH_PreferencesValue_Create_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetBasic_Value_0100", nullptr, OH_PreferencesValue_SetGetBasic_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetOperations_Value_0100", nullptr, OH_PreferencesValue_SetGetOperations_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetInt64_Value_0100", nullptr, OH_PreferencesValue_SetGetInt64_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetDouble_Value_0100", nullptr, OH_PreferencesValue_SetGetDouble_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetIntArray_Value_0100", nullptr, OH_PreferencesValue_SetGetIntArray_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetBoolArray_Value_0100", nullptr, OH_PreferencesValue_SetGetBoolArray_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetStringArray_Value_0100", nullptr, OH_PreferencesValue_SetGetStringArray_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetInt64Array_Value_0100", nullptr, OH_PreferencesValue_SetGetInt64Array_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetDoubleArray_Value_0100", nullptr, OH_PreferencesValue_SetGetDoubleArray_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_SetGetBlob_Value_0100", nullptr, OH_PreferencesValue_SetGetBlob_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_EdgeCases_Value_0100", nullptr, OH_PreferencesValue_EdgeCases_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0100", nullptr, OH_PreferencesValue_GetValueType_Value_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0200", nullptr, OH_PreferencesValue_GetValueType_Value_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0300", nullptr, OH_PreferencesValue_GetValueType_Value_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0400", nullptr, OH_PreferencesValue_GetValueType_Value_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0500", nullptr, OH_PreferencesValue_GetValueType_Value_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0600", nullptr, OH_PreferencesValue_GetValueType_Value_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0700", nullptr, OH_PreferencesValue_GetValueType_Value_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_PreferencesValue_GetValueType_Value_0800", nullptr, OH_PreferencesValue_GetValueType_Value_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "capability ",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
