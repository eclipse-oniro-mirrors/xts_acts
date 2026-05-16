/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/NativeDrawingFontMgrTest.h"
#include <cstring>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_font_mgr.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>
#include "include/NativeCopyStyleTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
/**
 * @tc.name   OHDrawingFontMgrTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0100
 * @tc.desc   test for creating and destroying font manager.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest001()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0200
 * @tc.desc   test for getting family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest002()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    int count = OH_Drawing_FontMgrGetFamilyCount(mgr);
    EXPECT_TRUE(count > 0);

    char* familyName = OH_Drawing_FontMgrGetFamilyName(mgr, FONT_INDEX_ZERO);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0300
 * @tc.desc   test for creating and destroying font style set by font mannager.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest003()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, FONT_INDEX_ZERO);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0400
 * @tc.desc   test for matching font family by family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest004()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrMatchFamily(mgr, matchFamilyName);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest005
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0500
 * @tc.desc   test for matching font typeface by family name and font style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest005()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyle(mgr, matchFamilyName, normalStyle);
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest006
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0600
 * @tc.desc   test for matching font typeface by family name, font style and specific character.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest006()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest007
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0700
 * @tc.desc   test for getting family name.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest007()
{
    int count = OH_Drawing_FontMgrGetFamilyCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    char* familyName = OH_Drawing_FontMgrGetFamilyName(nullptr, 0);
    EXPECT_TRUE(familyName == nullptr);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest008
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0800
 * @tc.desc   test for matching family style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest008()
{
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(nullptr, 0);
    EXPECT_TRUE(fontStyleSet == nullptr);
    const char* matchFamilyName = GetSystemDefaultFont();
    fontStyleSet = OH_Drawing_FontMgrMatchFamily(nullptr, matchFamilyName);
    EXPECT_TRUE(fontStyleSet == nullptr);

    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyle(nullptr, matchFamilyName, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest009
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0900
 * @tc.desc   test for matching family style character.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest009()
{
    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(nullptr, matchFamilyName, normalStyle, bcp47, 1, ' ');
    EXPECT_TRUE(CharTypeface == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest010
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1000
 * @tc.desc   test for create a typeface for the given index.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest010()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, FONT_INDEX_ZERO);
    OH_Drawing_Typeface* typeface = OH_Drawing_FontStyleSetCreateTypeface(fontStyleSet, FONT_INDEX_ZERO);
    EXPECT_NE(typeface, nullptr);
    typeface = OH_Drawing_FontStyleSetCreateTypeface(nullptr, 0);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest011
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1100
 * @tc.desc   test for get font style struct.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest011()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, FONT_INDEX_ZERO);
    OH_Drawing_FontStyleStruct normalStyle;
    char** styleName = nullptr;
    normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, FONT_INDEX_ZERO, styleName);
    EXPECT_TRUE(normalStyle.weight == FONT_WEIGHT_400);
    OH_Drawing_FontStyleSetFreeStyleName(styleName);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest012
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1200
 * @tc.desc   test for get typeface by match style.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest012()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, FONT_INDEX_ZERO);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface* typeface = OH_Drawing_FontStyleSetMatchStyle(fontStyleSet, normalStyle);
    EXPECT_NE(typeface, nullptr);

    typeface = OH_Drawing_FontStyleSetMatchStyle(nullptr, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontMgrTest013
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1300
 * @tc.desc   test for get font style set.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontMgrTest013()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, FONT_INDEX_ZERO);
    int count = OH_Drawing_FontStyleSetCount(fontStyleSet);
    EXPECT_TRUE(count > 0);

    count = OH_Drawing_FontStyleSetCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0100
 * @tc.desc   test for matching font is not a null pointer, but points to the default font, when bcp47 is a null pointer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, nullptr, FONT_INDEX_ZERO, FONT_MATCH_CHARACTER);
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0200
 * @tc.desc   Test for matching font typeface with empty bcp47 array.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = {};
    OH_Drawing_Typeface* typeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, FONT_INDEX_ZERO, FONT_MATCH_CHARACTER);

    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight900
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0300
 * @tc.desc   Test for matching font typeface with weight 900.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight900()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_900;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight100
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0400
 * @tc.desc   Test for matching font typeface with weight 100.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight100()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth1
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0500
 * @tc.desc   Test for matching font typeface with width 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth9
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0600
 * @tc.desc   Test for matching font typeface with width 9.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth9()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0700
 * @tc.desc   Test for matching font typeface with style oblique.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0800
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_WEIGHT_0100
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = OH_Drawing_FontWeight(FONT_WEIGHT_EXCEED_MAX); // exceeding the defined max value
    abnormalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0900
 * @tc.desc   Test for matching font typeface with familyName null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = FONT_WEIGHT_100; // exceeding the defined max value
    abnormalStyle.width = OH_Drawing_FontWidth(FONT_WIDTH_EXCEED_MAX);
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;
    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface =
        OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName, abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1000
 * @tc.desc   Test for matching font typeface with weight 200.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1100
 * @tc.desc   Test for matching font typeface with weight 300.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight400
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1200
 * @tc.desc   Test for matching font typeface with weight 400.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight400()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight500
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1300
 * @tc.desc   Test for matching font typeface with weight 500.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight500()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_500;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight600
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1400
 * @tc.desc   Test for matching font typeface with weight 600.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight600()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_600;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight700
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1500
 * @tc.desc   Test for matching font typeface with weight 700.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight700()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_700;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight800
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1600
 * @tc.desc   Test for matching font typeface with weight 800.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight800()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_800;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1700
 * @tc.desc   Test for matching font typeface with width 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth2
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1800
 * @tc.desc   Test for matching font typeface with width 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth3
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1900
 * @tc.desc   Test for matching font typeface with width 3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth3()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth4
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2000
 * @tc.desc   Test for matching font typeface with width 4.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth4()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth6
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2100
 * @tc.desc   Test for matching font typeface with width 6.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth6()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth7
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2200
 * @tc.desc   Test for matching font typeface with width 7.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth7()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth8
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2300
 * @tc.desc   Test for matching font typeface with width 8.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth8()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2400
 * @tc.desc   Test for matching font typeface with width 9.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle0
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2500
 * @tc.desc   Test for matching font typeface with style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle1
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2600
 * @tc.desc   Test for matching font typeface with style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle2
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2700
 * @tc.desc   Test for matching font typeface with style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2800
 * @tc.desc   Test for matching font typeface with weight 200 and style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CHARACTER_WEIGHT_200_STYLE_0100
 * @tc.desc   Test for matching font typeface with weight 200 and style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CHARACTER_WEIGHT_200_STYLE_0200
 * @tc.desc   Test for matching font typeface with weight 200 and style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_3100
 * @tc.desc   Test for matching font typeface with weight 300 and style 0.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2900
 * @tc.desc   Test for matching font typeface with weight 300 and style 1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_3000
 * @tc.desc   Test for matching font typeface with weight 300 and style 2.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2()
{
    OH_Drawing_FontMgr* mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = GetSystemDefaultFont();
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char* bcp47[] = { "zh-Hans", "zh-CN" };
    OH_Drawing_Typeface* CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, BCP47_ARRAY_SIZE, FONT_MATCH_CHARACTER);
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);
    OH_Drawing_FontMgrDestroy(mgr);
    return TEST_SUCCESS_CODE;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS