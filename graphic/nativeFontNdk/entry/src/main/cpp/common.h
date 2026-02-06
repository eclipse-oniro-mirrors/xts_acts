/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef GRAPHIC_CAPI_XTS_COMMON_TEST_H
#define GRAPHIC_CAPI_XTS_COMMON_TEST_H

#include <napi/native_api.h>
#include <hilog/log.h>
#include <cstdio>
#include <string>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_NEGATIVE_1 (-1)
#define SUCCESS 0
#define INVALID_PARAM 401
#define NULL_PARAM 404
#define PARAM_0_POINT_8 0.8
#define PARAM_1_POINT_0 1.0
#define PARAM_0_POINT_2 0.2
#define EPSILON (1.0e-6)

/**
 * Log print domain.
 */
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

#define ASSERT_EQ(result, expect)                                                                                      \
    do {                                                                                                               \
        if ((result) != (expect)) {                                                                                    \
            std::string assertStr = "assert equal failed, expect is " + std::to_string(expect) + " and result is " +   \
                                    std::to_string(result);                                                            \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_NE(result, expect)                                                                                      \
    do {                                                                                                               \
        if ((result) == (expect)) {                                                                                    \
            std::string assertStr = "assert not equal failed, expect is " + std::to_string(expect) +                   \
                                    " and result is " + std::to_string(result);                                        \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_STREQ(result, expect)                                                                                   \
    do {                                                                                                               \
        const char *res1 = (result);                                                                                   \
        const char *res2 = (expect);                                                                                   \
        std::string str1 = res1;                                                                                       \
        std::string str2 = res2;                                                                                       \
        if (::strcmp(res1, res2) != 0) {                                                                               \
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ASSERT_STREQ",                                         \
                         "assert equal failed, expect is %{public}s and result is %{public}s", res2, res1);            \
            std::string assertStr = "assert not equal failed, expect is " + std::string(res2) +                        \
                                    " and result is " + std::string(res1);                                             \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
        }                                                                                                              \
    } while (0)

#define ASSERT_STRNE(result, expect)                                                                                   \
    do {                                                                                                               \
        auto *res1 = (result);                                                                                         \
        decltype(res1) res2 = (expect);                                                                                \
        std::string str1 = res1;                                                                                       \
        std::string str2 = res2;                                                                                       \
        if (::strcmp(res1, res2) == 0) {                                                                               \
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ASSERT_STRNE",                                         \
                         "assert not equal failed, expect is %{public}s and result is %{public}s", res2, res1);        \
            std::string assertStr = "assert equal failed, expect is " + res2 +                                         \
                                    " and result is " + res1;                                                          \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
        }                                                                                                              \
    } while (0)

#define ASSERT_NULL(result, expect)                                                                                    \
    do {                                                                                                               \
        if ((result) != nullptr) {                                                                                     \
            std::string assertStr = "assert equal failed, expect is " + std::to_string(nullptr) + " and result is " +  \
                                    std::to_string(result);                                                            \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
        }                                                                                                              \
    } while (0)

#define ASSERT_NOTNULL(result, expect)                                                                                 \
    do {                                                                                                               \
        if ((result) == nullptr) {                                                                                     \
            std::string assertStr = "assert not equal failed, expect not is " + std::to_string(nullptr) +              \
                                    " and result is " +  std::to_string(result);                                       \
            char assertChars[assertStr.size() + PARAM_1];                                                              \
            strcpy(assertChars, assertStr.c_str());                                                                    \
            napi_throw_error((env), nullptr, assertChars);                                                             \
        }                                                                                                              \
    } while (0)

#define ASSERT_FLOATEQ(result, expect)                                                                                 \
    do {                                                                                                               \
        if (abs((result) - (expect)) > EPSILON) {                                                                      \
            napi_value errorResult = nullptr;                                                                          \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define NAPI_END                                                                                                       \
    do {                                                                                                               \
        napi_value result = nullptr;                                                                                   \
        napi_create_int32(env, SUCCESS, &result);                                                                      \
        return result;                                                                                                 \
    } while (0)

#endif // GRAPHIC_CAPI_XTS_COMMON_TEST_H
