/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "ImageKitSuccesTest.h"
#include "multimedia/image_framework/image/image_receiver_native.h"
#include "multimedia/image_framework/image_packer_mdk.h"
#include "node_api.h"
#include <cstdlib>
#include <hilog/log.h>
#include <map>
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <utility>
constexpr size_t SIZE_ZERO = 0;
constexpr size_t SIZE_ONE = 1;
constexpr size_t SIZE_THREE = 3;
constexpr size_t SIZE_FOUR = 4;
constexpr size_t SIZE_FIVE = 4;
constexpr size_t DEFAULT_PACKING_SIZE = 25 * 1024 * 1024;
constexpr uint32_t ARGS_FIRST = 0;
constexpr uint32_t ARGS_SECOND = 1;
constexpr uint32_t ARGS_THIRD = 2;
constexpr uint32_t ARGS_FOURTH = 3;
constexpr int32_t INVALID_FD = -1;
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
constexpr size_t ID_SIZE = 64;
constexpr uint32_t INVALID_FRAME_COUNT = 0;
constexpr int32_t DEFAULT_INDEX = 0;
constexpr uint32_t NUM_4 = 4;
constexpr uint32_t NUM_0 = 0;
constexpr uint32_t NUM_1 = 1;
constexpr uint32_t NUM_2 = 2;
constexpr uint32_t NUM_3 = 3;
static constexpr int32_t NUM_3000 = 3000;
class MyMap {
public:
    /*
     * constructor
     */
    explicit MyMap(int32_t startCount) : count_(startCount) {}

    /*
     * destructor
     */
    ~MyMap() {}

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
    uintptr_t FindItem(int32_t key)
    {
        auto itor = map_.find(key);
        if (itor == map_.end()) {
            return 0;
        }
        return itor->second;
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
static MyMap g_optionMap(NUM_3000);
static ImagePacker_Native *getNativeImagePacker(napi_env env, napi_callback_info info, napi_value *argValue,
                                                size_t &argCount)
{
    napi_value thisVar = nullptr;
    if (argValue == nullptr || argCount == SIZE_ZERO) {
        LOGE("Invaild input!");
        return nullptr;
    }
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        return nullptr;
    }
    return OH_ImagePacker_InitNative(env, argValue[ARGS_FIRST]);
}
static bool checkArgs(const napi_value *argValue, size_t argCount, size_t want)
{
    if (argCount < want) {
        LOGE("argCount %{public}zu < want %{public}zu", argCount, want);
        return false;
    }
    for (size_t i = SIZE_ZERO; i < want; i++) {
        if (argValue[i] == nullptr) {
            LOGE("argValue[%{public}zu] is nullptr", i);
            return false;
        }
    }
    return true;
}
static napi_value createUndefine(napi_env env)
{
    napi_value udfVal = nullptr;
    napi_get_undefined(env, &udfVal);
    return udfVal;
}
struct ImagePackingTestOps {
    char *format;
    size_t formatSize;
    int32_t quality;
    uint32_t size = SIZE_ZERO;
};
static bool GetInt32Property(napi_env env, napi_value root, const char *utf8name, int32_t *res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_int32(env, property, res) == napi_ok);
}

static bool GetUint32Property(napi_env env, napi_value root, const char *utf8name, uint32_t *res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_uint32(env, property, res) == napi_ok);
}

