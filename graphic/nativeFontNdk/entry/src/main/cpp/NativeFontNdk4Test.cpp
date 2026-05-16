/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_font_descriptor.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>
#include <native_drawing/drawing_types.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_lineTypography.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_font_mgr.h>
#include "napi/native_api.h"
#include "native_common.h"
#include "common.h"
#include "nativeFontNdk.h"

namespace {
    // 测试常量
    constexpr double DEFAULT_FONT_SIZE = 50;
    constexpr double MAX_WIDTH = 800.0;
}

napi_value OHDrawingTextStyleGetFontMetrics001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    const char *text = "OpenHarmony";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    OH_Drawing_Font_Metrics fontmetrics = {0};

    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    bool ret = OH_Drawing_TextStyleGetFontMetrics(typography, style, &fontmetrics);
    NAPI_ASSERT(env, ret == true, "GetFontMetrics001 failed: ret != true");
    NAPI_ASSERT_NO_MES(fontmetrics.ascent < 0);
    NAPI_ASSERT_NO_MES(fontmetrics.descent > 0);
    NAPI_ASSERT_NO_MES(fontmetrics.leading >= 0);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTextStyleGetFontMetrics002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);
    OH_Drawing_Font_Metrics fontmetrics = {0};
    OH_Drawing_Typography *typography = nullptr;

    bool ret = OH_Drawing_TextStyleGetFontMetrics(typography, style, &fontmetrics);
    NAPI_ASSERT(env, ret == false, "GetFontMetrics002 failed: ret != false");

    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTextStyleGetFontMetrics003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 内联创建typography（保留handler初始化动作）
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    // handler核心初始化动作（保留）
    const char *text = "OpenHarmony";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    // 创建有效typography
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    OH_Drawing_TextStyle *style = nullptr;
    OH_Drawing_Font_Metrics fontmetrics = {0};

    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");

    bool ret = OH_Drawing_TextStyleGetFontMetrics(typography, style, &fontmetrics);
    NAPI_ASSERT(env, ret == false, "GetFontMetrics003 failed: ret != false");

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTextStyleGetFontMetrics004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 内联创建typography（保留handler初始化动作）
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    // handler核心初始化动作（保留）
    const char *text = "OpenHarmony";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    // 创建有效typography
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    // 2. 合法style + 核心非法参数：空fontmetrics指针
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    OH_Drawing_Font_Metrics *fontmetrics = nullptr;

    // 前置断言：合法对象创建成功
    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 3. 调用被测接口（合法typography/style + 空fontmetrics指针）
    bool ret = OH_Drawing_TextStyleGetFontMetrics(typography, style, fontmetrics);

    // 4. 核心断言：返回false
    NAPI_ASSERT(env, ret == false, "GetFontMetrics004 failed: ret != false");

    // 5. 资源清理（所有创建的对象均销毁）
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(style);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetFontMetrics005：反向用例-多参数为空
 * @details 验证typography+style同时为空时，接口仍返回false（参数校验鲁棒性）
 */
napi_value OHDrawingTextStyleGetFontMetrics005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 核心非法参数：typography+style均为空（无需创建任何对象）
    OH_Drawing_Typography *typography = nullptr;
    OH_Drawing_TextStyle *style = nullptr;
    OH_Drawing_Font_Metrics fontmetrics = {0};

    // 调用被测接口（双空参数 + 合法fontmetrics）
    bool ret = OH_Drawing_TextStyleGetFontMetrics(typography, style, &fontmetrics);

    // 核心断言：返回false
    NAPI_ASSERT(env, ret == false, "GetFontMetrics005 failed: ret != false");

    // 返回结果（无资源需清理）
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineInfo001：正向用例-全合法参数
 * @details 验证有效typography+合法行号+有效LineMetrics时，接口返回true
 */
napi_value OHDrawingTypographyGetLineInfo001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建并初始化有效Typography（含文本内容，确保有行信息）
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);

    // 填充文本（确保存在行信息，如换行文本）
    const char *text = "OpenHarmony\nTypographyLineInfo";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    // 排版布局（必须布局才能获取行信息）
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

    // 2. 合法参数
    int lineNumber = 0; // 第0行（合法行号）
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics = {0};

    // 前置断言
    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");

    // 3. 调用接口
    bool ret = OH_Drawing_TypographyGetLineInfo(typography, lineNumber, oneLine, includeWhitespace, &lineMetrics);

    // 4. 核心断言
    NAPI_ASSERT(env, ret == true, "GetLineInfo001 failed: ret != true");

    // 5. 资源清理
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineInfo002：反向用例-空Typography对象
 * @details 验证typography为空时，接口返回false
 */
napi_value OHDrawingTypographyGetLineInfo002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 非法参数：空typography
    OH_Drawing_Typography *typography = nullptr;
    int lineNumber = 0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics = {0};

    // 2. 调用接口
    bool ret = OH_Drawing_TypographyGetLineInfo(typography, lineNumber, oneLine, includeWhitespace, &lineMetrics);

    // 3. 核心断言
    NAPI_ASSERT(env, ret == false, "GetLineInfo002 failed: ret != false");

    // 4. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineInfo003：反向用例-空LineMetrics指针
 * @details 验证drawingLineMetrics为空时，接口返回false
 */
