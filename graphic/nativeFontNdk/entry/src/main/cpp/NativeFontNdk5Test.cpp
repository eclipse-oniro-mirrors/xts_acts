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
#include "native_drawing/drawing_register_font.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_font_descriptor.h"
#include "native_drawing/drawing_text_typography.h"
#include "native_drawing/drawing_text_run.h"
#include "native_drawing/drawing_text_line.h"
#include "native_drawing/drawing_text_lineTypography.h"
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
    // 测试常量
    const double DEFAULT_FONT_SIZE = 50;
    const double MAX_WIDTH = 800.0;
    const int ZERO_MINUS_ONE = -1;
    const int MIN_FONT_WEIGHT = 100;
    const int MAX_FONT_WEIGHT = 1000;
    const int TEST_FONT_SIZE = 12;
    const double TEST_LINE_HEIGHT = 1.5;
    const int TEST_TEXT_ALIGN = 1;
    const int INVALID_ATTRIBUTE_ID = 9999;
    const int INVALID_VALUE = -1;
    const float TEST_WIDTH = 200.0f;
    const int TEST_MAX_LINES = 1;
    const char* NULL_FONT_FAMILY = nullptr;
    const char* NULL_FONT_PATH = nullptr;
    const uint32_t VALID_INDEX = 0;
    const uint32_t INVALID_INDEX = 9999;
    const size_t VALID_BUFFER_SIZE = 1024;
    const size_t ZERO_BUFFER_SIZE = 0;
    const size_t PARTIAL_DATA_SIZE = 100;
    const size_t MAX_REGISTRATION_COUNT = 3;
    const size_t MIN_FILE_SIZE_THRESHOLD = 100;
    const size_t LARGE_BUFFER_SIZE = 1024 * 1024; // 1MB
    constexpr uint8_t BYTE_MODULO_BASE = 256;
    // 字体路径常量
    constexpr const char* INVALID_FONT_PATH = "/invalid/path/font.ttf";
    constexpr const char* INVALID_TTC_PATH = "/invalid/path/font.ttc";
    constexpr const char* EMPTY_STRING = "";
    const char* UNSUPPORTED_FONT_PATH = "/invalid/path/font.xyz";
    const char* EMPTY_PATH = "";
    const char* NULL_PATH = nullptr;
    const char* TEST_FONT_FAMILY = "TestFontFamily";
    const char* EMPTY_FONT_FAMILY = "";
    const char* EMPTY_FONT_PATH = "";
    // 测试结果常量
    constexpr int FAILURE = -1;
    // 字符串长度限制常量
    constexpr size_t MAX_PATH_LENGTH = 1024;
    constexpr size_t MAX_NAME_LENGTH = 512;
    constexpr size_t MAX_FAMILY_NAME_LENGTH = 256;
    constexpr size_t MAX_SUBFAMILY_NAME_LENGTH = 128;
    constexpr size_t MAX_VERSION_LENGTH = 64;
    constexpr size_t MAX_MANUFACTURE_LENGTH = 256;
    constexpr size_t MAX_COPYRIGHT_LENGTH = 512;
    constexpr size_t MAX_TRADEMARK_LENGTH = 128;
    constexpr size_t MAX_LICENSE_LENGTH = 1024;
    constexpr size_t MAX_GENERAL_LENGTH = 2048;
    // 属性数量常量
    constexpr int ATTRIBUTE_COUNT_9 = 9;
    constexpr int ATTRIBUTE_COUNT_10 = 10;
    // 字符处理常量
    constexpr size_t ZERO_LENGTH = 0;
    constexpr size_t UTF16_ALIGNMENT = 2;
    constexpr size_t BYTES_PER_UTF16_CHAR = 2;
    constexpr uint16_t NULL_CHAR = 0;
    constexpr char CHAR_ZERO = '0';
    constexpr char CHAR_NINE = '9';
    constexpr char CHAR_DOT = '.';
    // Unicode相关常量
    constexpr int32_t UNICODE_MAX_VALUE = 0x10FFFF;
    constexpr int32_t UNICODE_MIN_VALUE = 0;
    constexpr uint16_t LOW_SURROGATE_START = 0xD800;
    constexpr uint16_t LOW_SURROGATE_END = 0xDBFF;
    constexpr uint16_t HIGH_SURROGATE_START = 0xDC00;
    constexpr uint16_t HIGH_SURROGATE_END = 0xDFFF;
    // 字体类型枚举
    constexpr int ALL = 1 << 0;
    constexpr int GENERIC = 1 << 1;
    constexpr int STYLISH = 1 << 2;
    constexpr int INSTALLED = 1 << 3;
    constexpr int CUSTOMIZED = 1 << 4;
    // 合理的字体数量上限
    constexpr size_t MAX_REASONABLE_FONT_COUNT = 1000;
    // 字体文件扩展名检查
    constexpr uint16_t CHAR_T = 't';
    constexpr uint16_t CHAR_O = 'o';
    constexpr uint16_t CHAR_F = 'f';
    constexpr uint16_t CHAR_C = 'c';
    // 无符号0常量
    constexpr uint32_t UINT32_ZERO = 0;
    constexpr size_t SIZE_T_ZERO = 0;
    constexpr int32_t INT32_ZERO = 0;
}

