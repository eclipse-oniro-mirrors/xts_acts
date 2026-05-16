/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "native_drawing/drawing_text_font_descriptor.h"
#include "nativeFontNdk.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "log_common.h"
#include "common.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstddef>
#include <cstdint>
#include <climits>
#include <codecvt>
#include <cfloat>
#include <cmath>

namespace {
const double ZERO_POINT_FIVE = 0.5;
const double DEFAULT_FONT_SIZE = 16.0;
const double CONSTRAINT_WIDTH = 400.0;
const double CONSTRAINT_HEIGHT = 200.0;
const double LARGE_CONSTRAINT_WIDTH = 1000.0;
const double LARGE_CONSTRAINT_HEIGHT = 500.0;
const double SMALL_CONSTRAINT_WIDTH = 50.0;
const double SMALL_CONSTRAINT_HEIGHT = 30.0;
const double ZERO_SIZE = 0.0;
const int ZERO = 0;
const int ONE = 1;
const int TWO = 2;
const int THREE = 3;
const int FOUR = 4;
const int FIVE = 5;
const int SIX = 6;
const int SEVEN = 7;
const int EIGHT = 8;
const int NIGHT = 9;
const int TEN = 10;
const int ONE_ONE = 11;
const int ONE_TWO = 12;
const int ONE_THREE = 13;
const int ONE_FOUR = 14;
const int ONE_FIVE = 15;
const int ONE_SIX = 16;
const int ONE_SEVEN = 17;
const int ONE_EIGHT = 18;
const int ONE_NINE = 19;
const int TWO_ZERO = 20;
const int TWO_ONE = 21;
const int ONE_ZERO_ZERO = 100;
const int TWO_ZERO_ONE = 201;
const int FOUR_ZERO_ZERO = 400;
const int FOUR_ZERO_ONE = 401;
const int EIGHT_ZERO_ZERO = 800;
const int ONE_TWO_ZERO_ZERO = 1200;
const int TWO_SIX_TWO_ZEROS_ONE = 26200001;
const int TWO_SIX_TWO_ZEROS_TWO = 26200002;
const int TWO_SIX_TWO_ZEROS_THREE = 26200003;
const int TWO_SIX_TWO_ZEROS_FOUR = 26200004;
const int TWO_SIX_TWO_ZEROS_FIVE = 26200005;
const int TWO_SIX_TWO_ZEROS_SIX = 26200006;
const int TWO_SIX_TWO_ZEROS_SEVEN = 26200007;
const int TWO_SIX_TWO_ZEROS_EIGHT = 26200008;
const int TWO_SIX_TWO_ZEROS_NIGHT = 26200009;
const int TWO_SIX_TWO_ZEROS_TEN = 26200010;
const int TWO_SIX_TWO_ZEROS_ELEVEN = 26200011;
const int INVALID_ATTRIBUTE_ID = 9999;
} // namespace

std::string g_systemPushPath = "/system/fonts/NotoSans[wdth,wght].ttf";

// 安全释放函数
inline void SafeFreeStringData(OH_Drawing_String* str)
{
    if (str != nullptr && str->strData != nullptr) {
        free(str->strData);
        str->strData = nullptr;
        str->strLen = 0;
    }
}

napi_value GetFontFullDescriptorAttributeArrayDetailError(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_String key = {.strData = nullptr, .strLen =0};
    OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, 0);
    NAPI_ASSERT_NO_MES(axis != nullptr);
    OH_Drawing_FontVariationAxisAttributeId id00 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_KEY);
    NAPI_ASSERT_NO_MES(id00 == 0);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_SUCCESS  == err00);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_NO_PERMISSION == TWO_ZERO_ONE);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INVALID_PARAMETER == FOUR_ZERO_ONE);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == TWO_SIX_TWO_ZEROS_ONE);
    OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ALLOCATION_FAILED == TWO_SIX_TWO_ZEROS_TWO);
    OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == TWO_SIX_TWO_ZEROS_THREE);
    OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INCORRECT_PARAMETER == TWO_SIX_TWO_ZEROS_FOUR);
    OH_Drawing_ErrorCode err07 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == TWO_SIX_TWO_ZEROS_FIVE);
    OH_Drawing_ErrorCode err08 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == TWO_SIX_TWO_ZEROS_SIX);
    OH_Drawing_ErrorCode err09 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == TWO_SIX_TWO_ZEROS_SEVEN);
    OH_Drawing_ErrorCode err10 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == TWO_SIX_TWO_ZEROS_EIGHT);
    OH_Drawing_ErrorCode err11 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == TWO_SIX_TWO_ZEROS_NIGHT);
    OH_Drawing_ErrorCode err12 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == TWO_SIX_TWO_ZEROS_TEN);
    OH_Drawing_ErrorCode err13 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == TWO_SIX_TWO_ZEROS_ELEVEN);
    SafeFreeStringData(&key);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetFontFullDescriptorAttributeArrayDetailError2(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    int flags;
    OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, 0);
    NAPI_ASSERT_NO_MES(axis != nullptr);
    OH_Drawing_FontVariationAxisAttributeId id04 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_I_FLAGS);
    NAPI_ASSERT_NO_MES(id04 != 0);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_SUCCESS  == 0);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_NO_PERMISSION == TWO_ZERO_ONE);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INVALID_PARAMETER == FOUR_ZERO_ONE);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == TWO_SIX_TWO_ZEROS_ONE);
    OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ALLOCATION_FAILED == TWO_SIX_TWO_ZEROS_TWO);
    OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == TWO_SIX_TWO_ZEROS_THREE);
    OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INCORRECT_PARAMETER == TWO_SIX_TWO_ZEROS_FOUR);
    OH_Drawing_ErrorCode err07 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == TWO_SIX_TWO_ZEROS_FIVE);
    OH_Drawing_ErrorCode err08 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == TWO_SIX_TWO_ZEROS_SIX);
    OH_Drawing_ErrorCode err09 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == TWO_SIX_TWO_ZEROS_SEVEN);
    OH_Drawing_ErrorCode err10 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == TWO_SIX_TWO_ZEROS_EIGHT);
    OH_Drawing_ErrorCode err11 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == TWO_SIX_TWO_ZEROS_NIGHT);
    OH_Drawing_ErrorCode err12 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == TWO_SIX_TWO_ZEROS_TEN);
    OH_Drawing_ErrorCode err13 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == TWO_SIX_TWO_ZEROS_ELEVEN);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetFontFullDescriptorAttributeArrayDetailError3(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    double flags;
    OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, 0);
    NAPI_ASSERT_NO_MES(axis != nullptr);
    OH_Drawing_FontVariationAxisAttributeId id04 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_D_MIN_VALUE);
    NAPI_ASSERT_NO_MES(id04 != 0);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_SUCCESS  == 0);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_NO_PERMISSION == TWO_ZERO_ONE);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INVALID_PARAMETER == FOUR_ZERO_ONE);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == TWO_SIX_TWO_ZEROS_ONE);
    OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ALLOCATION_FAILED == TWO_SIX_TWO_ZEROS_TWO);
    OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == TWO_SIX_TWO_ZEROS_THREE);
    OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INCORRECT_PARAMETER == TWO_SIX_TWO_ZEROS_FOUR);
    OH_Drawing_ErrorCode err07 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == TWO_SIX_TWO_ZEROS_FIVE);
    OH_Drawing_ErrorCode err08 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == TWO_SIX_TWO_ZEROS_SIX);
    OH_Drawing_ErrorCode err09 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == TWO_SIX_TWO_ZEROS_SEVEN);
    OH_Drawing_ErrorCode err10 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == TWO_SIX_TWO_ZEROS_EIGHT);
    OH_Drawing_ErrorCode err11 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == TWO_SIX_TWO_ZEROS_NIGHT);
    OH_Drawing_ErrorCode err12 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == TWO_SIX_TWO_ZEROS_TEN);
    OH_Drawing_ErrorCode err13 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id04, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == TWO_SIX_TWO_ZEROS_ELEVEN);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetFontFullDescriptorAttributeArrayDetailError4(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    double flags = 0.0;
    int value = 0;
    OH_Drawing_String key = {.strData = nullptr, .strLen =0};
    OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, 0);
    OH_Drawing_FontVariationAxisAttributeId id02 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_KEY);
    OH_Drawing_FontVariationAxisAttributeId id03 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_I_FLAGS);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id02, &flags);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == err01);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id02, &value);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == err02);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id03, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == err03);
    SafeFreeStringData(&key);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value GetFontFullDescriptorAttributeArrayDetail(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    for (int j = 0; j < size0; j++) {
        OH_Drawing_String key = {.strData = nullptr, .strLen =0};
        double minValue;
        double maxValue;
        double defaultValue;
        OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, j);
        NAPI_ASSERT_NO_MES(axis != nullptr);
        OH_Drawing_FontVariationAxisAttributeId id00 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_KEY);
        NAPI_ASSERT_NO_MES(id00 == ZERO);
        OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id00, &key);
        NAPI_ASSERT_NO_MES(err00 == OH_DRAWING_SUCCESS);
        OH_Drawing_FontVariationAxisAttributeId id01 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_D_MIN_VALUE);
        NAPI_ASSERT_NO_MES(id01 == ONE);
        OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id01, &minValue);
        NAPI_ASSERT_NO_MES(err01 == OH_DRAWING_SUCCESS);
        OH_Drawing_FontVariationAxisAttributeId id02 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_D_MAX_VALUE);
        NAPI_ASSERT_NO_MES(id02 == TWO);
        OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id02, &maxValue);
        NAPI_ASSERT_NO_MES(err02 == OH_DRAWING_SUCCESS);
        OH_Drawing_FontVariationAxisAttributeId id03 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_D_DEFAULT_VALUE);
        NAPI_ASSERT_NO_MES(id03 == THREE);
        OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeDouble(axis, id03, &defaultValue);
        NAPI_ASSERT_NO_MES(err03 == OH_DRAWING_SUCCESS);
        SafeFreeStringData(&key);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetFontFullDescriptorAttributeArrayDetail2(size_t size0, OH_Drawing_Array *array0, napi_env env)
{
    napi_value result = nullptr;
    for (int j = 0; j < size0; j++) {
        int flags;
        OH_Drawing_String name = {.strData = nullptr, .strLen =0};
        OH_Drawing_String localName = {.strData = nullptr, .strLen =0};
        OH_Drawing_FontVariationAxis *axis = OH_Drawing_GetFontVariationAxisByIndex(array0, j);
        NAPI_ASSERT_NO_MES(axis != nullptr);
        OH_Drawing_FontVariationAxisAttributeId id04 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_I_FLAGS);
        NAPI_ASSERT_NO_MES(id04 == FOUR);
        OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationAxisAttributeInt(axis, id04, &flags);
        NAPI_ASSERT_NO_MES(err04 == OH_DRAWING_SUCCESS);
        OH_Drawing_FontVariationAxisAttributeId id05 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_NAME);
        NAPI_ASSERT_NO_MES(id05 == FIVE);
        OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id05, &name);
        NAPI_ASSERT_NO_MES(err05 == OH_DRAWING_SUCCESS);
        OH_Drawing_FontVariationAxisAttributeId id06 =
            OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_LOCAL_NAME);
        NAPI_ASSERT_NO_MES(id06 == SIX);
        OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationAxisAttributeStr(axis, id06, &localName);
        NAPI_ASSERT_NO_MES(err06 == OH_DRAWING_SUCCESS);
        SafeFreeStringData(&name);
        SafeFreeStringData(&localName);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetFontFullDescriptorAttributeArrayVariationInstanceDetail(size_t size1, OH_Drawing_Array *array1,
                                                                      napi_env env)
{
    napi_value result = nullptr;
    for (int i = 0; i < size1; i++) {
        OH_Drawing_String name = {.strData = nullptr, .strLen =0};
        OH_Drawing_FontVariationInstance *fontVariationInstance = OH_Drawing_GetFontVariationInstanceByIndex(array1, i);
        NAPI_ASSERT_NO_MES(fontVariationInstance != nullptr);
        OH_Drawing_FontVariationInstanceAttributeId id20 =
            OH_Drawing_FontVariationInstanceAttributeId(FONT_VARIATION_INSTANCE_ATTR_S_NAME);
        NAPI_ASSERT_NO_MES(id20 == 0);
        OH_Drawing_ErrorCode err20 =
            OH_Drawing_GetFontVariationInstanceAttributeStr(fontVariationInstance, id20, &name);
        NAPI_ASSERT_NO_MES(err20 == OH_DRAWING_SUCCESS);

        OH_Drawing_FontVariationInstanceAttributeId id21 =
            OH_Drawing_FontVariationInstanceAttributeId(FONT_VARIATION_INSTANCE_ATTR_S_LOCAL_NAME);
        NAPI_ASSERT_NO_MES(id21 == 1);
        OH_Drawing_ErrorCode err21 =
            OH_Drawing_GetFontVariationInstanceAttributeStr(fontVariationInstance, id21, &name);
        NAPI_ASSERT_NO_MES(err21 == OH_DRAWING_SUCCESS);
        size_t length;
        OH_Drawing_FontVariationInstanceCoordinate *coordinate =
            OH_Drawing_GetFontVariationInstanceCoordinate(fontVariationInstance, &length);
        NAPI_ASSERT_NO_MES(coordinate != nullptr);
        for (int n = 0; n < length; n++) {
            std::string axisKey = coordinate[n].axisKey;
            std::string axisKeyString(axisKey);
            NAPI_ASSERT_NO_MES(axisKeyString != "");
            double value = coordinate[n].value;
            NAPI_ASSERT_NO_MES(value != 0);
        }
        SafeFreeStringData(&name);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

std::string ConverrtUtf16ToUtf8(const uint8_t * utf16Data, uint32_t strLen)
{
    constexpr int two = 2;
    if (strLen % two != 0) {
        return "";
    }
    const char16_t* utf16Chars = reinterpret_cast<const char16_t*>(utf16Data);
    size_t charCount = strLen / two;
    std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> converter;
    return converter.to_bytes(utf16Chars, utf16Chars+charCount);
}

napi_value GetOHDrawingGetFontFullDescriptorByFullNameDetail(const OH_Drawing_FontFullDescriptor *desc, napi_env env)
{
    napi_value result = nullptr;
    
    OH_Drawing_String fullname = {.strData = nullptr, .strLen =0};
    OH_Drawing_ErrorCode e2 = OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_FULL_NAME,
        &fullname);
        
    const OH_Drawing_FontFullDescriptor *descriptor0 =
        OH_Drawing_GetFontFullDescriptorByFullName(&fullname, OH_Drawing_SystemFontType::ALL);
    NAPI_ASSERT_NO_MES(descriptor0 != nullptr);
    const OH_Drawing_FontFullDescriptor *descriptor1 =
        OH_Drawing_GetFontFullDescriptorByFullName(&fullname, OH_Drawing_SystemFontType::GENERIC);
    NAPI_ASSERT_NO_MES(descriptor1 != nullptr);
    const OH_Drawing_FontFullDescriptor *descriptor2 =
        OH_Drawing_GetFontFullDescriptorByFullName(&fullname, OH_Drawing_SystemFontType::STYLISH);
    NAPI_ASSERT_NO_MES(descriptor2 == nullptr);
    const OH_Drawing_FontFullDescriptor *descriptor3 =
        OH_Drawing_GetFontFullDescriptorByFullName(&fullname, OH_Drawing_SystemFontType::INSTALLED);
    NAPI_ASSERT_NO_MES(descriptor3 == nullptr);
    const OH_Drawing_FontFullDescriptor *descriptor4 =
        OH_Drawing_GetFontFullDescriptorByFullName(&fullname, OH_Drawing_SystemFontType::CUSTOMIZED);
    NAPI_ASSERT_NO_MES(descriptor4 == nullptr);
    
    OH_Drawing_DestroyFontFullDescriptor(descriptor0);
    descriptor0 = nullptr;
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    OH_Drawing_DestroyFontFullDescriptor(descriptor1);
    descriptor1 = nullptr;
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    OH_Drawing_DestroyFontFullDescriptor(descriptor3);
    descriptor3 = nullptr;
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    OH_Drawing_DestroyFontFullDescriptor(descriptor4);
    descriptor3 = nullptr;
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    SafeFreeStringData(&fullname);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontFullDescriptorAttributeArray0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeArray_0100
 * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeArray0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontFullDescriptorAttributeArray0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    std::string pathString = g_systemPushPath;
    OH_Drawing_Array *fontList = OH_Drawing_GetFontFullDescriptorsFromPath(pathString.c_str());
    size_t size = OH_Drawing_GetDrawingArraySize(fontList);
    for (int i = 0; i < size; i++) {
        const OH_Drawing_FontFullDescriptor *desc = OH_Drawing_GetFontFullDescriptorByIndex(fontList, i);

        OH_Drawing_FontFullDescriptorAttributeId id0 =
            OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_AXIS);
        NAPI_ASSERT_NO_MES(id0 == ONE_NINE);
        OH_Drawing_Array *array0 = OH_Drawing_GetFontFullDescriptorAttributeArray(desc, id0);
        NAPI_ASSERT_NO_MES(array0 != nullptr);
        size_t size0 = OH_Drawing_GetDrawingArraySize(array0);
        NAPI_ASSERT_NO_MES(size0 > 0);
        GetFontFullDescriptorAttributeArrayDetail(size0, array0, env);
        GetFontFullDescriptorAttributeArrayDetail2(size0, array0, env);
        GetFontFullDescriptorAttributeArrayDetailError(size0, array0, env);
        GetFontFullDescriptorAttributeArrayDetailError2(size0, array0, env);
        GetFontFullDescriptorAttributeArrayDetailError3(size0, array0, env);
        GetFontFullDescriptorAttributeArrayDetailError4(size0, array0, env);
        
        GetOHDrawingGetFontFullDescriptorByFullNameDetail(desc, env);

        OH_Drawing_FontFullDescriptorAttributeId id1 =
            OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_INSTANCE);
        NAPI_ASSERT_NO_MES(id0 != TWO_ZERO);
        OH_Drawing_Array *array1 = OH_Drawing_GetFontFullDescriptorAttributeArray(desc, id1);
        NAPI_ASSERT_NO_MES(array1 != nullptr);
        
        size_t size1 = OH_Drawing_GetDrawingArraySize(array1);
        NAPI_ASSERT_NO_MES(size1 > 0);
        GetFontFullDescriptorAttributeArrayVariationInstanceDetail(size1, array1, env);
        
        OH_Drawing_DestroyFontVariationAxis(array0);
        array0 = nullptr;
        NAPI_ASSERT_NO_MES(array0 == nullptr);
        OH_Drawing_DestroyFontVariationInstance(array1);
        array1 = nullptr;
        NAPI_ASSERT_NO_MES(array1 == nullptr);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


/**
 * @tc.name   testOHDrawingGetFontFullDescriptorAttributeArray0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeArray_0200
 * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeArray0200
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontFullDescriptorAttributeArray0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontFullDescriptorAttributeId id0 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_AXIS);
    OH_Drawing_Array *array0 = OH_Drawing_GetFontFullDescriptorAttributeArray(nullptr, id0);
    NAPI_ASSERT_NO_MES(array0 == nullptr);
    size_t size0 = OH_Drawing_GetDrawingArraySize(array0);
    NAPI_ASSERT_NO_MES(size0 == 0);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


/**
 * @tc.name   testOHDrawingGetFontVariationAxisAttributeStr0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeStr_0100
 * @tc.desc   test OHDrawingGetFontVariationAxisAttributeStr0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationAxisAttributeStr0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_String key = {.strData = nullptr, .strLen =0};
    OH_Drawing_FontVariationAxisAttributeId id00 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_KEY);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(err00 != OH_DRAWING_SUCCESS);
    SafeFreeStringData(&key);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontVariationAxisAttributeStr0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeStr_0200
 * @tc.desc   test OHDrawingGetFontVariationAxisAttributeStr0200
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationAxisAttributeStr0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_String key = {.strData = nullptr, .strLen =0};
    OH_Drawing_FontVariationAxisAttributeId id00 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_S_KEY);
    OH_Drawing_ErrorCode err0 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    DRAWING_LOGI("999 wangxiaolong OHDrawingGetFontVariationAxisAttributeStr0200 err0 = %{public}u", err0);
    NAPI_ASSERT_NO_MES(err0 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_NO_PERMISSION == TWO_ZERO_ONE);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INVALID_PARAMETER == FOUR_ZERO_ONE);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == TWO_SIX_TWO_ZEROS_ONE);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ALLOCATION_FAILED == TWO_SIX_TWO_ZEROS_TWO);
    OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == TWO_SIX_TWO_ZEROS_THREE);
    OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INCORRECT_PARAMETER == TWO_SIX_TWO_ZEROS_FOUR);
    OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == TWO_SIX_TWO_ZEROS_FIVE);
    OH_Drawing_ErrorCode err07 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == TWO_SIX_TWO_ZEROS_SIX);
    OH_Drawing_ErrorCode err08 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == TWO_SIX_TWO_ZEROS_SEVEN);
    OH_Drawing_ErrorCode err09 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == TWO_SIX_TWO_ZEROS_EIGHT);
    OH_Drawing_ErrorCode err010 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == TWO_SIX_TWO_ZEROS_NIGHT);
    OH_Drawing_ErrorCode err011 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == TWO_SIX_TWO_ZEROS_TEN);
    OH_Drawing_ErrorCode err012 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, &key);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == TWO_SIX_TWO_ZEROS_ELEVEN);
    OH_Drawing_ErrorCode err013 = OH_Drawing_GetFontVariationAxisAttributeStr(nullptr, id00, nullptr);
    NAPI_ASSERT_NO_MES(err013 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    SafeFreeStringData(&key);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontVariationInstanceByIndex0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontVariationInstanceByIndex_0100
 * @tc.desc   test OHDrawingGetFontVariationInstanceByIndex0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationInstanceByIndex0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_Drawing_FontVariationInstance *fontVariationInstance = OH_Drawing_GetFontVariationInstanceByIndex(nullptr, 0);
    NAPI_ASSERT_NO_MES(fontVariationInstance == nullptr);
    
    std::string pathString = g_systemPushPath;
    OH_Drawing_Array *fontList = OH_Drawing_GetFontFullDescriptorsFromPath(pathString.c_str());
    const OH_Drawing_FontFullDescriptor *desc = OH_Drawing_GetFontFullDescriptorByIndex(fontList, 0);
    OH_Drawing_FontFullDescriptorAttributeId id0 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_AXIS);
    OH_Drawing_Array *array0 = OH_Drawing_GetFontFullDescriptorAttributeArray(desc, id0);
    OH_Drawing_FontVariationInstance *fontVariationInstance2 = OH_Drawing_GetFontVariationInstanceByIndex(array0,
                                                                                                          INT_MAX);
    NAPI_ASSERT_NO_MES(fontVariationInstance2 == nullptr);
    
    OH_Drawing_FontVariationInstance *fontVariationInstance3 = OH_Drawing_GetFontVariationInstanceByIndex(array0,
                                                                                                          INT_MIN);
    NAPI_ASSERT_NO_MES(fontVariationInstance3 == nullptr);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingDestroyFontVariationInstance0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingDestroyFontVariationInstance_0100
 * @tc.desc   testOHDrawingDestroyFontVariationInstance0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingDestroyFontVariationInstance0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_DestroyFontVariationInstance(nullptr);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontVariationInstanceAttributeStr0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontVariationInstanceAttributeStr_0100
 * @tc.desc   testOHDrawingDestroyFontVariationInstance0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationInstanceAttributeStr0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_String name = {.strData = nullptr, .strLen =0};
    OH_Drawing_FontVariationInstanceAttributeId id20 =
        OH_Drawing_FontVariationInstanceAttributeId(FONT_VARIATION_AXIS_ATTR_S_NAME);
    OH_Drawing_ErrorCode err20 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(err20 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_NO_PERMISSION == TWO_ZERO_ONE);
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INVALID_PARAMETER == FOUR_ZERO_ONE);
    OH_Drawing_ErrorCode err02 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == TWO_SIX_TWO_ZEROS_ONE);
    OH_Drawing_ErrorCode err03 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ALLOCATION_FAILED == TWO_SIX_TWO_ZEROS_TWO);
    OH_Drawing_ErrorCode err04 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == TWO_SIX_TWO_ZEROS_THREE);
    OH_Drawing_ErrorCode err05 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_INCORRECT_PARAMETER == TWO_SIX_TWO_ZEROS_FOUR);
    OH_Drawing_ErrorCode err06 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_NOT_FOUND == TWO_SIX_TWO_ZEROS_FIVE);
    OH_Drawing_ErrorCode err07 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_OPEN_FILE_FAILED == TWO_SIX_TWO_ZEROS_SIX);
    OH_Drawing_ErrorCode err08 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_SEEK_FAILED == TWO_SIX_TWO_ZEROS_SEVEN);
    OH_Drawing_ErrorCode err09 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_GET_FILE_SIZE_FAILED == TWO_SIX_TWO_ZEROS_EIGHT);
    OH_Drawing_ErrorCode err010 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_READ_FILE_FAILED == TWO_SIX_TWO_ZEROS_NIGHT);
    OH_Drawing_ErrorCode err011 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_EMPTY_FILE == TWO_SIX_TWO_ZEROS_TEN);
    OH_Drawing_ErrorCode err012 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, &name);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_FILE_CORRUPTED == TWO_SIX_TWO_ZEROS_ELEVEN);
    OH_Drawing_ErrorCode err013 = OH_Drawing_GetFontVariationInstanceAttributeStr(nullptr, id20, nullptr);
    NAPI_ASSERT_NO_MES(err013 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    SafeFreeStringData(&name);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontVariationInstanceCoordinate0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontVariationInstanceCoordinate_0100
 * @tc.desc   testOHDrawingGetFontVariationInstanceCoordinate0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationInstanceCoordinate0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t length;
    OH_Drawing_FontVariationInstanceCoordinate *coordinate =
        OH_Drawing_GetFontVariationInstanceCoordinate(nullptr, &length);
    NAPI_ASSERT_NO_MES(coordinate == nullptr);
    
    OH_Drawing_FontVariationInstanceCoordinate *coordinate2 =
        OH_Drawing_GetFontVariationInstanceCoordinate(nullptr, nullptr);
    NAPI_ASSERT_NO_MES(coordinate2 == nullptr);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontFullDescriptorByFullName0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontFullDescriptorByFullName_0100
 * @tc.desc   testOHDrawingGetFontFullDescriptorByFullName0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontFullDescriptorByFullName0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const OH_Drawing_FontFullDescriptor *descriptor0 =
        OH_Drawing_GetFontFullDescriptorByFullName(nullptr, OH_Drawing_SystemFontType::ALL);
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    OH_Drawing_DestroyFontFullDescriptor(descriptor0);
    descriptor0 = nullptr;
    NAPI_ASSERT_NO_MES(descriptor0 == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetFontVariationAxisAttributeDouble0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontVariationAxisAttributeDouble_0100
 * @tc.desc   testOHDrawingGetFontVariationAxisAttributeDouble0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationAxisAttributeDouble0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    double value;
    OH_Drawing_FontVariationAxisAttributeId id00 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_D_MIN_VALUE);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeDouble(nullptr, id00, &value);
    DRAWING_LOGI("999 wangxiaolong OHDrawingGetFontVariationAxisAttributeDouble0100 err0 = %{public}u", err00);
    NAPI_ASSERT_NO_MES(err00 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeDouble(nullptr, id00, nullptr);
    NAPI_ASSERT_NO_MES(err01 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


/**
 * @tc.name   testOHDrawingGetFontVariationAxisAttributeInt0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontVariationAxisAttributeInt_0100
 * @tc.desc   testOHDrawingGetFontVariationAxisAttributeInt0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetFontVariationAxisAttributeInt0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int value;
    OH_Drawing_FontVariationAxisAttributeId id00 =
        OH_Drawing_FontVariationAxisAttributeId(FONT_VARIATION_AXIS_ATTR_I_FLAGS);
    OH_Drawing_ErrorCode err00 = OH_Drawing_GetFontVariationAxisAttributeInt(nullptr, id00, &value);
    NAPI_ASSERT_NO_MES(err00 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    OH_Drawing_ErrorCode err01 = OH_Drawing_GetFontVariationAxisAttributeInt(nullptr, id00, nullptr);
    NAPI_ASSERT_NO_MES(err01 == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0900
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyLayoutWithConstraintsWithBuffer_0900
 * @tc.desc   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0900
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handle = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_TypographyHandlerPushTextStyle(handle, txtStyle1);
    std::string str = "你好世界";
    OH_Drawing_TypographyHandlerAddText(handle, str.c_str());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handle);
    
    OH_Drawing_RectSize rectSize = {ONE_TWO_ZERO_ZERO, EIGHT_ZERO_ZERO};
    NAPI_ASSERT_NO_MES(rectSize.width == ONE_TWO_ZERO_ZERO);
    NAPI_ASSERT_NO_MES(rectSize.height== EIGHT_ZERO_ZERO);
    OH_Drawing_RectSize rectSize2 = {0, 0};
    NAPI_ASSERT_NO_MES(rectSize2.width == 0);
    NAPI_ASSERT_NO_MES(rectSize2.height == 0);
    OH_Drawing_RectSize rectSize3 = {DBL_MAX, DBL_MAX};
    NAPI_ASSERT_NO_MES(rectSize3.width == DBL_MAX);
    NAPI_ASSERT_NO_MES(rectSize3.height == DBL_MAX);
    OH_Drawing_RectSize rectSize4 = {-DBL_MAX, -DBL_MAX};
    NAPI_ASSERT_NO_MES(rectSize4.width == -DBL_MAX);
    NAPI_ASSERT_NO_MES(rectSize4.height == -DBL_MAX);
    OH_Drawing_Array *fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;
    OH_Drawing_RectSize rectSizeResult = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(typography, rectSize,
        &fitStrRangeArr, &fitStrRangeArrayLen);
    DRAWING_LOGI("999 Wwangxiaolong rectSizeResult.height = %{public}f", rectSizeResult.height);
    NAPI_ASSERT_NO_MES(rectSizeResult.height == ONE_ZERO_ZERO);

    NAPI_ASSERT_NO_MES((int)(rectSizeResult.width + ZERO_POINT_FIVE) == FOUR_ZERO_ZERO);
    for (size_t i = 0; i < fitStrRangeArrayLen; i++) {
        OH_Drawing_Range *range = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, i);
        NAPI_ASSERT_NO_MES(range != nullptr);
        size_t start = OH_Drawing_GetStartFromRange(range);
        NAPI_ASSERT_NO_MES(start == 0);
        size_t end = OH_Drawing_GetEndFromRange(range);
        NAPI_ASSERT_NO_MES(end == FOUR);
        OH_Drawing_ReleaseRangeBuffer(range);
        range = nullptr;
        NAPI_ASSERT_NO_MES(range == nullptr);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer1000Detail(OH_Drawing_Array* fitStrRangeArr, napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *range1 = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, INT_MAX);
    NAPI_ASSERT_NO_MES(range1 == nullptr);
    OH_Drawing_Range *range2 = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, INT_MIN);
    NAPI_ASSERT_NO_MES(range2 == nullptr);
    OH_Drawing_Range *range3 = OH_Drawing_GetRangeByArrayIndex(nullptr, 0);
    NAPI_ASSERT_NO_MES(range3 == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer1000
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyLayoutWithConstraintsWithBuffer_1000
 * @tc.desc   testOHDrawingTypographyLayoutWithConstraintsWithBuffer1000
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer1000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handle = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_TypographyHandlerPushTextStyle(handle, txtStyle1);
    std::string str = "你好世界";
    OH_Drawing_TypographyHandlerAddText(handle, str.c_str());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handle);
    
    OH_Drawing_RectSize rectSize = {ONE_TWO_ZERO_ZERO, EIGHT_ZERO_ZERO};
    NAPI_ASSERT_NO_MES(rectSize.width == ONE_TWO_ZERO_ZERO);
    NAPI_ASSERT_NO_MES(rectSize.height== EIGHT_ZERO_ZERO);
    OH_Drawing_Array *fitStrRangeArr = nullptr;
    size_t fitStrRangeArrayLen = 0;
    OH_Drawing_RectSize rectSizeResult = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(nullptr, rectSize,
        &fitStrRangeArr, &fitStrRangeArrayLen);
    OH_Drawing_RectSize rectSizeResult2 = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(typography, rectSize,
        nullptr, &fitStrRangeArrayLen);
    OH_Drawing_RectSize rectSizeResult3 = OH_Drawing_TypographyLayoutWithConstraintsWithBuffer(typography, rectSize,
        &fitStrRangeArr, nullptr);
    NAPI_ASSERT_NO_MES(rectSizeResult.height == 0);
    NAPI_ASSERT_NO_MES(rectSizeResult.width == 0);
    NAPI_ASSERT_NO_MES(rectSizeResult2.height == 0);
    NAPI_ASSERT_NO_MES(rectSizeResult2.width == 0);
    NAPI_ASSERT_NO_MES(rectSizeResult3.height == 0);
    NAPI_ASSERT_NO_MES(rectSizeResult3.width == 0);
    for (size_t i = 0; i < fitStrRangeArrayLen; i++) {
        OH_Drawing_Range *range = OH_Drawing_GetRangeByArrayIndex(fitStrRangeArr, i);
        NAPI_ASSERT_NO_MES(range != nullptr);
        size_t start = OH_Drawing_GetStartFromRange(range);
        NAPI_ASSERT_NO_MES(start == 0);
        size_t end = OH_Drawing_GetEndFromRange(range);
        NAPI_ASSERT_NO_MES(end == FOUR);
        OH_Drawing_ReleaseRangeBuffer(range);
        range = nullptr;
        NAPI_ASSERT_NO_MES(range == nullptr);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTextStyleAddFontVariationWithNormalization_0100
 * @tc.desc   testOHDrawingTextStyleAddFontVariationWithNormalization0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int one = 1;
    int zero = 0;
    int minusone = -1;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wght", one);
    NAPI_ASSERT_NO_MES(one == 1);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wght", zero);
    NAPI_ASSERT_NO_MES(zero == 0);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wght", minusone);
    NAPI_ASSERT_NO_MES(minusone == -1);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wdth", one);
    NAPI_ASSERT_NO_MES(one == 1);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wdth", zero);
    NAPI_ASSERT_NO_MES(zero == 0);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wdth", minusone);
    NAPI_ASSERT_NO_MES(minusone == -1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTextStyleAddFontVariationWithNormalization_0200
 * @tc.desc   testOHDrawingTextStyleAddFontVariationWithNormalization0200
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wght", FLT_MAX);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wght", DBL_MIN);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wdth", FLT_MAX);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "wdth", DBL_MIN);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0300
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTextStyleAddFontVariationWithNormalization_0300
 * @tc.desc   testOHDrawingTextStyleAddFontVariationWithNormalization0300
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyleAddFontVariationWithNormalization(nullptr, "wght", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(nullptr, "wght", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(nullptr, "wdth", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(nullptr, "wdth", 0);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0400
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTextStyleAddFontVariationWithNormalization_0400
 * @tc.desc   testOHDrawingTextStyleAddFontVariationWithNormalization0400
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "aaaaaaaaaaa", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "0", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "xnbiWCIBVALCNAL;WINCLWMCL/AO;NCVNBAE.UH", 0);
    
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, "129418089134574", 0);
    OH_Drawing_TextStyleAddFontVariationWithNormalization(txtStyle1, nullptr, 0);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferUTF8(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRangeutf8 = nullptr;
    OH_Drawing_Range *range = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, 0, 3,
        &actualGlyphRangeutf8, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRangeutf8 != nullptr);
    size_t atart = OH_Drawing_GetStartFromRange(range);
    size_t end = OH_Drawing_GetEndFromRange(range);
    NAPI_ASSERT_NO_MES(atart == 0);
    NAPI_ASSERT_NO_MES(end == NIGHT);
    size_t atartActualGlyph = OH_Drawing_GetStartFromRange(actualGlyphRangeutf8);
    size_t endActualGlyph = OH_Drawing_GetEndFromRange(actualGlyphRangeutf8);
    NAPI_ASSERT_NO_MES(atartActualGlyph == 0);
    NAPI_ASSERT_NO_MES(endActualGlyph == THREE);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferUTF16(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRangeutf16 = nullptr;
    OH_Drawing_Range *range = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, 0, 3,
        &actualGlyphRangeutf16, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRangeutf16 != nullptr);
    size_t atart = OH_Drawing_GetStartFromRange(range);
    size_t end = OH_Drawing_GetEndFromRange(range);
    NAPI_ASSERT_NO_MES(atart == 0);
    NAPI_ASSERT_NO_MES(end == THREE);
    size_t atartActualGlyph = OH_Drawing_GetStartFromRange(actualGlyphRangeutf16);
    size_t endActualGlyph = OH_Drawing_GetEndFromRange(actualGlyphRangeutf16);
    NAPI_ASSERT_NO_MES(atartActualGlyph == 0);
    NAPI_ASSERT_NO_MES(endActualGlyph == THREE);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange01(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range01 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, INT_MIN,
        INT_MAX, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range01 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange02(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range02 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, INT_MAX,
        INT_MAX, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range02 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange03(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range03 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, INT_MAX,
        INT_MIN, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range03 != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange04(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range04 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, INT_MIN,
        INT_MIN, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range04 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferNullptr01(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *rangenull01 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(nullptr, 0, 3,
        &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(rangenull01 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferNullptr02(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *rangenull02 = OH_Drawing_TypographyGetCharacterRangeForGlyphRangeWithBuffer(typography, 0, 3,
        nullptr, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(rangenull02 != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer_0100
 * @tc.desc   testOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handle = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_TypographyHandlerPushTextStyle(handle, txtStyle1);
    std::string str = "你好我是鸿蒙测试";
    OH_Drawing_TypographyHandlerAddText(handle, str.c_str());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handle);
    OH_Drawing_TypographyLayout(typography, ONE_TWO_ZERO_ZERO);
    
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas *cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, 0, 0);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferUTF8(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferUTF16(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange01(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange02(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange03(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferRange04(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferNullptr01(typography, env);
    GetOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBufferNullptr02(typography, env);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferUTF8(OH_Drawing_Typography* typography,
                                                                              napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, 0, TWO_ZERO,
        &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange != nullptr);
    size_t atart = OH_Drawing_GetStartFromRange(range);
    size_t end = OH_Drawing_GetEndFromRange(range);
    NAPI_ASSERT_NO_MES(atart == 0);
    NAPI_ASSERT_NO_MES(end == SEVEN);
    size_t atartActualGlyph = OH_Drawing_GetStartFromRange(actualGlyphRange);
    size_t endActualGlyph = OH_Drawing_GetEndFromRange(actualGlyphRange);
    NAPI_ASSERT_NO_MES(atartActualGlyph == 0);
    NAPI_ASSERT_NO_MES(endActualGlyph == TWO_ONE);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferUTF16(OH_Drawing_Typography* typography,
                                                                               napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, 0, TWO_ZERO,
        &actualGlyphRange, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange != nullptr);
    size_t atart = OH_Drawing_GetStartFromRange(range);
    size_t end = OH_Drawing_GetEndFromRange(range);
    NAPI_ASSERT_NO_MES(atart == 0);
    NAPI_ASSERT_NO_MES(end == EIGHT);
    size_t atartActualGlyph = OH_Drawing_GetStartFromRange(actualGlyphRange);
    size_t endActualGlyph = OH_Drawing_GetEndFromRange(actualGlyphRange);
    NAPI_ASSERT_NO_MES(atartActualGlyph == 0);
    NAPI_ASSERT_NO_MES(endActualGlyph == EIGHT);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange01(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range01 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, INT_MIN,
        INT_MIN, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range01 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange02(OH_Drawing_Typography* typography,
                                                                                 napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range02 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, INT_MAX,
        INT_MIN, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range02 != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange03(OH_Drawing_Typography* typography,
                                                                                 napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range03 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, INT_MIN,
        INT_MAX, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range03 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange04(OH_Drawing_Typography* typography,
                                                                                 napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *range04 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, INT_MAX,
        INT_MAX, &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range04 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferNullptr01(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *rangenull01 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(nullptr, 0, THREE,
        &actualGlyphRange, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(rangenull01 == nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferNullptr02(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_Range *actualGlyphRange = nullptr;
    OH_Drawing_Range *rangenull02 = OH_Drawing_TypographyGetGlyphRangeForCharacterRangeWithBuffer(typography, 0, THREE,
        nullptr, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(rangenull02 != nullptr);
    NAPI_ASSERT_NO_MES(actualGlyphRange == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer_0100
 * @tc.desc   testOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handle = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_TypographyHandlerPushTextStyle(handle, txtStyle1);
    std::string str = "你好我是鸿蒙测试";
    OH_Drawing_TypographyHandlerAddText(handle, str.c_str());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handle);
    OH_Drawing_TypographyLayout(typography, ONE_TWO_ZERO_ZERO);
    
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas *cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, 0, 0);
    
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferUTF8(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferUTF16(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange01(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange02(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange03(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferRange04(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferNullptr01(typography, env);
    GetOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBufferNullptr02(typography, env);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferUTF8(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(typography,
        1276, 0, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(range != nullptr);
    int position = OH_Drawing_GetPositionFromPositionAndAffinity(range);
    int affinity = OH_Drawing_GetAffinityFromPositionAndAffinity(range);
    DRAWING_LOGI("999 Wwangxiaolong position = %{public}f", position);
    DRAWING_LOGI("999 Wwangxiaolong position affinity = %{public}f", affinity);
    NAPI_ASSERT_NO_MES(position > 0);
    NAPI_ASSERT_NO_MES(affinity == 0);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferUTF16(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(typography,
        1276, 0, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range != nullptr);
    int position = OH_Drawing_GetPositionFromPositionAndAffinity(range);
    int affinity = OH_Drawing_GetAffinityFromPositionAndAffinity(range);
    NAPI_ASSERT_NO_MES(position > 0);
    NAPI_ASSERT_NO_MES(affinity == 0);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange01(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range01 = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(
        typography, INT_MAX, INT_MAX, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range01 != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange02(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range02 = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(
        typography, INT_MAX, INT_MIN, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range02 != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange03(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range03 = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(
        typography, INT_MIN, INT_MAX, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range03 != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange04(OH_Drawing_Typography* typography,
                                                                                   napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *range04 = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(
        typography, INT_MIN, INT_MIN, TEXT_ENCODING_UTF16);
    NAPI_ASSERT_NO_MES(range04 != nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferNullptr01(OH_Drawing_Typography* typography,
    napi_env env)
{
    napi_value result = nullptr;
    OH_Drawing_PositionAndAffinity *rangenull01 = OH_Drawing_TypographyGetCharacterPositionAtCoordinateWithBuffer(
        nullptr, 1276, 0, TEXT_ENCODING_UTF8);
    NAPI_ASSERT_NO_MES(rangenull01 == nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer_0100
 * @tc.desc   testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handle = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_TypographyHandlerPushTextStyle(handle, txtStyle1);
    std::string str = "你好我是鸿蒙测试";
    OH_Drawing_TypographyHandlerAddText(handle, str.c_str());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handle);
    OH_Drawing_TypographyLayout(typography, ONE_TWO_ZERO_ZERO);
    
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas *cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, 0, 0);
    
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferUTF8(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferUTF16(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange01(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange02(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange03(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferRange04(typography, env);
    GetOHDrawingTypographyGetCharacterPositionAtCoordinateWithBufferNullptr01(typography, env);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer_0100
 * @tc.desc   testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHEllipsisModalMultilineHead0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle1, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle1, ONE_ZERO_ZERO);
    OH_Drawing_SetTextStyleFontWeight(txtStyle1, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle1, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(txtStyle1, 1);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_ErrorCode code = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_ELLIPSIS_MODAL, ELLIPSIS_MODAL_MULTILINE_HEAD);
    NAPI_ASSERT_NO_MES(code == OH_DRAWING_SUCCESS);
    int sizeResult = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_ELLIPSIS_MODAL, &sizeResult);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(sizeResult == ELLIPSIS_MODAL_MULTILINE_HEAD);
    
    OH_Drawing_ErrorCode code2 = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_ELLIPSIS_MODAL, ELLIPSIS_MODAL_MULTILINE_MIDDLE);
    NAPI_ASSERT_NO_MES(code2 == OH_DRAWING_SUCCESS);
    int sizeResult2 = 0;
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_ELLIPSIS_MODAL, &sizeResult2);
    NAPI_ASSERT_NO_MES(errorCode2 == OH_DRAWING_SUCCESS);
    DRAWING_LOGI("999 wangxiaolong sizeResult2 = %{public}u", sizeResult2);
    NAPI_ASSERT_NO_MES(sizeResult2 == ELLIPSIS_MODAL_MULTILINE_MIDDLE);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHtextStyleAttriFontEdgingDetail(OH_Drawing_TextStyle* txtStyle, int num, napi_env env)
{
    napi_value result = nullptr;
    
    OH_Drawing_ErrorCode code = OH_Drawing_SetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_FONT_EDGING, num);
    NAPI_ASSERT_NO_MES(code == OH_DRAWING_SUCCESS);
    int sizeResult = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_FONT_EDGING, &sizeResult);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(sizeResult == num);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHTextStyleAttriFontEdging0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHTextStyleAttriFontEdging_0100
 * @tc.desc   testOHTextStyleAttriFontEdging0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHTextStyleAttriFontEdging0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    
    OHtextStyleAttriFontEdgingDetail(txtStyle1, 0, env);
    OHtextStyleAttriFontEdgingDetail(txtStyle1, ONE, env);
    OHtextStyleAttriFontEdgingDetail(txtStyle1, TWO, env);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingReleaseRangeBuffer0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingReleaseRangeBuffer_0100
 * @tc.desc   testOHDrawingReleaseRangeBuffer0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingReleaseRangeBuffer0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_ReleaseRangeBuffer(nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingFontFullDescriptorAttributeId0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingFontFullDescriptorAttributeId_0100
 * @tc.desc   testOHDrawingFontFullDescriptorAttributeId0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingFontFullDescriptorAttributeId0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontFullDescriptorAttributeId id0 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_PATH);
    OH_Drawing_FontFullDescriptorAttributeId id1 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_POSTSCRIPT_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id2 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_FULL_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id3 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_FAMILY_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id4 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_SUB_FAMILY_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id5 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_I_WEIGHT);
    OH_Drawing_FontFullDescriptorAttributeId id6 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_I_WIDTH);
    OH_Drawing_FontFullDescriptorAttributeId id7 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_I_ITALIC);
    OH_Drawing_FontFullDescriptorAttributeId id8 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_B_MONO);
    OH_Drawing_FontFullDescriptorAttributeId id9 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_B_SYMBOLIC);
    OH_Drawing_FontFullDescriptorAttributeId id10 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_LOCAL_POSTSCRIPT_NAME);
    DRAWING_LOGI("999 wangxiaolong id0 = %{public}u", id0);
    NAPI_ASSERT_NO_MES(id0 == ZERO);
    NAPI_ASSERT_NO_MES(id1 == ONE);
    NAPI_ASSERT_NO_MES(id2 == TWO);
    NAPI_ASSERT_NO_MES(id3 == THREE);
    NAPI_ASSERT_NO_MES(id4 == FOUR);
    NAPI_ASSERT_NO_MES(id5 == FIVE);
    NAPI_ASSERT_NO_MES(id6 == SIX);
    NAPI_ASSERT_NO_MES(id7 == SEVEN);
    NAPI_ASSERT_NO_MES(id8 == EIGHT);
    NAPI_ASSERT_NO_MES(id9 == NIGHT);
    NAPI_ASSERT_NO_MES(id10 == TEN);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingFontFullDescriptorAttributeId0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingFontFullDescriptorAttributeId_0200
 * @tc.desc   testOHDrawingFontFullDescriptorAttributeId0200
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingFontFullDescriptorAttributeId0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontFullDescriptorAttributeId id11 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_LOCAL_FULL_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id12 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_LOCAL_FAMILY_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id13 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_LOCAL_SUB_FAMILY_NAME);
    OH_Drawing_FontFullDescriptorAttributeId id14 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_VERSION);
    OH_Drawing_FontFullDescriptorAttributeId id15 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_MANUFACTURE);
    OH_Drawing_FontFullDescriptorAttributeId id16 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_COPYRIGHT);
    OH_Drawing_FontFullDescriptorAttributeId id17 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_TRADEMARK);
    OH_Drawing_FontFullDescriptorAttributeId id18 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_S_LICENSE);
    OH_Drawing_FontFullDescriptorAttributeId id19 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_AXIS);
    OH_Drawing_FontFullDescriptorAttributeId id20 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_O_VARIATION_INSTANCE);
    OH_Drawing_FontFullDescriptorAttributeId id21 =
        OH_Drawing_FontFullDescriptorAttributeId(FULL_DESCRIPTOR_ATTR_I_INDEX);
    NAPI_ASSERT_NO_MES(id11 == ONE_ONE);
    NAPI_ASSERT_NO_MES(id12 == ONE_TWO);
    NAPI_ASSERT_NO_MES(id13 == ONE_THREE);
    NAPI_ASSERT_NO_MES(id14 == ONE_FOUR);
    NAPI_ASSERT_NO_MES(id15 == ONE_FIVE);
    NAPI_ASSERT_NO_MES(id16 == ONE_SIX);
    NAPI_ASSERT_NO_MES(id17 == ONE_SEVEN);
    NAPI_ASSERT_NO_MES(id18 == ONE_EIGHT);
    NAPI_ASSERT_NO_MES(id19 == ONE_NINE);
    NAPI_ASSERT_NO_MES(id20 == TWO_ZERO);
    NAPI_ASSERT_NO_MES(id21 == TWO_ONE);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0100
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with valid parameters
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = THREE;
    double indentValues[THREE] = {10.0, 20.0, 30.0};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, indentValues, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleArray0100",
        "set LINE_HEAD_INDENT with %{public}zu values", arrayLen);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0100
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with valid parameters
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = THREE;
    double indentValues[THREE] = {10.0, 20.0, 30.0};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, indentValues, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    double* getArray = nullptr;
    size_t getLen = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &getArray, &getLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(getArray != nullptr);
    NAPI_ASSERT_NO_MES(getLen == arrayLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0100",
        "getLen: %{public}zu, values: %{public}f %{public}f %{public}f", getLen,
        getArray[0], getArray[1], getArray[2]);
    NAPI_ASSERT_NO_MES(getArray[0] == indentValues[0]);
    NAPI_ASSERT_NO_MES(getArray[1] == indentValues[1]);
    NAPI_ASSERT_NO_MES(getArray[2] == indentValues[2]);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    getArray = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0200
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with nullptr style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const size_t arrayLen = THREE;
    double indentValues[THREE] = {10.0, 20.0, 30.0};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(nullptr,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, indentValues, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleArray0200",
        "nullptr style returns errorCode: %{public}d", errorCode);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0200
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0200
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    double* getArray = nullptr;
    size_t getLen = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(nullptr,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &getArray, &getLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0200",
        "nullptr style returns errorCode: %{public}d", errorCode);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0300
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0300
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with invalid attribute id
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = ONE;
    double value = 10.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), &value, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleArray0300",
        "invalid id returns errorCode: %{public}d", errorCode);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0300
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0300
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with invalid attribute id
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double* getArray = nullptr;
    size_t getLen = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), &getArray, &getLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0300",
        "invalid id returns errorCode: %{public}d", errorCode);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0400
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0400
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with line tail indent
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = TWO;
    double tailValues[TWO] = {15.0, 25.0};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_TAIL_INDENT, tailValues, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    double* getArray = nullptr;
    size_t getLen = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_TAIL_INDENT, &getArray, &getLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(getArray != nullptr);
    NAPI_ASSERT_NO_MES(getLen == arrayLen);
    NAPI_ASSERT_NO_MES(getArray[0] == tailValues[0]);
    NAPI_ASSERT_NO_MES(getArray[1] == tailValues[1]);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleArray0400",
        "getLen: %{public}zu, values: %{public}f %{public}f", getLen, getArray[0], getArray[1]);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    getArray = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0400
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0400
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with line tail indent
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = TWO;
    double tailValues[TWO] = {15.0, 25.0};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_TAIL_INDENT, tailValues, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    double* getArray = nullptr;
    size_t getLen = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_TAIL_INDENT, &getArray, &getLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(getArray != nullptr);
    NAPI_ASSERT_NO_MES(getLen == arrayLen);
    NAPI_ASSERT_NO_MES(getArray[0] == tailValues[0]);
    NAPI_ASSERT_NO_MES(getArray[1] == tailValues[1]);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0400",
        "getLen: %{public}zu, values: %{public}f %{public}f", getLen, getArray[0], getArray[1]);
    NAPI_ASSERT_NO_MES(getArray[0] == tailValues[0]);
    NAPI_ASSERT_NO_MES(getArray[1] == tailValues[1]);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    getArray = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0500
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0500
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with unsupported attribute id
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = ONE;
    double value = 10.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &value, arrayLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleArray0500",
        "unsupported id returns errorCode: %{public}d", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0500
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0500
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with unsupported attribute id
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double* getArray = nullptr;
    size_t getLen = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &getArray, &getLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0500",
        "unsupported id returns errorCode: %{public}d", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0600
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0600
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray without prior set
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double* getArray = nullptr;
    size_t getLen = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &getArray, &getLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0600",
        "getLen without set: %{public}zu, getArray: %{public}p", getLen, getArray);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0700
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0700
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr arrayValue out param
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = ONE;
    double setValue = 10.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &setValue, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    size_t getLen = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, nullptr, &getLen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0700",
        "nullptr arrayValue returns errorCode: %{public}d", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0800
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0800
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr arrayLength out param
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const size_t arrayLen = ONE;
    double setValue = 10.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &setValue, arrayLen);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    double* getArray = nullptr;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, &getArray, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0800",
        "nullptr arrayLength returns errorCode: %{public}d", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0900
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0900
 * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with both out params nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetTypographyStyleAttributeDoubleArray(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_DA_LINE_HEAD_INDENT, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetTypographyStyleAttributeDoubleArray0900",
        "both out params nullptr returns errorCode: %{public}d", errorCode);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent_0100
 * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDouble with FIRST_LINE_HEAD_INDENT
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
napi_value OHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    const double indentValue = 50.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_FIRST_LINE_HEAD_INDENT, indentValue);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleFirstLineHeadIndent0100",
        "set FIRST_LINE_HEAD_INDENT value: %{public}f", indentValue);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    double getValue = 0.0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_FIRST_LINE_HEAD_INDENT, &getValue);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetTypographyStyleAttributeDoubleFirstLineHeadIndent0100",
        "get FIRST_LINE_HEAD_INDENT value: %{public}f", getValue);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    NAPI_ASSERT_NO_MES(getValue == indentValue);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