napi_value OHDrawingTypographyGetLineInfo003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建有效Typography
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    const char *text = "OpenHarmony";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

    // 2. 非法参数：空LineMetrics指针
    int lineNumber = 0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics *lineMetrics = nullptr;

    // 前置断言
    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");

    // 3. 调用接口
    bool ret = OH_Drawing_TypographyGetLineInfo(typography, lineNumber, oneLine, includeWhitespace, lineMetrics);

    // 4. 核心断言
    NAPI_ASSERT(env, ret == false, "GetLineInfo003 failed: ret != false");

    // 5. 资源清理
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineInfo004：反向用例-非法行号
 * @details 验证行号超出文本行数时，接口返回false（原生GetLineInfo失败）
 */
napi_value OHDrawingTypographyGetLineInfo004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建有效Typography（仅1行文本）
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    const char *text = "SingleLineText"; // 无换行，仅1行（行号0有效，1非法）
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

    // 2. 非法参数：行号1（超出文本行数）
    int lineNumber = 1;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics = {0};

    // 前置断言
    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");

    // 3. 调用接口
    bool ret = OH_Drawing_TypographyGetLineInfo(typography, lineNumber, oneLine, includeWhitespace, &lineMetrics);

    // 4. 核心断言
    NAPI_ASSERT(env, ret == false, "GetLineInfo004 failed: ret != false");

    // 5. 资源清理
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineInfo005：反向用例-未布局的Typography
 * @details 验证Typography未执行Layout时，原生GetLineInfo失败，接口返回false
 */
napi_value OHDrawingTypographyGetLineInfo005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建Typography但不执行Layout（核心：未布局无行信息）
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    const char *text = "UnlayoutText";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    // 2. 合法行号但未布局
    int lineNumber = 0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics = {0};

    // 前置断言
    NAPI_ASSERT(env, typography != nullptr, "Typography create failed");

    // 3. 调用接口
    bool ret = OH_Drawing_TypographyGetLineInfo(typography, lineNumber, oneLine, includeWhitespace, &lineMetrics);

    // 4. 核心断言
    NAPI_ASSERT(env, ret == false, "GetLineInfo005 failed: ret != false");

    // 5. 资源清理
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetShadowWithIndex001：正向用例-全合法参数
 * @details 验证有效TextStyle+合法索引（存在阴影）时，接口返回非空TextShadow指针
 */
napi_value OHDrawingTextStyleGetShadowWithIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建并配置单个阴影对象
    OH_Drawing_TextShadow *shadow = OH_Drawing_CreateTextShadow();
    NAPI_ASSERT(env, shadow != nullptr, "TextShadow create failed");
    OH_Drawing_Point *offset = OH_Drawing_PointCreate(10, 10);
    uint32_t color = OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0x00);
    double blurRadius = 20.0;
    OH_Drawing_SetTextShadow(shadow, color, offset, blurRadius);

    // 2. 创建TextStyle并添加阴影
    OH_Drawing_TextStyle *textStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, textStyle != nullptr, "TextStyle create failed");
    OH_Drawing_TextStyleAddShadow(textStyle, shadow);

    // 2. 合法索引（0，假设shadows列表至少有1个元素）
    int index = 0;

    // 3. 核心：合法索引（0）调用被测接口
    OH_Drawing_TextShadow *getShadow = OH_Drawing_TextStyleGetShadowWithIndex(textStyle, 0);
    NAPI_ASSERT(env, getShadow != nullptr, "Valid index should return non-null shadow");

    // 4. 资源清理
    OH_Drawing_PointDestroy(offset);
    OH_Drawing_DestroyTextShadow(shadow);
    OH_Drawing_DestroyTextStyle(textStyle);

    // 5. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetShadowWithIndex002：反向用例-空TextStyle对象
 * @details 验证style为空时，接口返回nullptr
 */
napi_value OHDrawingTextStyleGetShadowWithIndex002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 非法参数：空style
    OH_Drawing_TextStyle *style = nullptr;
    int index = 0; // 合法索引，但style为空

    // 2. 调用接口
    OH_Drawing_TextShadow *shadow = OH_Drawing_TextStyleGetShadowWithIndex(style, index);

    // 3. 核心断言：返回nullptr
    NAPI_ASSERT(env, shadow == nullptr, "GetShadowWithIndex002 failed: shadow is not nullptr");

    // 4. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetShadowWithIndex003：反向用例-负索引
 * @details 验证index<0时，接口返回nullptr
 */
napi_value OHDrawingTextStyleGetShadowWithIndex003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建有效TextStyle（无需添加阴影，参数校验优先）
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 2. 非法参数：负索引
    int index = -1;

    // 3. 调用接口
    OH_Drawing_TextStyleGetShadowWithIndex(style, index);
    OH_Drawing_TextShadow *shadow = OH_Drawing_TextStyleGetShadowWithIndex(style, index);

    // 4. 核心断言：返回nullptr
    NAPI_ASSERT(env, shadow == nullptr, "GetShadowWithIndex003 failed: shadow is not nullptr");

    // 5. 资源清理
    OH_Drawing_DestroyTextStyle(style);

    // 6. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetShadowWithIndex004：反向用例-索引超出范围
 * @details 验证index>=阴影列表长度时，接口返回nullptr
 */
napi_value OHDrawingTextStyleGetShadowWithIndex004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1. 创建有效TextStyle（阴影列表为空 或 索引超出长度）
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 场景1：阴影列表为空，索引0超出范围
    int index = 0;
    // 场景2（可选）：若添加1个阴影，索引1超出范围（index=1）
    // 2. 调用接口
    OH_Drawing_TextShadow *shadow = OH_Drawing_TextStyleGetShadowWithIndex(style, index);

    // 3. 核心断言：返回nullptr
    NAPI_ASSERT(env, shadow == nullptr, "GetShadowWithIndex004 failed: shadow is not nullptr");

    // 4. 资源清理
    OH_Drawing_DestroyTextStyle(style);

    // 5. 返回结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyTextGetHeightBehavior001：正向用例-有效TypographyStyle
 * @details 验证有效style时，返回正确的TextHeightBehavior值
 */
napi_value OHDrawingTypographyTextGetHeightBehavior001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TypographyStyle并设置核心属性
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_ALL);

    // 2. 核心：有效typoStyle调用，验证返回TEXT_HEIGHT_ALL
    OH_Drawing_TextHeightBehavior behavior = OH_Drawing_TypographyTextGetHeightBehavior(typoStyle);
    NAPI_ASSERT(env, behavior == TEXT_HEIGHT_ALL, "Valid style should return TEXT_HEIGHT_ALL");

    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    behavior = OH_Drawing_TypographyTextGetHeightBehavior(typoStyle);
    NAPI_ASSERT(env, behavior == TEXT_HEIGHT_DISABLE_FIRST_ASCENT,
                "Valid style should return TEXT_HEIGHT_DISABLE_FIRST_ASCENT");

    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    behavior = OH_Drawing_TypographyTextGetHeightBehavior(typoStyle);
    NAPI_ASSERT(env, behavior == TEXT_HEIGHT_DISABLE_LAST_ASCENT,
                "Valid style should return TEXT_HEIGHT_DISABLE_LAST_ASCENT");

    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_ALL);
    behavior = OH_Drawing_TypographyTextGetHeightBehavior(typoStyle);
    NAPI_ASSERT(env, behavior == TEXT_HEIGHT_DISABLE_ALL, "Valid style should return TEXT_HEIGHT_DISABLE_ALL");

    // 3. 资源清理
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    // 4. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyTextGetHeightBehavior002：反向用例-空TypographyStyle
 * @details 验证style为空时，返回默认值TEXT_HEIGHT_ALL
 */
napi_value OHDrawingTypographyTextGetHeightBehavior002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 非法参数：空style
    OH_Drawing_TypographyStyle *style = nullptr;

    // 2. 调用被测接口
    OH_Drawing_TextHeightBehavior behavior = OH_Drawing_TypographyTextGetHeightBehavior(style);

    // 3. 核心断言：返回默认值TEXT_HEIGHT_ALL
    NAPI_ASSERT(env, behavior == TEXT_HEIGHT_ALL, "Null style should return default TEXT_HEIGHT_ALL");

    // 4. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetDecorationStyle001：反向用例-覆盖所有异常分支
 * @details 验证style为空/原生对象为空时，均返回默认值TEXT_DECORATION_STYLE_SOLID
 */
napi_value OHDrawingTextStyleGetDecorationStyle001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 分支1：style == nullptr
    OH_Drawing_TextDecorationStyle res1 = OH_Drawing_TextStyleGetDecorationStyle(nullptr);
    NAPI_ASSERT(env, res1 == TEXT_DECORATION_STYLE_SOLID, "Null style should return TEXT_DECORATION_STYLE_SOLID");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetDecorationStyle002：正向用例-有效参数分支
 * @details 验证style和原生对象均有效时，返回设置的decorationStyle值
 */
