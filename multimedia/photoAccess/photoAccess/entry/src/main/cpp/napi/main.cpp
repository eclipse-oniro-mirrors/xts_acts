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

#include "photoAccessHelper.h"
#include "napi/native_api.h"
#include "hilog/log.h"

static NDKMediaLibrary *ndkMediaLibrary = nullptr;

/*-----media asset start-----*/
static napi_value TestMediaAssetGetUri(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetUri(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDisplayName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDisplayName(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetSize(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDateModifiedMs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDateModifiedMs(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetWidth(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetHeight(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetHeight(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetOrientation(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetOrientation(index);

    napi_create_int32(env, code, &result);
    return result;
}


static napi_value TestMediaAssetRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestChangeRequestAddResourceWithBuffer(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestAddResourceWithBuffer(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestChangeRequestSaveCameraPhoto(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestSaveCameraPhoto(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestChangeRequestDiscardCameraPhoto(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestDiscardCameraPhoto(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestChangeRequestRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestManagerRequestImage(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ManagerRequestImage(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAccessHelperApplyChanges(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAccessHelperApplyChanges(index);

    napi_create_int32(env, code, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testMediaAssetGetUri", nullptr, TestMediaAssetGetUri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAssetGetDisplayName", nullptr, TestMediaAssetGetDisplayName, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetGetSize", nullptr, TestMediaAssetGetSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAssetGetDateModifiedMs", nullptr, TestMediaAssetGetDateModifiedMs, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetGetWidth", nullptr, TestMediaAssetGetWidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAssetGetHeight", nullptr, TestMediaAssetGetHeight, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAssetGetOrientation", nullptr, TestMediaAssetGetOrientation, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetRelease", nullptr, TestMediaAssetRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testChangeRequestAddResourceWithBuffer", nullptr, TestChangeRequestAddResourceWithBuffer, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testChangeRequestSaveCameraPhoto", nullptr, TestChangeRequestSaveCameraPhoto, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testChangeRequestDiscardCameraPhoto", nullptr, TestChangeRequestDiscardCameraPhoto, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testChangeRequestRelease", nullptr, TestChangeRequestRelease, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testManagerRequestImage", nullptr, TestManagerRequestImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAccessHelperApplyChanges", nullptr, TestMediaAccessHelperApplyChanges, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };

    ndkMediaLibrary = new NDKMediaLibrary();

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/*
 * module define
 */
static napi_module g_module = {.nm_version = 1,
                               .nm_flags = 0,
                               .nm_filename = nullptr,
                               .nm_register_func = Init,
                               .nm_modname = "photoAccessHelperTest",
                               .nm_priv = ((void *)0),
                               .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MediaLibraryModule(void) { napi_module_register(&g_module); }