/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include "node_api.h"
#include "hilog/log.h"
#include "multimedia/image_framework/image/image_packer_native.h"
#include "multimedia/image_framework/image/pixelmap_native.h"
#include "image_packing_test.h"
#include <cstdlib>
#include <cstdio>
#include "image_packer_module_test.h"
#include "multimedia/image_framework/image_pixel_map_napi.h"
#include <cstring>
#include <vector>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "IMAGE_TAGLOG"

#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

using namespace std;
namespace {
    static constexpr uint32_t NUM_0 = 0;
    static constexpr uint32_t NUM_1 = 1;
    static constexpr uint32_t NUM_2 = 2;
    static constexpr uint32_t NUM_3 = 3;
    static constexpr uint32_t NUM_4 = 4;
    static constexpr uint32_t NUM_5 = 5;
    static constexpr uint32_t IMAGE_WIDTH = 600;
    static constexpr uint32_t IMAGE_HEIGHT = 400;
    uint32_t A = 0xff000000;
    uint32_t R = 0x00ff0000;
    uint32_t G = 0x0000ff00;
    uint32_t B = 0x000000ff;
    uint32_t colorArray[240000] = { 0 };
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
}

namespace OHOS {
namespace Media {
const unsigned int LOG_ID = 0xD002B05;
inline const char* DEBUG_PTR(void* p) {
    return (p == nullptr) ? "nullptr" : "not nullptr";
}

void SetUpImage(int type)
{
    // type 0 -> Red, 1 -> Green, 2 -> Blue
    uint32_t valueColor = 0;
    switch (type) {
        case NUM_0: valueColor = R; break;
        case NUM_1: valueColor = G; break;
        case NUM_2: valueColor = B; break;
        default:
            break;
    }
    for (int i = 0; i < IMAGE_WIDTH * IMAGE_HEIGHT; i++) {
        colorArray[i] = valueColor;
    }
}

bool CreateArrayBuffer(napi_env env, void* src, size_t srcLen, napi_value *res)
{
    if (src == nullptr || srcLen == 0) {
        return false;
    }
    void *nativePtr = nullptr;
    if (napi_create_arraybuffer(env, srcLen, &nativePtr, res) != napi_ok || nativePtr == nullptr) {
        return false;
    }
    if (memcpy(nativePtr, src, srcLen) != src) {
        return false;
    }
    return true;
}

void setImageFormat(napi_env env, napi_value argValue, OH_PackingOptions *options)
{
    size_t mimeTypeSize = 0;
    Image_MimeType format;
    if (napi_get_value_string_utf8(env, argValue, nullptr, 0, &mimeTypeSize) != napi_ok) {
        LOGI("failed to format");
        return;
    }
    char *buffer = static_cast<char *>(malloc((mimeTypeSize + 1) * sizeof(char)));
    if (buffer == nullptr) {
        return;
    }
    if (napi_get_value_string_utf8(env, argValue, buffer, mimeTypeSize + 1, &mimeTypeSize)) {
        free(buffer);
        return;
    }
    format.data = buffer;
    format.size = mimeTypeSize;
    OH_PackingOptions_SetMimeType(options, &format);
    LOGI("get format data success %{public}s", format.data);
    LOGI("get format size success %{public}zu", format.size);
    free(buffer);
    return;
}

struct PackingOptionsForSequence {
    int32_t frameCount;
    int32_t* delayTimesList;
    size_t delayTimeListLength = 0;
    uint32_t* disposalTypesList;
    size_t disposalTypesLength = 0;
    uint32_t loopCount = 1;
};

static void getLoop(napi_env env, napi_value argValue, PackingOptionsForSequence *ops)
{
    if (napi_get_value_uint32(env, argValue, &(ops->loopCount)) != napi_ok) {
        LOGE("failed to get loop");
    }
    LOGI("get loop success %{public}d", ops->loopCount);
}

static bool getDelayTimes(napi_env env, napi_value argValue, PackingOptionsForSequence *ops)
{
    napi_value delayTimesValue = nullptr;
    if (napi_get_named_property(env, argValue, "delayTimes", &delayTimesValue) != napi_ok) {
        LOGE("failed to napi_get_named_property");
        return false;
    }
    bool isDelayTimesArray = false;
    uint32_t delayTimesSize = 0;
    if (napi_is_array(env, delayTimesValue, &isDelayTimesArray) != napi_ok) {
        LOGE("JsPackToFileMultiFrames failed to napi_is_array");
        return false;
    }
    if (!isDelayTimesArray) {
        LOGE("is not DelayTimesArray");
        return false;
    }
    if (napi_get_array_length(env, delayTimesValue, &delayTimesSize) != napi_ok) {
        LOGE("Parse delayTime pack napi_get_array_length failed");
        return false;
    }
    LOGI("delayTime size %{public}u", delayTimesSize);
    ops->delayTimeListLength = delayTimesSize;
    ops->delayTimesList = static_cast<int32_t *>(malloc((delayTimesSize + 1) * sizeof(int32_t)));
    if (ops->delayTimesList == nullptr) {
        LOGE("get delayTimesArray space failed.");
        return false;
    }
    int32_t num = 0;
    for (size_t i = 0; i < delayTimesSize; i++) {
        napi_value item1;
        if (napi_get_element(env, delayTimesValue, i, &item1) != napi_ok) {
            LOGE("napi_get_element failed %{public}zu", i);
            return false;
        }
        if (napi_get_value_int32(env, item1, &num) != napi_ok) {
            LOGE("Parse delayTime in item1 failed %{public}zu", i);
            return false;
        }
        ops->delayTimesList[i] = num;
        LOGI("Parse delayTime in item1 success %{public}d", ops->delayTimesList[i]);
    }
    return true;
}

static void getDisposalTypes(napi_env env, napi_value argValue, PackingOptionsForSequence *ops)
{
    napi_value disposalTypesValue = nullptr;
    if (napi_get_named_property(env, argValue, "disposalTypes", &disposalTypesValue) != napi_ok) {
        LOGE("JsPackToFileMultiFrames failed to napi_get_named_property");
        return;
    }
    bool isDisposalTypesArray = false;
    uint32_t disposalSize = 0;
    if (napi_is_array(env, disposalTypesValue, &isDisposalTypesArray) != napi_ok) {
        LOGE(" failed to napi_is_array");
        return;
    }
    if (!isDisposalTypesArray) {
        LOGE("is not DisposalTypesArray");
        return;
    }
    if (napi_get_array_length(env, disposalTypesValue, &disposalSize) != napi_ok) {
        LOGE("Parse disposalTypes pack napi_get_array_length failed");
        return;
    }
    LOGI("disposalSize %{public}u", disposalSize);
    ops->disposalTypesLength = disposalSize;
    ops->disposalTypesList = static_cast<uint32_t *>(malloc((disposalSize + 1) * sizeof(uint32_t)));
    if (ops->disposalTypesList == nullptr) {
        LOGE("get disposalTypesArray space failed.");
        return;
    }
    uint32_t num = 0;
    for (size_t i = 0; i < disposalSize; i++) {
        napi_value item2;
        if (napi_get_element(env, disposalTypesValue, i, &item2) != napi_ok) {
            LOGE("napi_get_element failed %{public}zu", i);
            return;
        }
        if (napi_get_value_uint32(env, item2, &num) != napi_ok) {
            LOGE("Parse disposalTypes in item2 failed %{public}zu", i);
            return;
        }
        ops->disposalTypesList[i] = num;
        LOGI("Parse disposalTypes in item2 success %{public}u", ops->disposalTypesList[i]);
    }
    return;
}

static bool getFrameCount(napi_env env, napi_value argValue, PackingOptionsForSequence *ops)
{
    if (napi_get_value_int32(env, argValue, &(ops->frameCount)) != napi_ok) {
        LOGE("failed to get frameCount");
        return false;
    }
    LOGI("get frameCount success %{public}d", ops->frameCount);
    return true;
}

int32_t getFileDescriptor(napi_env env, napi_value argValue)
{
    int32_t fd = 0;
    if (napi_get_value_int32(env, argValue, &fd) != napi_ok) {
        LOGE("get fd failed ");
        return fd;
    }
    LOGI("get fd success %{public}d", fd);
    return fd;
}

void createPixelMapList(OH_PixelmapNative **pixelmaps, int32_t frameCount)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, IMAGE_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(options, IMAGE_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NUM_5);
    OH_PixelmapInitializationOptions_SetAlphaType(options, 1);

