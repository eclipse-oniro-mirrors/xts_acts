/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "include/OhosCommonTest.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <hilog/log.h>
#include <string>

namespace ActsNNCoreOpsConstants {
const std::string DEFAULT_TAG = "ActsNNCoreOpsTest";
} // namespace ActsNNCoreOpsConstants

namespace {
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
constexpr int MAX_HEAD_SIZE = 50;
constexpr uint32_t FAIL_PRINT_LIMIT = 100;
constexpr float QUANT_TOL_THRESHOLD = 0.04f;
constexpr uint32_t PREVIEW_ELEMENT_LIMIT = 10;
constexpr uint64_t DATA_SIZE_INIT = 1;
constexpr float DEFAULT_RTOL = 1e-05f;
constexpr float DEFAULT_ATOL = 1e-08f;
constexpr float EPSILON_OFFSET = 1.0f;
constexpr int INDEX_OFFSET_ONE = 1;
constexpr int CSV_SUCCESS_FLAG = 1;
constexpr int CSV_FAIL_FLAG = 0;
constexpr float ZERO_THRESHOLD = 0.0f;
constexpr int FLOAT32_BYTE_SIZE = 4;
constexpr int FLOAT32_BYTE_OFFSET_1 = 1;
constexpr int FLOAT32_BYTE_OFFSET_2 = 2;
constexpr int FLOAT32_BYTE_OFFSET_3 = 3;
constexpr uint64_t MICROSECONDS_PER_SECOND = 1000000;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int ERROR_CODE_NEGATIVE_THREE = -3;
constexpr int SUCCESS_CODE = 0;
constexpr int STRING_OFFSET_ONE = 1;
constexpr int FILE_SEEK_START = 0;

struct AllCloseInt8Options {
    uint8_t* a;
    uint8_t* b;
    uint64_t count;
    float rTol;
    float aTol;
    bool isQuant;
};

struct AllCloseFloatOptions {
    float* a;
    float* b;
    uint64_t count;
    float rTol;
    float aTol;
    bool isQuant;
};
} // namespace

void ConvertToPublic(const char* fmt, char* out, size_t outSize)
{
    const char* p = fmt;
    char* q = out;

    while (*p && static_cast<size_t>(q - out) < outSize - FORMAT_PUBLIC_RESERVED) {
        // 格式起点：% 但不是 %{public}
        if (*p == '%' && *(p + 1) != '{') {
            p++; // 跳过%
            // 写入 %{public}
            SafeMemcpy(q, outSize - (q - out), "%{public}", outSize - (q - out) - 1);
            q += strlen("%{public}");
            // 拷贝所有格式修饰符（如 03、-20、.2、ll、h 等）
            while (*p && strchr("0123456789.+-hlLjzt", *p)) {
                *q++ = *p++;
            }
            // 最终的类型符号（s d f p x c g u l 等等）
            if (*p) {
                *q++ = *p++;
            }

            continue;
        }
        // 普通字符
        *q++ = *p++;
    }

    *q = '\0';
}

void OHPrintf(const char* fmt, ...)
{
    char fmtPublic[PRINTF_BUFFER_SIZE];
    ConvertToPublic(fmt, fmtPublic, sizeof(fmtPublic));

    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, ActsNNCoreOpsConstants::DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[index + 1];

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }

    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }

    return result;
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}