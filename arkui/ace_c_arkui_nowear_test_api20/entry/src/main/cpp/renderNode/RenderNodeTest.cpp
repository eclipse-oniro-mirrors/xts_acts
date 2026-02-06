/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "../manager/plugin_manager.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

static int NUMBER_106404 = 106404;
#define NUMBER_100 100
#define NUMBER_0_5 0.5

namespace ArkUICapiTest {

static napi_value RenderNodeErrorCode001(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;

    ArkUI_RenderContentModifierHandle modifier;
    auto result1 = OH_ArkUI_RenderNodeUtils_AttachContentModifier(rsNode, modifier);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_FloatPropertyHandle floatProperty;
    auto result2 = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, floatProperty);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_Vector2PropertyHandle vector2Property;
    auto result3 = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, vector2Property);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_ColorPropertyHandle colorProperty;
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, colorProperty);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_FloatAnimatablePropertyHandle floatAnimatable;
    auto result5 = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, floatAnimatable);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result5=%{public}d", result5);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_Vector2AnimatablePropertyHandle vector2Animatable;
    auto result6 = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, vector2Animatable);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result6=%{public}d", result6);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_ColorAnimatablePropertyHandle colorAnimatable;
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, colorAnimatable);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode001 result7=%{public}d", result7);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    NAPI_END;
}