    for (int i = 0; i < frameCount; i++) {
        SetUpImage(i % NUM_3);
        OH_PixelmapNative_CreatePixelmap((uint8_t *)colorArray,
            IMAGE_WIDTH * IMAGE_HEIGHT * NUM_4, options, &pixelmaps[i]);
    }
}

static bool GetInt32Property(napi_env env, napi_value root, const char* utf8name, int32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_int32(env, property, res) == napi_ok);
}

static bool GetUint32Property(napi_env env, napi_value root, const char* utf8name, uint32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_uint32(env, property, res) == napi_ok);
}

static bool GetStringProperty(napi_env env, napi_value root,
    const char* utf8name, char** buffer, size_t *bufferSize)
{
    napi_value value = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &value);
    if (status != napi_ok || value == nullptr) {
        LOGE("Get property error %{public}s", utf8name);
        return false;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, nullptr, SIZE_ZERO, bufferSize)
        || *bufferSize == SIZE_ZERO) {
        LOGE("Get napi string length error");
        return false;
    }

    *buffer = static_cast<char*>(malloc((*bufferSize) + 1));
    for (size_t i = SIZE_ZERO; i < (*bufferSize) + 1; i++) {
        (*buffer)[i] = 0;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, *buffer, (*bufferSize) + 1, bufferSize)) {
        LOGE("Get napi string error");
        return false;
    }
    return (*bufferSize > SIZE_ZERO);
}

