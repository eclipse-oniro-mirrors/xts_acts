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

#include "nativeFontNdk.h"

#define SUCCESS 0
#define FAIL (-1)
#define ARR_NUM_0 0
#define ARR_NUM_1 1
#define ARR_NUM_2 2
#define ARR_NUM_3 3
#define ARR_NUM_4 4
#define ALIGNMENT600 600
#define ALIGNMENT700 700
#define ALIGNMENT20 20
#define TEXTLINE30 30
#define TEXTLINE250 250
#define HEIGHT40 40
#define NUM_50 50
#define NUM_500 500.0
#define NUM_10 10
#define INT_NUM_2 2
#define INT_NUM_100 100
#define INT_NUM_200 200
#define INT_NUM_5 5
#define INT_NUM_400 400
#define INT_NUM_500 500
#define DOUBLE_NUM_2 2.0
#define DOUBLE_NUM_0 0.0
#define DOUBLE_NEGATIVE_NUM_1 (-1.0)
#define DOUBLE_NUM_05 0.5
#define DOUBLE_NUM_100 100.0
#define DOUBLE_NUM_800 800.0
#define DOUBLE_NUM_10 10.0
#define DOUBLE_NUM_15 15.0
#define DOUBLE_NUM_001 0.01

static OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
static OH_Drawing_TextStyle *txtStyle_ = nullptr;
static OH_Drawing_FontCollection *fontCollection_ = nullptr;
static OH_Drawing_TypographyCreate *handler_ = nullptr;
static OH_Drawing_Typography *typography_ = nullptr;
static OH_Drawing_Bitmap *cBitmap_ = nullptr;
static OH_Drawing_Canvas *canvas_ = nullptr;
static OH_Drawing_TypographyCreate *handler2_ = nullptr;
static OH_Drawing_FontCollection *fontCollection2_ = nullptr;
static OH_Drawing_TextStyle *txtStyle2_ = nullptr;
static OH_Drawing_TypographyStyle *typoStyle2_ = nullptr;
std::string g_text;

static void PrepareCreateTextLine(const std::string &text)
{
    double maxWidth = NUM_500;
    uint32_t height = HEIGHT40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    txtStyle_ = OH_Drawing_CreateTextStyle();
    fontCollection_ = OH_Drawing_CreateFontCollection();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = TEXTLINE30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {DOUBLE_NUM_10, DOUBLE_NUM_15};
    cBitmap_ = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = ALIGNMENT20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

static void TearDown()
{
    if (canvas_ != nullptr) {
        OH_Drawing_CanvasDestroy(canvas_);
        canvas_ = nullptr;
    }
    if (typography_ != nullptr) {
        OH_Drawing_DestroyTypography(typography_);
        typography_ = nullptr;
    }
    if (handler_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler_);
        handler_ = nullptr;
    }
    if (txtStyle_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle_);
        txtStyle_ = nullptr;
    }
    if (typoStyle_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle_);
        typoStyle_ = nullptr;
    }
    if (cBitmap_ != nullptr) {
        OH_Drawing_BitmapDestroy(cBitmap_);
        cBitmap_ = nullptr;
    }
    if (fontCollection_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection_);
        fontCollection_ = nullptr;
    }
}

static void PrepareTypographyCreate(const char *text)
{
    fontCollection2_ = OH_Drawing_CreateFontCollection();
    typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    handler2_ = OH_Drawing_CreateTypographyHandler(typoStyle2_, fontCollection2_);
    txtStyle2_ = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle2_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = TEXTLINE30;
    OH_Drawing_SetTextStyleFontSize(txtStyle2_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle2_, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle2_, TEXT_BASELINE_ALPHABETIC);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle2_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler2_, txtStyle2_);
    if (text != nullptr) {
        OH_Drawing_TypographyHandlerAddText(handler2_, text);
    }
}

