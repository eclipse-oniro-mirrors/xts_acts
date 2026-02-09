/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef CES_CAPI_DEMO_COMMON_TEST_H
#define CES_CAPI_DEMO_COMMON_TEST_H

#include <cstring>
#include <napi/native_api.h>
#include <hilog/log.h>
#include "BasicServicesKit/oh_commonevent.h"
#include "BasicServicesKit/oh_commonevent_support.h"

#define PARAM_NEGATIVE_1 (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_4 4
#define PARAM_6 6
#define SUCCESS 0
#define INVALID_PARAM 401

#define NAPI_END                                                                                                     \
    do {                                                                                                             \
        napi_value result = nullptr;                                                                                 \
        napi_create_int32(env, SUCCESS, &result);                                                                    \
        return result;                                                                                               \
    } while (0)                                                                                                      \

#define ASSERT_OBJEQ(result, expect)                                                                                 \
    do {                                                                                                             \
        if ((result) != (expect)) {                                                                                  \
            napi_value errorResult = nullptr;                                                                        \
            return errorResult;                                                                                      \
        }                                                                                                            \
    } while (0)

#define ASSERT_OBJNE(result, expect)                                                                                 \
    do {                                                                                                             \
        if ((result) == (expect)) {                                                                                  \
            napi_value errorResult = nullptr;                                                                        \
            return errorResult;                                                                                      \
        }                                                                                                            \
    } while (0)

#define ASSERT_EQ(result, expect)                                                                                    \
    do {                                                                                                             \
        if ((result) != (expect)) {                                                                                  \
            napi_value errorResult = nullptr;                                                                        \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                  \
            return errorResult;                                                                                      \
        }                                                                                                            \
    } while (0)

#define ASSERT_NE(result, expect)                                                                                    \
    do {                                                                                                             \
        if ((result) == (expect)) {                                                                                  \
            napi_value errorResult = nullptr;                                                                        \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                  \
            return errorResult;                                                                                      \
        }                                                                                                            \
    } while (0)

#define ASSERT_STREQ(result, expect)                                                                                   \
    do {                                                                                                               \
        auto *res1 = (result);                                                                                         \
        decltype(res1) res2 = (expect);                                                                                \
        if (::strcmp(res1, res2) != 0) {                                                                               \
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_STRNE(result, expect)                                                                                   \
    do {                                                                                                               \
        auto *res1 = (result);                                                                                         \
        decltype(res1) res2 = (expect);                                                                                \
        if (::strcmp(res1, res2) == 0) {                                                                               \
            napi_value errorResult = nullptr;                                                                          \
            napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
            return errorResult;                                                                                        \
        }                                                                                                              \
    } while (0)

#define ASSERT_TRUE(a)                                                                                               \
    do {                                                                                                             \
        ASSERT_EA(a, true);                                                                                          \
    } while (0)

#define ASSERT_FALSE(a)                                                                                              \
    do {                                                                                                             \
        ASSERT_EA(a, false);                                                                                         \
    } while (0)

#define ASSERT_EA(a, b)                                                                                              \
    do {                                                                                                             \
        if ((a) != (b)) {                                                                                            \
            OH_LOG_ERROR(LOG_APP, "test failed", a);                                                                 \
        }                                                                                                            \
    } while (0)

static const char* COMMON_EVENT_TEST = "event_test";
static const char* KEY_INT = "int";
static const char* KEY_INT_ARRAY = "int_array";
static const char* KEY_LONG = "long";
static const char* KEY_LONG_ARRAY = "long_array";
static const char* KEY_DOUBLE = "double";
static const char* KEY_DOUBLE_ARRAY = "double_array";
static const char* KEY_BOOL = "bool";
static const char* KEY_BOOL_ARRAY = "bool_array";
static const char* KEY_CHAR = "char";
static const char* KEY_CHAR_ARRAY = "char_array";
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

static CommonEvent_Subscriber* subscriber = nullptr;
static CommonEvent_SubscribeInfo* subscribeInfo = nullptr;
static CommonEvent_PublishInfo* publishInfo = nullptr;
static char* dataStr = nullptr;
static char* g_publishInfoBN = nullptr;
static char* g_publishInfoData = nullptr;
static int32_t g_publishInfoCode = PARAM_0;
static int32_t g_parametersInt = PARAM_0;
static CommonEvent_Parameters* parameters = nullptr;

#endif // CES_CAPI_DEMO_COMMON_TEST_H