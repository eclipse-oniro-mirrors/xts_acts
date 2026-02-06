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

#ifndef NATIVE_XCOMPONENT_COMMON_H
#define NATIVE_XCOMPONENT_COMMON_H

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl3.h>
#include <napi/native_api.h>

namespace NativeXComponentSample {

#define PARAM_1 1
#define PARAM_NEGATIVE_1 (-1)

#define SUCCESS 0

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
        auto *res1 = (result);                                                                                         \
        decltype(res1) res2 = (expect);                                                                                \
        std::string str1 = res1;                                                                                       \
        std::string str2 = res2;                                                                                       \
        if (::strcmp(res1, res2) != 0) {                                                                               \
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ASSERT_STREQ",                                         \
                         "assert equal failed, expect is %{public}s and result is %{public}s", res2, res1);            \
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
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
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_OBJ(result, expect)                                                                                     \
    do {                                                                                                               \
        if ((result) != (expect)) {                                                                                    \
            napi_value errorResult = nullptr;                                                                          \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_OBJ_NE(result, expect)                                                                                     \
    do {                                                                                                               \
        if ((result) == (expect)) {                                                                                    \
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

#define NAPI_START(componentName, componentType)                                                                       \
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                                          \
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));                              \
    auto(componentName) = nodeAPI->createNode(componentType);                                                          \
    do {                                                                                                               \
        if ((env == nullptr) || (info == nullptr)) {                                                                   \
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NAPI_CHECK_PARAMS", "GetContext env or info is null"); \
            return nullptr;                                                                                            \
        }                                                                                                              \
    } while (0)

} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_COMMON_H