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

#include "gtest/gtest.h"
#include "drawing_font_mgr.h"
#include "drawing_text_typography.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class OH_Drawing_FontMgrTest : public testing::Test {
};

/*
 * @tc.name: OH_Drawing_FontMgrTest001
 * @tc.desc: test for creating and destroying font manager.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest001, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest002
 * @tc.desc: test for getting family name.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest002, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    int count = OH_Drawing_FontMgrGetFamilyCount(mgr);
    EXPECT_TRUE(count > 0);

    char *familyName = OH_Drawing_FontMgrGetFamilyName(mgr, 0);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest003
 * @tc.desc: test for creating and destroying font style set by font mannager.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest003, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest004
 * @tc.desc: test for matching font family by family name.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest004, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrMatchFamily(mgr, matchFamilyName);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
}


/*
 * @tc.name: OH_Drawing_FontMgrTest005
 * @tc.desc: test for matching font typeface by family name and font style.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest005, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface *typeface = OH_Drawing_FontMgrMatchFamilyStyle(mgr, matchFamilyName, normalStyle);
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest006
 * @tc.desc: test for matching font typeface by family name, font style and specific character.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest006, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest007
 * @tc.desc: test for getting family name.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest007, Function | MediumTest | Level1)
{
    int count = OH_Drawing_FontMgrGetFamilyCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    char *familyName = OH_Drawing_FontMgrGetFamilyName(nullptr, 0);
    EXPECT_TRUE(familyName == nullptr);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest008
 * @tc.desc: test for matching family style.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest008, Function | MediumTest | Level1)
{
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(nullptr, 0);
    EXPECT_TRUE(fontStyleSet == nullptr);
    const char* matchFamilyName = "HarmonyOS-Sans";
    fontStyleSet = OH_Drawing_FontMgrMatchFamily(nullptr, matchFamilyName);
    EXPECT_TRUE(fontStyleSet == nullptr);

    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface *typeface = OH_Drawing_FontMgrMatchFamilyStyle(nullptr, matchFamilyName, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest009
 * @tc.desc: test for matching family style character.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest009, Function | MediumTest | Level1)
{
    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(nullptr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_TRUE(CharTypeface == nullptr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest010
 * @tc.desc: test for create a typeface for the given index.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest010, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_Typeface *typeface = OH_Drawing_FontStyleSetCreateTypeface(fontStyleSet, 0);
    EXPECT_NE(typeface, nullptr);
    typeface = OH_Drawing_FontStyleSetCreateTypeface(nullptr, 0);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest011
 * @tc.desc: test for get font style struct.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest011, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    char** styleName = nullptr;
    normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, 0, styleName);
    EXPECT_TRUE(normalStyle.weight == FONT_WEIGHT_400);
    OH_Drawing_FontStyleSetFreeStyleName(styleName);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrTest012
 * @tc.desc: test for get typeface by match style.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest012, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
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
}

/*
 * @tc.name: OH_Drawing_FontMgrTest013
 * @tc.desc: test for get font style set.
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontMgrTest, OH_Drawing_FontMgrTest013, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet* fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    int count = OH_Drawing_FontStyleSetCount(fontStyleSet);
    EXPECT_TRUE(count > 0);
    
    count = OH_Drawing_FontStyleSetCount(nullptr);
    EXPECT_TRUE(count == 0);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0100
 * @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null
 * @tc.desc: test for matching font is not a null pointer, but points to the default font, when bcp47 is a null pointer
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    OH_Drawing_Typeface *typeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, nullptr, 0, ' ');
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0200
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47
* @tc.desc: Test for matching font typeface with empty bcp47 array.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char* bcp47[] = {};
    OH_Drawing_Typeface *typeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        mgr, matchFamilyName, normalStyle, bcp47, 0, ' ');

    EXPECT_NE(typeface, nullptr);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0300
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900
* @tc.desc: Test for matching font typeface with weight 900.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_900;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0400
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100
* @tc.desc: Test for matching font typeface with weight 100.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0500
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1
* @tc.desc: Test for matching font typeface with width 1.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0600
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9
* @tc.desc: Test for matching font typeface with width 9.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0700
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique
* @tc.desc: Test for matching font typeface with style oblique.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0800
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull
* @tc.desc: Test for matching font typeface with familyName null.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0900
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue
* @tc.desc: Test for matching font typeface with familyName null.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue,
 TestSize.Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = OH_Drawing_FontWeight(99); // exceeding the defined max value
    abnormalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_0900
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue
* @tc.desc: Test for matching font typeface with familyName null.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue,
 TestSize.Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = nullptr;
    OH_Drawing_FontStyleStruct abnormalStyle;
    abnormalStyle.weight = FONT_WEIGHT_100; // exceeding the defined max value
    abnormalStyle.width = OH_Drawing_FontWidth(99);
    abnormalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    abnormalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1000
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200
* @tc.desc: Test for matching font typeface with weight 200.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1100
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300
* @tc.desc: Test for matching font typeface with weight 300.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1200
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400
* @tc.desc: Test for matching font typeface with weight 400.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1300
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500
* @tc.desc: Test for matching font typeface with weight 500.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_500;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1400
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600
* @tc.desc: Test for matching font typeface with weight 600.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_600;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1500
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700
* @tc.desc: Test for matching font typeface with weight 700.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_700;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1600
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800
* @tc.desc: Test for matching font typeface with weight 800.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_800;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1700
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1
* @tc.desc: Test for matching font typeface with width 1.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1800
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2
* @tc.desc: Test for matching font typeface with width 2.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_1900
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3
* @tc.desc: Test for matching font typeface with width 3.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2000
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4
* @tc.desc: Test for matching font typeface with width 4.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2100
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6
* @tc.desc: Test for matching font typeface with width 6.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_SEMI_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2200
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7
* @tc.desc: Test for matching font typeface with width 7.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2300
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8
* @tc.desc: Test for matching font typeface with width 8.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_EXTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2400
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9
* @tc.desc: Test for matching font typeface with width 9.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2500
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0
* @tc.desc: Test for matching font typeface with style 0.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2600
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1
* @tc.desc: Test for matching font typeface with style 1.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2700
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2
* @tc.desc: Test for matching font typeface with style 2.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2, Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_100;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2800
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0
* @tc.desc: Test for matching font typeface with weight 200 and style 0.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2900
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1
* @tc.desc: Test for matching font typeface with weight 200 and style 1.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_200;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3000
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2
* @tc.desc: Test for matching font typeface with weight 200 and style 2.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3100
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0
* @tc.desc: Test for matching font typeface with weight 300 and style 0.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_NORMAL;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_2900
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1
* @tc.desc: Test for matching font typeface with weight 300 and style 1.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_ITALIC;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
* @tc.number: SUB_GRAPHIC_NAPI_OH_Drawing_FontMgrMatchFamilyStyleCharacter_3000
* @tc.name: testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2
* @tc.desc: Test for matching font typeface with weight 300 and style 2.
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
HWTEST_F(OH_Drawing_FontMgrTest, testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2,
    Function | MediumTest | Level1)
{
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    const char* matchFamilyName = "HarmonyOS-Sans";
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_300;
    normalStyle.width = FONT_WIDTH_ULTRA_CONDENSED;
    normalStyle.slant = FONT_STYLE_OBLIQUE;

    const char *bcp47[] = {"zh-Hans", "zh-CN"};
    OH_Drawing_Typeface *CharTypeface = OH_Drawing_FontMgrMatchFamilyStyleCharacter(mgr, matchFamilyName,
                                                                                    normalStyle, bcp47, 1, ' ');
    EXPECT_NE(CharTypeface, nullptr);
    OH_Drawing_TypefaceDestroy(CharTypeface);

    OH_Drawing_FontMgrDestroy(mgr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS