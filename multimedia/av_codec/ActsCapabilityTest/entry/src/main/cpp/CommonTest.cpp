/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <hilog/log.h>
#include "include/CommonTest.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <fstream>

namespace {
constexpr int NEGATIVE_TWO = -2;
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
const std::string DEFAULT_TAG = "AudioCapTest";
}

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
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return -1;
    }
    if (len == 0) {
        return 0; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return 0; // 源和目标相同，无需复制
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
    return 0;
}
#include "CommonTest.h"