static bool checkArgs(const napi_value* argValue, size_t argCount, size_t want)
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

struct ImagePackingTestOps {
    char* format;
    size_t formatSize;
    int32_t quality;
    uint32_t size = SIZE_ZERO;
};

static bool parseImagePackingOps(napi_env env, napi_value arg, struct ImagePackingTestOps &ops)
{
    if (env == nullptr || arg == nullptr) {
        LOGE("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
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
static napi_value createUndefine(napi_env env)
{
    napi_value udfVal = nullptr;
    napi_get_undefined(env, &udfVal);
    return udfVal;
}
static napi_value createResultValue(napi_env env, int32_t resCode, napi_value res = nullptr)
{
    napi_value result = nullptr;
    // JS result like
    // {code: <error code>, result: <result value>}
    napi_value nRes = nullptr;
    napi_create_int32(env, resCode, &nRes);
    napi_create_object(env, &result);
    napi_set_named_property(env, result, "code", nRes);
    if (res != nullptr) {
        napi_set_named_property(env, result, "result", res);
    }
    return result;
}

static bool parsePackToDataOptionsForSequence(napi_env env, napi_value *argValue, PackingOptionsForSequence *ops)
{
    getLoop(env, argValue[NUM_0], ops);
    getDisposalTypes(env, argValue[NUM_1], ops);
    if (!getDelayTimes(env, argValue[NUM_1], ops)) {
        LOGE("parsePackToDataOptionsForSequence get delayTimes failed");
        return false;
    }
    if (!getFrameCount(env, argValue[NUM_2], ops)) {
        LOGE("parsePackToDataOptionsForSequence get frameCount failed");
        return false;
    }
    LOGI("parsePackToDataOptionsForSequence success");
    return true;
}

static bool setPackingOptionsForSequence(OH_PackingOptionsForSequence *options, PackingOptionsForSequence ops)
{
    if (OH_PackingOptionsForSequence_SetFrameCount(options, static_cast<uint32_t>(ops.frameCount)) != IMAGE_SUCCESS) {
        LOGE("OH_PackingOptionsForSequence_SetFrameCount failed");
        return false;
    }
    if (OH_PackingOptionsForSequence_SetDelayTimeList(options, ops.delayTimesList,
        ops.delayTimeListLength) != IMAGE_SUCCESS) {
        LOGE("OH_PackingOptionsForSequence_SetDelayTimeList failed");
        return false;
    }
    if (OH_PackingOptionsForSequence_SetDisposalTypes(options, ops.disposalTypesList,
        ops.disposalTypesLength) != IMAGE_SUCCESS) {
        LOGE("OH_PackingOptionsForSequence_SetDisposalTypes failed");
        return false;
    }
    if (OH_PackingOptionsForSequence_SetLoopCount(options, ops.loopCount)!= IMAGE_SUCCESS) {
        LOGE("OH_PackingOptionsForSequence_SetLoopCount failed");
        return false;
    }
    LOGI("setPackingOptionsForSequence success");
    return true;
}

static bool checkPackingOptionsForSequence(OH_PackingOptionsForSequence *options, PackingOptionsForSequence ops)
{
    PackingOptionsForSequence tmpOpts;
    uint32_t frameCount = 0;
    Image_ErrorCode reslut = OH_PackingOptionsForSequence_GetFrameCount(options, &frameCount);
    LOGI("Set frameCount = %{public}d", ops.frameCount);
    LOGI("Get frameCount = %{public}u", frameCount);
    if (reslut != IMAGE_SUCCESS || ops.frameCount != static_cast<int32_t>(frameCount)) {
        LOGE("frameCount not matching");
        return false;
    }
    tmpOpts.delayTimeListLength = ops.delayTimeListLength;
    std::vector<int32_t> delayTimeList(tmpOpts.delayTimeListLength);
    reslut = OH_PackingOptionsForSequence_GetDelayTimeList(options, delayTimeList.data(), ops.delayTimeListLength);
    if (reslut != IMAGE_SUCCESS) {
        LOGE("OH_PackingOptionsForSequence_GetDelayTimeList failed");
        return false;
    }
    if (ops.disposalTypesLength != 0) {
        tmpOpts.disposalTypesLength = ops.disposalTypesLength;
        std::vector<uint32_t> disposalTypes(tmpOpts.disposalTypesLength);
        reslut = OH_PackingOptionsForSequence_GetDisposalTypes(
            options, disposalTypes.data(), tmpOpts.disposalTypesLength);
        if (reslut != IMAGE_SUCCESS) {
            LOGE("OH_PackingOptionsForSequence_GetDisposalTypes failed");
            return false;
        }
    }
    reslut = OH_PackingOptionsForSequence_GetLoopCount(options, &(tmpOpts.loopCount));
    LOGI("Set loopCount = %{public}u", ops.loopCount);
    LOGI("Get loopCount = %{public}u", tmpOpts.loopCount);
    if (tmpOpts.loopCount != ops.loopCount || reslut != IMAGE_SUCCESS) {
        LOGE("loopCount not matching");
        return false;
    }
    return true;
}

napi_value ImagePackingNDKTest::JsPackToDataMultiFrames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value resultBuffer = nullptr;
    napi_get_undefined(env, &result);
    napi_get_undefined(env, &resultBuffer);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOGE("JsPackToDataMultiFrames failed to parse params");
        return result;
    }
    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    PackingOptionsForSequence ops;
    if (!parsePackToDataOptionsForSequence(env, argValue, &ops)) {
        LOGE("JsPackToDataMultiFrames failed to parse packing options");
        return result;
    }
    if (!setPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToDataMultiFrames failed to set packing options");
        return result;
    }
    if (!checkPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToDataMultiFrames failed to check packing options");
        return result;
    }
    OH_PixelmapNative *pixelmaps[ops.frameCount];
    createPixelMapList(pixelmaps, ops.frameCount);

    size_t outDataSize = 10000;
    uint8_t outData[outDataSize];
    ImagePackerModuleTest ipmt;
    Image_ErrorCode ret = ipmt.PackToDataMultiFrames(options, pixelmaps, ops.frameCount, outData, &outDataSize);
    if (ret != IMAGE_SUCCESS) {
        LOGE("JsPackToDataMultiFrames failed");
    } else {
        CreateArrayBuffer(env, outData, outDataSize, &resultBuffer);
    }
    result = createResultValue(env, ret, resultBuffer);
    OH_PackingOptionsForSequence_Release(options);
    return result;
}

napi_value ImagePackingNDKTest::JsPackToDataMultiFramesError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value undefined = nullptr;
    napi_get_undefined(env, &result);
    napi_get_undefined(env, &undefined);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOGE("JsPackToDataMultiFramesError failed to parse params");
        return result;
    }
    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    PackingOptionsForSequence ops;
    if (!parsePackToDataOptionsForSequence(env, argValue, &ops)) {
        LOGE("JsPackToDataMultiFrames failed to parse packing options");
        return result;
    }
    if (!setPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToDataMultiFrames failed to set packing options");
        return result;
    }
    if (!checkPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToDataMultiFrames failed to check packing options");
        return result;
    }
    uint32_t mode;
    if (napi_get_value_uint32(env, argValue[NUM_3], &mode) != napi_ok) {
        LOGE("Parse error mode in argValue failed");
        return result;
    }
    OH_PixelmapNative *pixelmaps[ops.frameCount];
    createPixelMapList(pixelmaps, ops.frameCount);

    size_t outDataSize = 10000;
    uint8_t outData[outDataSize];
    ImagePackerModuleTest ipmt;
    packMultiFramesOptions opts = {options, pixelmaps, ops.frameCount, mode};
    Image_ErrorCode ret = ipmt.PackToDataMultiFramesError(&opts, outData, &outDataSize);
    if (ret != IMAGE_SUCCESS) {
        LOGE("PackToDataFromPixelmapSequence failed");
    }
    OH_PackingOptionsForSequence_Release(options);
    result = createResultValue(env, ret, undefined);
    return result;
}

