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

#include <string>
#include <fstream>
#include <filesystem>
#include <js_native_api.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "native_drawing/drawing_bitmap.h"
#include "native_drawing/drawing_brush.h"
#include "native_drawing/drawing_canvas.h"
#include "native_drawing/drawing_color.h"
#include "native_drawing/drawing_font.h"
#include "native_drawing/drawing_font_collection.h"
#include "native_drawing/drawing_path.h"
#include "native_drawing/drawing_point.h"
#include "native_drawing/drawing_pen.h"
#include "native_drawing/drawing_rect.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_typography.h"
#include "native_drawing/drawing_text_font_descriptor.h"

#define SUCCESS 0
#define FAIL (-1)
#define ALIGNMENT600 600
#define ALIGNMENT700 700
#define ALIGNMENT20 20
#define TEXTLINE30 30
#define TEXTLINE250 250
#define HEIGHT40 40
#define NUM_50 50
#define NUM_500 500.0
#define INT_NUM_2 2
#define INT_NUM_100 100
#define INT_NUM_200 200
#define INT_NUM_5 5
#define DOUBLE_NUM_2 2.0
#define DOUBLE_NUM_0 0.0
#define DOUBLE_NEGATIVE_NUM_1 (-1.0)
#define DOUBLE_NUM_05 0.5
#define DOUBLE_NUM_100 100.0
#define DOUBLE_NUM_800 800.0

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
    double maxWidth = 500.0;
    uint32_t height = 40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    txtStyle_ = OH_Drawing_CreateTextStyle();
    fontCollection_ = OH_Drawing_CreateFontCollection();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
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
    double position[2] = {10.0, 15.0};
    cBitmap_ = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
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
    double fontSize = 30;
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

static napi_value OHDrawingGetFontDescriptorByFullName001(napi_env env, napi_callback_info info)
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

static napi_value OHDrawingGetSystemFontFullNamesByType001(napi_env env, napi_callback_info info)
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

static napi_value OHDrawingGetSystemFontFullNameByIndex001(napi_env env, napi_callback_info info)
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

static napi_value OHDrawingGetDrawingArraySize001(napi_env env, napi_callback_info info)
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

static napi_value OHDrawingGetFontCollectionGlobalInstance001(napi_env env, napi_callback_info info)
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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHDrawingGetFontDescriptorByFullName001", nullptr, OHDrawingGetFontDescriptorByFullName001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetSystemFontFullNamesByType001", nullptr, OHDrawingGetSystemFontFullNamesByType001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetSystemFontFullNameByIndex001", nullptr, OHDrawingGetSystemFontFullNameByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetDrawingArraySize001", nullptr, OHDrawingGetDrawingArraySize001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetFontCollectionGlobalInstance001", nullptr, OHDrawingGetFontCollectionGlobalInstance001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeFontNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }