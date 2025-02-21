/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#include <bits/alltypes.h>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include "hilog/log.h"
#include <iostream>
#include "media_asset_base_capi.h"
#include "media_asset_manager_capi.h"
#include "napi/native_api.h"
#include <securec.h>
#include <termios.h>
#include <unistd.h>
#include <uv.h>

const unsigned int LOG_ID = 0xD002B70;
constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, LOG_ID, "MediaAssetManagerNDKTest"};
#define MY_HILOG(op, fmt, args...)                                                 \
    do                                                                             \
    {                                                                              \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args); \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)

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

static void Callback(uv_work_t *work, int status)
{
    MediaAssetMangerContext *context = reinterpret_cast<MediaAssetMangerContext *>(work->data);
    if (context == nullptr) {
        DEBUG_LOG("Callback context is nullptr");
    } else {
        napi_value argv[TEST_THREE_ARG_SUM] = {0};

        napi_value retVal = nullptr;
        napi_value callback = nullptr;
        if (context->env != nullptr && context->callbackRef != nullptr) {
            napi_handle_scope scope = nullptr;
            napi_open_handle_scope(context->env, &scope);
            if (scope == nullptr) {
                DEBUG_LOG("Callback scope is nullptr");
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
                DEBUG_LOG("Callback callback is nullptr");
            }
            napi_close_handle_scope(context->env, scope);
        } else {
            DEBUG_LOG("Callback env or callbackRef is nullptr");
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
            DEBUG_LOG("uv loop is nullptr");
            return;
        }
    }

    ~NapiMediaAssetDataHandler() = default;
    ReturnDataType GetHandlerType() { return dataType_; }

    static void OnDataPreared(int32_t result, MediaLibrary_RequestId requestId)
    {
        std::unique_ptr<uv_work_t> work = std::make_unique<uv_work_t>();
        if (work == nullptr) {
            DEBUG_LOG("uv_work_t is nullptr");
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
            DEBUG_LOG("uv_queue_work failed");
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
        DEBUG_LOG("Invalid delivery mode");
        return napi_invalid_arg;
    } else {
        deliveryMode = static_cast<MediaLibrary_DeliveryMode>(mode);
    }
    return napi_ok;
}

napi_status ParseArgGetRequestOption(napi_env env, napi_value arg, MediaLibrary_DeliveryMode &deliveryMode)
{
    if (GetDeliveryMode(env, arg, "deliveryMode", deliveryMode) != napi_ok) {
        DEBUG_LOG("GetDeliveryMode failed");
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
        DEBUG_LOG("ParseArgGetRequestOption failed");
        return result;
    }
    std::string destUri;
    GetUtf8String(env, argValue[PARAM2], destUri);

    napi_ref napiMediaDataHandler;
    napi_create_reference(env, argValue[PARAM3], 1, &(napiMediaDataHandler));
    if (napiMediaDataHandler == nullptr) {
        DEBUG_LOG("napiMediaDataHandler is nullptr");
        return result;
    }
    NapiMediaAssetDataHandler mediaAssetDataHandler(env, napiMediaDataHandler, ReturnDataType::TYPE_TARGET_PATH);
    const OH_MediaLibrary_OnDataPrepared callback =
        reinterpret_cast<OH_MediaLibrary_OnDataPrepared>(mediaAssetDataHandler.OnDataPreared);
    MediaLibrary_RequestId requestId =
        OH_MediaAssetManager_RequestImageForPath(manager, srcUri.c_str(), options, destUri.c_str(), callback);
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
        DEBUG_LOG("ParseArgGetRequestOption failed");
        return result;
    }
    std::string destUri;
    GetUtf8String(env, argValue[PARAM2], destUri);

    napi_ref napiMediaDataHandler;
    napi_create_reference(env, argValue[PARAM3], 1, &(napiMediaDataHandler));
    if (napiMediaDataHandler == nullptr) {
        DEBUG_LOG("napiMediaDataHandler is nullptr");
        return result;
    }
    NapiMediaAssetDataHandler mediaAssetDataHandler(env, napiMediaDataHandler, ReturnDataType::TYPE_TARGET_PATH);
    const OH_MediaLibrary_OnDataPrepared callback =
        reinterpret_cast<OH_MediaLibrary_OnDataPrepared>(mediaAssetDataHandler.OnDataPreared);
    MediaLibrary_RequestId requestId =
        OH_MediaAssetManager_RequestVideoForPath(manager, srcUri.c_str(), options, destUri.c_str(), callback);
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
    strncpy_s(requestIdStruct.requestId, UUID_STR_MAX_LENGTH, requestId.c_str(), UUID_STR_MAX_LENGTH);
    bool ret = OH_MediaAssetManager_CancelRequest(manager, requestIdStruct);
    napi_get_boolean(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testRequestImageForPath", nullptr, TestRequestImageForPath, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testRequestVideoForPath", nullptr, TestRequestVideoForPath, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCancelRequest", nullptr, TestCancelRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    manager = OH_MediaAssetManager_Create();
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
                               .nm_modname = "mediaAssetManager",
                               .nm_priv = ((void *)0),
                               .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void) { napi_module_register(&g_module); }