static napi_value RenderNodeErrorCode002(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float alpha = 0;
    auto ret32 = OH_ArkUI_RenderNodeUtils_GetShadowAlpha(rsNode, &alpha);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode002 ret32=%{public}d", ret32);
    ASSERT_EQ(ret32, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode003(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret33 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, NUMBER_0_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode003 ret33=%{public}d", ret33);
    ASSERT_EQ(ret33, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode004(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t shadowOffsetX = 0;
    int32_t shadowOffsetY = 0;
    auto ret34 = OH_ArkUI_RenderNodeUtils_GetShadowOffset(rsNode, &shadowOffsetX, &shadowOffsetY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode004 ret34=%{public}d", ret34);
    ASSERT_EQ(ret34, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode005(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret35 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode005 ret35=%{public}d", ret35);
    ASSERT_EQ(ret35, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode006(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    uint32_t shadowColor = 0;
    auto ret36 = OH_ArkUI_RenderNodeUtils_GetShadowColor(rsNode, &shadowColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode006 ret36=%{public}d", ret36);
    ASSERT_EQ(ret36, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode007(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret37 = OH_ArkUI_RenderNodeUtils_SetShadowColor(rsNode, 0xFFFF00FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode007 ret37=%{public}d", ret37);
    ASSERT_EQ(ret37, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode008(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float matrix[] = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};
    auto ret38 = OH_ArkUI_RenderNodeUtils_SetTransform(rsNode, matrix);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode008 ret38=%{public}d", ret38);
    ASSERT_EQ(ret38, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode009(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float setRotationX = 0;
    float setRotationY = 0;
    float setRotationZ = 0;
    auto ret39 = OH_ArkUI_RenderNodeUtils_GetRotation(rsNode, &setRotationX, &setRotationY, &setRotationZ);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode009 ret39=%{public}d", ret39);
    ASSERT_EQ(ret39, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode010(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret40 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_100, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode010 ret40=%{public}d", ret40);
    ASSERT_EQ(ret40, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode011(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float setTranslationX = 0;
    float setTranslationY = 0;
    auto ret41 = OH_ArkUI_RenderNodeUtils_GetTranslation(rsNode, &setTranslationX, &setTranslationY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode011 ret41=%{public}d", ret41);
    ASSERT_EQ(ret41, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode012(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret42 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode012 ret42=%{public}d", ret42);
    ASSERT_EQ(ret42, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode013(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;

    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    auto ret23 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNode, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret23=%{public}d", ret23);
    ASSERT_EQ(ret23, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    auto ret25 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNode, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret25=%{public}d", ret25);
    ASSERT_EQ(ret25, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    auto ret26 = OH_ArkUI_RenderNodeUtils_GetBorderStyle(rsNode, &styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret26=%{public}d", ret26);
    ASSERT_EQ(ret26, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    auto ret27 = OH_ArkUI_RenderNodeUtils_SetBorderStyle(rsNode, styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret27=%{public}d", ret27);
    ASSERT_EQ(ret27, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    float radius = 0;
    auto ret28 = OH_ArkUI_RenderNodeUtils_GetShadowRadius(rsNode, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret28=%{public}d", ret28);
    ASSERT_EQ(ret28, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    auto ret29 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret29=%{public}d", ret29);
    ASSERT_EQ(ret29, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    float elevation = 0;
    auto ret30 = OH_ArkUI_RenderNodeUtils_GetShadowElevation(rsNode, &elevation);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret30=%{public}d", ret30);
    ASSERT_EQ(ret30, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    auto ret31 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode013 ret31=%{public}d", ret31);
    ASSERT_EQ(ret31, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    NAPI_END;
}

static napi_value RenderNodeErrorCode014(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float setScaleX = 0;
    float setScaleY = 0;
    auto ret43 = OH_ArkUI_RenderNodeUtils_GetScale(rsNode, &setScaleX, &setScaleY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode014 ret43=%{public}d", ret43);
    ASSERT_EQ(ret43, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode015(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret44 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode015 ret44=%{public}d", ret44);
    ASSERT_EQ(ret44, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode016(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float setPivotX = 0;
    float setPivotY = 0;
    auto ret45 = OH_ArkUI_RenderNodeUtils_GetPivot(rsNode, &setPivotX, &setPivotY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode016 ret45=%{public}d", ret45);
    ASSERT_EQ(ret45, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode017(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret46 = OH_ArkUI_RenderNodeUtils_SetPivot(rsNode, 1, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode017 ret46=%{public}d", ret46);
    ASSERT_EQ(ret46, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode018(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t setPositionX = 0;
    int32_t setPositionY = 0;
    auto ret47 = OH_ArkUI_RenderNodeUtils_GetPosition(rsNode, &setPositionX, &setPositionY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode018 ret47=%{public}d", ret47);
    ASSERT_EQ(ret47, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode019(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret48 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode019 ret48=%{public}d", ret48);
    ASSERT_EQ(ret48, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode020(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t getSizeWidth = 0;
    int32_t getSizeHeight = 0;
    auto ret49 = OH_ArkUI_RenderNodeUtils_GetSize(rsNode, &getSizeWidth, &getSizeHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode020 ret49=%{public}d", ret49);
    ASSERT_EQ(ret49, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode021(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret50 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode021 ret50=%{public}d", ret50);
    ASSERT_EQ(ret50, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode022(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    float opacity = 0;
    auto ret51 = OH_ArkUI_RenderNodeUtils_GetOpacity(rsNode, &opacity);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode022 ret51=%{public}d", ret51);
    ASSERT_EQ(ret51, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode023(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret52 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, NUMBER_0_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode023 ret52=%{public}d", ret52);
    ASSERT_EQ(ret52, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode024(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t clipToBounds = 0;
    auto ret53 = OH_ArkUI_RenderNodeUtils_GetClipToBounds(rsNode, &clipToBounds);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode024 ret53=%{public}d", ret53);
    ASSERT_EQ(ret53, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode025(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret54 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode025 ret54=%{public}d", ret54);
    ASSERT_EQ(ret54, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode026(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t clipToFrame = 0;
    auto ret55 = OH_ArkUI_RenderNodeUtils_GetClipToFrame(rsNode, &clipToFrame);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode026 ret55=%{public}d", ret55);
    ASSERT_EQ(ret55, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode027(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret56 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode027 ret56=%{public}d", ret56);
    ASSERT_EQ(ret56, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode028(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    uint32_t backgroundColor = 0;
    auto ret57 = OH_ArkUI_RenderNodeUtils_GetBackgroundColor(rsNode, &backgroundColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode028 ret57=%{public}d", ret57);
    ASSERT_EQ(ret57, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode029(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret58 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(rsNode, 0xFF0000FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode029 ret58=%{public}d", ret58);
    ASSERT_EQ(ret58, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode030(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int count = 0;
    auto ret59 = OH_ArkUI_RenderNodeUtils_GetChildrenCount(rsNode, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode030 ret59=%{public}d", ret59);
    ASSERT_EQ(ret59, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode031(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderNodeHandle* nodeList;
    int count = 0;
    auto ret60 = OH_ArkUI_RenderNodeUtils_GetChildren(rsNode, &nodeList, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode031 ret60=%{public}d", ret60);
    ASSERT_EQ(ret60, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode032(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderNodeHandle nodeTemp;
    auto ret61 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rsNode, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode032 ret61=%{public}d", ret61);
    ASSERT_EQ(ret61, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode033(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderNodeHandle nodeTemp;
    auto ret62 = OH_ArkUI_RenderNodeUtils_GetNextSibling(rsNode, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode033 ret62=%{public}d", ret62);
    ASSERT_EQ(ret62, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode034(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderNodeHandle nodeTemp;
    auto ret63 = OH_ArkUI_RenderNodeUtils_GetFirstChild(rsNode, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode034 ret63=%{public}d", ret63);
    ASSERT_EQ(ret63, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode035(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    ArkUI_RenderNodeHandle nodeTemp;
    auto ret64 = OH_ArkUI_RenderNodeUtils_GetChild(rsNode, 1, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode035 ret64=%{public}d", ret64);
    ASSERT_EQ(ret64, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode036(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret65 = OH_ArkUI_RenderNodeUtils_ClearChildren(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode036 ret65=%{public}d", ret65);
    ASSERT_EQ(ret65, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode037(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;

    ArkUI_RenderNodeHandle rsNodeSecondChild;
    auto ret66 = OH_ArkUI_RenderNodeUtils_RemoveChild(rsNode, rsNodeSecondChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode037 ret66=%{public}d", ret66);
    ASSERT_EQ(ret66, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    auto ret67 = OH_ArkUI_RenderNodeUtils_InsertChildAfter(rsNode, rsNodeSecondChild, rsNodeSecondChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode037 ret67=%{public}d", ret67);
    ASSERT_EQ(ret67, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_RenderNodeHandle rsNodeFirstChild;
    auto ret68 = OH_ArkUI_RenderNodeUtils_AddChild(rsNode, rsNodeFirstChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode037 ret68=%{public}d", ret68);
    ASSERT_EQ(ret68, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    auto ret69 = OH_ArkUI_RenderNodeUtils_DisposeNode(rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode037 ret69=%{public}d", ret69);
    ASSERT_EQ(ret69, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    ArkUI_NodeHandle node;
    auto ret70 = OH_ArkUI_RenderNodeUtils_Invalidate(node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode037 ret70=%{public}d", ret70);
    ASSERT_EQ(ret70, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    NAPI_END;
}

static napi_value RenderNodeErrorCode038(napi_env env, napi_callback_info info)
{
    ArkUI_ColorAnimatablePropertyHandle colorAnimatable;
    uint32_t value1 = 0;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(colorAnimatable, &value1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode038 ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode039(napi_env env, napi_callback_info info)
{
    ArkUI_ColorAnimatablePropertyHandle colorAnimatable;
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(colorAnimatable, 0xFF00FF00);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode039 ret3=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    NAPI_END;
}
    
static napi_value RenderNodeErrorCode040(napi_env env, napi_callback_info info)
{
    float x = 0.0f;
    float y = 0.0f;
    ArkUI_Vector2AnimatablePropertyHandle vector2Animatable;
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(vector2Animatable, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode040 ret4=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode041(napi_env env, napi_callback_info info)
{
    ArkUI_Vector2AnimatablePropertyHandle vector2Animatable;
    auto ret5 = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(vector2Animatable, 1.5f, 1.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode041 ret5=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode042(napi_env env, napi_callback_info info)
{
    float value2 = 0.0f;
    ArkUI_FloatAnimatablePropertyHandle floatAnimatable;
    auto ret6 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(floatAnimatable, &value2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode042 ret6=%{public}d", ret6);
    ASSERT_EQ(ret6, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode043(napi_env env, napi_callback_info info)
{
    ArkUI_FloatAnimatablePropertyHandle floatAnimatable;
    auto ret7 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(floatAnimatable, 1.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode043 ret7=%{public}d", ret7);
    ASSERT_EQ(ret7, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode044(napi_env env, napi_callback_info info)
{
    uint32_t value3 = 0;
    ArkUI_ColorPropertyHandle colorProperty;
    auto ret8 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(colorProperty, &value3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode044 ret8=%{public}d", ret8);
    ASSERT_EQ(ret8, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode045(napi_env env, napi_callback_info info)
{
    uint32_t value3 = 0;
    ArkUI_ColorPropertyHandle colorProperty;
    auto ret9 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(colorProperty, 0xFF00FF00);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeErrorCode045 ret9=%{public}d", ret9);
    ASSERT_EQ(ret9, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);

    NAPI_END;
}

static napi_value RenderNodeErrorCode046(napi_env env, napi_callback_info info)
{
    float x = 0.0f;
    float y = 0.0f;
    ArkUI_Vector2PropertyHandle vector2Property;
    auto ret10 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(vector2Property, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode046 ret10=%{public}d", ret10);
    ASSERT_EQ(ret10, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode047(napi_env env, napi_callback_info info)
{
    float x = 0.0f;
    float y = 0.0f;
    ArkUI_Vector2PropertyHandle vector2Property;
    auto ret11 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(vector2Property, 1.5f, 1.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode047 ret11=%{public}d", ret11);
    ASSERT_EQ(ret11, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode048(napi_env env, napi_callback_info info)
{
    ArkUI_FloatPropertyHandle floatProperty;
    float value = 0.0f;
    auto ret12 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(floatProperty, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode048 ret12=%{public}d", ret12);
    ASSERT_EQ(ret12, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode049(napi_env env, napi_callback_info info)
{
    ArkUI_FloatPropertyHandle floatProperty;
    auto ret13 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(floatProperty, 1.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode049 ret13=%{public}d", ret13);
    ASSERT_EQ(ret13, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode050(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret14 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode050 ret14=%{public}d", ret14);
    ASSERT_EQ(ret14, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode051(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    int32_t setBoundsX = 0;
    int32_t setBoundsY = 0;
    int32_t setBoundsWidth = 0;
    int32_t setBoundsHeight = 0;
    auto ret15 = OH_ArkUI_RenderNodeUtils_GetBounds(rsNode, &setBoundsX, &setBoundsY,
        &setBoundsWidth, &setBoundsHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode051 ret15=%{public}d", ret15);
    ASSERT_EQ(ret15, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode052(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret16 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode052 ret16=%{public}d", ret16);
    ASSERT_EQ(ret16, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode053(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto ret17 = OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode053 ret17=%{public}d", ret17);
    ASSERT_EQ(ret17, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode054(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto commandPath = OH_ArkUI_RenderNodeUtils_CreateCommandPathOption();
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCommandPath(commandPath);
    auto ret18 = OH_ArkUI_RenderNodeUtils_SetClip(rsNode, rectClip);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode054 ret18=%{public}d", ret18);
    ASSERT_EQ(ret18, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}
    
static napi_value RenderNodeErrorCode055(napi_env env, napi_callback_info info)
{
    ArkUI_RenderNodeHandle rsNode;
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromOvalShape(rectShape);
    auto ret19 = OH_ArkUI_RenderNodeUtils_SetMask(rsNode, rectMask);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode055 ret19=%{public}d", ret19);
    ASSERT_EQ(ret19, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeErrorCode060(napi_env env, napi_callback_info info)
{
    ArkUI_RenderContentModifierHandle contentModifier1;
    int userData = 123;
    static bool drawCallbackCalled = false;
    auto drawCallback = [](ArkUI_DrawContext* context, void* userData) {
        drawCallbackCalled = true;
    };
    auto result = OH_ArkUI_RenderNodeUtils_SetContentModifierOnDraw(contentModifier1, &userData, drawCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode060 ret19=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value RenderNodeNullTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 rsNode=%{public}p", rsNode);
    ASSERT_OBJ_NE(rsNode, nullptr);

    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 modifier=%{public}p", modifier);
    ASSERT_OBJ_NE(modifier, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);

    ArkUI_FloatPropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(0.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 property=%{public}p", property);
    ASSERT_OBJ_NE(property, nullptr);

    ArkUI_Vector2PropertyHandle vector2Property = OH_ArkUI_RenderNodeUtils_CreateVector2Property(0.5f, 0.5f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 vector2Property=%{public}p", vector2Property);
    ASSERT_OBJ_NE(vector2Property, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeVector2Property(vector2Property);

    ArkUI_ColorPropertyHandle colorProperty = OH_ArkUI_RenderNodeUtils_CreateColorProperty(0xFF0000FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 colorProperty=%{public}p", colorProperty);
    ASSERT_OBJ_NE(colorProperty, nullptr);

    ArkUI_ColorAnimatablePropertyHandle animatable = OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(0xFF0000FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 animatable=%{public}p", animatable);
    ASSERT_OBJ_NE(animatable, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeColorAnimatableProperty(animatable);

    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest001 rectShape=%{public}p", rectShape);
    ASSERT_OBJ_NE(rectShape, nullptr);

    NAPI_END;
}

static napi_value RenderNodeNullTest002(napi_env env, napi_callback_info info)
{
    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 styleOption=%{public}p", styleOption);
    ASSERT_OBJ_NE(styleOption, nullptr);

    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 widthOption=%{public}p", widthOption);
    ASSERT_OBJ_NE(widthOption, nullptr);

    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 colorOption=%{public}p", colorOption);
    ASSERT_OBJ_NE(colorOption, nullptr);

    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 radiusOption=%{public}p", radiusOption);
    ASSERT_OBJ_NE(radiusOption, nullptr);

    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 circleShape=%{public}p", circleShape);
    ASSERT_OBJ_NE(circleShape, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeCircleShapeOption(circleShape);

    auto roundShape = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 roundShape=%{public}p", roundShape);
    ASSERT_OBJ_NE(roundShape, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeRoundRectShapeOption(roundShape);

    auto commandPath = OH_ArkUI_RenderNodeUtils_CreateCommandPathOption();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RenderNodeNullTest002 roundShape=%{public}p", commandPath);
    ASSERT_OBJ_NE(commandPath, nullptr);
    OH_ArkUI_RenderNodeUtils_DisposeCommandPathOption(commandPath);

    NAPI_END;
}

static napi_value TestRenderNode001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    auto rsNodeFirstChild = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rsNodeSecondChild = OH_ArkUI_RenderNodeUtils_CreateNode();

    // 节点结构初始化
    auto result2 = OH_ArkUI_RenderNodeUtils_AddChild(rootRenderNode, rsNodeFirstChild);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result = OH_ArkUI_RenderNodeUtils_InsertChildAfter(rootRenderNode, rsNodeSecondChild, rsNodeSecondChild);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 节点结构验证
    int count = 0;
    ArkUI_RenderNodeHandle nodeTemp;
    auto result3 = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, 1, &nodeTemp);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_GetFirstChild(rootRenderNode, &nodeTemp);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    auto result5 = OH_ArkUI_RenderNodeUtils_GetNextSibling(rsNodeFirstChild, &nodeTemp);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_NO_ERROR);
    auto result6 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rsNodeSecondChild, &nodeTemp);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderNodeHandle* nodeList;
    auto ret = OH_ArkUI_RenderNodeUtils_GetChildren(rootRenderNode, &nodeList, &count);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(count, 2); // expect 2 children

    auto result7 = OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 2); // expect 2 children
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_NO_ERROR);

    auto result8 = OH_ArkUI_RenderNodeUtils_RemoveChild(rootRenderNode, rsNodeSecondChild);
    ASSERT_EQ(result8, ARKUI_ERROR_CODE_NO_ERROR);
    auto result9 = OH_ArkUI_RenderNodeUtils_ClearChildren(rootRenderNode);
    ASSERT_EQ(result9, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 0);
    auto result12 = OH_ArkUI_RenderNodeUtils_RemoveChild(nullptr, rsNodeSecondChild);
    ASSERT_EQ(result12, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode001 result12=%{public}d", result12);
    auto result22 = OH_ArkUI_RenderNodeUtils_AddChild(nullptr, rsNodeFirstChild);
    ASSERT_EQ(result22, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode001 result22=%{public}d", result22);
    auto result21 = OH_ArkUI_RenderNodeUtils_InsertChildAfter(nullptr, rsNodeSecondChild, rsNodeSecondChild);
    ASSERT_EQ(result21, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result21=%{public}d", result21);
    NAPI_END;
}

static napi_value TestRenderNode009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rootRender = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRender);
    // 节点结构验证
    int count = 0;
    ArkUI_RenderNodeHandle nodeTemp;
    ArkUI_RenderNodeHandle* nodeList;
    auto result11 = OH_ArkUI_RenderNodeUtils_GetChildrenCount(nullptr, &count);
    ASSERT_EQ(result11, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result11=%{public}d", result11);
    auto result12 = OH_ArkUI_RenderNodeUtils_GetChildren(nullptr, &nodeList, &count);
    ASSERT_EQ(result12, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result12=%{public}d", result12);
    auto result13 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(nullptr, &nodeTemp);
    ASSERT_EQ(result13, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result13=%{public}d", result13);
    auto result14 = OH_ArkUI_RenderNodeUtils_GetNextSibling(nullptr, &nodeTemp);
    ASSERT_EQ(result14, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result14=%{public}d", result14);
    auto result15 = OH_ArkUI_RenderNodeUtils_GetFirstChild(nullptr, &nodeTemp);
    ASSERT_EQ(result15, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result15=%{public}d", result15);
    auto result16 = OH_ArkUI_RenderNodeUtils_GetChild(nullptr, 1, &nodeTemp);
    ASSERT_EQ(result16, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result16=%{public}d", result16);
    
    auto result17 = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rootRender, nullptr);
    ASSERT_EQ(result17, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result17=%{public}d", result17);
    auto result18 = OH_ArkUI_RenderNodeUtils_GetNextSibling(rootRender, nullptr);
    ASSERT_EQ(result18, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result18=%{public}d", result18);
    auto result19 = OH_ArkUI_RenderNodeUtils_GetFirstChild(rootRender, nullptr);
    ASSERT_EQ(result19, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result19=%{public}d", result19);
    auto result20 = OH_ArkUI_RenderNodeUtils_GetChild(rootRender, 1, nullptr);
    ASSERT_EQ(result20, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result20=%{public}d", result20);
    ASSERT_EQ(ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST, NUMBER_106404);

    auto result21 = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result21, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result21=%{public}d", result21);
    auto result22 = OH_ArkUI_RenderNodeUtils_ClearChildren(nullptr);
    ASSERT_EQ(result22, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result22=%{public}d", result22);
    auto result23 = OH_ArkUI_RenderNodeUtils_DisposeNode(nullptr);
    ASSERT_EQ(result23, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestRenderNode009 result23=%{public}d", result23);
    NAPI_END;
}

static napi_value TestRenderNode002(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    auto result2 = OH_ArkUI_RenderNodeUtils_AttachContentModifier(rootRenderNode, modifier);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    // 测试 float property
    ArkUI_FloatPropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(0.5f);  // set value=0.5f
    float value = 0.0f;
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    auto result5 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    auto result6 = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, property);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_NO_ERROR);

    auto result7 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(nullptr, &value);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result7=%{public}d", result7);
    auto result8 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(nullptr, 1.5f);
    ASSERT_EQ(result8, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result8=%{public}d", result8);
    auto result9 = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, nullptr);
    ASSERT_EQ(result9, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result9=%{public}d", result9);
    auto result10 = OH_ArkUI_RenderNodeUtils_AttachContentModifier(nullptr, modifier);
    ASSERT_EQ(result10, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result10=%{public}d", result10);
    
    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    auto result11 = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result11, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode002 result11=%{public}d", result11);
    NAPI_END;
}

static napi_value TestRenderNode003(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2PropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateVector2Property(0.5f, 0.5f);

    // 测试 Vector2Property
    float x = 0.0f;
    float y = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result1=%{public}d", result1);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property, 1.5f, 1.5f);  // set x, y=1.5f
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result2=%{public}d", result2);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result3=%{public}d", result3);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result4=%{public}d", result4);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(nullptr, &x, &y);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(nullptr, 1.5f, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode003 result7=%{public}d", result7);
    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2Property(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode004(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_FloatAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(0.5f);  // set value=0.5f

    // 测试 FloatAnimatableProperty
    float value = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(nullptr, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode004 result7=%{public}d", result7);
    // FloatAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode005(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorPropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorProperty(0xFF0000FF);  // set value=0xFF0000FF
    
    // 测试 ColorProperty
    uint32_t value = 0;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property, 0xFF00FF00);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(nullptr, 0xFF00FF00);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode005 result7=%{public}d", result7);
    
    // ColorProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode006(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2AnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(0.5f, 0.5f);  // set x, y=0.5f

    // 测试 Vector2AnimatableProperty
    float x = 0.0f;
    float y = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    auto result2 = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, 1.5f, 1.5f);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result5 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(nullptr, &x, &y);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(nullptr, 1.5f, 1.5f);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode006 result7=%{public}d", result7);
    
    // Vector2AnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2AnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode007(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(0xFF0000FF);  // set value=0xFF0000FF

    // 测试 ColorAnimatableProperty
    uint32_t value = 0;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property, 0xFF00FF00);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    auto result4 = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, property);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);

    auto result5 = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(nullptr, &value);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result5=%{public}d", result5);
    auto result6 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(nullptr, 0xFF00FF00);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result6=%{public}d", result6);
    auto result7 = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, nullptr);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk TestRenderNode007 result7=%{public}d", result7);
    
    // ColorAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode008(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto contentModifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    static bool drawCallbackCalled = false;
    auto drawCallback = [](ArkUI_DrawContext* context, void* userData) {
        drawCallbackCalled = true;
    };

    // 设置 ContentModifier 的 onDraw 回调
    int userData = 123;
    auto result = OH_ArkUI_RenderNodeUtils_SetContentModifierOnDraw(contentModifier, &userData, drawCallback);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 销毁 ContentModifier
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(contentModifier);
    NAPI_END;
}
} // namespace ArkUICapiTest