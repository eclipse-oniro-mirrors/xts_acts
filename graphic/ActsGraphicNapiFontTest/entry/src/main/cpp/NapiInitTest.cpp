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
#include <array>
#include "include/NativeCopyStyleTest.h"
#include "include/NativeDrawingFontMgrTest.h"
#include "include/NativeFontTest.h"
#include "include/NativeTextLineTest.h"
#include "include/NativeTextRunTest.h"
#include "include/NativeTypographyAutoSpaceTest.h"
#include "include/NativeTypographyUpdateTest.h"
#include "include/NativeUndefinedGlyphDisplayTest.h"
#include "include/OHDrawingTypographyTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;
static constexpr size_t FONT_MGR_MATCH_FAMILY_STYLE_HANDLER_COUNT = 34;
static constexpr size_t TEXT_LINE_TEXT_HANDLER_COUNT = 25;
static constexpr size_t EXECUTE_RUN_TEST_HANDLER_COUNT = 9;

using CaseFn = int (*)();

enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65,
    CASE_NUM_66,
    CASE_NUM_67,
    CASE_NUM_68,
    CASE_NUM_69,
    CASE_NUM_70,
    CASE_NUM_71,
    CASE_NUM_72,
    CASE_NUM_73,
    CASE_NUM_74,
    CASE_NUM_75,
    CASE_NUM_76,
    CASE_NUM_77,
    CASE_NUM_78,
    CASE_NUM_79,
    CASE_NUM_80,
    CASE_NUM_81,
    CASE_NUM_82,
    CASE_NUM_83,
    CASE_NUM_84,
    CASE_NUM_85,
    CASE_NUM_86,
    CASE_NUM_87,
    CASE_NUM_88,
    CASE_NUM_89,
    CASE_NUM_90,
};

using NapiFn = int (*)();

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<NapiFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}


// OHDrawingCopyTextStyle functions
static napi_value OHDrawingCopyTextStyle(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTextStyle001();
                break;
            case CASE_NUM_1:
                result = OHOS::OHDrawingCopyTextStyle002();
                break;
            case CASE_NUM_2:
                result = OHOS::OHDrawingCopyTextStyle003();
                break;
            case CASE_NUM_3:
                result = OHOS::OHDrawingCopyTextStyle004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCopyTextShadow functions
static napi_value OHDrawingCopyTextShadow(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTextShadow001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCopyTypographyStyle functions
static napi_value OHDrawingCopyTypographyStyle(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTypographyStyle001();
                break;
            case CASE_NUM_1:
                result = OHOS::OHDrawingCopyTypographyStyle002();
                break;
            case CASE_NUM_2:
                result = OHOS::OHDrawingCopyTypographyStyle003();
                break;
            case CASE_NUM_3:
                result = OHOS::OHDrawingCopyTypographyStyle004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingFontMgrTest helper functions
static int ExecuteFontMgrTestCase(int32_t caseNum)
{
    switch (caseNum) {
        case CASE_NUM_0:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest001();
        case CASE_NUM_1:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest002();
        case CASE_NUM_2:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest003();
        case CASE_NUM_3:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest004();
        case CASE_NUM_4:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest005();
        case CASE_NUM_5:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest006();
        case CASE_NUM_6:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest007();
        case CASE_NUM_7:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest008();
        case CASE_NUM_8:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest009();
        case CASE_NUM_9:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest010();
        case CASE_NUM_10:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest011();
        case CASE_NUM_11:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest012();
        case CASE_NUM_12:
            return OHOS::Rosen::Drawing::OHDrawingFontMgrTest013();
        default:
            return RESULT_ERROR;
    }
}

// OHDrawingFontMgrTest functions
static napi_value OHDrawingFontMgrTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = ExecuteFontMgrTestCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingFontMgrMatchFamilyStyleCharacter helper functions
static int ExecuteFontMgrMatchFamilyStyleCharacterCase(int32_t caseNum)
{
    static constexpr std::array<NapiFn, FONT_MGR_MATCH_FAMILY_STYLE_HANDLER_COUNT> handlers = {
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight900,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight100,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth1,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth9,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight400,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight500,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight600,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight700,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight800,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth2,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth3,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth4,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth6,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth7,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth8,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle0,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle1,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle2,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1,
        OHOS::Rosen::Drawing::TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2,
    };
    return DispatchByCaseNum(caseNum, handlers);
}

// OHDrawingFontMgrMatchFamilyStyleCharacter functions
static napi_value OHDrawingFontMgrMatchFamilyStyleCharacter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = ExecuteFontMgrMatchFamilyStyleCharacterCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// NativeFontTest_FontMeasureText functions
static napi_value NativeFontTest_FontMeasureText(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::NativeFontTestFontMeasureText015();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::NativeFontTestFontMeasureText016();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::NativeFontTestFontMeasureText017();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// NativeDrawingRegisterFontTest functions
static napi_value NativeDrawingRegisterFontTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::NativeDrawingRegisterFontTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::NativeDrawingRegisterFontTest002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OH_Drawing_FontCollectionTest functions
static napi_value OH_Drawing_FontCollectionTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingFontCollectionTest001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyLargeValueTest functions
static napi_value OHDrawingTypographyLargeValueTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest016();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest026();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest027();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest042();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTestWithIndent();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCreateTextTab functions
static napi_value OHDrawingCreateTextTab(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab003();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TypographyTest functions
static napi_value TypographyTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::TypographyTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::TypographyTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::TypographyTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::TypographyTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::TypographyTest005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// FontGetTextPath functions
static napi_value FontGetTextPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::FontGetTextPath001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::FontGetTextPath002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::FontGetTextPath003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::FontGetTextPath004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::FontGetTextPath005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TextLineTest helper functions
static int ExecuteTextLineTestCase(int32_t caseNum)
{
    static constexpr std::array<NapiFn, TEXT_LINE_TEXT_HANDLER_COUNT> handlers = {
        OHOS::Rosen::Drawing::TextLineTest001, OHOS::Rosen::Drawing::TextLineTest002,
        OHOS::Rosen::Drawing::TextLineTest003, OHOS::Rosen::Drawing::TextLineTest004,
        OHOS::Rosen::Drawing::TextLineTest005, OHOS::Rosen::Drawing::TextLineTest006,
        OHOS::Rosen::Drawing::TextLineTest007, OHOS::Rosen::Drawing::TextLineTest008,
        OHOS::Rosen::Drawing::TextLineTest009, OHOS::Rosen::Drawing::TextLineTest010,
        OHOS::Rosen::Drawing::TextLineTest011, OHOS::Rosen::Drawing::TextLineTest012,
        OHOS::Rosen::Drawing::TextLineTest013, OHOS::Rosen::Drawing::TextLineTest014,
        OHOS::Rosen::Drawing::TextLineTest015, OHOS::Rosen::Drawing::TextLineTest016,
        OHOS::Rosen::Drawing::TextLineTest017, OHOS::Rosen::Drawing::TextLineTest018,
        OHOS::Rosen::Drawing::TextLineTest019, OHOS::Rosen::Drawing::TextLineTest020,
        OHOS::Rosen::Drawing::TextLineTest021, OHOS::Rosen::Drawing::TextLineTest022,
        OHOS::Rosen::Drawing::TextLineTest023, OHOS::Rosen::Drawing::TextLineTest024,
        OHOS::Rosen::Drawing::TextLineTest025,
    };
    return DispatchByCaseNum(caseNum, handlers);
}

// TextLineTest functions
static napi_value TextLineTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = ExecuteTextLineTestCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RunTest helper functions
static int ExecuteRunTestCase(int32_t caseNum)
{
    static constexpr std::array<NapiFn, EXECUTE_RUN_TEST_HANDLER_COUNT> handlers = {
        OHOS::Rosen::Drawing::RunTest001, OHOS::Rosen::Drawing::RunTest002, OHOS::Rosen::Drawing::RunTest003,
        OHOS::Rosen::Drawing::RunTest004, OHOS::Rosen::Drawing::RunTest005, OHOS::Rosen::Drawing::RunTest006,
        OHOS::Rosen::Drawing::RunTest007, OHOS::Rosen::Drawing::RunTest008, OHOS::Rosen::Drawing::RunTest009,
    };
    return DispatchByCaseNum(caseNum, handlers);
}

// RunTest functions
static napi_value RunTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = ExecuteRunTestCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyTextAutoSpaceTest functions
static napi_value OHDrawingSetTypographyTextAutoSpaceTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTextUndefinedGlyphDisplay functions
static napi_value OHDrawingSetTextUndefinedGlyphDisplay(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyUpdate functions
static napi_value OHDrawingTypographyUpdate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyTextTrailingSpaceOptimized functions
static napi_value OHDrawingSetTypographyTextTrailingSpaceOptimized(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextTrailingSpaceOptimized001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyVerticalAlignment functions
static napi_value OHDrawingSetTypographyVerticalAlignment(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyVerticalAlignment001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyTest helper functions
static int ExecuteOHDrawingTypographyTestCasePart1(int32_t caseNum)
{
    static constexpr std::array<NapiFn, 30> handlers = {
        OHOS::Rosen::Drawing::OHDrawingTypographyTest001,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest002,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest003,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest004,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest005,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest006,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest007,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest008,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest009,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest010,
        nullptr,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest012,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest013,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest014,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest015,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest016,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest017,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest018,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest019,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest020,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest021,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest022,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest023,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest024,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest025,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest026,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest027,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest028,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest029,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest030,
    };
    return DispatchByCaseNum(caseNum, handlers);
}

static int ExecuteOHDrawingTypographyTestCasePart2(int32_t caseNum)
{
    static constexpr std::array<NapiFn, 30> handlers = {
        OHOS::Rosen::Drawing::OHDrawingTypographyTest031, OHOS::Rosen::Drawing::OHDrawingTypographyTest032,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest033, OHOS::Rosen::Drawing::OHDrawingTypographyTest034,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest035, OHOS::Rosen::Drawing::OHDrawingTypographyTest036,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest037, OHOS::Rosen::Drawing::OHDrawingTypographyTest038,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest039, OHOS::Rosen::Drawing::OHDrawingTypographyTest040,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest041, OHOS::Rosen::Drawing::OHDrawingTypographyTest042,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest043, OHOS::Rosen::Drawing::OHDrawingTypographyTest044,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest045, OHOS::Rosen::Drawing::OHDrawingTypographyTest046,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest047, OHOS::Rosen::Drawing::OHDrawingTypographyTest048,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest049, OHOS::Rosen::Drawing::OHDrawingTypographyTest050,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest051, nullptr,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest053, OHOS::Rosen::Drawing::OHDrawingTypographyTest054,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest055, OHOS::Rosen::Drawing::OHDrawingTypographyTest056,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest057, OHOS::Rosen::Drawing::OHDrawingTypographyTest058,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest059, OHOS::Rosen::Drawing::OHDrawingTypographyTest060,
    };
    return DispatchByCaseNum(caseNum - CASE_NUM_30, handlers);
}

static int ExecuteOHDrawingTypographyTestCasePart3(int32_t caseNum)
{
    static constexpr std::array<NapiFn, 31> handlers = {
        OHOS::Rosen::Drawing::OHDrawingTypographyTest061,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest062,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest063,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest064,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest065,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest066,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest067,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest068,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest069,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest070,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest071,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest072,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest073,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest074,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest075,
        nullptr,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest077,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest078,
        nullptr,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest080,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest081,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest082,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest083,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest084,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest085,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest086,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest102,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest103,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest104,
        OHOS::Rosen::Drawing::OHDrawingTypographyTest105,
        OHOS::Rosen::Drawing::OHDrawingTypographyTestWithIndent,
    };
    return DispatchByCaseNum(caseNum - CASE_NUM_60, handlers);
}

static int ExecuteOHDrawingTypographyTestCase(int32_t caseNum)
{
    if (caseNum >= CASE_NUM_0 && caseNum < CASE_NUM_30) {
        return ExecuteOHDrawingTypographyTestCasePart1(caseNum);
    } else if (caseNum >= CASE_NUM_30 && caseNum < CASE_NUM_60) {
        return ExecuteOHDrawingTypographyTestCasePart2(caseNum);
    } else if (caseNum >= CASE_NUM_60 && caseNum <= CASE_NUM_90) {
        return ExecuteOHDrawingTypographyTestCasePart3(caseNum);
    }
    return RESULT_ERROR;
}

// OHDrawingTypographyTest functions (91 functions)
static napi_value OHDrawingTypographyTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = ExecuteOHDrawingTypographyTestCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingAddTextStyleDecoration functions
static napi_value OHDrawingAddTextStyleDecoration(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingAddTextStyleDecoration001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTextLineEnumerateCaretOffsets functions
static napi_value OHDrawingTextLineEnumerateCaretOffsets(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTextLineEnumerateCaretOffsets001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// testOHDrawingUnregisterFont functions
static napi_value testOHDrawingUnregisterFont(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::TestOHDrawingUnregisterFont001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::TestOHDrawingUnregisterFont002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

// Merge all descriptors
static const napi_property_descriptor g_graphicDescriptors[] = {
    DECL_NAPI_DESC(OHDrawingCopyTextStyle),
    DECL_NAPI_DESC(OHDrawingCopyTextShadow),
    DECL_NAPI_DESC(OHDrawingCopyTypographyStyle),
    DECL_NAPI_DESC(OHDrawingFontMgrTest),
    DECL_NAPI_DESC(OHDrawingFontMgrMatchFamilyStyleCharacter),
    DECL_NAPI_DESC(NativeFontTest_FontMeasureText),
    DECL_NAPI_DESC(NativeDrawingRegisterFontTest),
    DECL_NAPI_DESC(OH_Drawing_FontCollectionTest),
    DECL_NAPI_DESC(OHDrawingTypographyLargeValueTest),
    DECL_NAPI_DESC(OHDrawingCreateTextTab),
    DECL_NAPI_DESC(TypographyTest),
    DECL_NAPI_DESC(FontGetTextPath),
    DECL_NAPI_DESC(TextLineTest),
    DECL_NAPI_DESC(RunTest),
    DECL_NAPI_DESC(OHDrawingSetTypographyTextAutoSpaceTest),
    DECL_NAPI_DESC(OHDrawingSetTextUndefinedGlyphDisplay),
    DECL_NAPI_DESC(OHDrawingTypographyUpdate),
    DECL_NAPI_DESC(OHDrawingSetTypographyTextTrailingSpaceOptimized),
    DECL_NAPI_DESC(OHDrawingSetTypographyVerticalAlignment),
    DECL_NAPI_DESC(OHDrawingTypographyTest),
    DECL_NAPI_DESC(OHDrawingAddTextStyleDecoration),
    DECL_NAPI_DESC(OHDrawingTextLineEnumerateCaretOffsets),
    DECL_NAPI_DESC(testOHDrawingUnregisterFont),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_graphicDescriptors) / sizeof(g_graphicDescriptors[0]), g_graphicDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module graphicdrawingModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "graphicdrawing",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&graphicdrawingModule);
}