// 安全释放函数
inline void SafeFreeStringData(OH_Drawing_String* str)
{
    if (str != nullptr && str->strData != nullptr) {
        free(str->strData);
        str->strData = nullptr;
        str->strLen = 0;
    }
}

static bool ReadFontFile(uint8_t** buffer, size_t* bufferSize)
{
    FILE* fontFile = fopen(TEST_FONT_PATH, "rb");
    if (fontFile == nullptr) {
        return false;
    }
    
    bool success = false;
    
    do {
        if (fseek(fontFile, 0, SEEK_END) != 0) {
            break;
        }
        
        long fileSize = ftell(fontFile);
        if (fileSize <= 0) {
            break;
        }
        
        if (fseek(fontFile, 0, SEEK_SET) != 0) {
            break;
        }
        
        *bufferSize = static_cast<size_t>(fileSize);
        *buffer = new uint8_t[*bufferSize];
        if (*buffer == nullptr) {
            break;
        }
        
        size_t bytesRead = fread(*buffer, 1, *bufferSize, fontFile);
        if (bytesRead != *bufferSize) {
            break;
        }
        
        success = true;
    } while (false);
    
    // 总是尝试关闭文件，记录错误但不中断
    if (fontFile != nullptr) {
        int closeResult = fclose(fontFile);
        if (closeResult != 0) {
            // 可以记录日志，但不影响返回值
            DRAWING_LOGE("fclose(fontFile) result != 0");
        }
    }
    
    if (!success && *buffer != nullptr) {
        delete[] *buffer;
        *buffer = nullptr;
        *bufferSize = 0;
    }
    
    return success;
}

napi_value OHDrawingSetTextStyleAttributeInt004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TextStyle* style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode ret = OH_Drawing_SetTextStyleAttributeInt(
        style, TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, MIN_FONT_WEIGHT);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_Drawing_DestroyTextStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Text exceeds max lines (returns true)
napi_value OHDrawingTypographyDidExceedMaxLines004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Create typography style
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    // Set max lines on the style (correct usage)
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, TEST_MAX_LINES);

    // Create font collection
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    // Create typography handler (returns OH_Drawing_TypographyCreate*)
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    NAPI_ASSERT_NO_MES(handler != nullptr);

    // Create text style
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);

    // Configure text style
    double fontSize = 16.0;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    const char* fontFamilies[] = {"HarmonyOS Sans SC"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);

    // Push text style to handler
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    // Add long text that will exceed max lines
    std::string longText = "This is a very long text that will definitely exceed "
                          "the maximum line limit when rendered with narrow width. "
                          "Adding more content to ensure line breaks occur.";
    OH_Drawing_TypographyHandlerAddText(handler, longText.c_str());

    // Create typography from handler
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    NAPI_ASSERT_NO_MES(typography != nullptr);

    // Layout typography
    OH_Drawing_TypographyLayout(typography, TEST_WIDTH);

    // Verify text exceeds max lines
    bool exceeded = OH_Drawing_TypographyDidExceedMaxLines(typography);
    NAPI_ASSERT_NO_MES(exceeded == true);

    // Clean up
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler); // Destroy handler, not typography
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyStyleGetEffectiveAlignment003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Create typography style
    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_SetTypographyTextAlign(style, TEXT_ALIGN_END);

    // Get effective alignment, TEXT_ALIGN_END can't get, refer to its definition
    OH_Drawing_TextAlign alignment = OH_Drawing_TypographyStyleGetEffectiveAlignment(style);
    NAPI_ASSERT_NO_MES(alignment != TEXT_ALIGN_END);

    // Clean up
    OH_Drawing_DestroyTypographyStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeDouble005(napi_env env, napi_callback_info info)
{
    OH_Drawing_TextStyle* txtStyle = nullptr;
    double maxLineHeight = 30.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, maxLineHeight);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == 26200001);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Supported font format
napi_value OHDrawingIsFontSupportedFromPath001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with supported font path
    bool isSupported = OH_Drawing_IsFontSupportedFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(isSupported == true);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Unsupported font format
napi_value OHDrawingIsFontSupportedFromPath002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with unsupported font path
    bool isSupported = OH_Drawing_IsFontSupportedFromPath(UNSUPPORTED_FONT_PATH);
    NAPI_ASSERT_NO_MES(isSupported == false);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Empty path
napi_value OHDrawingIsFontSupportedFromPath003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with empty path
    bool isSupported = OH_Drawing_IsFontSupportedFromPath(EMPTY_PATH);
    NAPI_ASSERT_NO_MES(isSupported == false);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Null path
napi_value OHDrawingIsFontSupportedFromPath004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with null path
    bool isSupported = OH_Drawing_IsFontSupportedFromPath(NULL_PATH);
    NAPI_ASSERT_NO_MES(isSupported == false);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Valid font buffer
napi_value OHDrawingIsFontSupportedFromBuffer001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    std::vector<uint8_t> fontBuffer(VALID_BUFFER_SIZE, 0);
    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(fontBuffer.data(), fontBuffer.size());
    NAPI_ASSERT_NO_MES(isSupported == false);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Null buffer
napi_value OHDrawingIsFontSupportedFromBuffer002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with null buffer
    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(nullptr, VALID_BUFFER_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Zero length buffer
napi_value OHDrawingIsFontSupportedFromBuffer003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = new uint8_t[VALID_BUFFER_SIZE](); // 值初始化，自动清零

    // Test with zero length
    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(fontBuffer, ZERO_BUFFER_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false);

    delete[] fontBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Large buffer
napi_value OHDrawingIsFontSupportedFromBuffer004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* largeBuffer = new uint8_t[LARGE_BUFFER_SIZE](); // 值初始化，自动清零

    // Test with large buffer
    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(largeBuffer, LARGE_BUFFER_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false);

    delete[] largeBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Invalid font data
napi_value OHDrawingIsFontSupportedFromBuffer005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* invalidBuffer = new uint8_t[VALID_BUFFER_SIZE];

    // Fill with pattern using loop
    constexpr uint8_t BYTE_MODULO_BASE = 256;
    for (size_t i = 0; i < VALID_BUFFER_SIZE; i++) {
        invalidBuffer[i] = static_cast<uint8_t>(i % BYTE_MODULO_BASE);
    }

    // Test with invalid font data
    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(invalidBuffer, VALID_BUFFER_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false);

    delete[] invalidBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Real font file data
napi_value OHDrawingIsFontSupportedFromBuffer006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = nullptr;
    size_t bufferSize = 0;

    bool success = ReadFontFile(&fontBuffer, &bufferSize);
    NAPI_ASSERT_NO_MES(success);
    NAPI_ASSERT_NO_MES(fontBuffer != nullptr);
    NAPI_ASSERT_NO_MES(bufferSize > 0);

    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(fontBuffer, bufferSize);
    NAPI_ASSERT_NO_MES(isSupported == true);

    delete[] fontBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Buffer boundary conditions
napi_value OHDrawingIsFontSupportedFromBuffer007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Test with small but valid buffer
    const size_t SMALL_BUFFER_SIZE = 16;
    uint8_t* smallBuffer = new uint8_t[SMALL_BUFFER_SIZE];

    // Fill with 0xFF using循环
    for (size_t i = 0; i < SMALL_BUFFER_SIZE; i++) {
        smallBuffer[i] = 0xFF;
    }

    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(smallBuffer, SMALL_BUFFER_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false); // Too small for real font

    delete[] smallBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Partial font data
napi_value OHDrawingIsFontSupportedFromBuffer008(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const size_t PARTIAL_SIZE = 512; // Partial font data
    uint8_t* partialBuffer = new uint8_t[PARTIAL_SIZE];

    // Fill with 0xAA using循环
    for (size_t i = 0; i < PARTIAL_SIZE; i++) {
        partialBuffer[i] = 0xAA;
    }

    bool isSupported = OH_Drawing_IsFontSupportedFromBuffer(partialBuffer, PARTIAL_SIZE);
    NAPI_ASSERT_NO_MES(isSupported == false); // Partial data should not be supported

    delete[] partialBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingErrorFileNotFound001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == 26200005);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == 26200006);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == 26200007);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == 26200008);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == 26200009);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == 26200010);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == 26200011);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with valid parameters
napi_value OHDrawingRegisterFontByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        TEST_FONT_FAMILY, TEST_FONT_PATH, VALID_INDEX);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null font collection
napi_value OHDrawingRegisterFontByIndex002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(nullptr,
        TEST_FONT_FAMILY, TEST_FONT_PATH, VALID_INDEX);

    // 应该返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with empty font family name