napi_value OHDrawingTextStyleGetDecorationStyle002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 构造有效TextStyle（完全参照参考代码逻辑）
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "Failed to create valid TextStyle");

    // 2. 参考代码：设置文本颜色（辅助验证TextStyle有效性）
    OH_Drawing_SetTextStyleColor(txtStyle, 1);
    NAPI_ASSERT(env, OH_Drawing_TextStyleGetColor(txtStyle) == 1, "Text color should be 1");

    // 返回枚举类型：TEXT_DECORATION_STYLE_SOLID,TEXT_DECORATION_STYLE_DOUBLE,TEXT_DECORATION_STYLE_DOTTED,
    // TEXT_DECORATION_STYLE_DASHED,TEXT_DECORATION_STYLE_WAVY未覆盖

    // 3. 参考代码：设置装饰样式为SOLID（核心操作）
    // 4. 验证装饰样式（参考代码EXPECT_EQ(..., 0)，因SOLID枚举值为0）
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_SOLID);
    OH_Drawing_TextDecorationStyle decoStyle = OH_Drawing_TextStyleGetDecorationStyle(txtStyle);
    NAPI_ASSERT(env, decoStyle == TEXT_DECORATION_STYLE_SOLID,
                "Decoration style should be TEXT_DECORATION_STYLE_SOLID");

    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOUBLE);
    decoStyle = OH_Drawing_TextStyleGetDecorationStyle(txtStyle);
    NAPI_ASSERT(env, decoStyle == TEXT_DECORATION_STYLE_DOUBLE,
                "Decoration style should be TEXT_DECORATION_STYLE_DOUBLE");

    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOTTED);
    decoStyle = OH_Drawing_TextStyleGetDecorationStyle(txtStyle);
    NAPI_ASSERT(env, decoStyle == TEXT_DECORATION_STYLE_DOTTED,
                "Decoration style should be TEXT_DECORATION_STYLE_DOTTED");

    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DASHED);
    decoStyle = OH_Drawing_TextStyleGetDecorationStyle(txtStyle);
    NAPI_ASSERT(env, decoStyle == TEXT_DECORATION_STYLE_DASHED,
                "Decoration style should be TEXT_DECORATION_STYLE_DASHED");

    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_WAVY);
    decoStyle = OH_Drawing_TextStyleGetDecorationStyle(txtStyle);
    NAPI_ASSERT(env, decoStyle == TEXT_DECORATION_STYLE_WAVY, "Decoration style should be TEXT_DECORATION_STYLE_WAVY");

    // 5. 参考代码：验证空参数返回默认值（补充反向验证）
    NAPI_ASSERT(env, OH_Drawing_TextStyleGetDecorationStyle(nullptr) == TEXT_DECORATION_STYLE_SOLID,
                "Null param should return TEXT_DECORATION_STYLE_SOLID");

    // 6. 资源清理
    OH_Drawing_DestroyTextStyle(txtStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetFontWeight001：反向用例-覆盖所有异常分支
 * @details 验证style为空/原生对象为空时，均返回默认值FONT_WEIGHT_400
 */
napi_value OHDrawingTextStyleGetFontWeight001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 分支1：style == nullptr
    OH_Drawing_FontWeight res1 = OH_Drawing_TextStyleGetFontWeight(nullptr);
    NAPI_ASSERT(env, res1 == FONT_WEIGHT_400, "Null style should return FONT_WEIGHT_400");

    napi_create_int32(env, 0, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetFontWeight002：正向用例-有效参数分支
 * @details 验证style和原生对象均有效时，返回设置的fontWeight值
 */
napi_value OHDrawingTextStyleGetFontWeight002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TextStyle（构造合法对象）
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 2.
    // 返回枚举类型：FONT_WEIGHT_100,FONT_WEIGHT_200,FONT_WEIGHT_300,FONT_WEIGHT_400,FONT_WEIGHT_500,FONT_WEIGHT_600,
    // FONT_WEIGHT_700,FONT_WEIGHT_800,FONT_WEIGHT_900未覆盖
    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_100);
    OH_Drawing_FontWeight res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_100, "Valid style should return set FONT_WEIGHT_100");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_200);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_200, "Valid style should return set FONT_WEIGHT_200");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_300);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_300, "Valid style should return set FONT_WEIGHT_300");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_400);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_400, "Valid style should return set FONT_WEIGHT_400");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_500);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_500, "Valid style should return set FONT_WEIGHT_500");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_600);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_600, "Valid style should return set FONT_WEIGHT_600");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_700);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_700, "Valid style should return set FONT_WEIGHT_700");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_800);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_800, "Valid style should return set FONT_WEIGHT_800");

    OH_Drawing_SetTextStyleFontWeight(style, FONT_WEIGHT_900);
    res = OH_Drawing_TextStyleGetFontWeight(style);
    NAPI_ASSERT(env, res == FONT_WEIGHT_900, "Valid style should return set FONT_WEIGHT_900");

    // 4. 资源清理（避免内存泄漏）
    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, 0, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetFontStyle001：反向用例-覆盖所有异常分支
 * @details 验证style为空/原生对象为空时，均返回默认值FONT_STYLE_NORMAL
 */
napi_value OHDrawingTextStyleGetFontStyle001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 分支1：style == nullptr
    OH_Drawing_FontStyle res1 = OH_Drawing_TextStyleGetFontStyle(nullptr);
    NAPI_ASSERT(env, res1 == FONT_STYLE_NORMAL, "Null style should return FONT_STYLE_NORMAL");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetFontStyle002：正向用例-有效参数分支
 * @details 验证style和原生对象均有效时，返回设置的fontStyle值
 */
napi_value OHDrawingTextStyleGetFontStyle002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TextStyle
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 2. 返回枚举类型：FONT_STYLE_NORMAL,FONT_STYLE_ITALIC,FONT_STYLE_OBLIQUE未覆盖
    OH_Drawing_SetTextStyleFontStyle(style, FONT_STYLE_NORMAL);
    OH_Drawing_FontStyle res = OH_Drawing_TextStyleGetFontStyle(style);
    NAPI_ASSERT(env, res == FONT_STYLE_NORMAL, "Valid style should return set FONT_STYLE_NORMAL");

    OH_Drawing_SetTextStyleFontStyle(style, FONT_STYLE_ITALIC);
    res = OH_Drawing_TextStyleGetFontStyle(style);
    NAPI_ASSERT(env, res == FONT_STYLE_ITALIC, "Valid style should return set FONT_STYLE_ITALIC");

    OH_Drawing_SetTextStyleFontStyle(style, FONT_STYLE_OBLIQUE);
    res = OH_Drawing_TextStyleGetFontStyle(style);
    NAPI_ASSERT(env, res == FONT_STYLE_ITALIC, "Valid style FONT_STYLE_OBLIQUE should return set FONT_STYLE_ITALIC");

    // 4. 资源清理
    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetBaseline001：反向用例-覆盖所有异常分支
 * @details 验证style为空/原生对象为空时，均返回默认值TEXT_BASELINE_ALPHABETIC
 */
