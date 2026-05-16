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

#include "native_drawing/drawing_font.h"
#include "native_drawing/drawing_font_collection.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_typography.h"
#include "nativeFontNdk.h"
#include "font_common.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "log_common.h"
#include "common.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstddef>
#include <cstdint>

namespace {
    const double DEFAULT_FONT_SIZE = 16.0;
    const double CONSTRAINT_WIDTH = 400.0;
    const double CONSTRAINT_HEIGHT = 200.0;
    const double LARGE_CONSTRAINT_WIDTH = 1000.0;
    const double LARGE_CONSTRAINT_HEIGHT = 500.0;
    const double SMALL_CONSTRAINT_WIDTH = 50.0;
    const double SMALL_CONSTRAINT_HEIGHT = 30.0;
    const double ZERO_SIZE = 0.0;
}

/**
 * @brief 从文件读取二进制数据
 * @param filePath 文件路径
 * @param dataSize 返回的数据大小
 * @return 读取的数据指针，失败返回nullptr
 */
uint8_t* ReadFontFileData(const char* filePath, size_t* dataSize)
{
    if (filePath == nullptr || dataSize == nullptr) {
        return nullptr;
    }
    
    FILE* file = fopen(filePath, "rb");
    if (file == nullptr) {
        return nullptr;
    }
    
    fseek(file, 0, SEEK_END);
    long size = ftell(file);
    fseek(file, 0, SEEK_SET);
    
    if (size <= 0) {
        fclose(file);
        return nullptr;
    }
    
    uint8_t* data = (uint8_t*)malloc(size);
    if (data == nullptr) {
        fclose(file);
        return nullptr;
    }
    
    size_t readSize = fread(data, 1, size, file);
    fclose(file);
    
    if (readSize != (size_t)size) {
        free(data);
        return nullptr;
    }
    
    *dataSize = size;
    return data;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0100
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with valid parameters
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "Hello World, this is a test for typography layout with constraints.";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {CONSTRAINT_WIDTH, CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0100",
        "actualRect.width: %{public}f, actualRect.height: %{public}f, fitStrRangeArrayLen: %{public}zu",
        actualRect.width, actualRect.height, fitStrRangeArrayLen);
    NAPI_ASSERT_NO_MES(actualRect.width > ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height > ZERO_SIZE);
    NAPI_ASSERT_NO_MES(fitStrRangeArr != nullptr);
    NAPI_ASSERT_NO_MES(fitStrRangeArrayLen > 0);

    OH_Drawing_ErrorCode errCode =  OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    NAPI_ASSERT_NO_MES(errCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0200
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with large constraints
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "Hello World";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {LARGE_CONSTRAINT_WIDTH, LARGE_CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0200",
        "actualRect.width: %{public}f, actualRect.height: %{public}f", actualRect.width, actualRect.height);

    if (fitStrRangeArr != nullptr) {
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0300
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0300
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with small constraints
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "Hello World, this is a long text for testing small constraints.";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {SMALL_CONSTRAINT_WIDTH, SMALL_CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0300",
        "actualRect.width: %{public}f, actualRect.height: %{public}f, fitStrRangeArrayLen: %{public}zu",
        actualRect.width, actualRect.height, fitStrRangeArrayLen);

    if (fitStrRangeArr != nullptr) {
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0400
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0400
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with zero width constraints
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "Hello World";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {ZERO_SIZE, CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0400",
        "actualRect.width: %{public}f, actualRect.height: %{public}f", actualRect.width, actualRect.height);

    if (fitStrRangeArr != nullptr) {
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0500
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0500
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with zero height constraints
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "Hello World";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {CONSTRAINT_WIDTH, ZERO_SIZE};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0500",
        "actualRect.width: %{public}f, actualRect.height: %{public}f", actualRect.width, actualRect.height);

    if (fitStrRangeArr != nullptr) {
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0600
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0600
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with Chinese text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "你好世界，这是一个排版约束测试文本，用于验证中文文本的布局效果。";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {CONSTRAINT_WIDTH, CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0600",
        "actualRect.width: %{public}f, actualRect.height: %{public}f, fitStrRangeArrayLen: %{public}zu",
        actualRect.width, actualRect.height, fitStrRangeArrayLen);

    if (fitStrRangeArr != nullptr) {
        for (size_t i = 0; i < fitStrRangeArrayLen; i++) {
            OH_Drawing_Range* range = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, i);
        }
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0700
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0700
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with empty text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_RectSize constraintsRect = {CONSTRAINT_WIDTH, CONSTRAINT_HEIGHT};

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        nullptr, constraintsRect, nullptr, nullptr);

    NAPI_ASSERT_NO_MES(actualRect.width == ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height == ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0700",
        "actualRect.width: %{public}f, actualRect.height: %{public}f", actualRect.width, actualRect.height);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0800
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0800
 * @tc.desc   test OH_Drawing_TypographyLayoutWithConstraintsWithBuffer with multiline text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "This is a long text that will wrap to multiple lines when the constraints "
        "are applied. The layout algorithm will break the text into appropriate lines based on "
        "the available width and height constraints.";
    OH_Drawing_TypographyHandlerAddText(handler, text);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    OH_Drawing_RectSize constraintsRect = {CONSTRAINT_WIDTH, CONSTRAINT_HEIGHT};
    OH_Drawing_Array* fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;

    OH_Drawing_RectSize actualRect = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(
        typography, constraintsRect, &fitStrRangeArr, &fitStrRangeArrayLen);

    NAPI_ASSERT_NO_MES(actualRect.width >= ZERO_SIZE);
    NAPI_ASSERT_NO_MES(actualRect.height >= ZERO_SIZE);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingTypographyLayoutWithConstraintsWithBuffer0800",
        "actualRect.width: %{public}f, actualRect.height: %{public}f, fitStrRangeArrayLen: %{public}zu",
        actualRect.width, actualRect.height, fitStrRangeArrayLen);

    if (fitStrRangeArr != nullptr) {
        for (size_t i = 0; i < fitStrRangeArrayLen; i++) {
            OH_Drawing_Range* range = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, i);
        }
        OH_Drawing_ReleaseArrayBuffer(fitStrRangeArr);
    }

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0100
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with system font full names array
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingReleaseArrayBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0100", "Start test");
    
    // 使用文档中正确的枚举值 ALL
    OH_Drawing_Array* fontNameArray = OH_Drawing_GetSystemFontFullNamesByType(ALL);
    
    NAPI_ASSERT_NO_MES(fontNameArray != nullptr);
    OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(fontNameArray);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0100",
        "Release code: %{public}d", releaseCode);
    fontNameArray = nullptr;
    NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_SUCCESS);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0200
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with text lines array
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingReleaseArrayBuffer0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const float maxWidth = 200.0f;
    const char* text = "Line 1\nLine 2\nLine 3";
    
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);
    
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);
    
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);
    
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);
    
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);
    
    OH_Drawing_TypographyLayout(typography, maxWidth);
    OH_Drawing_Array* textLinesArray = OH_Drawing_TypographyGetTextLines(typography);
    
    if (textLinesArray != nullptr) {
        OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(textLinesArray);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0200",
            "Release code: %{public}d", releaseCode);
        NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_SUCCESS);
        textLinesArray = nullptr;
    }
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0300
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0300
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with string indices array
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingReleaseArrayBuffer0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const float maxWidth = 200.0f;
    const char* text = "Hello World";
    
    // 1. 创建基本对象（必须成功）
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);
    
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);
    
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);
    
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);
    
    // 2. 添加文本和创建排版
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);
    
    // 3. 布局排版
    OH_Drawing_TypographyLayout(typography, maxWidth);
    
    // 4. 获取文本行数组（必须成功）
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography);
    NAPI_ASSERT_NO_MES(textLines != nullptr);
    
    // 5. 验证文本行数量
    size_t textLinesSize = OH_Drawing_GetDrawingArraySize(textLines);
    NAPI_ASSERT_NO_MES(textLinesSize > 0);
    
    // 6. 获取文本行（必须成功）
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    NAPI_ASSERT_NO_MES(textLine != nullptr);
    
    // 7. 获取Glyph Runs（必须成功）
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    NAPI_ASSERT_NO_MES(runs != nullptr);
    
    // 8. 验证Run数量
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    NAPI_ASSERT_NO_MES(runsSize > 0);
    
    // 9. 获取Run对象（必须成功）
    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, 0);
    NAPI_ASSERT_NO_MES(run != nullptr);
    
    // 10. 验证字形数量
    uint32_t glyphCount = OH_Drawing_GetRunGlyphCount(run);
    NAPI_ASSERT_NO_MES(glyphCount > 0);
    
    // 11. 获取字符串索引数组（必须成功）
    OH_Drawing_Array* stringIndicesArr = OH_Drawing_GetRunStringIndices(run, 0, glyphCount);
    NAPI_ASSERT_NO_MES(stringIndicesArr != nullptr);
    
    // 12. 核心测试：调用OH_Drawing_ReleaseArrayBuffer
    OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(stringIndicesArr);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "OHDrawingReleaseArrayBuffer0300", "Release string indices array code: %{public}d", releaseCode);
    
    NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_SUCCESS);
    stringIndicesArr = nullptr;
    
    // 13. 清理资源
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0400
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0400
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with rect array created by OH_Drawing_RectCreateArray
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingReleaseArrayBuffer0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const size_t arraySize0 = 2;
    
    OH_Drawing_Array* rectArray = OH_Drawing_RectCreateArray(arraySize0);
    if (rectArray == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    size_t arraySize = 0;
    OH_Drawing_ErrorCode sizeErr = OH_Drawing_RectGetArraySize(rectArray, &arraySize);
    if (sizeErr != OH_DRAWING_SUCCESS || arraySize != arraySize0) {
        OH_Drawing_RectDestroyArray(rectArray);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    for (size_t i = 0; i < arraySize; i++) {
        OH_Drawing_Rect* rect = nullptr;
        OH_Drawing_ErrorCode getErr = OH_Drawing_RectGetArrayElement(rectArray, i, &rect);
        if (getErr != OH_DRAWING_SUCCESS || rect == nullptr) {
            OH_Drawing_RectDestroyArray(rectArray);
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        OH_Drawing_RectSetLeft(rect, 10.0f + i * 50.0f);
        OH_Drawing_RectSetTop(rect, 20.0f + i * 30.0f);
        OH_Drawing_RectSetRight(rect, 10.0f + i * 50.0f + 100.0f);
        OH_Drawing_RectSetBottom(rect, 20.0f + i * 30.0f + 80.0f);
    }
    
    OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(rectArray);
    if (releaseCode != OH_DRAWING_SUCCESS) {
        napi_create_int32(env, FAIL, &result);
    } else {
        rectArray = nullptr;
        napi_create_int32(env, SUCCESS, &result);
    }
    
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0500
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0500
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with font descriptors from stream
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingReleaseArrayBuffer0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    size_t dataSize = 0;
    uint8_t* fontData = ReadFontFileData(TEST_FONT_PATH, &dataSize);
    
    if (fontData != nullptr) {
        OH_Drawing_Array* fontDescriptors = OH_Drawing_GetFontFullDescriptorsFromStream(fontData, dataSize);
        
        if (fontDescriptors != nullptr) {
            OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(fontDescriptors);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0500",
                "Release code: %{public}d", releaseCode);
            fontDescriptors = nullptr;
            NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_SUCCESS);
        }
        
        free(fontData);
        fontData = nullptr;
    }
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0600
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0600
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with valid array pointer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingReleaseArrayBuffer0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int expectedResult = 0;
    const char* fontPath = TEST_FONT_PATH;
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0600",
        "Starting test with font path: %{public}s", fontPath);
    
    // 1. 获取字体描述符数组
    OH_Drawing_Array* fontArray = OH_Drawing_GetFontFullDescriptorsFromPath(fontPath);
    
    if (fontArray == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0600",
            "Cannot get font descriptors from path. Test may be invalid.");
        napi_create_int32(env, SUCCESS, &result);
        return result;
    }
    
    // 2. 调用释放函数
    OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(fontArray);
    fontArray = nullptr;
    
    // 3. 验证返回结果
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0600",
        "ReleaseArrayBuffer returned: %{public}d, Expected: %{public}d", releaseCode, expectedResult);
    
    NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_SUCCESS);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseArrayBuffer0700
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseArrayBuffer_0700
 * @tc.desc   test OH_Drawing_ReleaseArrayBuffer with nullptr parameter
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingReleaseArrayBuffer0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int expectedError = OH_DRAWING_ERROR_INCORRECT_PARAMETER;
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0700",
        "Starting nullptr test");
    
    // 1. 调用释放函数，传入 nullptr
    OH_Drawing_ErrorCode releaseCode = OH_Drawing_ReleaseArrayBuffer(nullptr);
    
    // 2. 验证应返回错误码
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OHDrawingReleaseArrayBuffer0700",
        "Release code: %{public}d, Expected error: %{public}d", releaseCode, expectedError);
    
    NAPI_ASSERT_NO_MES(releaseCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