static bool parsePackToFileOptionsForSequence(napi_env env, napi_value *argValue, PackingOptionsForSequence *ops)
{
    getLoop(env, argValue[NUM_3], ops);
    getDisposalTypes(env, argValue[NUM_0], ops);
    if (!getDelayTimes(env, argValue[NUM_0], ops)) {
        LOGE("parsePackToFileOptionsForSequence get delayTimes failed");
        return false;
    }
    if (!getFrameCount(env, argValue[NUM_2], ops)) {
        LOGE("parsePackToFileOptionsForSequence get frameCount failed");
        return false;
    }
    LOGI("parsePackToDataOptionsForSequence success");
    return true;
}

napi_value ImagePackingNDKTest::JsPackToFileMultiFrames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value undefined = nullptr;
    napi_get_undefined(env, &result);
    napi_get_undefined(env, &undefined);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOGE("failed to parse params");
        return result;
    }

    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    PackingOptionsForSequence ops;
    int32_t fd = getFileDescriptor(env, argValue[NUM_1]);
    if (!parsePackToFileOptionsForSequence(env, argValue, &ops)) {
        LOGE("JsPackToFileMultiFrames failed to parse packing options");
        return result;
    }
    if (!setPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToFileMultiFrames failed to set packing options");
        return result;
    }
    if (!checkPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToFileMultiFrames failed to check packing options");
        return result;
    }
    OH_PixelmapNative *pixelmaps[ops.frameCount];
    createPixelMapList(pixelmaps, ops.frameCount);

    ImagePackerModuleTest ipmt;
    Image_ErrorCode ret = ipmt.PackToFileMultiFrames(options, pixelmaps, ops.frameCount, fd);
    if (ret != IMAGE_SUCCESS) {
        LOGE("JsPackToFileMultiFrames failed");
    }
    LOGI("ret = %{public}d", ret);
    OH_PackingOptionsForSequence_Release(options);
    result = createResultValue(env, ret, undefined);
    return result;
}

napi_value ImagePackingNDKTest::JsPackToFileMultiFramesError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value undefined = nullptr;
    napi_get_undefined(env, &result);
    napi_get_undefined(env, &undefined);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_5] = {0};
    size_t argCount = NUM_5;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOGE("failed to parse params");
        return result;
    }

    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    PackingOptionsForSequence ops;
    int32_t fd = getFileDescriptor(env, argValue[NUM_1]);
    if (!parsePackToFileOptionsForSequence(env, argValue, &ops)) {
        LOGE("JsPackToFileMultiFrames failed to parse packing options");
        return result;
    }
    if (!setPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToFileMultiFrames failed to set packing options");
        return result;
    }
    if (!checkPackingOptionsForSequence(options, ops)) {
        LOGE("JsPackToFileMultiFrames failed to check packing options");
        return result;
    }
    uint32_t mode;
    if (napi_get_value_uint32(env, argValue[NUM_4], &mode) != napi_ok || mode == BAD_PARAMETER_OUTDATA) {
        LOGE("Parse error mode in argValue failed");
        return result;
    }
    OH_PixelmapNative *pixelmaps[ops.frameCount];
    createPixelMapList(pixelmaps, ops.frameCount);

    packMultiFramesOptions opts = {options, pixelmaps, ops.frameCount, mode};
    ImagePackerModuleTest ipmt;
    Image_ErrorCode ret = ipmt.PackToFileMultiFramesError(&opts, fd);
    if (ret != IMAGE_SUCCESS) {
        LOGE("PackToFileFromPixelmapSequence failed");
    }
    LOGI("ret = %{public}d", ret);
    OH_PackingOptionsForSequence_Release(options);
    result = createResultValue(env, ret, undefined);
    return result;
}