napi_value OHDrawingRegisterFontByIndex003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        EMPTY_FONT_FAMILY, TEST_FONT_PATH, VALID_INDEX);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null font family name
napi_value OHDrawingRegisterFontByIndex004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        NULL_FONT_FAMILY, TEST_FONT_PATH, VALID_INDEX);

    // null字体名应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with empty file path
napi_value OHDrawingRegisterFontByIndex005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        TEST_FONT_FAMILY, EMPTY_FONT_PATH, VALID_INDEX);

    // 空文件路径应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null file path
napi_value OHDrawingRegisterFontByIndex006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        TEST_FONT_FAMILY, NULL_FONT_PATH, VALID_INDEX);

    // null文件路径应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with invalid file path
napi_value OHDrawingRegisterFontByIndex007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        TEST_FONT_FAMILY, INVALID_TTC_PATH, VALID_INDEX);

    // 无效文件路径应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with invalid index
napi_value OHDrawingRegisterFontByIndex008(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        TEST_FONT_FAMILY, TEST_FONT_PATH, INVALID_INDEX);

    // 无效索引应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with both empty parameters
napi_value OHDrawingRegisterFontByIndex009(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        EMPTY_FONT_FAMILY, EMPTY_FONT_PATH, VALID_INDEX);

    // 空参数应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with both null parameters
napi_value OHDrawingRegisterFontByIndex010(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontByIndex(fontCollection,
        NULL_FONT_FAMILY, NULL_FONT_PATH, VALID_INDEX);

    // null参数应该返回错误
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with valid parameters (success case)
napi_value OHDrawingRegisterFontBufferByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);
    NAPI_ASSERT_NO_MES(fontBuffer != nullptr);
    NAPI_ASSERT_NO_MES(fileSize > ZERO_BUFFER_SIZE);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        TEST_FONT_FAMILY, fontBuffer, fileSize, VALID_INDEX);

    // 成功用例：验证返回成功
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null font collection
napi_value OHDrawingRegisterFontBufferByIndex002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(nullptr,
        TEST_FONT_FAMILY, fontBuffer, fileSize, VALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with empty font family name
napi_value OHDrawingRegisterFontBufferByIndex003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        EMPTY_FONT_FAMILY, fontBuffer, fileSize, VALID_INDEX);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null font family name
napi_value OHDrawingRegisterFontBufferByIndex004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        NULL_FONT_FAMILY, fontBuffer, fileSize, VALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with null buffer
napi_value OHDrawingRegisterFontBufferByIndex005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        TEST_FONT_FAMILY, nullptr, VALID_BUFFER_SIZE, VALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with zero length buffer
napi_value OHDrawingRegisterFontBufferByIndex006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = new uint8_t[VALID_BUFFER_SIZE]();
    NAPI_ASSERT_NO_MES(fontBuffer != nullptr);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        TEST_FONT_FAMILY, fontBuffer, ZERO_BUFFER_SIZE, VALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with invalid index
napi_value OHDrawingRegisterFontBufferByIndex007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        TEST_FONT_FAMILY, fontBuffer, fileSize, INVALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with partial buffer data
napi_value OHDrawingRegisterFontBufferByIndex008(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);
    NAPI_ASSERT_NO_MES(fileSize > MIN_FILE_SIZE_THRESHOLD);

    // 只使用部分字体数据
    uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
        TEST_FONT_FAMILY, fontBuffer, PARTIAL_DATA_SIZE, VALID_INDEX);

    // 验证返回错误码
    NAPI_ASSERT_NO_MES(errorCode != OH_DRAWING_SUCCESS);

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font multiple times
napi_value OHDrawingRegisterFontBufferByIndex009(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    // 多次注册同一字体
    for (size_t i = 0; i < MAX_REGISTRATION_COUNT; i++) {
        uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
            TEST_FONT_FAMILY, fontBuffer, fileSize, VALID_INDEX);

        if (i == 0) {
            // 第一次注册应该成功
            NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
        }
    }

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: Register font with different family names
napi_value OHDrawingRegisterFontBufferByIndex010(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    NAPI_ASSERT_NO_MES(fontCollection != nullptr);

    uint8_t* fontBuffer = nullptr;
    size_t fileSize = 0;

    bool readSuccess = ReadFontFile(&fontBuffer, &fileSize);
    NAPI_ASSERT_NO_MES(readSuccess == true);

    // 使用不同的字体家族名注册同一字体数据
    const char* fontFamilies[] = {
        "CustomFont1",
        "CustomFont2",
        "CustomFont3"
    };
    const size_t FONT_FAMILY_COUNT = 3;

    for (size_t i = 0; i < FONT_FAMILY_COUNT; i++) {
        uint32_t errorCode = OH_Drawing_RegisterFontBufferByIndex(fontCollection,
            fontFamilies[i], fontBuffer, fileSize, VALID_INDEX);

        // 每个注册都应该成功
        NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    }

    delete[] fontBuffer;
    OH_Drawing_DestroyFontCollection(fontCollection);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_POSTSCRIPT_NAME - Basic test
napi_value FullDescriptorAttrSLocalPostscriptName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_POSTSCRIPT_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_POSTSCRIPT_NAME - Length validation
napi_value FullDescriptorAttrSLocalPostscriptName002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_POSTSCRIPT_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_PATH_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen % UTF16_ALIGNMENT == 0);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_FULL_NAME - Basic test
napi_value FullDescriptorAttrSLocalFullName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_FULL_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_FULL_NAME - Content validation
napi_value FullDescriptorAttrSLocalFullName002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_FULL_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_NAME_LENGTH);

    bool hasValidContent = false;
    for (uint32_t i = 0; i < resultString.strLen; i += BYTES_PER_UTF16_CHAR) {
        uint16_t ch = *(uint16_t*)(resultString.strData + i);
        if (ch != NULL_CHAR) {
            hasValidContent = true;
            break;
        }
    }
    NAPI_ASSERT_NO_MES(hasValidContent);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_FAMILY_NAME - Basic test
napi_value FullDescriptorAttrSLocalFamilyName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_FAMILY_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen % UTF16_ALIGNMENT == 0);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LOCAL_SUB_FAMILY_NAME - Basic test
napi_value FullDescriptorAttrSLocalSubFamilyName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LOCAL_SUB_FAMILY_NAME, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_SUBFAMILY_NAME_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_VERSION - Basic test
napi_value FullDescriptorAttrSVersion001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_VERSION, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_VERSION_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_VERSION - Version format validation
napi_value FullDescriptorAttrSVersion002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_VERSION, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);

    bool hasVersionChars = false;
    for (uint32_t i = 0; i < resultString.strLen; i += BYTES_PER_UTF16_CHAR) {
        uint16_t ch = *(uint16_t*)(resultString.strData + i);
        if ((ch >= CHAR_ZERO && ch <= CHAR_NINE) || ch == CHAR_DOT) {
            hasVersionChars = true;
            break;
        }
    }
    NAPI_ASSERT_NO_MES(hasVersionChars);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_MANUFACTURE - Basic test
napi_value FullDescriptorAttrSManufacture001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_MANUFACTURE, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_MANUFACTURE_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_COPYRIGHT - Basic test
napi_value FullDescriptorAttrSCopyright001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_COPYRIGHT, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData != nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen > ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(resultString.strLen < MAX_COPYRIGHT_LENGTH);

    SafeFreeStringData(&resultString);
    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_TRADEMARK - Basic test
napi_value FullDescriptorAttrSTrademark001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_TRADEMARK, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData == nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen == ZERO_LENGTH);

    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_S_LICENSE - Basic test
napi_value FullDescriptorAttrSLicense001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    OH_Drawing_String resultString = {nullptr, 0};

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeString(
        descriptor, FULL_DESCRIPTOR_ATTR_S_LICENSE, &resultString);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(resultString.strData == nullptr);
    NAPI_ASSERT_NO_MES(resultString.strLen == ZERO_LENGTH);

    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case: FULL_DESCRIPTOR_ATTR_I_INDEX - Basic test
napi_value FullDescriptorAttrIIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_Array* descriptorArray = OH_Drawing_GetFontFullDescriptorsFromPath(TEST_FONT_PATH);
    NAPI_ASSERT_NO_MES(descriptorArray != nullptr);

    const OH_Drawing_FontFullDescriptor* descriptor = OH_Drawing_GetFontFullDescriptorByIndex(descriptorArray, 0);
    NAPI_ASSERT_NO_MES(descriptor != nullptr);

    int fontIndex = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeInt(
        descriptor, FULL_DESCRIPTOR_ATTR_I_INDEX, &fontIndex);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(fontIndex >= 0);

    OH_Drawing_DestroyFontFullDescriptors(descriptorArray);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Test case for OH_Drawing_GetFontUnicodeArrayFromFile
napi_value OHDrawingGetFontUnicodeArrayFromFile001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* fontSrc = TEST_FONT_PATH;
    uint32_t index = 0;
    int32_t* unicodeArray = nullptr;
    int32_t arrayLength = 0;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromFile(
        fontSrc, index, &unicodeArray, &arrayLength);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(unicodeArray != nullptr || arrayLength == ZERO_LENGTH);
    NAPI_ASSERT_NO_MES(arrayLength >= 0);

    if (unicodeArray != nullptr) {
        free(unicodeArray);
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontUnicodeArrayFromFile002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* fontSrc = nullptr;
    uint32_t index = 0;
    int32_t* unicodeArray = nullptr;
    int32_t arrayLength = 0;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromFile(
        fontSrc, index, &unicodeArray, &arrayLength);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontUnicodeArrayFromFile003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* invalidFontSrc = "/invalid/path/font.ttf";
    uint32_t index = 0;
    int32_t* unicodeArray = nullptr;
    int32_t arrayLength = 0;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromFile(
        invalidFontSrc, index, &unicodeArray, &arrayLength);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontUnicodeArrayFromFile004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* fontSrc = TEST_FONT_PATH;
    uint32_t index = 0;
    int32_t arrayLength = 0;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromFile(
        fontSrc, index, nullptr, &arrayLength);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontUnicodeArrayFromFile005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* fontSrc = TEST_FONT_PATH;
    uint32_t index = 0;
    int32_t* unicodeArray = nullptr;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromFile(
        fontSrc, index, &unicodeArray, nullptr);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontUnicodeArrayFromBuffer - 基本功能测试
napi_value OHDrawingGetFontUnicodeArrayFromBuffer001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = nullptr;
    size_t bufferSize = 0;

    bool success = ReadFontFile(&fontBuffer, &bufferSize);
    NAPI_ASSERT_NO_MES(success);
    NAPI_ASSERT_NO_MES(fontBuffer != nullptr);
    NAPI_ASSERT_NO_MES(bufferSize > 0);

    uint32_t index = 0;
    int32_t* unicodeArray = nullptr;
    int32_t arrayLength = 0;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontUnicodeArrayFromBuffer(
        fontBuffer, bufferSize, index, &unicodeArray, &arrayLength);

    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(unicodeArray != nullptr || arrayLength == 0);
    NAPI_ASSERT_NO_MES(arrayLength >= 0);

    if (unicodeArray != nullptr && arrayLength > 0) {
        for (int32_t i = 0; i < arrayLength; i++) {
            int32_t codePoint = unicodeArray[i];
            NAPI_ASSERT_NO_MES(codePoint >= UNICODE_MIN_VALUE);
            NAPI_ASSERT_NO_MES(codePoint <= UNICODE_MAX_VALUE);
        }
        free(unicodeArray);
    }

    delete[] fontBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontUnicodeArrayFromBuffer - nullptr和0参数测试
napi_value OHDrawingGetFontUnicodeArrayFromBuffer002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = nullptr;
    size_t bufferSize = 0;

    bool success = ReadFontFile(&fontBuffer, &bufferSize);
    NAPI_ASSERT_NO_MES(success);

    if (success && fontBuffer != nullptr) {
        // 测试fontBuffer为nullptr
        OH_Drawing_ErrorCode errorCode1 = OH_Drawing_GetFontUnicodeArrayFromBuffer(
            nullptr, bufferSize, UINT32_ZERO, nullptr, nullptr);
        NAPI_ASSERT_NO_MES(errorCode1 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

        // 测试bufferSize为0
        OH_Drawing_ErrorCode errorCode2 = OH_Drawing_GetFontUnicodeArrayFromBuffer(
            fontBuffer, SIZE_T_ZERO, UINT32_ZERO, nullptr, nullptr);
        NAPI_ASSERT_NO_MES(errorCode2 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

        // 测试unicodeArray参数为nullptr
        int32_t arrayLength = 0;
        OH_Drawing_ErrorCode errorCode3 = OH_Drawing_GetFontUnicodeArrayFromBuffer(
            fontBuffer, bufferSize, UINT32_ZERO, nullptr, &arrayLength);
        NAPI_ASSERT_NO_MES(errorCode3 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

        // 测试arrayLength参数为nullptr
        int32_t* unicodeArray = nullptr;
        OH_Drawing_ErrorCode errorCode4 = OH_Drawing_GetFontUnicodeArrayFromBuffer(
            fontBuffer, bufferSize, UINT32_ZERO, &unicodeArray, nullptr);
        NAPI_ASSERT_NO_MES(errorCode4 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

        delete[] fontBuffer;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontCountFromFile - 基本功能测试
napi_value OHDrawingGetFontCountFromFile001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    const char* fontSrc = TEST_FONT_PATH;
    uint32_t fontCount = OH_Drawing_GetFontCountFromFile(fontSrc);

    NAPI_ASSERT_NO_MES(fontCount > 0);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontCountFromFile - 空字符串、nullptr和无效路径测试
napi_value OHDrawingGetFontCountFromFile002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 测试空字符串
    const char* emptyString = EMPTY_STRING;
    uint32_t fontCount1 = OH_Drawing_GetFontCountFromFile(emptyString);
    NAPI_ASSERT_NO_MES(fontCount1 == UINT32_ZERO);

    // 测试nullptr
    const char* nullPath = nullptr;
    uint32_t fontCount2 = OH_Drawing_GetFontCountFromFile(nullPath);
    NAPI_ASSERT_NO_MES(fontCount2 == UINT32_ZERO);

    // 测试无效路径
    const char* invalidPath = INVALID_FONT_PATH;
    uint32_t fontCount3 = OH_Drawing_GetFontCountFromFile(invalidPath);
    NAPI_ASSERT_NO_MES(fontCount3 == UINT32_ZERO);

    // 测试无效TTC路径
    const char* invalidTtcPath = INVALID_TTC_PATH;
    uint32_t fontCount4 = OH_Drawing_GetFontCountFromFile(invalidTtcPath);
    NAPI_ASSERT_NO_MES(fontCount4 == UINT32_ZERO);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontCountFromBuffer - 基本功能测试
napi_value OHDrawingGetFontCountFromBuffer001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    uint8_t* fontBuffer = nullptr;
    size_t bufferSize = 0;

    bool success = ReadFontFile(&fontBuffer, &bufferSize);
    NAPI_ASSERT_NO_MES(success);
    NAPI_ASSERT_NO_MES(fontBuffer != nullptr);
    NAPI_ASSERT_NO_MES(bufferSize > 0);

    uint32_t fontCount = OH_Drawing_GetFontCountFromBuffer(fontBuffer, bufferSize);
    NAPI_ASSERT_NO_MES(fontCount > 0);

    delete[] fontBuffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontCountFromBuffer - nullptr和0参数测试
napi_value OHDrawingGetFontCountFromBuffer002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 测试fontBuffer为nullptr
    uint8_t* nullBuffer = nullptr;
    size_t length = 100;
    uint32_t fontCount1 = OH_Drawing_GetFontCountFromBuffer(nullBuffer, length);
    NAPI_ASSERT_NO_MES(fontCount1 == UINT32_ZERO);

    // 测试bufferSize为0
    uint8_t validData[100] = {0};
    uint32_t fontCount2 = OH_Drawing_GetFontCountFromBuffer(validData, SIZE_T_ZERO);
    NAPI_ASSERT_NO_MES(fontCount2 == UINT32_ZERO);

    // 测试无效数据
    uint8_t invalidData[100] = {0};
    size_t dataLength = sizeof(invalidData);
    uint32_t fontCount3 = OH_Drawing_GetFontCountFromBuffer(invalidData, dataLength);
    NAPI_ASSERT_NO_MES(fontCount3 == UINT32_ZERO);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontPathsByType - 基本功能测试
napi_value OHDrawingGetFontPathsByType001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::ALL;
    size_t pathCount = 0;

    OH_Drawing_String* fontPaths = OH_Drawing_GetFontPathsByType(fontType, &pathCount);

    NAPI_ASSERT_NO_MES(fontPaths != nullptr || pathCount == 0);

    if (fontPaths != nullptr) {
        for (size_t i = 0; i < pathCount; i++) {
            OH_Drawing_String path = fontPaths[i];
            NAPI_ASSERT_NO_MES(path.strData != nullptr);
            NAPI_ASSERT_NO_MES(path.strLen > 0);
            NAPI_ASSERT_NO_MES(path.strLen < MAX_PATH_LENGTH);

            // 使用SafeFreeStringData释放字符串数据
            SafeFreeStringData(&fontPaths[i]);
        }
        free(fontPaths);
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontPathsByType - nullptr参数测试
napi_value OHDrawingGetFontPathsByType002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::ALL;

    // 测试pathCount为nullptr
    OH_Drawing_String* fontPaths = OH_Drawing_GetFontPathsByType(fontType, nullptr);
    NAPI_ASSERT_NO_MES(fontPaths != nullptr);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetFontPathsByType - 所有字体类型测试
napi_value OHDrawingGetFontPathsByType003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_SystemFontType fontTypes[] = {
        OH_Drawing_SystemFontType::ALL,
        OH_Drawing_SystemFontType::GENERIC,
        OH_Drawing_SystemFontType::STYLISH,
        OH_Drawing_SystemFontType::INSTALLED,
        OH_Drawing_SystemFontType::CUSTOMIZED
    };
    size_t typeCount = sizeof(fontTypes) / sizeof(fontTypes[0]);

    for (size_t i = 0; i < typeCount; i++) {
        size_t pathCount = 0;
        OH_Drawing_String* fontPaths = OH_Drawing_GetFontPathsByType(fontTypes[i], &pathCount);

        NAPI_ASSERT_NO_MES(fontPaths != nullptr || pathCount == 0);

        if (fontPaths != nullptr) {
            // 使用SafeFreeStringData释放每个字符串
            for (size_t j = 0; j < pathCount; j++) {
                SafeFreeStringData(&fontPaths[j]);
            }
            free(fontPaths);
        }
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_SetTypographyStyleAttributeBool - 行首标点压缩测试
napi_value OHDrawingSetTypographyStyleAttributeBool001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_COMPRESS_HEAD_PUNCTUATION, true);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_SetTypographyStyleAttributeBool - 字体内部padding测试
napi_value OHDrawingSetTypographyStyleAttributeBool002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_INCLUDE_FONT_PADDING, false);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_SetTypographyStyleAttributeBool - 行间距回退机制测试
napi_value OHDrawingSetTypographyStyleAttributeBool003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_FALLBACK_LINE_SPACING, true);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_SetTypographyStyleAttributeBool - nullptr参数测试
napi_value OHDrawingSetTypographyStyleAttributeBool004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        nullptr, TYPOGRAPHY_STYLE_ATTR_B_COMPRESS_HEAD_PUNCTUATION, true);
    DRAWING_LOGI("OHDrawingSetTypographyStyleAttributeBool004 errorCode is %{public}u", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeBool005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        nullptr, TYPOGRAPHY_STYLE_ATTR_B_COMPRESS_HEAD_PUNCTUATION, true);
    DRAWING_LOGI("OHDrawingSetTypographyStyleAttributeBool004 errorCode is %{public}u", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeBool006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, true);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetTypographyStyleAttributeBool - 行首标点压缩获取测试
napi_value OHDrawingGetTypographyStyleAttributeBool001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    bool value = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_COMPRESS_HEAD_PUNCTUATION, &value);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetTypographyStyleAttributeBool - 设置后获取验证
napi_value OHDrawingGetTypographyStyleAttributeBool002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_SetTypographyStyleAttributeBool(style, TYPOGRAPHY_STYLE_ATTR_B_INCLUDE_FONT_PADDING, true);

    bool value = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_INCLUDE_FONT_PADDING, &value);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(value == true);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetTypographyStyleAttributeBool - nullptr参数测试
napi_value OHDrawingGetTypographyStyleAttributeBool003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    bool value = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeBool(
        nullptr, TYPOGRAPHY_STYLE_ATTR_B_FALLBACK_LINE_SPACING, &value);
    DRAWING_LOGI("OHDrawingGetTypographyStyleAttributeBool003 errorCode is %{public}u", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_GetTypographyStyleAttributeBool - 输出参数为nullptr测试
napi_value OHDrawingGetTypographyStyleAttributeBool004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_B_FALLBACK_LINE_SPACING, nullptr);
    DRAWING_LOGI("OHDrawingGetTypographyStyleAttributeBool004 errorCode is %{public}u", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTypographyStyleAttributeBool005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    bool value = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeBool(
        style, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, &value);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    OH_Drawing_DestroyTypographyStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_DestroyPositionAndAffinity - 基本功能测试
napi_value OHDrawingDestroyPositionAndAffinity001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TextBox* textBox = OH_Drawing_TypographyGetRectsForPlaceholders(typography);
    OH_Drawing_GetLeftFromTextBox(textBox, 0);
    OH_Drawing_GetRightFromTextBox(textBox, 0);
    OH_Drawing_GetTopFromTextBox(textBox, 0);
    OH_Drawing_GetBottomFromTextBox(textBox, 0);
    NAPI_ASSERT_NO_MES(OH_Drawing_GetTextDirectionFromTextBox(textBox, 0) == 0);
    NAPI_ASSERT_NO_MES(OH_Drawing_GetSizeOfTextBox(textBox) == 0);

    OH_Drawing_PositionAndAffinity* positionAndAffinity =
        OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0);
    OH_Drawing_GetPositionFromPositionAndAffinity(positionAndAffinity);
    OH_Drawing_GetAffinityFromPositionAndAffinity(positionAndAffinity);

    OH_Drawing_Range* range = OH_Drawing_TypographyGetWordBoundary(typography, 1);
    OH_Drawing_GetStartFromRange(range);
    OH_Drawing_GetEndFromRange(range);
    OH_Drawing_TypographyGetLineHeight(typography, 1);
    OH_Drawing_TypographyGetLineWidth(typography, 1);
    NAPI_ASSERT_NO_MES(positionAndAffinity != nullptr);

    OH_Drawing_DestroyPositionAndAffinity(positionAndAffinity);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// OH_Drawing_DestroyPositionAndAffinity - nullptr参数测试
napi_value OHDrawingDestroyPositionAndAffinity002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_DestroyPositionAndAffinity(nullptr);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}
