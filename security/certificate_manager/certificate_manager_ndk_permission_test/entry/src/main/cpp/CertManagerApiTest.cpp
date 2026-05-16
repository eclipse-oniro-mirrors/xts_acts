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

#include "napi/native_api.h"
#include "device_certificate/certmanager/cm_native_api.h"
#include "device_certificate/certmanager/cm_native_type.h"
#include <cstdint>
#include <string>

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

static napi_value OHCertManagerNativeApiUkeyPermission0100(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t str_length;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &str_length);

    if (str_length >= SIZE_MAX) {
        napi_throw_error(env, nullptr, "string length range error");
        return nullptr;
    }
    
    char* buffer = (char*)malloc(str_length + 1);
    if (buffer == nullptr) {
        napi_throw_error(env, nullptr, "malloc buffer error");
        return nullptr;
    }

    size_t copied;
    napi_get_value_string_utf8(env, args[0], buffer, str_length + 1, &copied);
    std::string identity = buffer;
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length()), (uint8_t*)identity.c_str()};
    OH_CM_UkeyInfo ukeyInfo = {OH_CM_CERT_PURPOSE_SIGN};
    OH_CM_CredentialDetailList credentialDetailList = {0, nullptr};
    
    int32_t ohResult = OH_CertManager_GetUkeyCertificate(&keyUri, &ukeyInfo, &credentialDetailList);
    
    OH_CertManager_FreeUkeyCertificate(&credentialDetailList);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_HAS_NO_PERMISSION || ohResult == OH_CM_CAPABILITY_NOT_SUPPORTED ) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPrivatePermission0100(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    size_t str_length;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &str_length);
    if (str_length >= SIZE_MAX) {
        napi_throw_error(env, nullptr, "string length range error");
        return nullptr;
    }
    
    char* buffer = (char*)malloc(str_length + 1);
    if (buffer == nullptr) {
        napi_throw_error(env, nullptr, "malloc buffer error");
        return nullptr;
    }
    size_t copied;
    napi_get_value_string_utf8(env, args[0], buffer, str_length + 1, &copied);
    std::string identity = buffer;
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length()+1), (uint8_t*)identity.c_str()};

    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPrivateCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_HAS_NO_PERMISSION) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPublicPermission0100(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    size_t str_length;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &str_length);
    if (str_length >= SIZE_MAX) {
        napi_throw_error(env, nullptr, "string length range error");
        return nullptr;
    }
    
    char* buffer = (char*)malloc(str_length + 1);
    if (buffer == nullptr) {
        napi_throw_error(env, nullptr, "malloc buffer error");
        return nullptr;
    }

    size_t copied;
    napi_get_value_string_utf8(env, args[0], buffer, str_length + 1, &copied);
    std::string identity = buffer;
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length()+1), (uint8_t*)identity.c_str()};

    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPublicCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_HAS_NO_PERMISSION) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiUkeyPermission0100", nullptr, OHCertManagerNativeApiUkeyPermission0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPrivatePermission0100", nullptr, OHCertManagerNativeApiPrivatePermission0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPublicPermission0100", nullptr, OHCertManagerNativeApiPublicPermission0100, nullptr, nullptr, nullptr, napi_default, nullptr }
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
