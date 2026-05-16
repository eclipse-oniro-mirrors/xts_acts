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

static napi_value OHCertManagerNativeApiUkeyErr0100(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length()), (uint8_t*)identity.c_str()};
    OH_CM_UkeyInfo ukeyInfo = {OH_CM_CERT_PURPOSE_SIGN};
    OH_CM_CredentialDetailList credentialDetailList = {0, nullptr};
    
    int32_t ohResult = OH_CertManager_GetUkeyCertificate(&keyUri, &ukeyInfo, &credentialDetailList);
    
    OH_CertManager_FreeUkeyCertificate(&credentialDetailList);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_INNER_FAILURE || ohResult == OH_CM_CAPABILITY_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiUkeyErr0200(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length()), (uint8_t*)identity.c_str()};
    OH_CM_UkeyInfo ukeyInfo = {OH_CM_CERT_PURPOSE_SIGN};
    OH_CM_CredentialDetailList credentialDetailList = {0, nullptr};
    
    int32_t ohResult = OH_CertManager_GetUkeyCertificate(&keyUri, &ukeyInfo, &credentialDetailList);
    
    OH_CertManager_FreeUkeyCertificate(&credentialDetailList);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_PARAMETER_VALIDATION_FAILED || ohResult == OH_CM_CAPABILITY_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPrivateFunc0100(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPrivateCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_SUCCESS) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPrivateErr0100(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPrivateCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_PARAMETER_VALIDATION_FAILED) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPrivateErr0200(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPrivateCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_NOT_FOUND) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPublicErr0100(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPublicCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_PARAMETER_VALIDATION_FAILED) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPublicErr0200(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPublicCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_INNER_FAILURE) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static napi_value OHCertManagerNativeApiPublicErr0300(napi_env env, napi_callback_info info)
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
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    
    int32_t ohResult = OH_CertManager_GetPublicCertificate(&keyUri, credential);
    
    OH_CertManager_FreeCredential(credential);
    napi_value ret;
    napi_create_int32(env, -1, &ret);
    if (ohResult == OH_CM_NO_AUTHORIZATION) {
        napi_create_int32(env, 0, &ret);
    }

    return ret;
}

static void SetInt32Prop(napi_env env, napi_value obj, const char* name, int32_t value)
{
    napi_value val;
    napi_create_int32(env, value, &val);
    napi_set_named_property(env, obj, name, val);
}

static napi_value OHCertValidateEnumTest0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value resultObj;
    napi_create_object(env, &resultObj);

    SetInt32Prop(env, resultObj, "OH_CM_SUCCESS", OH_CM_SUCCESS);
    SetInt32Prop(env, resultObj, "OH_CM_HAS_NO_PERMISSION", OH_CM_HAS_NO_PERMISSION);
    SetInt32Prop(env, resultObj, "OH_CM_CAPABILITY_NOT_SUPPORTED", OH_CM_CAPABILITY_NOT_SUPPORTED);
    SetInt32Prop(env, resultObj, "OH_CM_INNER_FAILURE", OH_CM_INNER_FAILURE);
    SetInt32Prop(env, resultObj, "OH_CM_NOT_FOUND", OH_CM_NOT_FOUND);
    SetInt32Prop(env, resultObj, "OH_CM_INVALID_CERT_FORMAT", OH_CM_INVALID_CERT_FORMAT);
    SetInt32Prop(env, resultObj, "OH_CM_MAX_CERT_COUNT_REACHED", OH_CM_MAX_CERT_COUNT_REACHED);
    SetInt32Prop(env, resultObj, "OH_CM_NO_AUTHORIZATION", OH_CM_NO_AUTHORIZATION);
    SetInt32Prop(env, resultObj, "OH_CM_DEVICE_ENTER_ADVSECMODE", OH_CM_DEVICE_ENTER_ADVSECMODE);
    SetInt32Prop(env, resultObj, "OH_CM_STORE_PATH_NOT_SUPPORTED", OH_CM_STORE_PATH_NOT_SUPPORTED);
    SetInt32Prop(env, resultObj, "OH_CM_ACCESS_UKEY_SERVICE_FAILED", OH_CM_ACCESS_UKEY_SERVICE_FAILED);
    SetInt32Prop(env, resultObj, "OH_CM_PARAMETER_VALIDATION_FAILED", OH_CM_PARAMETER_VALIDATION_FAILED);
    SetInt32Prop(env, resultObj, "OH_CM_CERT_PURPOSE_DEFAULT", OH_CM_CERT_PURPOSE_DEFAULT);
    SetInt32Prop(env, resultObj, "OH_CM_CERT_PURPOSE_ALL", OH_CM_CERT_PURPOSE_ALL);
    SetInt32Prop(env, resultObj, "OH_CM_CERT_PURPOSE_SIGN", OH_CM_CERT_PURPOSE_SIGN);
    SetInt32Prop(env, resultObj, "OH_CM_CERT_PURPOSE_ENCRYPT", OH_CM_CERT_PURPOSE_ENCRYPT);

    return resultObj;
}

