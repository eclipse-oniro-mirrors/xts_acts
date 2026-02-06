
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

#include "image_source_test.h"
#include "node_api.h"
#include "multimedia/image_framework/image_pixel_map_napi.h"
#include <cstdlib>
#include "hilog/log.h"
#include "rawfile/raw_file.h"

namespace {
    constexpr size_t SIZE_ZERO = 0;
    constexpr size_t SIZE_ONE = 1;
    constexpr size_t SIZE_TWO = 2;
    constexpr size_t SIZE_THREE = 3;
    constexpr size_t DEFAULT_STRING_SIZE = 64;
    constexpr uint32_t ARGS_FIRST = 0;
    constexpr uint32_t ARGS_SECOND = 1;
    constexpr uint32_t ARGS_THIRD = 2;
    constexpr uint32_t INVALID_FRAME_COUNT = 0;
    constexpr int8_t INT8_FALSE = 0;
    constexpr int8_t INT8_TRUE = 1;
    constexpr int32_t DEFAULT_INDEX = 0;
}

namespace OHOS {
namespace Media {

#define STATIC_FUNCTION(n, f) { (n), nullptr, (f), nullptr, nullptr, nullptr, napi_static, nullptr }
#define DEBUG_PTR(p) (((p) == nullptr)?"nullptr":"not nullptr")

napi_value ImageSourceNDKTest::Init(napi_env env, napi_value exports)
{
    napi_property_descriptor props[] = {
        STATIC_FUNCTION("create", Create),
        STATIC_FUNCTION("createFromFd", CreateFromFd),
        STATIC_FUNCTION("createFromUri", CreateFromUri),
        STATIC_FUNCTION("createFromData", CreateFromData),
        STATIC_FUNCTION("createFromRawFile", CreateFromRawFile),
        STATIC_FUNCTION("createIncremental", CreateIncremental),
        STATIC_FUNCTION("createIncrementalFromData", CreateIncrementalFromData),
        STATIC_FUNCTION("initNative", InitNative),
        STATIC_FUNCTION("createPixelMap", CreatePixelMap),
        STATIC_FUNCTION("createPixelMapList", CreatePixelMapList),
        STATIC_FUNCTION("getDelayTime", GetDelayTime),
        STATIC_FUNCTION("getFrameCount", GetFrameCount),
        STATIC_FUNCTION("getSupportedFormats", GetSupportedFormats),
        STATIC_FUNCTION("getImageInfo", GetImageInfo),
        STATIC_FUNCTION("getImageProperty", GetImageProperty),
        STATIC_FUNCTION("modifyImageProperty", ModifyImageProperty),
        STATIC_FUNCTION("updateData", UpdateData),
        STATIC_FUNCTION("release", Release)
    };
    napi_define_properties(env, exports, sizeof(props) / sizeof(props[ARGS_FIRST]), props);
    return exports;
}

static bool GetBoolProperty(napi_env env, napi_value root, const char* utf8name, int8_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOG("Get property error %{public}s", utf8name);
        return false;
    }
    bool tmp = false;
    status = napi_get_value_bool(env, property, &tmp);
    *res = tmp ? INT8_TRUE : INT8_FALSE;
    return (status == napi_ok);
}

static bool GetInt32Property(napi_env env, napi_value root, const char* utf8name, int32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOG("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_int32(env, property, res) == napi_ok);
}

static bool GetUint32Property(napi_env env, napi_value root, const char* utf8name, uint32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOG("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_uint32(env, property, res) == napi_ok);
}

static bool GetArrayBufferProperty(napi_env env, napi_value root, const char* utf8name,
    uint8_t** buffer, size_t* bufferSize)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        LOG("Get property error %{public}s", utf8name);
        return false;
    }
    void* tmp;
    status = napi_get_arraybuffer_info(env, property, &tmp, bufferSize);
    *buffer = static_cast<uint8_t*>(tmp);
    return (status == napi_ok);
}

static bool GetStringValue(napi_env env, napi_value value, char** buffer, size_t *bufferSize)
{
    if (napi_ok != napi_get_value_string_utf8(env, value, nullptr, SIZE_ZERO, bufferSize)
        && *bufferSize == SIZE_ZERO) {
        LOG("Get napi string length error");
        return false;
    }
    *buffer = (char*)malloc((*bufferSize) + 1);
    if (napi_ok != napi_get_value_string_utf8(env, value, *buffer, (*bufferSize) + 1, bufferSize)) {
        LOG("Get napi string error");
        return false;
    }
    return (*bufferSize > SIZE_ZERO);
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char* utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

static bool checkType(napi_env env, napi_value arg, napi_valuetype type)
{
    napi_valuetype argType = napi_undefined;
    napi_typeof(env, arg, &argType);
    return (type == argType);
}
static bool checkArgs(const napi_value* argValue, size_t argCount, size_t want)
{
    if (argCount < want) {
        LOG("argCount %{public}zu < want %{public}zu", argCount, want);
        return false;
    }
    for (size_t i = SIZE_ZERO; i < want; i++) {
        if (argValue[i] == nullptr) {
            LOG("argValue[%{public}zu] is nullptr", i);
            return false;
        }
    }
    return true;
}
static bool parseImageSource(napi_env env, napi_value arg, struct OhosImageSource &src)
{
    if (env == nullptr || arg == nullptr) {
        LOG("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
        return false;
    }
    bool isArrayBuffer = false;
    if (checkType(env, arg, napi_string)) {
        LOG("Uri arg In");
        if (!GetStringValue(env, arg, &src.uri, &src.uriSize)) {
            LOG("Uri arg failed");
            return false;
        }
        LOG("Uri arg %{public}s", src.uri);
        return true;
    } else if (checkType(env, arg, napi_number)) {
        LOG("Fd arg In");
        if (napi_ok != napi_get_value_int32(env, arg, &(src.fd))) {
            LOG("Fd arg failed");
            return false;
        }
        LOG("src.fd is: %{public}d", src.fd);
        return true;
    } else if (napi_is_arraybuffer(env, arg, &isArrayBuffer) == napi_ok && isArrayBuffer) {
        LOG("Buffer arg In");
        void* buf = nullptr;
        if (napi_ok != napi_get_arraybuffer_info(env, arg, &buf, &(src.bufferSize)) || buf == nullptr ||
            src.bufferSize == SIZE_ZERO) {
            LOG("Fd arg failed");
            return false;
        }
        src.buffer = static_cast<uint8_t*>(buf);
        return true;
    }
    LOG("Invaild arg type");
    return false;
}
static void OhosImageSourceRelease(struct OhosImageSource &src)
{
    if (src.uri != nullptr) {
        free(src.uri);
        src.uri = nullptr;
    }
}
static bool parseImageSourceOpt(napi_env env, napi_value arg, struct OhosImageSourceOps &src)
{
    if (env == nullptr || arg == nullptr) {
        LOG("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
        return false;
    }
    // Optional parameters, no need check error.
    GetInt32Property(env, arg, "density", &(src.density));
    GetInt32Property(env, arg, "pixelFormat", &(src.pixelFormat));
    napi_value nSize = nullptr;
    auto status = napi_get_named_property(env, arg, "size", &nSize);
    if (status == napi_ok && nSize != nullptr) {
        GetInt32Property(env, nSize, "width", &(src.size.width));
        GetInt32Property(env, nSize, "height", &(src.size.height));
    }
    return true;
}
static bool parseImageDecodingOps(napi_env env, napi_value arg, struct OhosImageDecodingOps &ops)
{
    if (env == nullptr || arg == nullptr) {
        LOG("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
        return false;
    }

    ops.editable = INT8_FALSE;
    ops.pixelFormat = 0;
    ops.fitDensity = 0;
    ops.index = 0;
    ops.sampleSize = 1;
    ops.rotate = 0;
    ops.size = {0, 0};
    ops.region = {0, 0, 0, 0};

    // Optional parameters, no need check error.
    GetBoolProperty(env, arg, "editable", &(ops.editable));
    GetInt32Property(env, arg, "pixelFormat", &(ops.pixelFormat));
    GetInt32Property(env, arg, "fitDensity", &(ops.fitDensity));
    LOG("ops.fitDensity is: %{public}d", ops.fitDensity);
    GetUint32Property(env, arg, "index", &(ops.index));
    GetUint32Property(env, arg, "sampleSize", &(ops.sampleSize));
    GetUint32Property(env, arg, "rotate", &(ops.rotate));
    napi_value nSize = nullptr;
    auto status = napi_get_named_property(env, arg, "size", &nSize);
    if (status == napi_ok && nSize != nullptr) {
        GetInt32Property(env, nSize, "width", &(ops.size.width));
        GetInt32Property(env, nSize, "height", &(ops.size.height));
    }
    napi_value nRegion = nullptr;
    status = napi_get_named_property(env, arg, "region", &nRegion);
    if (status == napi_ok && nRegion != nullptr) {
        GetInt32Property(env, nRegion, "x", &(ops.region.x));
        GetInt32Property(env, nRegion, "y", &(ops.region.y));
        GetInt32Property(env, nRegion, "width", &(ops.region.width));
        GetInt32Property(env, nRegion, "height", &(ops.region.height));
    }
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
napi_value ImageSourceNDKTest::Create(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    struct OhosImageSource src;
    LOG("parseImageSource argValue[ARGS_FIRST]: %{public}d", argValue[ARGS_FIRST]);
    if (!parseImageSource(env, argValue[ARGS_FIRST], src)) {
        LOG("parseImageSource failed!!!");
        OhosImageSourceRelease(src);
        return createUndefine(env);
    }
    struct OhosImageSourceOps ops;
    LOG("parseImageSource argValue[ARGS_SECOND]: %{public}d", argValue[ARGS_SECOND]);
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        OhosImageSourceRelease(src);
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    LOG("OH_ImageSource_Create src.fd is: %{public}d", src.fd);
    LOG("OH_ImageSource_Create ops.density is: %{public}d", ops.density);
    LOG("OH_ImageSource_Create ops.pixelFormat is: %{public}d", ops.pixelFormat);
    LOG("OH_ImageSource_Create ops.size.height is: %{public}d", ops.size.height);
    LOG("OH_ImageSource_Create ops.size.width is: %{public}d", ops.size.width);
    ops.pixelFormat = 0;
    ops.size.height = 0;
    ops.size.width = 0;
    int32_t res = OH_ImageSource_Create(env, &src, &ops, &imageSource);
    LOG("OH_ImageSource_Create res is: %{public}d", res);
    if (imageSource == nullptr) {
        LOG("imageSource is nullptr");
    }
    OhosImageSourceRelease(src);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateFromFd(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    if (!checkType(env, argValue[ARGS_FIRST], napi_number)) {
        LOG("Fd type is not number");
        return createUndefine(env);
    }
    int32_t fd;
    if (napi_ok != napi_get_value_int32(env, argValue[ARGS_FIRST], &(fd))) {
        LOG("Fd arg failed");
        return createUndefine(env);
    }
    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    int32_t res = OH_ImageSource_CreateFromFd(env, fd, &ops, &imageSource);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateFromData(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    bool isArrayBuffer = false;
    if (napi_is_arraybuffer(env, argValue[ARGS_FIRST], &isArrayBuffer) != napi_ok || !isArrayBuffer) {
        LOG("Buffer type is not arraybuffer");
        return createUndefine(env);
    }
    void* buf = nullptr;
    size_t bufferSize = 0;
    if (napi_ok != napi_get_arraybuffer_info(env, argValue[ARGS_FIRST], &buf, &(bufferSize)) ||
        buf == nullptr || bufferSize == SIZE_ZERO) {
        LOG("buf arg failed");
        return createUndefine(env);
    }
    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    uint8_t* data = reinterpret_cast<uint8_t*>(buf);
    int32_t res = OH_ImageSource_CreateFromData(env, data, bufferSize, &ops, &imageSource);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateFromUri(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    size_t uriSize;
    char uri[2048];
    napi_get_value_string_utf8(env, argValue[ARGS_FIRST], uri, sizeof(uri), &uriSize);

    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    int32_t res = OH_ImageSource_CreateFromUri(env, uri, uriSize, &ops, &imageSource);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateFromRawFile(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    RawFileDescriptor rawFileDescriptor = {};
    int32_t fd, offset, length;
    if (!GetInt32Property(env, argValue[ARGS_FIRST], "fd", &fd)) {
        LOG("get fd failed");
        return createUndefine(env);
    }
    rawFileDescriptor.fd = fd;
    if (!GetInt32Property(env, argValue[ARGS_FIRST], "offset", &offset)) {
        LOG("get offset failed");
        return createUndefine(env);
    }
    rawFileDescriptor.start = offset;
    if (!GetInt32Property(env, argValue[ARGS_FIRST], "length", &length)) {
        LOG("get length failed");
        return createUndefine(env);
    }
    rawFileDescriptor.length = length;

    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    int32_t res = OH_ImageSource_CreateFromRawFile(env, rawFileDescriptor, &ops, &imageSource);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateIncremental(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    // No source check. There is no source input.
    struct OhosImageSource src;
    parseImageSource(env, argValue[ARGS_FIRST], src);
    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        OhosImageSourceRelease(src);
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    int32_t res = OH_ImageSource_CreateIncremental(env, &src, &ops, &imageSource);
    if (res != OHOS_IMAGE_RESULT_SUCCESS || imageSource == nullptr) {
        OhosImageSourceRelease(src);
        return createUndefine(env);
    }
    OhosImageSourceRelease(src);
    return createResultValue(env, res, imageSource);
}

napi_value ImageSourceNDKTest::CreateIncrementalFromData(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !checkArgs(argValue, argCount, SIZE_TWO)) {
        return createUndefine(env);
    }
    bool isArrayBuffer = false;
    if (napi_is_arraybuffer(env, argValue[ARGS_FIRST], &isArrayBuffer) != napi_ok || !isArrayBuffer) {
        LOG("Buffer type is not arraybuffer");
        return createUndefine(env);
    }
    void* buf = nullptr;
    size_t bufferSize = 0;
    if (napi_ok != napi_get_arraybuffer_info(env, argValue[ARGS_FIRST], &buf, &(bufferSize)) ||
        buf == nullptr || bufferSize == SIZE_ZERO) {
        LOG("buf arg failed");
        return createUndefine(env);
    }
    struct OhosImageSourceOps ops;
    if (!parseImageSourceOpt(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageSourceOpt failed!!!");
        return createUndefine(env);
    }
    napi_value imageSource = nullptr;
    uint8_t* data = reinterpret_cast<uint8_t*>(buf);
    int32_t res = OH_ImageSource_CreateIncrementalFromData(env, data, bufferSize, &ops, &imageSource);
    return createResultValue(env, res, imageSource);
}

static ImageSourceNative* getNativeImageSource(napi_env env, napi_callback_info info,
    napi_value* argValue, size_t &argCount)
{
    napi_value thisVar = nullptr;
    if (argValue == nullptr || argCount == SIZE_ZERO) {
        LOG("Invaild input!");
        return nullptr;
    }
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOG("napi_get_cb_info failed!");
        return nullptr;
    }
    return OH_ImageSource_InitNative(env, argValue[ARGS_FIRST]);
}

napi_value ImageSourceNDKTest::InitNative(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;

    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr) {
        return createUndefine(env);
    }
    return createResultValue(env, OHOS_IMAGE_RESULT_SUCCESS);
}

napi_value ImageSourceNDKTest::CreatePixelMap(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;

    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_TWO)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    LOG("before parseImageDecodingOps");
    struct OhosImageDecodingOps ops;
    if (!parseImageDecodingOps(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageDecodingOps failed");
        return createUndefine(env);
    }
    napi_value pixelmap = nullptr;
    int32_t res = OH_ImageSource_CreatePixelMap(native, &ops, &pixelmap);
    LOG("OH_ImageSource_CreatePixelMap res = %{public}d", res);
    return createResultValue(env, res, pixelmap);
}

napi_value ImageSourceNDKTest::CreatePixelMapList(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;

    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_TWO)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    LOG("argValue check Success");
    struct OhosImageDecodingOps ops;
    if (!parseImageDecodingOps(env, argValue[ARGS_SECOND], ops)) {
        LOG("parseImageDecodingOps failed");
        return createUndefine(env);
    }
    if (native == nullptr) {
        LOG("native is null");
    }
    napi_value pixelmapList = nullptr;
    int32_t res = OH_ImageSource_CreatePixelMapList(native, &ops, &pixelmapList);
    LOG("OH_ImageSource_CreatePixelMapList Success, res is:%{public}d ", res);
    return createResultValue(env, res, pixelmapList);
}

static void ReleaseDelayTimeList(struct OhosImageSourceDelayTimeList &timeList)
{
    if (timeList.delayTimeList != nullptr) {
        timeList.size = SIZE_ZERO;
        free(timeList.delayTimeList);
        timeList.delayTimeList = nullptr;
    }
}

napi_value ImageSourceNDKTest::GetDelayTime(napi_env env, napi_callback_info info)  __attribute__((no_sanitize("cfi")))
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;

    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    LOG("argValue check Success");
    LOG("before OhosImageSourceDelayTimeList timeList");
    struct OhosImageSourceDelayTimeList timeList;
    timeList.delayTimeList = nullptr;
    int32_t res = OH_ImageSource_GetDelayTime(native, &timeList);
    LOG("timeList.size is %{public}d", timeList.size);
    LOG("OH_ImageSource_GetDelayTime res is %{public}d", res);
    if (timeList.delayTimeList == nullptr) {
        LOG("after timeList.delayTimeList is nullptr");
    }
    if (timeList.size == SIZE_ZERO || res != OHOS_IMAGE_RESULT_SUCCESS) {
        LOG("Delay time list get failed");
        return createUndefine(env);
    }
    LOG("Delay time list get Success");
    timeList.delayTimeList = (int32_t*)malloc(sizeof(int32_t) * timeList.size);
    res = OH_ImageSource_GetDelayTime(native, &timeList);
    LOG("OH_ImageSource_GetDelayTime Success");
    napi_value result;
    napi_create_array(env, &result);
    for (size_t i = SIZE_ZERO; i < timeList.size; i++) {
        napi_value nDelayTime = nullptr;
        napi_create_int32(env, timeList.delayTimeList[i], &nDelayTime);
        napi_set_element(env, result, i, nDelayTime);
    }
    ReleaseDelayTimeList(timeList);
    LOG("ReleaseDelayTimeList Success");
    return createResultValue(env, res, result);
}

napi_value ImageSourceNDKTest::GetFrameCount(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;

    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    uint32_t frameCount = INVALID_FRAME_COUNT;
    int32_t res = OH_ImageSource_GetFrameCount(native, &frameCount);

    napi_value nFrameCount = nullptr;
    napi_create_int32(env, frameCount, &nFrameCount);
    return createResultValue(env, res, nFrameCount);
}
static void ReleaseSupportedFormatList(struct OhosImageSourceSupportedFormatList &formatList)
{
    if (formatList.supportedFormatList == nullptr) {
        return;
    }
    for (size_t i = SIZE_ZERO; i < formatList.size; i++) {
        auto format = formatList.supportedFormatList[i];
        if (format != nullptr) {
            if (format->format != nullptr) {
                free(format->format);
                format->format = nullptr;
            }
            free(format);
        }
    }
    free(formatList.supportedFormatList);
    formatList.supportedFormatList = nullptr;
}
napi_value ImageSourceNDKTest::GetSupportedFormats(napi_env env, napi_callback_info info)  __attribute__((no_sanitize("cfi")))
{
    struct OhosImageSourceSupportedFormatList formatList;
    int32_t res = OH_ImageSource_GetSupportedFormats(&formatList);
    if (formatList.size == SIZE_ZERO || res != OHOS_IMAGE_RESULT_SUCCESS) {
        LOG("Supported format list get failed");
        return createUndefine(env);
    }
    formatList.supportedFormatList = (struct OhosImageSourceSupportedFormat**)malloc(
        sizeof(struct OhosImageSourceSupportedFormat*) * formatList.size);
    for (size_t i = 0; i < formatList.size; i++) {
        formatList.supportedFormatList[i] = (struct OhosImageSourceSupportedFormat*)malloc(
            sizeof(struct OhosImageSourceSupportedFormat));
        formatList.supportedFormatList[i]->format = (char*)malloc(DEFAULT_STRING_SIZE);
        formatList.supportedFormatList[i]->size = DEFAULT_STRING_SIZE;
    }

    res = OH_ImageSource_GetSupportedFormats(&formatList);
    napi_value result;
    napi_create_array(env, &result);
    for (size_t i = SIZE_ZERO; i < formatList.size; i++) {
        napi_value nFormat = nullptr;
        auto format = formatList.supportedFormatList[i];
        napi_create_string_utf8(env, format->format, format->size, &nFormat);
        napi_set_element(env, result, i, nFormat);
    }
    ReleaseSupportedFormatList(formatList);
    return createResultValue(env, res, result);
}

static napi_value createImageInfoNVal(napi_env env, const struct OhosImageSourceInfo &imageInfo)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "pixelFormat", imageInfo.pixelFormat);
    setInt32NamedProperty(env, result, "colorSpace", imageInfo.colorSpace);
    setInt32NamedProperty(env, result, "alphaType", imageInfo.alphaType);
    setInt32NamedProperty(env, result, "density", imageInfo.density);
    napi_value nSize = nullptr;
    napi_create_object(env, &nSize);
    setInt32NamedProperty(env, nSize, "width", imageInfo.size.width);
    setInt32NamedProperty(env, nSize, "height", imageInfo.size.height);
    napi_set_named_property(env, result, "size", nSize);
    return result;
}

napi_value ImageSourceNDKTest::GetImageInfo(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_TWO)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    int32_t index = DEFAULT_INDEX;
    napi_get_value_int32(env, argValue[ARGS_SECOND], &index);
    struct OhosImageSourceInfo imageInfo;
    int32_t res = OH_ImageSource_GetImageInfo(native, index, &imageInfo);
    napi_value nImageInfo = createImageInfoNVal(env, imageInfo);
    return createResultValue(env, res, nImageInfo);
}

napi_value ImageSourceNDKTest::GetImageProperty(napi_env env, napi_callback_info info)  __attribute__((no_sanitize("cfi")))
{
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_TWO)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    struct OhosImageSourceProperty key;
    if (!GetStringValue(env, argValue[ARGS_SECOND], &key.value, &key.size) ||
        key.value == nullptr || key.size == SIZE_ZERO) {
        LOG("Get key failed");
        return createUndefine(env);
    }
    struct OhosImageSourceProperty val;
    int32_t res = OH_ImageSource_GetImageProperty(native, &key, &val);
    if (val.size == SIZE_ZERO) {
        LOG("Get val size failed");
        return createResultValue(env, res, createUndefine(env));
    }
    val.value = (char*)malloc(val.size);

    res = OH_ImageSource_GetImageProperty(native, &key, &val);
    napi_value nValue = nullptr;
    if (val.value != nullptr && val.size != SIZE_ZERO) {
        napi_create_string_utf8(env, val.value, val.size, &nValue);
    } else {
        LOG("Get val is empty");
    }
    if (val.value != nullptr) {
        free(val.value);
    }
    return createResultValue(env, res, nValue);
}

napi_value ImageSourceNDKTest::ModifyImageProperty(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_THREE] = {0};
    size_t argCount = SIZE_THREE;
    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_THREE)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    struct OhosImageSourceProperty key;
    if (!GetStringValue(env, argValue[ARGS_SECOND], &key.value, &key.size) ||
        key.value == nullptr || key.size == SIZE_ZERO) {
        LOG("Get key failed");
        return createUndefine(env);
    }
    struct OhosImageSourceProperty val;
    if (!GetStringValue(env, argValue[ARGS_THIRD], &val.value, &val.size) ||
        val.value == nullptr || val.size == SIZE_ZERO) {
        LOG("Get val failed");
        return createUndefine(env);
    }
    int32_t res = OH_ImageSource_ModifyImageProperty(native, &key, &val);
    return createResultValue(env, res);
}
static bool parseImageSourceUpdateData(napi_env env, napi_value arg, struct OhosImageSourceUpdateData &data)
{
    if (env == nullptr || arg == nullptr) {
        LOG("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
        return false;
    }
    GetArrayBufferProperty(env, arg, "buffer", &(data.buffer), &(data.bufferSize));
    GetUint32Property(env, arg, "offset", &(data.offset));
    GetUint32Property(env, arg, "updateLength", &(data.updateLength));
    GetBoolProperty(env, arg, "isCompleted", &(data.isCompleted));
    return true;
}
napi_value ImageSourceNDKTest::UpdateData(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_TWO] = {0};
    size_t argCount = SIZE_TWO;
    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_TWO)) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    struct OhosImageSourceUpdateData data;
    parseImageSourceUpdateData(env, argValue[ARGS_SECOND], data);
    int32_t res = OH_ImageSource_UpdateData(native, &data);
    return createResultValue(env, res);
}

napi_value ImageSourceNDKTest::Release(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_ONE] = {0};
    size_t argCount = SIZE_ONE;
    ImageSourceNative* native = getNativeImageSource(env, info, argValue, argCount);
    if (native == nullptr) {
        LOG("argValue check failed");
        return createUndefine(env);
    }
    int32_t res = OH_ImageSource_Release(native);
    return createResultValue(env, res);
}

EXTERN_C_START
static napi_value ModuleRegister(napi_env env, napi_value exports)
{
    ImageSourceNDKTest::Init(env, exports);
    return exports;
}

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = ModuleRegister,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

__attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
EXTERN_C_END
}
}