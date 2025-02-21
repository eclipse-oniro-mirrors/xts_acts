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

#include "image_packing_test.h"

#include "node_api.h"
#include "image_pixel_map_napi.h"
#include <cstdlib>
#include "hilog/log.h"

namespace {
    constexpr size_t SIZE_ZERO = 0;
    constexpr size_t SIZE_ONE = 1;
    constexpr size_t SIZE_THREE = 3;
    constexpr size_t SIZE_FOUR = 4;
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
constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, LOG_ID, "ImagePackingNDKTest"};
#define MY_HILOG(op, fmt, args...) \
    do {                                  \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args);  \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)
#define DEBUG_PTR(p) (((p) == nullptr)?"nullptr":"not nullptr")

#define STATIC_FUNCTION(n, f) { (n), nullptr, (f), nullptr, nullptr, nullptr, napi_static, nullptr }
napi_value ImagePackingNDKTest::Init(napi_env env, napi_value exports)
{
    napi_property_descriptor props[] = {
        STATIC_FUNCTION("create", Create),
        STATIC_FUNCTION("initNative", InitNative),
        STATIC_FUNCTION("packToData", PackToData),
        STATIC_FUNCTION("packToFile", PackToFile),
        STATIC_FUNCTION("release", Release),
    };
    napi_define_properties(env, exports, sizeof(props) / sizeof(props[ARGS_FIRST]), props);
    return exports;
}

static bool GetInt32Property(napi_env env, napi_value root, const char* utf8name, int32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        DEBUG_LOG("Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_int32(env, property, res) == napi_ok);
}

static bool GetUint32Property(napi_env env, napi_value root, const char* utf8name, uint32_t* res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        DEBUG_LOG("Get property error %{public}s", utf8name);
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
        DEBUG_LOG("Get property error %{public}s", utf8name);
        return false;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, nullptr, SIZE_ZERO, bufferSize)
        && *bufferSize == SIZE_ZERO) {
        DEBUG_LOG("Get napi string length error");
        return false;
    }

    *buffer = (char*)malloc((*bufferSize) + 1);
    for (size_t i = SIZE_ZERO; i < (*bufferSize) + 1; i++) {
        (*buffer)[i] = 0;
    }

    if (napi_ok != napi_get_value_string_utf8(env, value, *buffer, (*bufferSize) + 1, bufferSize)) {
        DEBUG_LOG("Get napi string error");
        return false;
    }
    return (*bufferSize > SIZE_ZERO);
}

static bool checkArgs(const napi_value* argValue, size_t argCount, size_t want)
{
    if (argCount < want) {
        DEBUG_LOG("argCount %{public}zu < want %{public}zu", argCount, want);
        return false;
    }
    for (size_t i = SIZE_ZERO; i < want; i++) {
        if (argValue[i] == nullptr) {
            DEBUG_LOG("argValue[%{public}zu] is nullptr", i);
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
        DEBUG_LOG("env is %{public}s || arg is %{public}s", DEBUG_PTR(env), DEBUG_PTR(arg));
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
        DEBUG_LOG("Invaild input!");
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
        DEBUG_LOG("argValue check failed");
        return createUndefine(env);
    }
    struct ImagePackingTestOps ops;
    if (!parseImagePackingOps(env, argValue[ARGS_THIRD], ops)) {
        DEBUG_LOG("packing ops parse failed");
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
        DEBUG_LOG("packing create data failed");
        return createUndefine(env);
    }
    int32_t res = OH_ImagePacker_PackToData(native,
        argValue[ARGS_SECOND], &packerOpts, data, &dataSize);
    if (ops.format != nullptr) {
        free(ops.format);
        ops.format = nullptr;
    }
    DEBUG_LOG("packing act size %{public}zu", dataSize);
    return createResultValue(env, res, nValue);
}

// packToFile(packer, source, fd, opts:{format, quality})<{code, result}>
napi_value ImagePackingNDKTest::PackToFile(napi_env env, napi_callback_info info)
{
    napi_value argValue[SIZE_FOUR] = {0};
    size_t argCount = SIZE_FOUR;
    ImagePacker_Native* native = getNativeImagePacker(env, info, argValue, argCount);
    if (native == nullptr || !checkArgs(argValue, argCount, SIZE_FOUR)) {
        DEBUG_LOG("argValue check failed");
        return createUndefine(env);
    }
    int32_t fd = INVALID_FD;
    if (napi_ok != napi_get_value_int32(env, argValue[ARGS_THIRD], &fd)) {
        DEBUG_LOG("Fd arg failed");
        return createUndefine(env);
    }

    struct ImagePackingTestOps ops;
    if (!parseImagePackingOps(env, argValue[ARGS_FOURTH], ops)) {
        DEBUG_LOG("packing ops parse failed");
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
        DEBUG_LOG("argValue check failed");
        return createResultValue(env, IMAGE_RESULT_INVALID_PARAMETER);
    }
    int32_t res = OH_ImagePacker_Release(native);
    return createResultValue(env, res);
}

EXTERN_C_START
static napi_value ModuleRegister(napi_env env, napi_value exports)
{
    ImagePackingNDKTest::Init(env, exports);
    return exports;
}

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = ModuleRegister,
    .nm_modname = "ImagePackingNDKTest",
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