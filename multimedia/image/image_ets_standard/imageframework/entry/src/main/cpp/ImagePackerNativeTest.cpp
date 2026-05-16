/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <memory>
#include <string>
#include <map>
#include <uv.h>
#include "node_api.h"
#include "hilog/log.h"
#include "multimedia/image_framework/image/image_receiver_native.h"
#include "ImagePackerNativeTest.h"
#include <multimedia/image_framework/image/image_packer_native.h>

#include <vector>

using namespace std;

#define IMAGE_LOG_TAG "IMAGE_RECEIVER_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_30 = 30;
static constexpr int32_t NUM_1000 = 1000;
static constexpr int32_t NUM_2000 = 2000;
static constexpr int32_t NUM_3000 = 3000;
#define MAX_BUFFER_SIZE 512

class MyMap {
public:
    /*
     * constructor
     */
    explicit MyMap(int32_t startCount) : count_(startCount)
    {
    }

    /*
     * destructor
     */
    ~MyMap()
    {
    }

    /*
     * insert item
     */
    int32_t Save(uintptr_t ptr)
    {
        for (auto itor = map_.begin(); itor != map_.end(); ++itor) {
            if (itor->second == ptr) {
                return itor->first;
            }
        }
        Increase();
        map_.insert(std::pair<int32_t, uintptr_t>(count_, ptr));
        return count_;
    }

    /*
     * find item
     */
    uintptr_t Find(int32_t key)
    {
        auto itor = map_.find(key);
        if (itor == map_.end()) {
            return 0;
        }
        return itor->second;
    }

    /*
     * find item
     */
    int32_t Find(uintptr_t ptr)
    {
        for (auto itor = map_.begin(); itor != map_.end(); ++itor) {
            if (itor->second == ptr) {
                return itor->first;
            }
        }
        return 0;
    }

    /*
     * remove item
     */
    bool Remove(uintptr_t ptr)
    {
        for (auto itor = map_.begin(); itor != map_.end(); ++itor) {
            if (itor->second == ptr) {
                map_.erase(itor);
                return true;
            }
        }
        return true;
    }

    /*
     * remove item
     */
    bool Remove(int32_t key)
    {
        map_.erase(key);
        return true;
    }

    /*
     * check item
     */
    bool Check(uintptr_t ptr)
    {
        for (auto itor = map_.begin(); itor != map_.end(); ++itor) {
            if (itor->second == ptr) {
                return true;
            }
        }
        return false;
    }

    /*
     * check item
     */
    bool Check(int32_t key)
    {
        auto itor = map_.find(key);
        return itor != map_.end();
    }

protected:
    void Increase()
    {
        count_++;
    }

protected:
    std::map<int32_t, uintptr_t> map_;
    int32_t count_;
};

static MyMap g_receiverMap(NUM_1000);
static MyMap g_imageMap(NUM_2000);
static MyMap g_optionMap(NUM_3000);

struct ImageReceiverContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    OH_ImageReceiverNative* receiver = nullptr;
};

static void Callback(uv_work_t *work, int status)
{
    ImageReceiverContext *context = reinterpret_cast<ImageReceiverContext *>(work->data);
    if (context == nullptr) {
        LOG("context is empty");
    } else {
        napi_value result[1] = {0};
        napi_value retVal;
        napi_value callback = nullptr;
        if (context->env != nullptr && context->callbackRef != nullptr) {
            napi_handle_scope scope = nullptr;
            napi_open_handle_scope(context->env, &scope);
            if (scope == nullptr) {
                delete context;
                delete work;
                return;
            }
            int32_t receiverKey = g_receiverMap.Find(reinterpret_cast<uintptr_t>(context->receiver));
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            napi_create_uint32(context->env, receiverKey, &result[0]);
            if (callback != nullptr && receiverKey > NUM_1000) {
                napi_call_function(context->env, nullptr, callback, 1, result, &retVal);
            } else {
                LOG("napi_get_reference_value callback is empty");
            }
            napi_close_handle_scope(context->env, scope);
        } else {
            LOG("env or callbackRef is empty");
        }
    }
    delete context;
    delete work;
}

class JSImageBufferAvaliableHandler {
public:
    JSImageBufferAvaliableHandler(napi_env env, napi_ref jsHandler)
    {
        handler_ = jsHandler;
        env_ = env;
        napi_get_uv_event_loop(env_, &loop_);
        if (loop_ == nullptr) {
            LOG("napi_get_uv_event_loop failed");
            return;
        }
    }
    ~JSImageBufferAvaliableHandler() = default;
    static void OnBufferAvaliable(OH_ImageReceiverNative* receiver)
    {
        unique_ptr<uv_work_t> work = make_unique<uv_work_t>();
        if (work == nullptr) {
            LOG("DoCallBack: No memory");
            return;
        }
        ImageReceiverContext *context = new ImageReceiverContext;
        context->env = env_;
        context->callbackRef = handler_;
        context->receiver = receiver;
        work->data = reinterpret_cast<void *>(context);
        int ret = uv_queue_work(loop_, work.get(), [] (uv_work_t *work) {}, [] (uv_work_t *work, int status) {
            Callback(work, status);
        });
        if (ret != 0) {
            LOG("Failed to execute DoCallBack work queue");
        } else {
            work.release();
        }
    }

private:
    static napi_ref handler_;
    static napi_env env_;
    static uv_loop_s *loop_;
};

napi_ref JSImageBufferAvaliableHandler::handler_ = nullptr;
napi_env JSImageBufferAvaliableHandler::env_ = nullptr;
uv_loop_s *JSImageBufferAvaliableHandler::loop_ = nullptr;

static bool CheckArgs(size_t argc, const napi_value* argv, size_t expectedCount)
{
    if (argc != expectedCount) {
        return false;
    }
    for (size_t i = NUM_0; i < argc; i++) {
        if (argv[i] == nullptr) {
            return false;
        }
    }
    return true;
}

template <int NUM>
bool GetArgs(napi_env env, napi_callback_info info, napi_value (&argv)[NUM], int32_t (&params)[NUM])
{
    size_t argc = NUM;
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok ||
        !CheckArgs(argc, argv, NUM)) {
        return false;
    }

    for (size_t i = NUM_0; i < argc; i++) {
        if (napi_get_value_int32(env, argv[i], &params[i]) != napi_ok) {
            return false;
        }
    }
    return true;
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char* utf8name, int32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

napi_value JsImagePackerCreateImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    OH_ImageReceiverOptions* options = nullptr;
    napi_get_undefined(env, &udfVar);
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Create(&options);
    int32_t optionKey = 0;
    if (options != nullptr) {
        optionKey = g_optionMap.Save((uintptr_t)options);
    } else {
        LOG("JsCreateImageReceiverOptions failed to create options");
        return udfVar;
    }

    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    Image_Size size = {0};
    int32_t capacity = 0;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOG("JsCreateImageReceiverOptions failed to parse params");
        return udfVar;
    }
    
    if (!CheckArgs(argCount, argValue, NUM_3) ||
        napi_get_value_uint32(env, argValue[NUM_0], &(size.width)) != napi_ok ||
        napi_get_value_uint32(env, argValue[NUM_1], &(size.height)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &(capacity)) != napi_ok) {
        LOG("JsCreateImageReceiverOptions check params failed");
        return udfVar;
    }
    OH_ImageReceiverOptions_SetSize(options, size);
    LOG("size: %{public}dx%{public}d", size.width, size.height);
    OH_ImageReceiverOptions_SetCapacity(options, capacity);
    LOG("capacity: %{public}d", capacity);

    if (nRst != IMAGE_SUCCESS || options == nullptr || optionKey == 0) {
        return udfVar;
    }
    napi_value result = nullptr;
    napi_create_int32(env, optionKey, &result);
    return result;
}

napi_value JsImageReceiverOptionsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)g_optionMap.Find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    int32_t capacity = 0;
    if (OH_ImageReceiverOptions_GetCapacity(options, &capacity) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, capacity, &result);
    return result;
}

napi_value JsImageReceiverOptionsSetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)g_optionMap.Find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverOptions_SetCapacity(options, params[NUM_1]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value JsImageReceiverNativeCreateImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)g_optionMap.Find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    OH_ImageReceiverNative* receiver = nullptr;
    int32_t receiverKey = 0;
    Image_ErrorCode nRst = OH_ImageReceiverNative_Create(options, &receiver);
    if (receiver != nullptr) {
        receiverKey = g_receiverMap.Save((uintptr_t)receiver);
    }
    if (nRst != IMAGE_SUCCESS || receiver == nullptr || receiverKey == 0) {
        LOG("JsCreateImageReceiver failed to create receiver");
        return udfVar;
    }
    napi_value result = nullptr;
    napi_create_int32(env, receiverKey, &result);
    return result;
}

napi_value JsGetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)g_receiverMap.Find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    uint64_t id = 0;
    if (OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &id) != IMAGE_SUCCESS) {
        return udfVar;
    }

    std::string surfaceId = std::to_string(id);
    napi_value result = nullptr;
    napi_create_string_utf8(env, surfaceId.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value JsImageReceiverNativeReadLatestImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageReceiverNative *receiver = (OH_ImageReceiverNative *)g_receiverMap.Find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    OH_ImageNative *image = nullptr;
    Image_ErrorCode errorCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    if (errorCode == IMAGE_SUCCESS) {
        int32_t imageKey = 0;
        if (image != nullptr) {
            imageKey = g_imageMap.Save((uintptr_t)image);
        }
        if (imageKey == 0) {
            return udfVar;
        }
        napi_value result = nullptr;
        napi_create_int32(env, imageKey, &result);
        return result;
    } else {
        return udfVar;
    }
}

napi_value JsImageReceiverNativeReadNextImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)g_receiverMap.Find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    OH_ImageNative* image = nullptr;
    Image_ErrorCode errorCode = OH_ImageReceiverNative_ReadNextImage(receiver, &image);
    if (errorCode == IMAGE_SUCCESS) {
        int32_t imageKey = 0;
        if (image != nullptr) {
            imageKey = g_imageMap.Save((uintptr_t)image);
        }
        if (imageKey == 0) {
            return udfVar;
        }
        napi_value result = nullptr;
        napi_create_int32(env, imageKey, &result);
        return result;
    } else {
        return udfVar;
    }
}

