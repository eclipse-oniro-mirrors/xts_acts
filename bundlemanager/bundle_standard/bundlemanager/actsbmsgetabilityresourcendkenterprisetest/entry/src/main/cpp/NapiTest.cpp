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
#include "bundle/ability_resource_info.h"
#include "bundle/native_interface_bundle.h"
#include "napi/native_api.h"
#include <cstdlib>
#include <fstream>
#include <iostream>

const int COUNT = 0;
const int ERRORCODE = 401;

static void AddStringProperty(napi_env env, napi_value array, size_t *index,
                              OH_NativeBundle_AbilityResourceInfo *module,
                              BundleManager_ErrorCode (*getter)(OH_NativeBundle_AbilityResourceInfo *, char **))
{
    char *str = nullptr;
    getter(module, &str);
    napi_value strValue;
    if (str) {
        napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &strValue);
        free(str);
    } else {
        napi_get_null(env, &strValue);
    }
    napi_set_element(env, array, (*index)++, strValue);
}
static napi_value ProcessMatchingModule(napi_env env, OH_NativeBundle_AbilityResourceInfo *modules,
                                        size_t moduleCount)
{
    const char *targetBundleName = "com.acts.getabilityresourceinfo";
    size_t nativeBundleSize = OH_NativeBundle_GetSize();

    for (size_t i = 0; i < moduleCount; i++) {
        auto module = (OH_NativeBundle_AbilityResourceInfo *)((char *)modules + nativeBundleSize * i);
        char *currentBundleName = nullptr;
        OH_NativeBundle_GetBundleName(module, &currentBundleName);

        if (currentBundleName && strcmp(currentBundleName, targetBundleName) == 0) {
            napi_value moduleArray;
            napi_create_array(env, &moduleArray);
            size_t index = 0;

            // Add numeric and boolean properties
            napi_value sizeValue;
            napi_create_uint32(env, nativeBundleSize, &sizeValue);
            napi_set_element(env, moduleArray, index++, sizeValue);

            bool isDefaultApp = true;
            OH_NativeBundle_CheckDefaultApp(module, &isDefaultApp);
            napi_value defaultAppValue;
            napi_get_boolean(env, isDefaultApp, &defaultAppValue);
            napi_set_element(env, moduleArray, index++, defaultAppValue);

            int appIndex = -1;
            OH_NativeBundle_GetAppIndex(module, &appIndex);
            napi_value appIndexValue;
            napi_create_int32(env, appIndex, &appIndexValue);
            napi_set_element(env, moduleArray, index++, appIndexValue);

            // Add string properties using helper function
            AddStringProperty(env, moduleArray, &index, module, OH_NativeBundle_GetLabel);
            AddStringProperty(env, moduleArray, &index, module, OH_NativeBundle_GetModuleName);
            AddStringProperty(env, moduleArray, &index, module, OH_NativeBundle_GetAbilityName);

            // Add bundle name
            napi_value bundleNameValue;
            napi_create_string_utf8(env, currentBundleName, NAPI_AUTO_LENGTH, &bundleNameValue);
            napi_set_element(env, moduleArray, index++, bundleNameValue);

            // Add drawable null check
            ArkUI_DrawableDescriptor *rawDrawable = nullptr;
            OH_NativeBundle_GetDrawableDescriptor(module, &rawDrawable);
            bool isDrawableNull = (rawDrawable == nullptr);
            napi_value drawableNullValue;
            napi_get_boolean(env, isDrawableNull, &drawableNullValue);
            napi_set_element(env, moduleArray, index++, drawableNullValue);

            free(currentBundleName);
            return moduleArray;
        }
        if (currentBundleName) {
            free(currentBundleName);
        }
    }

    napi_throw_error(env, nullptr, "No matching bundle found");
    return nullptr;
}
static napi_value GetAbilityResourceInfo(napi_env env, napi_callback_info info)
{
    // Parameter validation and retrieval
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_throw_error(env, nullptr, "Invalid arguments. Expected fileType string.");
        return nullptr;
    }

    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    if (status != napi_ok || valuetype != napi_string) {
        napi_throw_error(env, nullptr, "Argument must be a string");
    }

    char fileType[256] = {0};
    size_t strLen;
    status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get fileType string");
        return nullptr;
    }

    // Get resource information
    size_t moduleCount = 0;
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    BundleManager_ErrorCode ret = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);

    std::cout << "OH_NativeBundle_GetAbilityResourceInfo returned moduleCount: " << moduleCount << std::endl;

    if (ret == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
        napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
        return nullptr;
    }

    if (modules == nullptr || moduleCount == 0) {
        std::cout << "no metadata found for file type: " << fileType;
        napi_throw_error(env, nullptr, "no metadata found");
        return nullptr;
    }

    // Call processing function
    napi_value result = ProcessMatchingModule(env, modules, moduleCount);

    OH_AbilityResourceInfo_Destroy(modules, moduleCount);
    return result;
}
static napi_value GetBundleNameErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    char *bundleName = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetBundleName(nullptr, &bundleName);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetBundleName(modules, &bundleName);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetModuleNameErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    char *moduleName = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetModuleName(nullptr, &moduleName);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetModuleName(modules, &moduleName);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetAbilityNameErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    char *abilityName = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetAbilityName(nullptr, &abilityName);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetAbilityName(modules, &abilityName);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetLabelErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    char *label = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetLabel(nullptr, &label);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetLabel(modules, &label);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetAppIndexErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    int appIndex = -1;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetAppIndex(nullptr, &appIndex);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetAppIndex(modules, &appIndex);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value CheckDefaultAppErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    bool isDefaultApp = false;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_CheckDefaultApp(nullptr, &isDefaultApp);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_CheckDefaultApp(modules, &isDefaultApp);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetDrawableDescriptorErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    ArkUI_DrawableDescriptor *rawDrawable = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_NativeBundle_GetDrawableDescriptor(nullptr, &rawDrawable);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_NativeBundle_GetDrawableDescriptor(modules, &rawDrawable);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value AbilityResourceInfoDestroyErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    BundleManager_ErrorCode ret;

    if (valuetype == napi_null) {
        ret = OH_AbilityResourceInfo_Destroy(nullptr, COUNT);
    } else if (valuetype == napi_string) {
        char fileType[256] = {0};
        size_t strLen;
        status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get fileType string");
            return nullptr;
        }
        size_t moduleCount = 0;
        BundleManager_ErrorCode code = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
        if (code == BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED) {
            napi_throw_error(env, "201", "BUNDLE_MANAGER_ERROR_CODE_PERMISSION_DENIED");
            return nullptr;
        }
        ret = OH_AbilityResourceInfo_Destroy(modules, moduleCount);
    } else {
        napi_throw_error(env, nullptr, "Argument must be string or null");
        return nullptr;
    }
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ERRORCODE, &result);
    } else if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}
