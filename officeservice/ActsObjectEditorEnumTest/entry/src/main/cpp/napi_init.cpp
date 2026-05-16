/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#define LOG_TAG "ContentEmbed_TEST"

#include <hilog/log.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>

namespace {

static napi_value TestMAX_OEID_LENGTH(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, MAX_OEID_LENGTH, &result);
    return result;
}

static napi_value TestMAX_PATH_LENGTH(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, MAX_PATH_LENGTH, &result);
    return result;
}

static napi_value TestMAX_NAME_LENGTH(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, MAX_NAME_LENGTH, &result);
    return result;
}

static napi_value TestMAX_DESCRIPTION_LENGTH(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, MAX_DESCRIPTION_LENGTH, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_OK(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_PERMISSION_DENIED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_PERMISSION_DENIED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_NULL_POINTER(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_NULL_POINTER, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED(napi_env env,
    napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_EXTENSION_ERROR, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_SYSTEM_ABNORMAL, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_STORAGE_OPERATION_FAILED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_STREAM_OPERATION_FAILED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_FILE_OPERATION_FAILED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_IN_DLP_SANDBOX, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED(napi_env env,
    napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_IMAGE_PACKER_OPERATION_FAILED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_CLIENT_CALLBACK_FAILED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_EXTENSION_ABNORMAL_EXIT, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_INVALID_LINKING_PATH, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_CONNECT_LIMIT_EXCEED, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_FILE_NOT_GRANT, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_DISK_FULL(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_DISK_FULL, &result);
    return result;
}

static napi_value TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_ERR_EXTENSION_NOT_SUPPORT, &result);
    return result;
}

static napi_value TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT(napi_env env,
    napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_CAPABILITY_SUPPORT_SNAPSHOT, &result);
    return result;
}

static napi_value TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT(napi_env env,
    napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, CE_CAPABILITY_SUPPORT_DO_EDIT, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestMAX_OEID_LENGTH", nullptr,
            TestMAX_OEID_LENGTH,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestMAX_PATH_LENGTH", nullptr,
            TestMAX_PATH_LENGTH,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestMAX_NAME_LENGTH", nullptr,
            TestMAX_NAME_LENGTH,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestMAX_DESCRIPTION_LENGTH", nullptr,
            TestMAX_DESCRIPTION_LENGTH,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_OK", nullptr,
            TestContentEmbedErrorCode_CE_ERR_OK,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_PERMISSION_DENIED", nullptr,
            TestContentEmbedErrorCode_CE_PERMISSION_DENIED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID", nullptr,
            TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_NULL_POINTER", nullptr,
            TestContentEmbedErrorCode_CE_ERR_NULL_POINTER,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR", nullptr,
            TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL", nullptr,
            TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX", nullptr,
            TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT", nullptr,
            TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH", nullptr,
            TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED", nullptr,
            TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT", nullptr,
            TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_DISK_FULL", nullptr,
            TestContentEmbedErrorCode_CE_ERR_DISK_FULL,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT", nullptr,
            TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT", nullptr,
            TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT", nullptr,
            TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};
} // namespace

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