static void SetStringProp(napi_env env, napi_value obj, const char* name, const char* value)
{
    napi_value val;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &val);
    napi_set_named_property(env, obj, name, val);
}

static void SetUint32Prop(napi_env env, napi_value obj, const char* name, uint32_t value)
{
    napi_value val;
    napi_create_uint32(env, value, &val);
    napi_set_named_property(env, obj, name, val);
}

static napi_value OHCertNativeCredTest0100(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    size_t strLength;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &strLength);
    if (strLength >= SIZE_MAX) {
        napi_throw_error(env, nullptr, "string length range error");
        return nullptr;
    }

    char* buffer = (char*)malloc(strLength + 1);
    if (buffer == nullptr) {
        napi_throw_error(env, nullptr, "malloc buffer error");
        return nullptr;
    }

    size_t copied;
    napi_get_value_string_utf8(env, args[0], buffer, strLength + 1, &copied);
    std::string identity = buffer;
    free(buffer);
    
    OH_CM_Blob keyUri = {static_cast<uint32_t>(identity.length() + 1), (uint8_t*)identity.c_str()};
    OH_CM_Credential *credential = static_cast<OH_CM_Credential*>(malloc(sizeof(OH_CM_Credential)));
    if (credential == nullptr) {
        napi_throw_error(env, nullptr, "malloc credential error");
        return nullptr;
    }
    
    int32_t ohResult = OH_CertManager_GetPrivateCertificate(&keyUri, credential);
    
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    SetInt32Prop(env, resultObj, "resultCode", ohResult);
    SetUint32Prop(env, resultObj, "isExist", credential->isExist);
    SetStringProp(env, resultObj, "type", credential->type);
    SetStringProp(env, resultObj, "alias", credential->alias);
    SetStringProp(env, resultObj, "keyUri", credential->keyUri);
    SetUint32Prop(env, resultObj, "certNum", credential->certNum);
    SetUint32Prop(env, resultObj, "keyNum", credential->keyNum);
    SetUint32Prop(env, resultObj, "credDataSize", credential->credData.size);
    SetUint32Prop(env, resultObj, "certPurpose", static_cast<uint32_t>(credential->certPurpose));
    
    OH_CertManager_FreeCredential(credential);
    free(credential);
    
    return resultObj;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiUkeyErr0100", nullptr, OHCertManagerNativeApiUkeyErr0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiUkeyErr0200", nullptr, OHCertManagerNativeApiUkeyErr0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPrivateFunc0100", nullptr, OHCertManagerNativeApiPrivateFunc0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPrivateErr0100", nullptr, OHCertManagerNativeApiPrivateErr0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPrivateErr0200", nullptr, OHCertManagerNativeApiPrivateErr0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPublicErr0100", nullptr, OHCertManagerNativeApiPublicErr0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPublicErr0200", nullptr, OHCertManagerNativeApiPublicErr0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertManagerNativeApiPublicErr0300", nullptr, OHCertManagerNativeApiPublicErr0300,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertValidateEnumTest0100", nullptr, OHCertValidateEnumTest0100,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OHCertNativeCredTest0100", nullptr, OHCertNativeCredTest0100,
            nullptr, nullptr, nullptr, napi_default, nullptr }
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