static void TypographyTearDown()
{
    if (handler2_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler2_);
        handler2_ = nullptr;
    }
    if (txtStyle2_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle2_);
        txtStyle2_ = nullptr;
    }
    if (fontCollection2_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection2_);
        fontCollection2_ = nullptr;
    }
    if (typoStyle2_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle2_);
        typoStyle2_ = nullptr;
    }
}

napi_value OHDrawingMatchFontDescriptors001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(nullptr, nullptr);
    if (descArr == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingMatchFontDescriptors002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr != nullptr) && (num != 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontDescriptor(desc);
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    return result;
}

napi_value OHDrawingMatchFontDescriptors003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    desc->weight = -1;
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr == nullptr) && (num == 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontDescriptor(desc);
    return result;
}

napi_value OHDrawingMatchFontDescriptors004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    char *fontFamily = strdup("HarmonyOS Sans");
    desc->fontFamily = fontFamily;
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr != nullptr) && (num >= 1) && (strcmp(descArr[0].fontFamily, fontFamily) == 0)) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    free(fontFamily);
    napi_set_element(env, result, ARR_NUM_0, result1);

    fontFamily = strdup("HarmonyOS Sans Condensed");
    desc->fontFamily = fontFamily;
    descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr != nullptr) && (num == 1) && (strcmp(descArr[0].fontFamily, fontFamily) == 0)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    OH_Drawing_DestroyFontDescriptor(desc);
    napi_set_element(env, result, ARR_NUM_1, result2);
    return result;
}

napi_value OHDrawingMatchFontDescriptors005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    char *fontFamily = strdup("HarmonyOS Sans");
    desc->fontFamily = fontFamily;
    desc->weight = INT_NUM_400;
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr != nullptr) && (num >= 1) && (strcmp(descArr[0].fontFamily, fontFamily) == 0) &&
        (descArr[0].weight == INT_NUM_400)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    OH_Drawing_DestroyFontDescriptor(desc);
    return result;
}

napi_value OHDrawingGetFontDescriptorByFullName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType(0b10000);
    OH_Drawing_FontDescriptor *descriptor = OH_Drawing_GetFontDescriptorByFullName(nullptr, fontType);
    if (descriptor == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetFontDescriptorByFullName002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const uint8_t ttfFullname[] = {
        0x4F, 0x60,
        0x59, 0x7D,
        0x00, 0x6F,
        0x00, 0x70,
        0x00, 0x65,
        0x00, 0x6E,
        0x00, 0x68,
        0x00, 0x61,
        0x00, 0x72,
        0x00, 0x6D,
        0x00, 0x6F,
        0x00, 0x6E,
        0x00, 0x79
    };
    OH_Drawing_String drawingString;
    drawingString.strData = const_cast<uint8_t*>(ttfFullname);
    drawingString.strLen = sizeof(ttfFullname);
    OH_Drawing_FontDescriptor *descriptor =
        OH_Drawing_GetFontDescriptorByFullName(&drawingString, OH_Drawing_SystemFontType::ALL);
    if (descriptor == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetFontDescriptorByFullName003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_4, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;

    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::GENERIC;
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    if (fontList != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t size = OH_Drawing_GetDrawingArraySize(fontList);
    if (size != 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    for (size_t i = 0; i < size; i++) {
        const OH_Drawing_String *fontFullName = OH_Drawing_GetSystemFontFullNameByIndex(fontList, i);
        if (fontFullName != nullptr) {
            napi_create_int32(env, SUCCESS, &result3);
        } else {
            napi_create_int32(env, FAIL, &result3);
        }
        napi_set_element(env, result, ARR_NUM_2, result3);

        OH_Drawing_FontDescriptor *descriptor = OH_Drawing_GetFontDescriptorByFullName(fontFullName, fontType);
        if (descriptor != nullptr) {
            napi_create_int32(env, SUCCESS, &result4);
        } else {
            napi_create_int32(env, FAIL, &result4);
        }
        napi_set_element(env, result, ARR_NUM_3, result4);
        OH_Drawing_DestroyFontDescriptor(descriptor);
    }
    OH_Drawing_DestroySystemFontFullNames(fontList);
    return result;
}

napi_value OHDrawingGetFontDescriptorByFullName004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_4, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;

    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType(ALL | STYLISH);
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    if (fontList != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t size = OH_Drawing_GetDrawingArraySize(fontList);
    if (size != 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    for (size_t i = 0; i < size; i++) {
        const OH_Drawing_String *fontFullName = OH_Drawing_GetSystemFontFullNameByIndex(fontList, i);
        if (fontFullName != nullptr) {
            napi_create_int32(env, SUCCESS, &result3);
        } else {
            napi_create_int32(env, FAIL, &result3);
        }
        napi_set_element(env, result, ARR_NUM_2, result3);

        OH_Drawing_FontDescriptor *descriptor = OH_Drawing_GetFontDescriptorByFullName(fontFullName, fontType);
        if (descriptor != nullptr) {
            napi_create_int32(env, SUCCESS, &result4);
        } else {
            napi_create_int32(env, FAIL, &result4);
        }
        napi_set_element(env, result, ARR_NUM_3, result4);
        OH_Drawing_DestroyFontDescriptor(descriptor);
    }
    OH_Drawing_DestroySystemFontFullNames(fontList);
    return result;
}

napi_value OHDrawingGetSystemFontFullNamesByType001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType(0b10000);
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    if (fontList == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetSystemFontFullNamesByType002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_4, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;

    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::GENERIC;
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    if (fontList != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    const OH_Drawing_String *fullName = OH_Drawing_GetSystemFontFullNameByIndex(fontList, INT_NUM_500);
    if (fullName == nullptr) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    OH_Drawing_DestroySystemFontFullNames(fontList);
    napi_set_element(env, result, ARR_NUM_1, result2);

    const OH_Drawing_String *fullName1 = OH_Drawing_GetSystemFontFullNameByIndex(nullptr, 0);
    if (fullName1 == nullptr) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);

    const OH_Drawing_String *fullName2 = OH_Drawing_GetSystemFontFullNameByIndex(nullptr, INT_NUM_500);
    if (fullName2 == nullptr) {
        napi_create_int32(env, SUCCESS, &result4);
    } else {
        napi_create_int32(env, FAIL, &result4);
    }
    napi_set_element(env, result, ARR_NUM_3, result4);
    OH_Drawing_DestroySystemFontFullNames(nullptr);
    return result;
}

napi_value OHDrawingGetSystemFontFullNamesByType003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    OH_Drawing_FontCollection *fc = OH_Drawing_CreateSharedFontCollection();
    const char *fontFamily = "NotoSansCJKjp-Regular-Alphabetic";
    const char *fontPath = "/system/fonts/NotoSansCJK-Regular.ttc";
    OH_Drawing_RegisterFont(fc, fontFamily, fontPath);

    OH_Drawing_Array *ttfs = OH_Drawing_GetSystemFontFullNamesByType(CUSTOMIZED);
    size_t num = OH_Drawing_GetDrawingArraySize(ttfs);
    if (num == 1) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    for (size_t i = 0; i < num; i++) {
        const OH_Drawing_String *fullName = OH_Drawing_GetSystemFontFullNameByIndex(ttfs, i);
        OH_Drawing_FontDescriptor *fd = OH_Drawing_GetFontDescriptorByFullName(fullName, CUSTOMIZED);
        if (strcmp(fd->fullName, "Noto Sans CJK JP") == 0) {
            napi_create_int32(env, SUCCESS, &result2);
        } else {
            napi_create_int32(env, FAIL, &result2);
        }
        napi_set_element(env, result, ARR_NUM_1, result2);
    }
    OH_Drawing_ClearFontCaches(fc);
    OH_Drawing_DestroyFontCollection(fc);
    return result;
}

napi_value OHDrawingGetSystemFontFullNamesByType004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fc = OH_Drawing_CreateSharedFontCollection();
    const char *fontFamily = "xxxxxxx";
    const char *fontPath = "/system/fonts/xxxxxxx.ttf";
    OH_Drawing_RegisterFont(fc, fontFamily, fontPath);

    OH_Drawing_Array *ttfs = OH_Drawing_GetSystemFontFullNamesByType(CUSTOMIZED);
    size_t num = OH_Drawing_GetDrawingArraySize(ttfs);
    if (num == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_ClearFontCaches(fc);
    OH_Drawing_DestroyFontCollection(fc);
    return result;
}

napi_value OHDrawingGetSystemFontFullNameByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const OH_Drawing_String *fullName = OH_Drawing_GetSystemFontFullNameByIndex(nullptr, 0 | 500);
    if (fullName == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroySystemFontFullNames(nullptr);
    return result;
}

napi_value OHDrawingCreateLineTypography001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    if (lineTypography == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingCreateLineTypography002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography1 = OH_Drawing_CreateLineTypography(handler_);
    if (lineTypography1 != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography1);
    return result;
}

napi_value OHDrawingCreateLineTypography003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    PrepareTypographyCreate("OpenHarmony\n");
    OH_Drawing_LineTypography *lineTypography1 = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography1 != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);
    OH_Drawing_DestroyLineTypography(lineTypography1);
    TypographyTearDown();

    OH_Drawing_LineTypography *nullLineTypograph = OH_Drawing_CreateLineTypography(nullptr);
    if (nullLineTypograph == nullptr) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    return result;
}

napi_value OHDrawingCreateLineTypography004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareTypographyCreate(nullptr);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingLineTypographyGetLineBreak001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = 0;
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == strlen(text)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography);
    return result;
}

