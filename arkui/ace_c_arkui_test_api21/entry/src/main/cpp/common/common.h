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

#ifndef ARKUI_CAPI_XTS_COMMON_TEST_H
#define ARKUI_CAPI_XTS_COMMON_TEST_H

#include <napi/native_api.h>
#include <hilog/log.h>
#include <cstdio>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <string>

namespace ArkUICapiTest {

#define PARAM_0_POINT_5 0.5
#define PARAM_1_POINT_5 1.5
#define PARAM_0_POINT_6 0.6
#define PARAM_1_POINT_1 1.1
#define PARAM_NEGATIVE_0_POINT_1 (-0.1)
#define PARAM_NEGATIVE_0_POINT_8 (-0.8)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_7 7
#define PARAM_8 8
#define PARAM_9 9
#define PARAM_10 10
#define PARAM_11 11
#define PARAM_12 12
#define PARAM_13 13
#define PARAM_14 14
#define PARAM_15 15
#define PARAM_16 16
#define PARAM_17 17
#define PARAM_18 18
#define PARAM_19 19
#define PARAM_20 20
#define PARAM_80 80
#define PARAM_50_POINT_5 50.5
#define PARAM_80_POINT_5 80.5
#define PARAM_101_POINT_5 101.5
#define PARAM_90 90
#define PARAM_100 100
#define PARAM_200 200
#define PARAM_10000 10000
#define PARAM_NEGATIVE_1 (-1)
#define PARAM_NEGATIVE_2 (-2)
#define PARAM_NEGATIVE_10 (-10)
#define PARAM_NEGATIVE_30 (-30)
#define PARAM_NEGATIVE_50 (-50)
#define PARAM_NEGATIVE_50_POINT_5 (-50.5)
#define PARAM_NEGATIVE_100 (-100)
#define PARAM_64 64
#define DEFAULT_MARGIN 10
#define SIZE_2 2
#define SIZE_3 3
#define SIZE_5 5
#define SIZE_10 10
#define SIZE_20 20
#define SIZE_30 30
#define SIZE_40 40
#define SIZE_50 50
#define SIZE_56 56
#define SIZE_60 60
#define SIZE_70 70
#define SIZE_80 80
#define SIZE_90 90
#define SIZE_100 100
#define SIZE_110 110
#define SIZE_120 120
#define SIZE_180 180
#define SIZE_150 150
#define SIZE_200 200
#define SIZE_250 250
#define SIZE_300 300
#define SIZE_350 350
#define SIZE_400 400
#define SIZE_500 500
#define SIZE_600 600
#define SIZE_10000 10000
#define SUCCESS 0
#define INVALID_PARAM 401
#define NULL_PARAM 404
#define COLOR_BLACK 0xFF000000
#define COLOR_RED 0xFFFF0000
#define COLOR_GREEN 0xFF00FF00
#define COLOR_BLUE 0xFF0000FF
#define COLOR_YELLOW 0xFFFFFF00
#define COLOR_PURPLE 0xFFFF11FF
#define COLOR_GRAY 0xFFDDDDDD
#define COLOR_CYAN 0xFF00FFFF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_PINK 0xFFFFC0CB
#define COLOR_ILLEGAL 0x00000000
#define ON_CLICK_EVENT_ID 6001
#define ON_FOCUS_EVENT_ID 6002
#define ON_TOUCH_EVENT_ID 6003
#define ON_AREA_CHANGE_EVENT_ID 6004
#define ON_APPEAR_EVENT_ID 6005
#define ON_BLUR_EVENT_ID 6006
#define ON_CHANGE_EVENT_ID 6007
#define ON_SUBMIT_EVENT_ID 6008
#define ON_CUT_EVENT_ID 6009
#define ON_PASTE_EVENT_ID 6010
#define ON_MEASURE_EVENT_ID 6011
#define ON_LAYOUT_EVENT_ID 6012
#define ON_DRAW_EVENT_ID 6013
#define ON_HOVER_EVENT_ID 6014
#define ON_AXIS_EVENT_ID 6015
#define LIST_ON_WILL_SCROLL_EVENT_ID 6203
#define ON_CUSTOM_EVENT_1_ID 9001
#define ON_CUSTOM_EVENT_2_ID 9002
#define ON_CUSTOM_EVENT_3_ID 9003
#define ON_CUSTOM_EVENT_4_ID 9004
#define ON_CUSTOM_EVENT_5_ID 9005
#define ON_CUSTOM_EVENT_6_ID 9006
#define ON_CUSTOM_EVENT_11_ID 9011
#define ON_CUSTOM_EVENT_12_ID 9012
#define ON_CUSTOM_EVENT_13_ID 9013
#define ON_CUSTOM_EVENT_14_ID 9014
#define ON_CUSTOM_EVENT_15_ID 9015
#define ON_CUSTOM_EVENT_16_ID 9016
#define PARAM_NEGATIVE_1 (-1)
#define PARAM_NEGATIVE_100 (-100)
#define PARAM_NEGATIVE_5 (-5)

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

} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_COMMON_TEST_H