static napi_value GetAbilityResourceErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);
    char fileType[256] = {0};
    size_t strLen;
    status = napi_get_value_string_utf8(env, args[0], fileType, sizeof(fileType) - 1, &strLen);
    OH_NativeBundle_AbilityResourceInfo *modules = nullptr;
    size_t moduleCount = 0;
    BundleManager_ErrorCode ret = OH_NativeBundle_GetAbilityResourceInfo(fileType, &modules, &moduleCount);
    napi_value result;
    if (ret == BUNDLE_MANAGER_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getAbilityResourceInfo", nullptr, GetAbilityResourceInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getBundleNameTest", nullptr, GetBundleNameErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getModuleNameTest", nullptr, GetModuleNameErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbilityNameTest", nullptr, GetAbilityNameErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLabelTest", nullptr, GetLabelErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAppIndexTest", nullptr, GetAppIndexErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkDefaultAppTest", nullptr, CheckDefaultAppErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDrawableDescriptorTest", nullptr, GetDrawableDescriptorErrorTest, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"abilityResourceInfoDestroyTest", nullptr, AbilityResourceInfoDestroyErrorTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getAbilityResourceErrorTest", nullptr, GetAbilityResourceErrorTest, nullptr, nullptr, nullptr, napi_default,
         nullptr}};
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }