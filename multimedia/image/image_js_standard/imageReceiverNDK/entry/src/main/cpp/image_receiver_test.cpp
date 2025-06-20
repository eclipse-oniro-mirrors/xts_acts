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
#include "image_receiver_test.h"

namespace OHOS {
namespace Media {

using namespace std;

#define IMAGE_LOG_TAG "IMAGE_RECEIVER_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr int32_t NUM_1000 = 1000;
static constexpr int32_t NUM_2000 = 2000;
static constexpr int32_t NUM_3000 = 3000;

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
    int32_t save(uintptr_t ptr)
    {
        for (auto itor = map_.begin(); itor != map_.end(); ++itor) {
            if (itor->second == ptr) {
                return itor->first;
            }
        }
        increase();
        map_.insert(std::pair<int32_t, uintptr_t>(count_, ptr));
        return count_;
    }

    /*
     * find item
     */
    uintptr_t find(int32_t key)
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
    int32_t find(uintptr_t ptr)
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
    bool remove(uintptr_t ptr)
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
    bool remove(int32_t key)
    {
        map_.erase(key);
        return true;
    }

    /*
     * check item
     */
    bool check(uintptr_t ptr)
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
    bool check(int32_t key)
    {
        auto itor = map_.find(key);
        return itor != map_.end();
    }

protected:
    void increase()
    {
        count_++;
    }

protected:
    std::map<int32_t, uintptr_t> map_;
    int32_t count_;
};

static MyMap receiverMap(NUM_1000);
static MyMap imageMap(NUM_2000);
static MyMap optionMap(NUM_3000);

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
            int32_t receiverKey = receiverMap.find((uintptr_t)context->receiver);
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

napi_value ImageReceiverTest::JsCreateImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    OH_ImageReceiverOptions* options = nullptr;
    napi_get_undefined(env, &udfVar);
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Create(&options);
    int32_t optionKey = 0;
    if (options != nullptr) {
        optionKey = optionMap.save((uintptr_t)options);
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

napi_value ImageReceiverTest::JsImageReceiverOptionsGetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageReceiverOptions_GetSize(options, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsSetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_3] = {nullptr};
    int32_t params[NUM_3] = {0};
    Image_Size size = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    size.width = params[NUM_1];
    size.height = params[NUM_2];
    Image_ErrorCode nRst = OH_ImageReceiverOptions_SetSize(options, size);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
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

napi_value ImageReceiverTest::JsImageReceiverOptionsSetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverOptions_SetCapacity(options, params[NUM_1]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Release(options);
    optionMap.remove(params[NUM_0]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsCreateImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)optionMap.find(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = nullptr;
    int32_t receiverKey = 0;
    Image_ErrorCode nRst = OH_ImageReceiverNative_Create(options, &receiver);
    if (receiver != nullptr) {
        receiverKey = receiverMap.save((uintptr_t)receiver);
    }

    if (nRst != IMAGE_SUCCESS || receiver == nullptr || receiverKey == 0) {
        LOG("JsCreateImageReceiver failed to create receiver");
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, receiverKey, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
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

napi_value ImageReceiverTest::JsReadLatestImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    OH_ImageNative* image = nullptr;
    if (OH_ImageReceiverNative_ReadLatestImage(receiver, &image) != IMAGE_SUCCESS) {
        return udfVar;
    }
    int32_t imageKey = 0;
    if (image != nullptr) {
        imageKey = imageMap.save((uintptr_t)image);
    }
    if (imageKey == 0) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, imageKey, &result);
    return result;
}

napi_value ImageReceiverTest::JsReadNextImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    OH_ImageNative* image = nullptr;
    if (OH_ImageReceiverNative_ReadNextImage(receiver, &image) != IMAGE_SUCCESS) {
        return udfVar;
    }
    int32_t imageKey = 0;
    if (image != nullptr) {
        imageKey = imageMap.save((uintptr_t)image);
    }
    if (imageKey == 0) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, imageKey, &result);
    return result;
}

napi_value ImageReceiverTest::JsOn(napi_env env, napi_callback_info info)
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

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
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

napi_value ImageReceiverTest::JsOff(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverNative_Off(receiver);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageReceiverNative_GetSize(receiver, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    int32_t capacity = 0;
    if (OH_ImageReceiverNative_GetCapacity(receiver, &capacity) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, capacity, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)receiverMap.find(params[NUM_0]);
    if (receiver == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverNative_Release(receiver);
    receiverMap.remove(params[NUM_0]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageNative_GetImageSize(image, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsGetImageComponentTypes(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    size_t typeSize = 0;
    if (OH_ImageNative_GetComponentTypes(image, nullptr, &typeSize) != IMAGE_SUCCESS) {
        return udfVar;
    }

    uint32_t* arrayTypes = nullptr;
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

    if (OH_ImageNative_GetComponentTypes(image, &arrayTypes, &typeSize) != IMAGE_SUCCESS) {
        delete [] arrayTypes;
        return result;
    }

    for (size_t i = 0; i < typeSize; i++) {
        napi_value type = nullptr;
        napi_create_uint32(env, arrayTypes[i], &type);
        napi_set_element(env, result, i, type);
    }

    delete [] arrayTypes;
    return result;
}

napi_value ImageReceiverTest::JsGetImageByteBuffer(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    OH_NativeBuffer* nativeBuffer = nullptr;
    if (OH_ImageNative_GetByteBuffer(image, componentType, &nativeBuffer) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)nativeBuffer, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageBufferSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    size_t bufferSize = 0;
    if (OH_ImageNative_GetBufferSize(image, componentType, &bufferSize) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, bufferSize, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageRowStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t rowStride = 0;
    if (OH_ImageNative_GetRowStride(image, componentType, &rowStride) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, rowStride, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImagePixelStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t pixelStride = 0;
    if (OH_ImageNative_GetPixelStride(image, componentType, &pixelStride) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, pixelStride, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)imageMap.find(params[NUM_0]);
    if (image == nullptr) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageNative_Release(image);
    imageMap.remove(params[NUM_0]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

} // namespace Media
} // namespace OHOS
