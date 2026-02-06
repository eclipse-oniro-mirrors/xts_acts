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
#include <bits/alltypes.h>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include "hilog/log.h"
#include <iostream>
#include "multimedia/media_library/media_asset_base_capi.h"
#include "multimedia/media_library/media_asset_manager_capi.h"
#include "securec.h"
#include <termios.h>
#include <unistd.h>
#include <uv.h>

constexpr int TEST_ARG_SUM = 4;
constexpr int TEST_ONE_ARG_SUM = 1;
constexpr int TEST_THREE_ARG_SUM = 3;
const size_t NUM0 = 0;
const size_t NUM1 = 1;
const uint32_t PARAM0 = 0;
const uint32_t PARAM1 = 1;
const uint32_t PARAM2 = 2;
const uint32_t PARAM3 = 3;
const char ERROR_REQUEST_ID[UUID_STR_MAX_LENGTH] = "00000000-0000-0000-0000-000000000000";

static OH_MediaAssetManager *manager;

enum class ReturnDataType {
    TYPE_IMAGE_SOURCE = 0,
    TYPE_ARRAY_BUFFER,
    TYPE_TARGET_PATH,
};

struct MediaAssetMangerContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    int32_t result = -1;
    std::string requestId;
};

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

static napi_value TestChangeRequestSaveCameraVideo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    MediaLibrary_ErrorCode code = ndkMediaLibrary->ChangeRequestSaveCameraVideo(index);

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

static void Callback(uv_work_t *work, int status)
{
    MediaAssetMangerContext *context = reinterpret_cast<MediaAssetMangerContext *>(work->data);
    if (context == nullptr) {
        LOG("Callback context is nullptr");
    } else {
        napi_value argv[TEST_THREE_ARG_SUM] = {0};

        napi_value retVal = nullptr;
        napi_value callback = nullptr;
        if (context->env != nullptr && context->callbackRef != nullptr) {
            napi_handle_scope scope = nullptr;
            napi_open_handle_scope(context->env, &scope);
            if (scope == nullptr) {
                LOG("Callback scope is nullptr");
                delete context;
                delete work;
                return;
            }

            napi_create_int32(context->env, context->result, &argv[PARAM1]);
            napi_create_string_utf8(context->env, context->requestId.c_str(), UUID_STR_MAX_LENGTH, &argv[PARAM2]);
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            if (callback != nullptr) {
                napi_call_function(context->env, nullptr, callback, TEST_THREE_ARG_SUM, argv, &retVal);
            } else {
                LOG("Callback callback is nullptr");
            }
            napi_close_handle_scope(context->env, scope);
        } else {
            LOG("Callback env or callbackRef is nullptr");
        }
    }
    delete context;
    delete work;
}

class NapiMediaAssetDataHandler {
public:
    NapiMediaAssetDataHandler(napi_env env, napi_ref jsMediaAssetDataHandler, ReturnDataType dataType)
    {
        handler_ = jsMediaAssetDataHandler;
        dataType_ = dataType;
        env_ = env;
        napi_get_uv_event_loop(env_, &loop_);
        if (loop_ == nullptr) {
            LOG("uv loop is nullptr");
            return;
        }
    }

    ~NapiMediaAssetDataHandler() = default;
    ReturnDataType GetHandlerType() { return dataType_; }

    static void OnDataPreared(int32_t result, MediaLibrary_RequestId requestId)
    {
        std::unique_ptr<uv_work_t> work = std::make_unique<uv_work_t>();
        if (work == nullptr) {
            LOG("uv_work_t is nullptr");
            return;
        }

        MediaAssetMangerContext *context = new MediaAssetMangerContext;
        context->env = env_;
        context->callbackRef = handler_;
        context->result = result;
        context->requestId = requestId.requestId;
        work->data = reinterpret_cast<void *>(context);

        int ret = uv_queue_work(
            loop_, work.get(), [](uv_work_t *work) {}, [](uv_work_t *work, int status) {
                Callback(work, status);
            });
        if (ret != 0) {
            LOG("uv_queue_work failed");
        } else {
            work.release();
        }
    }

private:
    static ReturnDataType dataType_;
    static napi_ref handler_;
    static napi_env env_;
    static uv_loop_s *loop_;
};

ReturnDataType NapiMediaAssetDataHandler::dataType_ = ReturnDataType::TYPE_ARRAY_BUFFER;
napi_env NapiMediaAssetDataHandler::env_ = nullptr;
napi_ref NapiMediaAssetDataHandler::handler_ = nullptr;
uv_loop_s *NapiMediaAssetDataHandler::loop_ = nullptr;

bool GetUtf8String(napi_env env, napi_value root, std::string &res)
{
    size_t bufferSize = NUM0;
    napi_get_value_string_utf8(env, root, nullptr, NUM0, &bufferSize);

    size_t resultSize = NUM0;
    bufferSize = bufferSize + NUM1;

    std::vector<char> buffer(bufferSize);
    napi_get_value_string_utf8(env, root, &(buffer[NUM0]), bufferSize, &resultSize);
    res.assign(buffer.begin(), buffer.end());
    return true;
}