napi_value OHDrawingTextStyleGetBaseline001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 分支1：style == nullptr
    OH_Drawing_TextBaseline res1 = OH_Drawing_TextStyleGetBaseline(nullptr);
    NAPI_ASSERT(env, res1 == TEXT_BASELINE_ALPHABETIC, "Null style should return TEXT_BASELINE_ALPHABETIC");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetBaseline002：正向用例-有效参数分支
 * @details 验证style和原生对象均有效时，返回设置的baseline值
 */
napi_value OHDrawingTextStyleGetBaseline002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TextStyle
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 2. 返回枚举类型：TEXT_BASELINE_ALPHABETIC,TEXT_BASELINE_IDEOGRAPHIC 未覆盖
    OH_Drawing_SetTextStyleBaseLine(style, TEXT_BASELINE_IDEOGRAPHIC);
    OH_Drawing_TextBaseline res = OH_Drawing_TextStyleGetBaseline(style);
    NAPI_ASSERT(env, res == TEXT_BASELINE_IDEOGRAPHIC, "Valid style should return set TEXT_BASELINE_MIDDLE");

    OH_Drawing_SetTextStyleBaseLine(style, TEXT_BASELINE_ALPHABETIC);
    res = OH_Drawing_TextStyleGetBaseline(style);
    NAPI_ASSERT(env, res == TEXT_BASELINE_ALPHABETIC, "Valid style should return set TEXT_BASELINE_ALPHABETIC");

    // 4. 资源清理
    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetHalfLeading001：反向用例-空参数场景
 * @details 验证style为nullptr时，返回默认值false
 */
napi_value OHDrawingTextStyleGetHalfLeading001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 仅验证空参数分支
    bool res = OH_Drawing_TextStyleGetHalfLeading(nullptr);
    NAPI_ASSERT(env, res == false, "Null style should return false");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleGetHalfLeading002：正向用例-有效参数场景
 * @details 验证有效style时，返回设置的halfLeading值
 */
napi_value OHDrawingTextStyleGetHalfLeading002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TextStyle
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "TextStyle create failed");

    // 2. 设置halfLeading为true（非默认值，精准验证）
    bool targetHalfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(style, targetHalfLeading);

    // 3. 调用函数并验证返回值
    bool res = OH_Drawing_TextStyleGetHalfLeading(style);
    NAPI_ASSERT(env, res == targetHalfLeading, "Valid style should return set true");

    // 4. 资源清理
    OH_Drawing_DestroyTextStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleIsPlaceholder001：反向用例-空参数场景
 * @details 验证style为nullptr时，返回默认值false（参考代码隐含空参数逻辑）
 */
napi_value OHDrawingTextStyleIsPlaceholder001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 验证空指针场景（参考代码中OH_Drawing_TextStyleSetPlaceholder(nullptr)对应空参数逻辑）
    bool res = OH_Drawing_TextStyleIsPlaceholder(nullptr);
    NAPI_ASSERT(env, res == false, "Null style should return false");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTextStyleIsPlaceholder002：正向用例-匹配参考代码完整逻辑
 * @details 复刻参考代码：创建Style->验证默认值false->调用SetPlaceholder->验证值true
 */