napi_value ImagePackingNDKTest::Create(napi_env env, napi_callback_info info)
{
    napi_value imagePacker = nullptr;
    int32_t res = OH_ImagePacker_Create(env, &imagePacker);
    return createResultValue(env, res, imagePacker);
}

static ImagePacker_Native* getNativeImagePacker(napi_env env, napi_callback_info info,
    napi_value* argValue, size_t &argCount)
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

napi_value ImagePackingNDKTest::InitNative(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;

    ImagePacker_Native* native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr) {
        return createUndefine(env);
    }
    return createResultValue(env, OHOS_IMAGE_RESULT_SUCCESS);
}

// PackToData(packer, source, opts:{format, quality, size})<{code, result}>
napi_value ImagePackingNDKTest::PackToData(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_THREE] = {0};
    size_t argCount = SIZE_THREE;
    ImagePacker_Native* native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_THREE)) {
        LOGE("argValue check failed");
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
    if (napi_create_arraybuffer(env, dataSize,
        reinterpret_cast<void**>(&data), &nValue) != napi_ok || data == nullptr) {
        LOGE("packing create data failed");
        return createUndefine(env);
    }
    int32_t res = OH_ImagePacker_PackToData(native,
        argValue[ARGS_SECOND], &packerOpts, data, &dataSize);
    if (ops.format != nullptr) {
        free(ops.format);
        ops.format = nullptr;
    }
    LOGI("packing act size %{public}zu", dataSize);
    return createResultValue(env, res, nValue);
}

// packToFile(packer, source, fd, opts:{format, quality})<{code, result}>
napi_value ImagePackingNDKTest::PackToFile(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_FOUR] = {0};
    size_t argCount = SIZE_FOUR;
    ImagePacker_Native* native = getNativeImagePacker(env, info, argValue, argCount);
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

    int32_t res = OH_ImagePacker_PackToFile(native, argValue[ARGS_SECOND], &packerOpts, fd);
    if (ops.format != nullptr) {
        free(ops.format);
        ops.format = nullptr;
    }
    return createResultValue(env, res, nullptr);
}

napi_value ImagePackingNDKTest::Release(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;
    ImagePacker_Native* native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr) {
        LOGE("argValue check failed");
        return createResultValue(env, IMAGE_RESULT_INVALID_PARAMETER);
    }
    int32_t res = OH_ImagePacker_Release(native);
    return createResultValue(env, res);
}
}
}
EXTERN_C_START
static napi_value ModuleRegister(napi_env env, napi_value exports)
{
    napi_property_descriptor props [] = {
        {"create", nullptr, OHOS::Media::ImagePackingNDKTest::Create, nullptr, nullptr, nullptr, napi_static, nullptr},
        {"initNative", nullptr, OHOS::Media::ImagePackingNDKTest::InitNative, nullptr, nullptr, nullptr, napi_static,
         nullptr},
        {"packToData", nullptr, OHOS::Media::ImagePackingNDKTest::PackToData, nullptr, nullptr, nullptr, napi_static,
         nullptr},
        {"packToFile", nullptr, OHOS::Media::ImagePackingNDKTest::PackToFile, nullptr, nullptr, nullptr, napi_static,
         nullptr},
        {"release", nullptr, OHOS::Media::ImagePackingNDKTest::Release, nullptr, nullptr, nullptr, napi_static,
         nullptr},
        {"JsPackToDataMultiFrames", nullptr, OHOS::Media::ImagePackingNDKTest::JsPackToDataMultiFrames, nullptr,
         nullptr, nullptr, napi_static, nullptr},
        {"JsPackToDataMultiFramesError", nullptr, OHOS::Media::ImagePackingNDKTest::JsPackToDataMultiFramesError,
         nullptr, nullptr, nullptr, napi_static, nullptr },
        {"JsPackToFileMultiFrames", nullptr, OHOS::Media::ImagePackingNDKTest::JsPackToFileMultiFrames, nullptr,
         nullptr, nullptr, napi_static, nullptr},
        {"JsPackToFileMultiFramesError", nullptr, OHOS::Media::ImagePackingNDKTest::JsPackToFileMultiFramesError,
         nullptr, nullptr, nullptr, napi_static, nullptr },
    };
    napi_define_properties(env, exports, sizeof(props) / sizeof(props[ARGS_FIRST]), props);
    return exports;
}
EXTERN_C_END
static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = ModuleRegister,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};
extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