static bool GetStringProperty(napi_env env, napi_value root, const char *utf8name, char **buffer, size_t *bufferSize)
{
    napi_value value = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &value);
    if (status != napi_ok || value == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, nullptr, SIZE_ZERO, bufferSize) || *bufferSize == SIZE_ZERO) {
        LOGE("Get napi string length error");
        return false;
    }

    *buffer = static_cast<char *>(malloc((*bufferSize) + 1));
    for (size_t i = SIZE_ZERO; i < (*bufferSize) + 1; i++) {
        (*buffer)[i] = 0;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, *buffer, (*bufferSize) + 1, bufferSize)) {
        LOGE("Get napi string error");
        return false;
    }
    return (*bufferSize > SIZE_ZERO);
}
static bool parseImagePackingOps(napi_env env, napi_value arg, struct ImagePackingTestOps &ops)
{
    if (env == nullptr || arg == nullptr) {
        return false;
    }

    if (!GetStringProperty(env, arg, "format", &(ops.format), &(ops.formatSize))) {
        return false;
    }
    if (!GetInt32Property(env, arg, "quality", &(ops.quality))) {
        return false;
    }
    GetUint32Property(env, arg, "size", &(ops.size));
    return true;
}
static napi_value createResultValue(napi_env env, int32_t resCode, napi_value res = nullptr)
{
    napi_value result = nullptr;
    napi_value nRes = nullptr;
    napi_create_int32(env, resCode, &nRes);
    napi_create_object(env, &result);
    napi_set_named_property(env, result, "code", nRes);
    if (res != nullptr) {
        napi_set_named_property(env, result, "result", res);
    }
    return result;
}
napi_value Create(napi_env env, napi_callback_info info)
{
    napi_value imagePacker = nullptr;
    int32_t res = OH_ImagePacker_Create(env, &imagePacker);
    return createResultValue(env, res, imagePacker);
}
napi_value PackToFile(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_FOUR] = {0};
    size_t argCount = SIZE_FOUR;
    ImagePacker_Native *native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_FOUR)) {
        LOGE("argValue check failed");
        return createUndefine(env);
    }
    int32_t fd = INVALID_FD;
    if (napi_ok != napi_get_value_int32(env, argValue[ARGS_THIRD], &fd)) {
        LOGE("Fd arg failed");
        return createUndefine(env);
    }

    struct ImagePackingTestOps ops;
    if (!parseImagePackingOps(env, argValue[ARGS_FOURTH], ops)) {
        LOGE("packing ops parse failed");
        return createResultValue(env, IMAGE_RESULT_INVALID_PARAMETER);
    }

    ImagePacker_Opts packerOpts;
    packerOpts.format = ops.format;
    packerOpts.quality = ops.quality;

    int32_t returnValue = OH_ImagePacker_PackToFile(native, argValue[ARGS_SECOND], &packerOpts, fd);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value Release(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;
    ImagePacker_Native *native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr) {
        LOGE("argValue check failed");
        return createResultValue(env, IMAGE_RESULT_INVALID_PARAMETER);
    }
    int32_t returnValue = OH_ImagePacker_Release(native);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PackToData(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_THREE] = {0};
    size_t argCount = SIZE_THREE;
    ImagePacker_Native *native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_THREE)) {
        return createUndefine(env);
    }
    struct ImagePackingTestOps ops;
    if (!parseImagePackingOps(env, argValue[ARGS_THIRD], ops)) {
        LOGE("packing ops parse failed");
        return createResultValue(env, IMAGE_RESULT_INVALID_PARAMETER);
    }
    ImagePacker_Opts packerOpts;
    packerOpts.format = ops.format;
    packerOpts.quality = ops.quality;

    size_t dataSize = (ops.size > SIZE_ZERO) ? ops.size : DEFAULT_PACKING_SIZE;
    napi_value nValue = nullptr;
    uint8_t *data = nullptr;
    if (napi_create_arraybuffer(env, dataSize, reinterpret_cast<void **>(&data), &nValue) != napi_ok ||
        data == nullptr) {
        LOGE("packing create data failed");
        return createUndefine(env);
    }
    int32_t returnValue = OH_ImagePacker_PackToData(native, argValue[ARGS_SECOND], &packerOpts, data, &dataSize);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
bool CheckArgs(size_t count, const napi_value *argValues, size_t exceptCount)
{
    if (count != exceptCount) {
        return false;
    }
    for (size_t i = NUM_0; i < count; i++) {
        if (argValues[i] == nullptr) {
            return false;
        }
    }
    return true;
}
template <int NUM>
bool GetArgs(napi_env env, napi_callback_info info, napi_value (&argv)[NUM], int32_t (&params)[NUM])
{
    size_t argc = NUM;
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok || !CheckArgs(argc, argv, NUM)) {
        return false;
    }

    for (size_t i = NUM_0; i < argc; i++) {
        if (napi_get_value_int32(env, argv[i], &params[i]) != napi_ok) {
            return false;
        }
    }
    return true;
}
napi_value JsCreateImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }
    OH_ImageReceiverOptions *options = (OH_ImageReceiverOptions *)g_optionMap.FindItem(params[NUM_0]);
    if (options == nullptr) {
        return udfVar;
    }
    OH_ImageReceiverNative *receiver = nullptr;
    int32_t receiverKey = 0;
    int32_t returnValue = OH_ImageReceiverNative_Create(options, &receiver);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testSensor_typeNdkTest500", "ret ====>  %{public}d", returnValue);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value JsCreateImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    OH_ImageReceiverOptions *options = nullptr;
    napi_get_undefined(env, &udfVar);
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Create(&options);
    int32_t optionKey = 0;
    if (options != nullptr) {
        optionKey = g_optionMap.Save((uintptr_t)options);
    } else {
        return udfVar;
    }
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    Image_Size size = {0};
    int32_t capacity = 0;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        return udfVar;
    }
    if (!CheckArgs(argCount, argValue, NUM_3) ||
        napi_get_value_uint32(env, argValue[NUM_0], &(size.width)) != napi_ok ||
        napi_get_value_uint32(env, argValue[NUM_1], &(size.height)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &(capacity)) != napi_ok) {
        return udfVar;
    }
    OH_ImageReceiverOptions_SetSize(options, size);
    OH_ImageReceiverOptions_SetCapacity(options, capacity);

    if (nRst != IMAGE_SUCCESS || options == nullptr || optionKey == 0) {
        return udfVar;
    }
    napi_value result = nullptr;
    napi_create_int32(env, optionKey, &result);
    return result;
}