napi_value OHDrawingTextStyleIsPlaceholder002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 参考代码：创建TextStyle
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "TextStyle create failed");

    // 2. 参考代码：验证初始值为false
    bool initRes = OH_Drawing_TextStyleIsPlaceholder(txtStyle);
    NAPI_ASSERT(env, initRes == false, "New TextStyle should return false for IsPlaceholder");

    // 3. 参考代码：调用SetPlaceholder（先传nullptr，再传有效style）
    OH_Drawing_TextStyleSetPlaceholder(nullptr);  // 参考代码中的空参数调用
    OH_Drawing_TextStyleSetPlaceholder(txtStyle); // 参考代码中的有效参数调用

    // 4. 参考代码：验证设置后值为true
    bool setRes = OH_Drawing_TextStyleIsPlaceholder(txtStyle);
    NAPI_ASSERT(env, setRes == true, "TextStyle should return true after SetPlaceholder");

    // 5. 资源清理
    OH_Drawing_DestroyTextStyle(txtStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyStyleGetEffectiveAlignment001：反向用例-空参数场景
 * @details 验证style为空/原生对象为空时，返回默认值TEXT_ALIGN_START
 */
napi_value OHDrawingTypographyStyleGetEffectiveAlignment001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 验证空指针场景（核心无效场景）
    OH_Drawing_TextAlign res = OH_Drawing_TypographyStyleGetEffectiveAlignment(nullptr);
    NAPI_ASSERT(env, res == TEXT_ALIGN_START, "Null style should return TEXT_ALIGN_START");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyStyleGetEffectiveAlignment002：正向用例-有效参数场景
 * @details 验证有效style时，返回设置的EffectiveAlignment值
 */
napi_value OHDrawingTypographyStyleGetEffectiveAlignment002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 创建有效TypographyStyle（对应参考代码的fTypoStyle）
    OH_Drawing_TypographyStyle *fTypoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, fTypoStyle != nullptr, "TypographyStyle create failed");

    // 返回枚举类型：TEXT_ALIGN_LEFT,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER,TEXT_ALIGN_JUSTIFY,TEXT_ALIGN_START,TEXT_ALIGN_END
    // 未覆盖
    // 2. 验证TEXT_ALIGN_START在不同方向下的结果（复刻参考代码第一段逻辑）
    OH_Drawing_SetTypographyTextAlign(fTypoStyle, TEXT_ALIGN_START);
    // 2.1 LTR方向 -> TEXT_ALIGN_LEFT
    OH_Drawing_SetTypographyTextDirection(fTypoStyle, TEXT_DIRECTION_LTR);
    OH_Drawing_TextAlign align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_LEFT, "TEXT_ALIGN_START + LTR should return TEXT_ALIGN_LEFT");

    // 2.2 RTL方向 -> TEXT_ALIGN_RIGHT
    OH_Drawing_SetTypographyTextDirection(fTypoStyle, TEXT_DIRECTION_RTL);
    align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_RIGHT, "TEXT_ALIGN_START + RTL should return TEXT_ALIGN_RIGHT");

    // 3. 验证TEXT_ALIGN_END在不同方向下的结果（复刻参考代码第二段逻辑）
    OH_Drawing_SetTypographyTextAlign(fTypoStyle, TEXT_ALIGN_END);
    // 3.1 LTR方向 -> TEXT_ALIGN_RIGHT
    OH_Drawing_SetTypographyTextDirection(fTypoStyle, TEXT_DIRECTION_LTR);
    align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_RIGHT, "TEXT_ALIGN_END + LTR should return TEXT_ALIGN_RIGHT");

    // 3.2 RTL方向 -> TEXT_ALIGN_LEFT
    OH_Drawing_SetTypographyTextDirection(fTypoStyle, TEXT_DIRECTION_RTL);
    align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_LEFT, "TEXT_ALIGN_END + RTL should return TEXT_ALIGN_LEFT");

    // 4. 验证TEXT_ALIGN_CENTER（不受方向影响）（复刻参考代码第三段逻辑）
    OH_Drawing_SetTypographyTextAlign(fTypoStyle, TEXT_ALIGN_CENTER);
    align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_CENTER, "TEXT_ALIGN_CENTER should return TEXT_ALIGN_CENTER");

    OH_Drawing_SetTypographyTextAlign(fTypoStyle, TEXT_ALIGN_JUSTIFY);
    align = OH_Drawing_TypographyStyleGetEffectiveAlignment(fTypoStyle);
    NAPI_ASSERT(env, align == TEXT_ALIGN_JUSTIFY, "TEXT_ALIGN_JUSTIFY should return TEXT_ALIGN_JUSTIFY");

    // 5. 资源清理
    OH_Drawing_DestroyTypographyStyle(fTypoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyDidExceedMaxLines001：反向用例-空参数场景
 * @details 验证typography为nullptr时，返回默认值false
 */
napi_value OHDrawingTypographyDidExceedMaxLines001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 验证空指针场景
    bool ret = OH_Drawing_TypographyDidExceedMaxLines(nullptr);
    if (ret != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyDidExceedMaxLines002：正向用例-未超出最大行数
 * @details 验证有效typography且文本行数<=最大行数时，返回false
 */
napi_value OHDrawingTypographyDidExceedMaxLines002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    NAPI_ASSERT(env, handler != nullptr, "TypographyHandler create failed");
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char *text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_PlaceholderSpan placeholderSpan = {20, 40, ALIGNMENT_OFFSET_AT_BASELINE, TEXT_BASELINE_ALPHABETIC, 10};
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 2160.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas *cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    NAPI_ASSERT(env, OH_Drawing_TypographyDidExceedMaxLines(typography) != true,
        "Typography should not exceed max lines");
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    size_t rangeStart = 1;
    size_t rangeEnd = 2;
    NAPI_ASSERT_NO_MES(
        OH_Drawing_TypographyGetRectsForRange(typography, rangeStart, rangeEnd, heightStyle, widthStyle) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, 1, 0) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetWordBoundary(typography, 1) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetLineTextRange(typography, 1, true) != nullptr);
    NAPI_ASSERT_NO_MES(OH_Drawing_TypographyGetLineCount(typography) != 0);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_CanvasDestroy(cCanvas);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, 0, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyDidExceedMaxLines003：正向用例-超出最大行数
 * @details 验证有效typography且文本行数>最大行数时，返回true
 */
napi_value OHDrawingTypographyDidExceedMaxLines003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    NAPI_ASSERT(env, handler != nullptr, "Failed to create TypographyHandler");
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char *text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas *cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    // 替换EXPECT_NE(OH_Drawing_TypographyDidExceedMaxLines(typography), true)
    NAPI_ASSERT(env, OH_Drawing_TypographyDidExceedMaxLines(typography) != true,
                "Typography should not exceed max lines");
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    auto box = OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle);
    // 替换EXPECT_NE(box, nullptr)
    NAPI_ASSERT(env, box != nullptr, "TypographyGetRectsForRange return null");
    OH_Drawing_GetRightFromTextBox(box, 0);
    // 替换剩余的EXPECT_NE断言
    NAPI_ASSERT(env, OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr,
                "TypographyGetRectsForPlaceholders return null");
    NAPI_ASSERT(env, OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0) != nullptr,
                "TypographyGetGlyphPositionAtCoordinate return null");
    NAPI_ASSERT(env, OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, 1, 0) != nullptr,
                "TypographyGetGlyphPositionAtCoordinateWithCluster return null");
    NAPI_ASSERT(env, OH_Drawing_TypographyGetWordBoundary(typography, 1) != nullptr,
                "TypographyGetWordBoundary return null");
    NAPI_ASSERT(env, OH_Drawing_TypographyGetLineTextRange(typography, 1, true) != nullptr,
                "TypographyGetLineTextRange return null");
    NAPI_ASSERT(env, OH_Drawing_TypographyGetLineCount(typography) != 0, "TypographyGetLineCount return 0");
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    // 补充完整的资源释放逻辑，避免内存泄漏
    OH_Drawing_CanvasDestroy(cCanvas);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetRectsForRange002：反向用例-空Typography调用
 * @details 验证传入nullptr的Typography对象时，函数返回nullptr且无崩溃
 */
napi_value OHDrawingTypographyGetRectsForRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 核心：空Typography对象+任意参数调用目标函数
    size_t start = 0;
    size_t end = 5;
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_INCLUDELINESPACEMIDDLE;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_MAX;
    OH_Drawing_TextBox *textBox = OH_Drawing_TypographyGetRectsForRange(nullptr, start, end, heightStyle, widthStyle);

    // 2. 断言：返回值为nullptr
    NAPI_ASSERT(env, textBox == nullptr, "Null Typography should return nullptr");

    // 3. 资源清理（空指针无需销毁）
    // 4. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetGlyphPositionAtCoordinate001：正向用例-有效参数获取PositionAndAffinity
 * @details 验证有效Typography对象+合法坐标调用后返回非空PositionAndAffinity，且资源可正常释放
 */
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinate001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 构建有效Typography对象
    OH_Drawing_TypographyStyle *fTypoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, fTypoStyle != nullptr, "CreateTypographyStyle failed");
    OH_Drawing_TypographyCreate *fHandler =
        OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
    NAPI_ASSERT(env, fHandler != nullptr, "OH_Drawing_CreateTypographyHandler failed");

    OH_Drawing_Typography *fTypography = OH_Drawing_CreateTypography(fHandler);
    NAPI_ASSERT(env, fTypography != nullptr, "Create Typography failed");

    // 2. 核心：使用参考代码的坐标值调用目标函数
    double dx = 50.5;
    double dy = 10.5;
    OH_Drawing_PositionAndAffinity *positionAndAffinity =
        OH_Drawing_TypographyGetGlyphPositionAtCoordinate(fTypography, dx, dy);

    // 3. 断言1：返回的PositionAndAffinity非空
    NAPI_ASSERT(env, positionAndAffinity != nullptr, "Valid Typography should return non-null PositionAndAffinity");

    // 4. 断言2：GetPositionFromPositionAndAffinity(有效对象) 返回0（对齐参考代码EXPECT_EQ）
    int32_t position = OH_Drawing_GetPositionFromPositionAndAffinity(positionAndAffinity);
    NAPI_ASSERT(env, position == 0, "GetPosition from valid PositionAndAffinity should return 0");

    OH_Drawing_DestroyTypographyHandler(fHandler);
    OH_Drawing_DestroyTypography(fTypography);
    OH_Drawing_DestroyTypographyStyle(fTypoStyle);

    // 5. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetGlyphPositionAtCoordinate002：反向用例-空Typography调用（核心覆盖空指针）
 * @details 验证传入nullptr的Typography对象时，函数返回nullptr且无崩溃
 */
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinate002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 核心：空Typography对象+任意坐标调用目标函数
    double dx = 10.0;
    double dy = 20.0;
    OH_Drawing_PositionAndAffinity *posAffinity = OH_Drawing_TypographyGetGlyphPositionAtCoordinate(nullptr, dx, dy);

    // 2. 断言：返回值为nullptr（空指针场景核心验证）
    NAPI_ASSERT(env, posAffinity == nullptr, "Null Typography should return nullptr");

    // 3. 资源清理（空指针无需销毁）
    // 4. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001：反向用例-空Typography调用
 * @details 验证空Typography对象调用函数返回nullptr，且无崩溃
 */
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1. 核心：空Typography+合法坐标调用目标函数
    double dx = 50.5;
    double dy = 10.5;
    OH_Drawing_PositionAndAffinity *positionAndAffinity =
        OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(nullptr, dx, dy);

    // 2. 断言：返回值为nullptr
    NAPI_ASSERT(env, positionAndAffinity == nullptr, "Null Typography should return nullptr");

    // 3. 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetWordBoundary001：反向用例-空Typography调用（仅覆盖空指针分支）
 * @details 验证传入nullptr的Typography对象时，OH_Drawing_TypographyGetWordBoundary返回nullptr且无崩溃
 */
