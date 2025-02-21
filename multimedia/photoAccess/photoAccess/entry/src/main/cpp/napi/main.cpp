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

static napi_value TestMediaAssetGetMediaType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetMediaType(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetMediaSubType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetMediaSubType(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDateAdded(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDateAdded(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDateModified(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDateModified(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDateTaken(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDateTaken(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDateAddedMs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDateAddedMs(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetDuration(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetDuration(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetIsFavorite(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetIsFavorite(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMediaAssetGetTitle(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MediaAssetGetTitle(index);

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

static napi_value TestChangeRequestAddResourceWithUri(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestAddResourceWithUri(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestChangeRequestGetWriteCacheHandler(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestGetWriteCacheHandler(index);

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

static napi_value TestManagerRequestMovingPhoto(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ManagerRequestMovingPhoto(index);

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

static napi_value TestManagerRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ManagerRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMovingPhotoGetUri(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MovingPhotoGetUri(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMovingPhotoRequestContentWithUris(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MovingPhotoRequestContentWithUris(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMovingPhotoRequestContentWithUri(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MovingPhotoRequestContentWithUri(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMovingPhotoRequestContentWithBuffer(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MovingPhotoRequestContentWithBuffer(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestMovingPhotoRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->MovingPhotoRelease(index);

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
        {"testMediaAssetGetMediaType", nullptr, TestMediaAssetGetMediaType, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaAssetGetMediaSubType", nullptr, TestMediaAssetGetMediaSubType, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetGetDateAdded", nullptr, TestMediaAssetGetDateAdded, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaAssetGetDateModified", nullptr, TestMediaAssetGetDateModified, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetGetDateTaken", nullptr, TestMediaAssetGetDateTaken, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaAssetGetDateAddedMs", nullptr, TestMediaAssetGetDateAddedMs, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testMediaAssetGetDuration", nullptr, TestMediaAssetGetDuration, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaAssetIsFavorite", nullptr, TestMediaAssetIsFavorite, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testMediaAssetGetTitle", nullptr, TestMediaAssetGetTitle, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMediaAssetRelease", nullptr, TestMediaAssetRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testChangeRequestAddResourceWithUri", nullptr, TestChangeRequestAddResourceWithUri, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testChangeRequestGetWriteCacheHandler", nullptr, TestChangeRequestGetWriteCacheHandler, nullptr, nullptr,
            nullptr, napi_default, nullptr},
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
        {"testManagerRequestMovingPhoto", nullptr, TestManagerRequestMovingPhoto, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testManagerRelease", nullptr, TestManagerRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMovingPhotoGetUri", nullptr, TestMovingPhotoGetUri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMovingPhotoRequestContentWithUris", nullptr, TestMovingPhotoRequestContentWithUris, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testMovingPhotoRequestContentWithUri", nullptr, TestMovingPhotoRequestContentWithUri, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testMovingPhotoRequestContentWithBuffer", nullptr, TestMovingPhotoRequestContentWithBuffer, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testMovingPhotoRelease", nullptr, TestMovingPhotoRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
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