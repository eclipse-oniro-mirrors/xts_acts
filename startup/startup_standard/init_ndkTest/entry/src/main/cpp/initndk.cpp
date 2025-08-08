/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <deviceinfo.h>
#include <syscap_ndk.h>
#include <string>
#include <cstring>
#include <hilog/log.h>
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

#define FAIL -1
#define SUCCESS 0

static napi_value OHGetDeviceType(napi_env env, napi_callback_info info)
{
    std::string deviceType = OH_GetDeviceType();
    napi_value result = nullptr;
    napi_create_string_utf8(env, deviceType.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetManufacture(napi_env env, napi_callback_info info)
{
    std::string manufactureString = OH_GetManufacture();
    napi_value result = nullptr;
    napi_create_string_utf8(env, manufactureString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBrand(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBrand();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetMarketName(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetMarketName();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetProductSeries(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetProductSeries();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetProductModel(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetProductModel();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetSoftwareModel(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetSoftwareModel();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetHardwareModel(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetHardwareModel();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBootloaderVersion(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBootloaderVersion();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetAbiList(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetAbiList();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetSecurityPatchTag(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetSecurityPatchTag();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetDisplayVersion(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetDisplayVersion();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetIncrementalVersion(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetIncrementalVersion();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetOsReleaseType(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetOsReleaseType();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetOSFullName(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetOSFullName();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetSdkApiVersion(napi_env env, napi_callback_info info)
{
    int resultValue = OH_GetSdkApiVersion();
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value OHGetFirstApiVersion(napi_env env, napi_callback_info info)
{
    int resultValue = OH_GetFirstApiVersion();
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value OHGetVersionId(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetVersionId();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBuildType(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBuildType();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBuildUser(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBuildUser();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBuildHost(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBuildHost();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBuildTime(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBuildTime();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetBuildRootHash(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetBuildRootHash();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetDistributionOSName(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetDistributionOSName();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetDistributionOSVersion(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetDistributionOSVersion();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value OHGetDistributionOSApiVersion(napi_env env, napi_callback_info info)
{
    int resultValue = OH_GetDistributionOSApiVersion();
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value OHGetDistributionOSReleaseType(napi_env env, napi_callback_info info)
{
    std::string resultString = OH_GetDistributionOSReleaseType();
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultString.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CanIUse(napi_env env, napi_callback_info info)
{
    const char *cap;
    cap = "SystemCapability.Location.Location.Core";
    bool ret = canIUse(cap);
    int value = FAIL;
    if (ret) {
        value = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value CanIUseOther(napi_env env, napi_callback_info info)
{
    const char *cap;
    cap = "SystemCapability.ArkUI.ArkUI.Full";
    bool ret = canIUse(cap);
    int value = FAIL;
    if (ret) {
        value = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"oHGetDeviceType", nullptr, OHGetDeviceType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetManufacture", nullptr, OHGetManufacture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBrand", nullptr, OHGetBrand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetMarketName", nullptr, OHGetMarketName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetProductSeries", nullptr, OHGetProductSeries, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetProductModel", nullptr, OHGetProductModel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetSoftwareModel", nullptr, OHGetSoftwareModel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetHardwareModel", nullptr, OHGetHardwareModel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBootloaderVersion", nullptr, OHGetBootloaderVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetAbiList", nullptr, OHGetAbiList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetSecurityPatchTag", nullptr, OHGetSecurityPatchTag, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetDisplayVersion", nullptr, OHGetDisplayVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetIncrementalVersion", nullptr, OHGetIncrementalVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetOsReleaseType", nullptr, OHGetOsReleaseType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetOSFullName", nullptr, OHGetOSFullName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetSdkApiVersion", nullptr, OHGetSdkApiVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetFirstApiVersion", nullptr, OHGetFirstApiVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetVersionId", nullptr, OHGetVersionId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBuildType", nullptr, OHGetBuildType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBuildUser", nullptr, OHGetBuildUser, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBuildHost", nullptr, OHGetBuildHost, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBuildTime", nullptr, OHGetBuildTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetBuildRootHash", nullptr, OHGetBuildRootHash, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetDistributionOSName", nullptr, OHGetDistributionOSName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetDistributionOSVersion", nullptr, OHGetDistributionOSVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetDistributionOSApiVersion", nullptr, OHGetDistributionOSApiVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHGetDistributionOSReleaseType", nullptr, OHGetDistributionOSReleaseType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"canIUse", nullptr, CanIUse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"canIUseOther", nullptr, CanIUseOther, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "libinitndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