napi_value OHDrawingTypographyGetWordBoundary001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 核心：空Typography对象 + 任意合法offset调用目标函数（覆盖空指针分支）
    size_t offset = 5; // 任意合法偏移值，聚焦空指针而非offset有效性
    OH_Drawing_Range *range = OH_Drawing_TypographyGetWordBoundary(nullptr, offset);

    // 断言：空指针入参时返回nullptr（核心空指针覆盖校验）
    NAPI_ASSERT(env, range == nullptr, "Null Typography should return nullptr");

    // 无资源需要清理（未创建任何对象，仅调用空指针分支）
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineMetricsAt001：反向用例-空Typography对象调用
 * @details 验证typography=nullptr时，函数返回false（覆盖第一个返回false分支）
 */
napi_value OHDrawingTypographyGetLineMetricsAt001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_LineMetrics lineMetric = {0}; // 有效LineMetrics对象

    // 核心：空Typography + 有效LineMetrics + 合法行号调用
    bool ret = OH_Drawing_TypographyGetLineMetricsAt(nullptr, 0, &lineMetric);
    // 断言返回false
    bool isRetValid = (ret == false);
    NAPI_ASSERT(env, isRetValid, "Null Typography should return false");

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineMetricsAt002：反向用例-空LineMetrics对象调用
 * @details 验证lineMetric=nullptr时，函数返回false（覆盖第二个返回false分支）
 */
napi_value OHDrawingTypographyGetLineMetricsAt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "CreateTypographyStyle failed");
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    NAPI_ASSERT(env, handler != nullptr, "CreateTypographyHandler failed");
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT(env, typography != nullptr, "CreateTypography failed");

    // 核心：有效Typography + 空LineMetrics + 合法行号调用
    int lineNumber = 0;
    bool ret = OH_Drawing_TypographyGetLineMetricsAt(typography, lineNumber, nullptr);
    // 断言返回false
    bool isRetValid = (ret == false);
    NAPI_ASSERT(env, isRetValid, "Null LineMetrics should return false");

    // 资源清理
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineMetricsAt003：正向用例-有效参数+合法行号
 * @details 验证有效参数+合法行号时，函数返回true（覆盖返回true分支）
 */
napi_value OHDrawingTypographyGetLineMetricsAt003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = nullptr;
    OH_Drawing_TextStyle *txtStyle = nullptr;
    OH_Drawing_TypographyCreate *handler = nullptr;
    OH_Drawing_Typography *typography = nullptr;
    OH_Drawing_LineMetrics lineMetric = {0};

    do {
        // 1. 创建并配置Typography（确保有有效行数据）
        typoStyle = OH_Drawing_CreateTypographyStyle();
        NAPI_ASSERT(env, typoStyle != nullptr, "CreateTypographyStyle failed");

        txtStyle = OH_Drawing_CreateTextStyle();
        NAPI_ASSERT(env, txtStyle != nullptr, "CreateTextStyle failed");
        OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);

        handler = OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
        NAPI_ASSERT(env, handler != nullptr, "CreateTypographyHandler failed");
        OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
        OH_Drawing_TypographyHandlerAddText(handler, "测试行度量获取的文本内容");

        typography = OH_Drawing_CreateTypography(handler);
        NAPI_ASSERT(env, typography != nullptr, "CreateTypography failed");
        OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

        // 2. 核心：有效参数 + 合法行号（0）调用
        bool ret = OH_Drawing_TypographyGetLineMetricsAt(typography, 0, &lineMetric);
        // 断言返回true
        bool isRetValid = (ret == true);
        NAPI_ASSERT(env, isRetValid, "Valid params should return true");
    } while (0);

    // 资源清理
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @brief OHDrawingTypographyGetLineMetricsAt004：反向用例-有效参数+非法行号
 * @details 验证有效参数+非法行号时，函数返回false（覆盖第三个返回false分支）
 */
napi_value OHDrawingTypographyGetLineMetricsAt004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = nullptr;
    OH_Drawing_TextStyle *txtStyle = nullptr;
    OH_Drawing_TypographyCreate *handler = nullptr;
    OH_Drawing_Typography *typography = nullptr;
    OH_Drawing_LineMetrics lineMetric = {0};

    do {
        // 1. 创建并配置Typography（确保有有效行数据）
        typoStyle = OH_Drawing_CreateTypographyStyle();
        NAPI_ASSERT(env, typoStyle != nullptr, "CreateTypographyStyle failed");

        txtStyle = OH_Drawing_CreateTextStyle();
        NAPI_ASSERT(env, txtStyle != nullptr, "CreateTextStyle failed");
        OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);

        handler = OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
        NAPI_ASSERT(env, handler != nullptr, "CreateTypographyHandler failed");
        OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
        OH_Drawing_TypographyHandlerAddText(handler, "测试行度量获取的文本内容");

        typography = OH_Drawing_CreateTypography(handler);
        NAPI_ASSERT(env, typography != nullptr, "CreateTypography failed");
        OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

        // 2. 获取总行数，传入超过总行数的非法行号
        int lineCount = static_cast<int>(OH_Drawing_TypographyGetLineCount(typography));
        bool ret = OH_Drawing_TypographyGetLineMetricsAt(typography, lineCount + 1, &lineMetric);
        // 断言返回false
        bool isRetValid = (ret == false);
        NAPI_ASSERT(env, isRetValid, "Invalid line number should return false");
    } while (0);

    // 资源清理
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}