napi_value JsImageReceiverNativeOn(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);

    napi_value thisVar = nullptr;
    size_t argCount = NUM_2;
    if (napi_get_cb_info(env, info, &argCount, argv, &thisVar, nullptr) != napi_ok) {
        LOG("JsOn failed to parse params");
        return udfVar;
    }
    if (!CheckArgs(argCount, argv, NUM_2) ||
        napi_get_value_int32(env, argv[NUM_0], &(params[NUM_0])) != napi_ok) {
        LOG("JsOn failed to parse OH_ImageReceiverNative handle");
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)g_receiverMap.Find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    napi_ref jsCallbackHandler;
    napi_create_reference(env, argv[NUM_1], 1, &(jsCallbackHandler));

    JSImageBufferAvaliableHandler bufferAvaliableHandler(env, jsCallbackHandler);
    const OH_ImageReceiver_OnCallback callback = bufferAvaliableHandler.OnBufferAvaliable;

    Image_ErrorCode nRst = OH_ImageReceiverNative_On(receiver, callback);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value JsGetImageSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    Image_Size size;
    Image_ErrorCode res = OH_ImageNative_GetImageSize(image, &size);
    
    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageSizeBadParameter(napi_env env, napi_callback_info info)
{
    Image_Size size;
    Image_ErrorCode res = OH_ImageNative_GetImageSize(nullptr, &size);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageComponentTypes(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    size_t typeSize = 0;
    if (OH_ImageNative_GetComponentTypes(image, nullptr, &typeSize) != IMAGE_SUCCESS) {
        return udfVar;
    }

    uint32_t *arrayTypes = nullptr;
    napi_value result = nullptr;
    napi_create_array(env, &result);
    if (typeSize <= 0) {
        return result;
    } else {
        arrayTypes = new uint32_t[typeSize];
    }

    if (arrayTypes == nullptr) {
        return result;
    }

    Image_ErrorCode res = OH_ImageNative_GetComponentTypes(image, nullptr, &typeSize);
    if (res == IMAGE_SUCCESS) {
        for (size_t i = 0; i < typeSize; i++) {
            napi_value type = nullptr;
            napi_create_uint32(env, arrayTypes[i], &type);
            napi_set_element(env, result, i, type);
        }
        delete[] arrayTypes;
        return result;
    } else {
        delete[] arrayTypes;
        return result;
    }
}

napi_value JsGetImageByteBuffer(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    OH_NativeBuffer* nativeBuffer = nullptr;

    Image_ErrorCode res = OH_ImageNative_GetByteBuffer(image, componentType, &nativeBuffer);

    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageByteBufferBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t componentType = 1;
    OH_NativeBuffer* nativeBuffer = nullptr;

    Image_ErrorCode res = OH_ImageNative_GetByteBuffer(nullptr, componentType, &nativeBuffer);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageBufferSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    size_t bufferSize = 0;
    Image_ErrorCode res = OH_ImageNative_GetBufferSize(image, componentType, &bufferSize);

    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsGetImageBufferSizeBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t componentType = 1;
    size_t bufferSize = 0;
    Image_ErrorCode res = OH_ImageNative_GetBufferSize(nullptr, componentType, &bufferSize);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageRowStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t rowStride = 0;
    Image_ErrorCode res = OH_ImageNative_GetRowStride(image, componentType, &rowStride);

    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageRowStrideBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t componentType = 1;
    int32_t rowStride = 0;
    Image_ErrorCode res = OH_ImageNative_GetRowStride(nullptr, componentType, &rowStride);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImagePixelStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t pixelStride = 0;
    Image_ErrorCode res = OH_ImageNative_GetPixelStride(image, componentType, &pixelStride);

    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsGetImagePixelStrideBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t componentType = 1;
    int32_t pixelStride = 0;
    Image_ErrorCode res = OH_ImageNative_GetPixelStride(nullptr, componentType, &pixelStride);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsGetImageTimestamp(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    int64_t timestamp = 0;
    Image_ErrorCode res = OH_ImageNative_GetTimestamp(image, &timestamp);

    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsGetImageTimestampBadParameter(napi_env env, napi_callback_info info)
{
    int64_t timestamp = 0;
    Image_ErrorCode res = OH_ImageNative_GetTimestamp(nullptr, &timestamp);

    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsReleaseImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)g_imageMap.Find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageNative_Release(image);
    g_imageMap.Remove(params[NUM_0]);

    int32_t resultValue = nRst == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsReleaseImageBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode nRst = OH_ImageNative_Release(nullptr);

    int32_t resultValue = nRst == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JSImagePackerDynamicRangeAuto(napi_env env, napi_callback_info info)
{
    OH_PackingOptions *options;
    Image_ErrorCode res = OH_PackingOptions_Create(&options);

    res = OH_PackingOptions_SetDesiredDynamicRange(options, IMAGE_PACKER_DYNAMIC_RANGE_AUTO);
    LOG("ImagePackerDynamicRangeAuto res is: %{public}d", res);
    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImagePackerDynamicRangeSdr(napi_env env, napi_callback_info info)
{
    OH_PackingOptions *options;
    Image_ErrorCode res = OH_PackingOptions_Create(&options);
    res = OH_PackingOptions_SetDesiredDynamicRange(options, IMAGE_PACKER_DYNAMIC_RANGE_SDR);
    LOG("ImagePackerDynamicRangeSdr res is: %{public}d", res);
    
    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSIOHPackingOptionsCreate(napi_env env, napi_callback_info info)
{
    OH_PackingOptions *options;
    Image_ErrorCode res = OH_PackingOptions_Create(&options);
    
    int32_t resultValue = res == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

static void DataCopy(void *dest, int32_t destSize, const void *src, int32_t n)
{
    if (dest == nullptr || src == nullptr) {
        return;
    }
    if (n > destSize) {
        return;
    }

    char *d = static_cast<char *>(dest);
    const char *s = static_cast<const char *>(src);

    while (n--) {
        *d++ = *s++;
    }
}

napi_value CreatePackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    OH_PackingOptions *res = nullptr;
    Image_ErrorCode errorCode = OH_PackingOptions_Create(&res);
            LOG("CreatePackingOptions OH_PackingOptions_Create errorCode is: %{public}d", errorCode);

    if (errorCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errorCode, &result);
        return result;
    }

    napi_status status = napi_create_external(env, reinterpret_cast<void *>(res), nullptr, nullptr, &result);
    LOG("CreatePackingOptions napi_create_external  status is: %{public}d", status);

    if (status != napi_ok) {
        LOG("CreatePackingOptions napi_create_external errorCode is: %{public}d", errorCode);

        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}


napi_value JSPackingOptionsSetMimeType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("JSPackingOptionsSetMimeType napi_get_cb_info is faill");

        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    const uint32_t maxMineTypeLen = MAX_BUFFER_SIZE;
    char mineType[maxMineTypeLen];
    size_t mineTypeSize = 0;

    napi_get_value_string_utf8(env, argValue[NUM_1], mineType, maxMineTypeLen, &mineTypeSize);

    Image_MimeType tmpMineType;
    tmpMineType.data = new (std::nothrow) char[MAX_BUFFER_SIZE];
    DataCopy(tmpMineType.data, MAX_BUFFER_SIZE, mineType, mineTypeSize);
    tmpMineType.data[mineTypeSize] = '\0';
    tmpMineType.size = mineTypeSize;
    LOG("JSPackingOptionsSetMimeType mineTypeSize is: %{public}d", mineTypeSize);
    
    Image_ErrorCode errCode = OH_PackingOptions_SetMimeType(packingOptions, &tmpMineType);
    
    LOG("JSPackingOptionsSetMimeType res is: %{public}d", errCode);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsSetMimeTypeImageAllocFailed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    const uint32_t maxMineTypeLen = MAX_BUFFER_SIZE;
    char mineType[maxMineTypeLen];
    size_t mineTypeSize = 0;

    napi_get_value_string_utf8(env, argValue[NUM_1], mineType, maxMineTypeLen, &mineTypeSize);

    Image_MimeType tmpMineType;
    tmpMineType.data = new (std::nothrow) char[MAX_BUFFER_SIZE];
    DataCopy(tmpMineType.data, MAX_BUFFER_SIZE, mineType, mineTypeSize);
    tmpMineType.data[mineTypeSize] = '\0';
    tmpMineType.size = mineTypeSize;
    
    tmpMineType.size = -1;
    Image_ErrorCode errCode = OH_PackingOptions_SetMimeType(packingOptions, &tmpMineType);

    LOG("JSPackingOptionsSetMimeType res is: %{public}d", errCode);

    int32_t resultValue = errCode == IMAGE_ALLOC_FAILED ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsSetMimeTypeImageBadParameter(napi_env env, napi_callback_info info)
{
    napi_value valueStr;
    napi_create_string_utf8(env, "IMAGE/jpeg", NAPI_AUTO_LENGTH, &valueStr);

    const uint32_t maxMineTypeLen = MAX_BUFFER_SIZE;
    char mineType[maxMineTypeLen];
    size_t mineTypeSize = 0;
    napi_get_value_string_utf8(env, valueStr, mineType, maxMineTypeLen, &mineTypeSize);
    
    Image_MimeType tmpMineType;
    tmpMineType.data = new (std::nothrow) char[MAX_BUFFER_SIZE];
    DataCopy(tmpMineType.data, MAX_BUFFER_SIZE, mineType, mineTypeSize);
    tmpMineType.data[1] = '\0';
    tmpMineType.size = mineTypeSize;
    tmpMineType.size = -1;
    Image_ErrorCode errCode = OH_PackingOptions_SetMimeType(nullptr, &tmpMineType);
    LOG("JSPackingOptionsSetMimeType res is: %{public}d", errCode);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JSPackingOptionsGetMimeType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    char mineTypeBuf[MAX_BUFFER_SIZE];
    Image_MimeType mineType;
    mineType.data = mineTypeBuf;

    Image_ErrorCode errorCode = OH_PackingOptions_GetMimeType(packingOptions, &mineType);
    LOG("JSPackingOptionsGetMimeType res is: %{public}d", errorCode);

    int32_t resultValue = errorCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetMimeTypeImageAllocFailed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    char mineTypeBuf[MAX_BUFFER_SIZE];
    Image_MimeType mineType;
    mineType.data = mineTypeBuf;
    mineType.size = -1;

    Image_ErrorCode errorCode = OH_PackingOptions_GetMimeType(packingOptions, &mineType);
    LOG("JSPackingOptionsGetMimeType res is: %{public}d", errorCode);

    int32_t resultValue = errorCode == IMAGE_ALLOC_FAILED ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsGetMimeTypeImageBadParameter(napi_env env, napi_callback_info info)
{
    char mineTypeBuf[MAX_BUFFER_SIZE];
    Image_MimeType mineType;
    mineType.data = mineTypeBuf;

    Image_ErrorCode errorCode = OH_PackingOptions_GetMimeType(nullptr, &mineType);
    int32_t resultValue = errorCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetMimeTypeNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    char mimeTypeBuf[MAX_BUFFER_SIZE];
    Image_MimeType mimeType = {nullptr, 1024};
    mimeType.data = mimeTypeBuf;

    Image_ErrorCode errorCode = OH_PackingOptions_GetMimeTypeWithNull(packingOptions, &mimeType);

    int32_t resultValue = errorCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetMimeTypeNullInvalidParameter(napi_env env, napi_callback_info info)
{
    char mimeTypeBuf[MAX_BUFFER_SIZE];
    Image_MimeType mimeType = {nullptr, 1024};
    mimeType.data = mimeTypeBuf;

    Image_ErrorCode errorCode = OH_PackingOptions_GetMimeTypeWithNull(nullptr, &mimeType);

    int32_t resultValue = errorCode == IMAGE_PACKER_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetQuality(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    uint32_t quality;
    Image_ErrorCode errCode = OH_PackingOptions_GetQuality(packingOptions, &quality);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsGetQualityBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t quality;
    Image_ErrorCode errCode = OH_PackingOptions_GetQuality(nullptr, &quality);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsSetQuality(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    uint32_t quality;
    napi_get_value_uint32(env, argValue[NUM_1], &quality);

    Image_ErrorCode errCode = OH_PackingOptions_SetQuality(packingOptions, quality);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsSetQualityBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t quality = NUM_30;
    Image_ErrorCode errCode = OH_PackingOptions_SetQuality(nullptr, quality);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsSetNeedsPackProperties(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int needsPackProperties;
    napi_get_value_int32(env, argValue[NUM_1], &needsPackProperties);

    Image_ErrorCode errCode = OH_PackingOptions_SetNeedsPackProperties(packingOptions,
        static_cast<bool>(needsPackProperties));

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsSetNeedsPackPropertiesBadParameter(napi_env env, napi_callback_info info)
{
    bool  needsPackProperties = true;
    Image_ErrorCode errCode = OH_PackingOptions_SetNeedsPackProperties(nullptr, needsPackProperties);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetNeedsPackProperties(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    bool needsPackProperties;
    Image_ErrorCode errCode = OH_PackingOptions_GetNeedsPackProperties(packingOptions, &needsPackProperties);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsGetNeedsPackPropertiesBadParameter(napi_env env, napi_callback_info info)
{
    bool needsPackProperties;
    Image_ErrorCode errCode = OH_PackingOptions_GetNeedsPackProperties(nullptr, &needsPackProperties);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsSetDesiredDynamicRange(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        OH_LOG_ERROR(LOG_APP, "PackingOptionsSetDesiredDynamicRange napi_get_cb_info failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int32_t desiredDynamicRange;
    napi_get_value_int32(env, argValue[NUM_1], &desiredDynamicRange);
    Image_ErrorCode errCode = OH_PackingOptions_SetDesiredDynamicRange(packingOptions, desiredDynamicRange);
   
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsSetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info)
{
    int32_t desiredDynamicRange = NUM_2;
    Image_ErrorCode errCode = OH_PackingOptions_SetDesiredDynamicRange(nullptr, desiredDynamicRange);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsGetDesiredDynamicRange(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "PackingOptionsGetDesiredDynamicRange napi_get_cb_info failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int32_t desiredDynamicRange;
    Image_ErrorCode errCode = OH_PackingOptions_GetDesiredDynamicRange(packingOptions, &desiredDynamicRange);
  
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsGetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info)
{
    int32_t desiredDynamicRange;
    Image_ErrorCode errCode = OH_PackingOptions_GetDesiredDynamicRange(nullptr, &desiredDynamicRange);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        OH_LOG_ERROR(LOG_APP, "PackingOptionsGetDesiredDynamicRange napi_get_cb_info failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    Image_ErrorCode errCode = OH_PackingOptions_Release(packingOptions);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsReleaseBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PackingOptions_Release(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceCreate(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsForSequenceSetFrameCount(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
    errCode = OH_PackingOptionsForSequence_SetFrameCount(options, NUM_2);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetFrameCountBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_SetFrameCount(nullptr, 2);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetFrameCount(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
    
    uint32_t value;
    errCode = OH_PackingOptionsForSequence_GetFrameCount(options, &value);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetFrameCountBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t value;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_GetFrameCount(nullptr, &value);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackingOptionsForSequenceSetDelayTimeList(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);

    int32_t delayTimeList;
    size_t delayTimeListLength = NUM_1;
    errCode = OH_PackingOptionsForSequence_SetDelayTimeList(options, &delayTimeList, delayTimeListLength);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetDelayTimeListBadParameter(napi_env env, napi_callback_info info)
{
    int32_t delayTimeList;
    size_t delayTimeListLength = NUM_1;
    Image_ErrorCode errCode =
        OH_PackingOptionsForSequence_SetDelayTimeList(nullptr, &delayTimeList, delayTimeListLength);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetDelayTimeList(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
    
    int32_t delayTimeList;
    size_t delayTimeListLength = NUM_1;
    errCode = OH_PackingOptionsForSequence_SetDelayTimeList(options, &delayTimeList, delayTimeListLength);
    
    int32_t resultDelayTimeList;
    errCode = OH_PackingOptionsForSequence_GetDelayTimeList(options, &resultDelayTimeList, delayTimeListLength);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetDelayTimeListBadParameter(napi_env env, napi_callback_info info)
{
    int32_t delayTimeList;
    size_t delayTimeListLength = NUM_1;
    Image_ErrorCode errCode =
        OH_PackingOptionsForSequence_GetDelayTimeList(nullptr, &delayTimeList, delayTimeListLength);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetDisposalTypes(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);

    uint32_t types[] = {NUM_0, NUM_1, NUM_2, NUM_3};
    size_t count = sizeof(types) / sizeof(types[0]);
    errCode = OH_PackingOptionsForSequence_SetDisposalTypes(options, types, count);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetDisposalTypesBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t types[] = {NUM_0, NUM_1, NUM_2, NUM_3};
    size_t count = sizeof(types) / sizeof(types[0]);
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_SetDisposalTypes(nullptr, types, count);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetDisposalTypes(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);

    uint32_t types[] = {NUM_0, NUM_1, NUM_2, NUM_3};
    size_t count = sizeof(types) / sizeof(types[0]);
    errCode = OH_PackingOptionsForSequence_SetDisposalTypes(options, types, count);
    uint32_t resultTypes[] = {NUM_0, NUM_1, NUM_2, NUM_3};
    errCode = OH_PackingOptionsForSequence_GetDisposalTypes(options, resultTypes, count);
    LOG("JSPackingOptionsForSequenceGetDisposalTypes errCode is: %{public}d", errCode);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetDisposalTypesBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t types[] = {NUM_0, NUM_1, NUM_2, NUM_3};
    size_t count = sizeof(types) / sizeof(types[0]);
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_GetDisposalTypes(nullptr, types, count);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetLoopCount(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
 
    errCode = OH_PackingOptionsForSequence_SetLoopCount(options, NUM_3);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceSetLoopCountBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_SetLoopCount(nullptr, NUM_3);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetLoopCount(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
 
    uint32_t loopCount;
    errCode = OH_PackingOptionsForSequence_GetLoopCount(options, &loopCount);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceGetLoopCountBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t loopCount;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_GetLoopCount(nullptr, &loopCount);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceRelease(napi_env env, napi_callback_info info)
{
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&options);
 
    errCode = OH_PackingOptionsForSequence_Release(options);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackingOptionsForSequenceReleaseBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Release(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePackerNativeCreate(napi_env env, napi_callback_info info)
{
    OH_ImagePackerNative *packer = nullptr;
    Image_ErrorCode errCode = OH_ImagePackerNative_Create(&packer);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