napi_status GetDeliveryMode(napi_env env, const napi_value arg, const std::string &propName,
                            MediaLibrary_DeliveryMode &deliveryMode)
{
    bool present = false;
    napi_value property = nullptr;
    int mode = -1;
    napi_has_named_property(env, arg, propName.c_str(), &present);
    napi_get_named_property(env, arg, propName.c_str(), &property);
    napi_get_value_int32(env, property, &mode);

    // delivery mode's valid range is 0 - 2
    if (mode < 0 || mode > 2) {
        LOG("Invalid delivery mode");
        return napi_invalid_arg;
    } else {
        deliveryMode = static_cast<MediaLibrary_DeliveryMode>(mode);
    }
    return napi_ok;
}

napi_status ParseArgGetRequestOption(napi_env env, napi_value arg, MediaLibrary_DeliveryMode &deliveryMode)
{
    if (GetDeliveryMode(env, arg, "deliveryMode", deliveryMode) != napi_ok) {
        LOG("GetDeliveryMode failed");
        return napi_invalid_arg;
    }
    return napi_ok;
}

static napi_value TestRequestImageForPath(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, ERROR_REQUEST_ID, UUID_STR_MAX_LENGTH, &result);
    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    std::string srcUri;
    GetUtf8String(env, argValue[PARAM0], srcUri);

    MediaLibrary_RequestOptions options;
    if (ParseArgGetRequestOption(env, argValue[PARAM1], options.deliveryMode) != napi_ok) {
        LOG("ParseArgGetRequestOption failed");
        return result;
    }
    std::string destUri;
    GetUtf8String(env, argValue[PARAM2], destUri);

    napi_ref napiMediaDataHandler;
    napi_create_reference(env, argValue[PARAM3], 1, &(napiMediaDataHandler));
    if (napiMediaDataHandler == nullptr) {
        LOG("napiMediaDataHandler is nullptr");
        return result;
    }
    NapiMediaAssetDataHandler mediaAssetDataHandler(env, napiMediaDataHandler, ReturnDataType::TYPE_TARGET_PATH);
    const OH_MediaLibrary_OnDataPrepared callback = reinterpret_cast<OH_MediaLibrary_OnDataPrepared>(mediaAssetDataHandler.OnDataPreared);
    MediaLibrary_RequestId requestId = OH_MediaAssetManager_RequestImageForPath(manager, srcUri.c_str(), options, destUri.c_str(), callback);
    napi_create_string_utf8(env, requestId.requestId, UUID_STR_MAX_LENGTH, &result);
    return result;
}

static napi_value TestRequestVideoForPath(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, ERROR_REQUEST_ID, UUID_STR_MAX_LENGTH, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    std::string srcUri;
    GetUtf8String(env, argValue[PARAM0], srcUri);

    MediaLibrary_RequestOptions options;
    if (ParseArgGetRequestOption(env, argValue[PARAM1], options.deliveryMode) != napi_ok) {
        LOG("ParseArgGetRequestOption failed");
        return result;
    }
    std::string destUri;
    GetUtf8String(env, argValue[PARAM2], destUri);

    napi_ref napiMediaDataHandler;
    napi_create_reference(env, argValue[PARAM3], 1, &(napiMediaDataHandler));
    if (napiMediaDataHandler == nullptr) {
        LOG("napiMediaDataHandler is nullptr");
        return result;
    }
    NapiMediaAssetDataHandler mediaAssetDataHandler(env, napiMediaDataHandler, ReturnDataType::TYPE_TARGET_PATH);
    const OH_MediaLibrary_OnDataPrepared callback = reinterpret_cast<OH_MediaLibrary_OnDataPrepared>(mediaAssetDataHandler.OnDataPreared);
    MediaLibrary_RequestId requestId = OH_MediaAssetManager_RequestVideoForPath(manager, srcUri.c_str(), options, destUri.c_str(), callback);
    napi_create_string_utf8(env, requestId.requestId, UUID_STR_MAX_LENGTH, &result);
    return result;
}

static napi_value TestCancelRequest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_boolean(env, false, &result);

    napi_value thisVar = nullptr;

    napi_value argValue[TEST_ONE_ARG_SUM] = {0};
    size_t argCount = TEST_ONE_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    std::string requestId;
    GetUtf8String(env, argValue[PARAM0], requestId);
    MediaLibrary_RequestId requestIdStruct;
    strncpy(requestIdStruct.requestId, requestId.c_str(), UUID_STR_MAX_LENGTH);
    bool ret = OH_MediaAssetManager_CancelRequest(manager, requestIdStruct);
    napi_get_boolean(env, ret, &result);
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
        {"testChangeRequestSaveCameraVideo", nullptr, TestChangeRequestSaveCameraVideo, nullptr, nullptr, nullptr,
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
        {"testRequestImageForPath", nullptr, TestRequestImageForPath, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testRequestVideoForPath", nullptr, TestRequestVideoForPath, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCancelRequest", nullptr, TestCancelRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    ndkMediaLibrary = new NDKMediaLibrary();
    manager = ndkMediaLibrary->GetMediaAssetManagerInstance();

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
extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&g_module); }