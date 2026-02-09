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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVEDRAWINGFONTMGRTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVEDRAWINGFONTMGRTEST_H

// Font manager test constants
constexpr int FONT_WEIGHT_EXCEED_MAX = 99;
constexpr int FONT_WIDTH_EXCEED_MAX = 99;
constexpr int FONT_INDEX_ZERO = 0;
constexpr int BCP47_ARRAY_SIZE = 1;
constexpr char FONT_MATCH_CHARACTER = ' ';

namespace OHOS {
namespace Rosen {
namespace Drawing {
int OHDrawingFontMgrTest001();
int OHDrawingFontMgrTest002();
int OHDrawingFontMgrTest003();
int OHDrawingFontMgrTest004();
int OHDrawingFontMgrTest005();
int OHDrawingFontMgrTest006();
int OHDrawingFontMgrTest007();
int OHDrawingFontMgrTest008();
int OHDrawingFontMgrTest009();
int OHDrawingFontMgrTest010();
int OHDrawingFontMgrTest011();
int OHDrawingFontMgrTest012();
int OHDrawingFontMgrTest013();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight900();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight100();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth1();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth9();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight400();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight500();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight600();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight700();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight800();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth2();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth3();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth4();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth6();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth7();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWidth8();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle0();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle1();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterStyle2();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1();
int TestOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVEDRAWINGFONTMGRTEST_H
