/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NATIVE_XCOMPONENT_COMMON_H
#define NATIVE_XCOMPONENT_COMMON_H

#include <napi/native_api.h>
#include <hilog/log.h>
#include <cstdio>
#include <arkui/native_interface.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>
#include <cstdint>
#include <js_native_api_types.h>
#include <random>
#include <list>
#include <cstddef>
#include <ace/xcomponent/native_xcomponent_key_event.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>

#define PARMA_0_POINT_0001 0.0001
#define PARAM_0_POINT_2 0.2
#define PARAM_0_POINT_3 0.3
#define PARAM_0_POINT_5 0.5
#define PARAM_1_POINT_5 1.5
#define PARAM_0_POINT_6 0.6
#define PARAM_0_POINT_7 0.7
#define PARAM_0_POINT_8 0.8
#define PARAM_0_POINT_9 0.9
#define PARAM_1_POINT_0 1.0
#define PARAM_1_POINT_1 1.1
#define PARAM_15_POINT_0 15.0
#define PARAM_90_POINT_0 90.0
#define PARMA_NEGATIVE_0_POINT_0001 (-0.0001)
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
#define PARAM_21 21
#define PARAM_24 24
#define PARAM_29 29
#define PARAM_30 30
#define PARAM_33 33
#define PARAM_50 50
#define PARAM_80 80
#define PARAM_50_POINT_5 50.5
#define PARAM_80_POINT_5 80.5
#define PARAM_101_POINT_5 101.5
#define PARAM_90 90
#define PARAM_96 96
#define PARAM_100 100
#define PARAM_101 101
#define PARAM_120 120
#define PARAM_128 128
#define PARAM_200 200
#define PARAM_240 240
#define PARAM_255 255
#define PARAM_300 300
#define PARAM_401 401
#define PARAM_500 500
#define PARAM_501 501
#define PARAM_512 512
#define PARAM_800 800
#define PARAM_911 911
#define PARAM_1000 1000
#define PARAM_1001 1001
#define PARAM_1024 1024
#define PARAM_3600 3600
#define PARAM_10000 10000
#define PARAM_180001 180001
#define PARAM_180002 180002
#define PARAM_180102 180102
#define PARAM_4294967296 4294967296
#define PARAM_NEGATIVE_1 (-1)
#define PARAM_NEGATIVE_2 (-2)
#define PARAM_NEGATIVE_5 (-5)
#define PARAM_NEGATIVE_9 (-9)
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
#define SIZE_240 240
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
#define PARAM_NEGATIVE_100 (-100)
#define COLUMN_WIDTH_AND_HEIGHT 210

/**
 * Log print domain.
 */
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

napi_property_descriptor XL(char* functionName, napi_callback func);
#endif // NATIVE_XCOMPONENT_COMMON_H