napi_value OHDrawingLineTypographyGetLineBreak002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    
    const char *text = "OpenHarmony\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = 0;
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == strlen(text)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyGetLineBreak003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    
    const char *text1 = "hello\n world";
    const char *text2 = "hello\n";
    PrepareTypographyCreate(text1);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = 0;
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == strlen(text2)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyGetLineBreak004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = strlen(text) - 1;
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == 1) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    maxWidth = 0;
    startIndex = 0;
    count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == 0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyGetLineBreak005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = strlen(text);
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    maxWidth = DOUBLE_NUM_001;
    startIndex = 0;
    count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == 1) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyCreateLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if (line != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography);
    OH_Drawing_DestroyTextLine(line);
    return result;
}

napi_value OHDrawingLineTypographyCreateLine002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line != nullptr) && (OH_Drawing_TextLineGetGlyphCount(line) == 12L)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyTextLine(line);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyCreateLine003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    
    const char *text = "Hello\n world!";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line != nullptr) && (OH_Drawing_TextLineGetGlyphCount(line) == 5L)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyTextLine(line);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyCreateLine004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t startIndex = strlen(text) - 1;
    size_t count = 1;
    auto line1 = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line1 != nullptr) && (OH_Drawing_TextLineGetGlyphCount(line1) == 0L)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyTextLine(line1);

    startIndex = 0;
    count = 0;
    auto line2 = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line2 != nullptr) && (OH_Drawing_TextLineGetGlyphCount(line2) == 12L)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_DestroyTextLine(line2);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyCreateLine005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t startIndex = strlen(text);
    size_t count = 1;
    auto line1 = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line1 == nullptr) && (OH_Drawing_TextLineGetGlyphCount(line1) == 0L)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_DestroyTextLine(line1);

    startIndex = 0;
    count = strlen(text) + 1;
    auto line2 = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if ((line2 == nullptr) && (OH_Drawing_TextLineGetGlyphCount(line2) == 0L)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_DestroyTextLine(line2);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingLineTypographyCreateLine006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    
    std::string text = "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 ";
    text += "Drawing \n\n   \u231A \u513B \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本";
    PrepareTypographyCreate(text.c_str());
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    if (lineTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = 0;
    int yPosition = 0;
    do {
        auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
        if (count == 0) {
            break;
        }
        OH_Drawing_TextLine *line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
        if (line != nullptr) {
            napi_create_int32(env, SUCCESS, &result2);
        } else {
            napi_create_int32(env, FAIL, &result2);
        }
        napi_set_element(env, result, ARR_NUM_1, result2);
        yPosition += TEXTLINE30;
        OH_Drawing_DestroyTextLine(line);
        startIndex += count;
    } while (true);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingFontGetBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = "   ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    if (count == strlen(space)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count - 1);
    if ((outRectarr != nullptr) &&
        (OH_Drawing_FontGetBounds(font, glyphs, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(nullptr, glyphs, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(font, nullptr, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(font, glyphs, count, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectDestroyArray(outRectarr) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingFontGetBounds002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *str = "helloworld";
    uint32_t count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    size_t size = 0;
    if ((OH_Drawing_RectGetArraySize(outRectarr, &size) == OH_DRAWING_SUCCESS) &&
        (size == count) && (OH_Drawing_FontGetBounds(font, glyphs, count, outRectarr) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    for (int i = 0; i < count; i++) {
        OH_Drawing_Rect *iter = nullptr;
        if ((OH_Drawing_RectGetArrayElement(outRectarr, i, &iter) == OH_DRAWING_SUCCESS) &&
            (iter != nullptr) && (OH_Drawing_RectGetWidth(iter) > 0) &&
            (OH_Drawing_RectGetHeight(iter) > 0)) {
            napi_create_int32(env, SUCCESS, &result2);
        } else {
            napi_create_int32(env, FAIL, &result2);
        }
        napi_set_element(env, result, ARR_NUM_1, result2);
    }

    if (OH_Drawing_RectDestroyArray(outRectarr) == OH_DRAWING_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingFontGetBounds003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = "   ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    size_t size = 0;
    if ((OH_Drawing_RectGetArraySize(outRectarr, &size) == OH_DRAWING_SUCCESS) &&
        (size == count) && (OH_Drawing_FontGetBounds(font, glyphs, count, outRectarr) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    for (int i = 0; i < count; i++) {
        OH_Drawing_Rect *iter = nullptr;
        if ((OH_Drawing_RectGetArrayElement(outRectarr, i, &iter) == OH_DRAWING_SUCCESS) &&
            (iter != nullptr) && (OH_Drawing_RectGetWidth(iter) == 0) &&
            (OH_Drawing_RectGetHeight(iter) == 0)) {
            napi_create_int32(env, SUCCESS, &result2);
        } else {
            napi_create_int32(env, FAIL, &result2);
        }
        napi_set_element(env, result, ARR_NUM_1, result2);
    }

    if (OH_Drawing_RectDestroyArray(outRectarr) == OH_DRAWING_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingRectDestroyArray001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = "   ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count - 1);
    if (OH_Drawing_RectDestroyArray(outRectarr) == OH_DRAWING_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingRectGetArraySize001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Drawing_Array *rectArray = OH_Drawing_RectCreateArray(NUM_50);
    if (rectArray != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t size = 0;
    if ((OH_Drawing_RectGetArraySize(nullptr, &size) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArraySize(rectArray, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectDestroyArray(rectArray) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    return result;
}

napi_value OHDrawingRectGetArraySize002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Drawing_Array *rectArray = OH_Drawing_RectCreateArray(NUM_10);
    if (rectArray != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    size_t size = 0;
    if ((OH_Drawing_RectGetArraySize(rectArray, &size) == OH_DRAWING_SUCCESS) && (size == NUM_10) &&
        (OH_Drawing_RectDestroyArray(rectArray) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    return result;
}

napi_value OHDrawingRectGetArrayElement001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t size = NUM_50;
    OH_Drawing_Array *rectArray = OH_Drawing_RectCreateArray(size);
    OH_Drawing_Rect *rect = nullptr;
    if ((OH_Drawing_RectGetArrayElement(rectArray, size, &rect) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArrayElement(rectArray, size - 1, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArrayElement(rectArray, size - 1, &rect) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingCreateTextTab001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (textTab != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

napi_value OHDrawingGetTextTabAlignment001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (OH_Drawing_GetTextTabAlignment(textTab) == TEXT_ALIGN_LEFT) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

napi_value OHDrawingGetTextTabLocation001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (OH_Drawing_GetTextTabLocation(textTab) == DOUBLE_NUM_0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

napi_value OHDrawingFontGetTextPath001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    const char *str = "Hello 中文";
    size_t length = std::char_traits<char>::length(str);
    float x = 12.0f;
    float y = 150.0f;
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if ((OH_Drawing_FontGetTextPath(nullptr, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, nullptr, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, str, 0, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, nullptr) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingGetDrawingArraySize001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::GENERIC;
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    size_t size = OH_Drawing_GetDrawingArraySize(fontList);
    if (size != 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroySystemFontFullNames(fontList);
    return result;
}

napi_value OHDrawingTypographyGetTextLines001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("");
    OH_Drawing_Array *textLines = textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    if (size == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTypographyGetTextLines002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n");
    OH_Drawing_Array *textLines = textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    if (size == INT_NUM_2) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingDestroyTextLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if (OH_Drawing_TextLineGetGlyphCount(line) == 12L) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLine(line);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

napi_value OHDrawingGetTextLineByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, -1 | 10);
    if (textLine == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetTextRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    size_t start = 0;
    OH_Drawing_TextLineGetTextRange(textLine, &start, nullptr);
    if (start == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetGlyphRuns001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    if (runs == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingDestroyRuns001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size - 1; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        if (runsSize == 0) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetRunByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(nullptr, 0);
    if (run == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingTextLinePaint001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_TextLine *truncatedLine =
        OH_Drawing_TextLineCreateTruncatedLine(textLine, INT_NUM_100, ELLIPSIS_MODAL_HEAD, "...");
        OH_Drawing_TextLinePaint(truncatedLine, canvas_, TEXTLINE30, TEXTLINE250);
        double count = OH_Drawing_TextLineGetGlyphCount(truncatedLine);
        if (count > 0) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
        OH_Drawing_DestroyTextLine(truncatedLine);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineCreateTruncatedLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_TextLine *truncatedLine = OH_Drawing_TextLineCreateTruncatedLine(textLine, INT_NUM_200, INT_NUM_5, "1");
    if (truncatedLine == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetTypographicBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    double ascent = DOUBLE_NUM_0;
    double descent = DOUBLE_NUM_0;
    double leading = DOUBLE_NUM_0;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        if ((ascent < 0) && (descent > 0) && (leading == 0) && (width == 0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetImageBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Rect *rect = OH_Drawing_TextLineGetImageBounds(textLine);
        if ((OH_Drawing_RectGetRight(rect) > OH_Drawing_RectGetLeft(rect)) &&
            (OH_Drawing_RectGetBottom(rect) > OH_Drawing_RectGetTop(rect)) &&
            (OH_Drawing_RectGetWidth(rect) < NUM_500) &&
            (OH_Drawing_RectGetHeight(rect) <= HEIGHT40)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetTrailingSpaceWidth001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        if (width > 1) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetStringIndexForPosition001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    if ((OH_Drawing_TextLineGetStringIndexForPosition(textLine, nullptr) == 0) &&
        (OH_Drawing_TextLineGetStringIndexForPosition(nullptr, nullptr) == 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetOffsetForStringIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        if ((OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetOffsetForStringIndex(textLine, INT_NUM_100) == DOUBLE_NUM_0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingTextLineGetAlignmentOffset001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        if ((OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_0, ALIGNMENT600) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_05, ALIGNMENT700) > DOUBLE_NUM_100) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NEGATIVE_NUM_1, ALIGNMENT700) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_2, ALIGNMENT20) == DOUBLE_NUM_0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetRunGlyphCount001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t count = OH_Drawing_GetRunGlyphCount(nullptr);
    if (count == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetRunStringRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint64_t location = 0;
    uint64_t length = 0;
    OH_Drawing_GetRunStringRange(nullptr, &location, &length);
    if ((location == 0) && (length == 0) && (OH_Drawing_GetRunStringIndices(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunGlyphs(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunPositions(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunImageBounds(nullptr) == nullptr)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetRunTypographicBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_RunPaint(nullptr, nullptr, 0, 0);
    float ascent = DOUBLE_NUM_0;
    float descent = DOUBLE_NUM_0;
    float leading = DOUBLE_NUM_0;
    float width = OH_Drawing_GetRunTypographicBounds(nullptr, &ascent, &descent, &leading);
    if ((ascent == DOUBLE_NUM_0) && (descent == DOUBLE_NUM_0) && (leading == DOUBLE_NUM_0) && (width == DOUBLE_NUM_0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHDrawingGetRunStringIndicesByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            uint64_t location = 0;
            uint64_t length = 0;
            OH_Drawing_GetRunStringRange(run, &location, &length);
            OH_Drawing_Array *stringIndicesArr = OH_Drawing_GetRunStringIndices(run, 0, count);
            size_t sizeArr = OH_Drawing_GetDrawingArraySize(stringIndicesArr);
            for (size_t stringIndex = 0; stringIndex < sizeArr; stringIndex++) {
                uint64_t indices = OH_Drawing_GetRunStringIndicesByIndex(stringIndicesArr, stringIndex);
                if (indices >= 0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunStringIndices(stringIndicesArr);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetRunImageBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            uint64_t location = 0;
            uint64_t length = 0;
            OH_Drawing_GetRunStringRange(run, &location, &length);
            OH_Drawing_Array *stringIndicesArr = OH_Drawing_GetRunStringIndices(run, 0, count);
            size_t sizeArr = OH_Drawing_GetDrawingArraySize(stringIndicesArr);
            for (size_t stringIndex = 0; stringIndex < sizeArr; stringIndex++) {
                uint64_t indices = OH_Drawing_GetRunStringIndicesByIndex(stringIndicesArr, stringIndex);
            }
            OH_Drawing_DestroyRunStringIndices(stringIndicesArr);
            OH_Drawing_Rect *bounds = OH_Drawing_GetRunImageBounds(run);
            if (bounds != nullptr) {
                napi_create_int32(env, SUCCESS, &result);
            } else {
                napi_create_int32(env, FAIL, &result);
            }
            OH_Drawing_DestroyRunImageBounds(bounds);
            OH_Drawing_RunPaint(canvas_, run, DOUBLE_NUM_0, DOUBLE_NUM_0);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetRunGlyphsByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            float ascent = DOUBLE_NUM_0;
            float descent = DOUBLE_NUM_0;
            float leading = DOUBLE_NUM_0;
            float width = OH_Drawing_GetRunTypographicBounds(run, &ascent, &descent, &leading);
            OH_Drawing_Array *glyphs = OH_Drawing_GetRunGlyphs(run, 0, count);
            size_t glyphSize = OH_Drawing_GetDrawingArraySize(glyphs);
            for (size_t glyphsIndex = 0; glyphsIndex < glyphSize; glyphsIndex++) {
                if (OH_Drawing_GetRunGlyphsByIndex(glyphs, glyphsIndex) > 0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunGlyphs(glyphs);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetRunPositions001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            OH_Drawing_Array *positions = OH_Drawing_GetRunPositions(run, 0, count);
            size_t positionSize = OH_Drawing_GetDrawingArraySize(positions);
            for (size_t posIndex = 0; posIndex < positionSize; posIndex++) {
                OH_Drawing_Point *pos = OH_Drawing_GetRunPositionsByIndex(positions, posIndex);
                float x = DOUBLE_NUM_0;
                OH_Drawing_PointGetX(pos, &x);
                if (x >= DOUBLE_NUM_0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunPositions(positions);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

napi_value OHDrawingGetFontCollectionGlobalInstance001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    if (fontCollection != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}