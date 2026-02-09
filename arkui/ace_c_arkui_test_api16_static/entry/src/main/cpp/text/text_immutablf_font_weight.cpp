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
#include "common/common.h"
#include "ani/ani.h"
#include <asm-generic/stat.h>
#include <bits/alltypes.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#define INT_0 0
#define INT_1 1
#define INT_2 2
#define INT_3 3
#define INT_4 4
#define INT_5 5
#define INT_6 6
#define INT_7 7
#define INT_8 8
#define INT_9 9
#define INT_10 10
#define INT_11 11
#define INT_12 12
#define INT_13 13
#define INT_14 14
#define INT_401 401

namespace ArkUIAniTest {

static ani_double textImmutablfFontWeight_001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  850}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_10);
    ASSERT_EQ(ret, INT_401);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_1);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_3);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_006(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_4);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_007(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_5);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_008(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_6);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_009(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_7);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_010(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_8);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_011(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_9);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_012(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_10);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_013(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_11);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_014(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_12);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_015(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_13);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double textImmutablfFontWeight_016(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue sIMMUTABLE_FONT_WEIGHT[] = {{.i32 =  ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem sIMMUTABLE_FONT_WEIGHTitem = {sIMMUTABLE_FONT_WEIGHT, 1};
    auto ret = nodeAPI->setAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT, &sIMMUTABLE_FONT_WEIGHTitem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_IMMUTABLE_FONT_WEIGHT)->value[0].u32, INT_14);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
}