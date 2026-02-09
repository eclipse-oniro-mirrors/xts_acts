'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Content } from '@ohos.arkui.node'
import { Resource } from '@ohos.arkui.component'

export class LibUtil {
  static {
    loadLibrary("entry")
  }

  native TestEventInfoGetPressedTime001(a: Content): void;

  native TestEventInfoGetResultTouch(): string[];

  native testPostFrameCallback(a: Content): void;

  native testButtonBackgroundColor001(): number;

  native testButtonBackgroundColor002(): number;

  native testButtonBackgroundColor003(): number;

  native testButtonFontColor001(): number;

  native testButtonFontColor002(): number;

  native testButtonFontColor003(): number;

  native testButtonFontSize001(): number;

  native testButtonFontSize002(): number;

  native testButtonFontSize003(): number;

  native testButtonFontSize004(): number;

  native testButtonFontWeight001(): number;

  native testButtonFontWeight002(): number;

  native testButtonFontWeight003(): number;

  native testButtonFontWeight004(): number;

  native testButtonFontWeight005(): number;

  native testButtonFontWeight006(): number;

  native testButtonFontWeight007(): number;

  native testButtonFontWeight008(): number;

  native testButtonFontWeight009(): number;

  native testButtonFontWeight010(): number;

  native testButtonFontWeight011(): number;

  native testButtonFontWeight012(): number;

  native testButtonFontWeight013(): number;

  native testButtonFontWeight014(): number;

  native testButtonFontWeight015(): number;

  native testButtonFontWeight016(): number;

  native testButtonType001(): number;

  native testButtonType002(): number;

  native testButtonType003(): number;

  native testButtonType004(): number;

  native testButtonType005(): number;

  native textTextStyleGraphic001(): number;

  native testCheckboxMark001(): number;

  native testCheckboxMark002(): number;

  native testCheckboxMark003(): number;

  native testCheckboxMark004(): number;

  native testCheckboxMark005(): number;

  native testCheckboxMark006(): number;

  native testCheckboxSelect001(): number;

  native testCheckboxSelect002(): number;

  native testCheckboxSelect003(): number;

  native testCheckboxSelectedColor001(): number;

  native testCheckboxSelectedColor002(): number;

  native testCheckboxSelectedColor003(): number;

  native testCheckboxShape001(): number;

  native testCheckboxShape002(): number;

  native testCheckboxShape003(): number;

  native testCheckboxUnselectedColor001(): number;

  native testCheckboxUnselectedColor002(): number;

  native testCheckboxUnselectedColor003(): number;

  native testCommonAttrsAlign001(): number;

  native testCommonAttrsAlign002(): number;

  native testCommonAttrsAlign003(): number;

  native testCommonAttrsAlign004(): number;

  native testCommonAttrsAlign005(): number;

  native testCommonAttrsAlign006(): number;

  native testCommonAttrsAlign007(): number;

  native testCommonAttrsAlign008(): number;

  native testCommonAttrsAlign009(): number;

  native testCommonAttrsAlign010(): number;

  native testCommonAttrsAlign011(): number;

  native testCommonAttrsAlignContent001(): number;

  native testCommonAttrsAlignContent002(): number;

  native testCommonAttrsAlignContent003(): number;

  native testCommonAttrsAlignContent004(): number;

  native testCommonAttrsAlignContent005(): number;

  native testCommonAttrsAlignContent006(): number;

  native testCommonAttrsAlignContent007(): number;

  native testCommonAttrsAlignContent008(): number;

  native testCommonAttrsAlignContent009(): number;

  native testCommonAttrsAlignItems001(): number;

  native testCommonAttrsAlignItems002(): number;

  native testCommonAttrsAlignItems003(): number;

  native testCommonAttrsAlignItems004(): number;

  native testCommonAttrsAlignItems005(): number;

  native testCommonAttrsAlignItems006(): number;

  native testCommonAttrsAlignSelf001(): number;

  native testCommonAttrsAlignSelf002(): number;

  native testCommonAttrsAlignSelf003(): number;

  native testCommonAttrsAlignSelf004(): number;

  native testCommonAttrsAlignSelf005(): number;

  native testCommonAttrsAlignSelf006(): number;

  native testCommonAttrsFlexBasis001(): number;

  native testCommonAttrsFlexBasis002(): number;

  native testCommonAttrsFlexGrow001(): number;

  native testCommonAttrsFlexGrow002(): number;

  native testCommonAttrsFlexShrink001(): number;

  native testCommonAttrsFlexShrink002(): number;

  native testCommonAttrsJustifyContent001(): number;

  native testCommonAttrsJustifyContent002(): number;

  native testCommonAttrsJustifyContent003(): number;

  native testCommonAttrsJustifyContent004(): number;

  native testCommonAttrsJustifyContent005(): number;

  native testCommonAttrsJustifyContent006(): number;

  native testCommonAttrsJustifyContent007(): number;

  native testCommonAttrsJustifyContent008(): number;

  native testCommonAttrsJustifyContent009(): number;

  native testCommonAttrsJustifyContent010(): number;

  native testCommonAttrsJustifyContent011(): number;

  native testCommonAttrsJustifyContent012(): number;

  native testCommonAttrsDirection001(): number;

  native testCommonAttrsDirection002(): number;

  native testCommonAttrsDirection003(): number;

  native testCommonAttrsDirection004(): number;

  native testCommonAttrsDirection005(): number;

  native testCommonAttrsOpacity001(): number;

  native testCommonAttrsOpacity002(): number;

  native testCommonAttrsOpacity003(): number;

  native testCommonAttrsOpacity004(): number;

  native testCommonAttrsOpacity005(): number;

  native testCommonAttrsOpacity006(): number;

  native testCommonAttrsInvert001(): number;

  native testCommonAttrsInvert002(): number;

  native testCommonAttrsInvert003(): number;

  native testCommonAttrsInvert004(): number;

  native testCommonAttrsInvert005(): number;

  native testCommonAttrsInvert006(): number;

  native testCommonAttrsContrast001(): number;

  native testCommonAttrsContrast002(): number;

  native testCommonAttrsContrast003(): number;

  native testCommonAttrsContrast004(): number;

  native testCommonAttrsContrast005(): number;

  native testCommonAttrsContrast006(): number;

  native testCommonAttrsSepia001(): number;

  native testCommonAttrsSepia002(): number;

  native testCommonAttrsSepia003(): number;

  native testCommonAttrsSepia004(): number;

  native testCommonAttrsSepia005(): number;

  native testCommonAttrsSepia006(): number;

  native testCommonAttrsGrayscale001(): number;

  native testCommonAttrsGrayscale002(): number;

  native testCommonAttrsGrayscale003(): number;

  native testCommonAttrsGrayscale004(): number;

  native testCommonAttrsGrayscale005(): number;

  native testCommonAttrsGrayscale006(): number;

  native testCommonAttrsBackgroundColor001(): number;

  native testCommonAttrsBackgroundColor002(): number;

  native testCommonAttrsBackgroundColor003(): number;

  native testCommonAttrsBorderColor001(): number;

  native testCommonAttrsBorderColor002(): number;

  native testCommonAttrsBorderRadius001(): number;

  native testCommonAttrsBorderRadius002(): number;

  native testCommonAttrsBorderRadius003(): number;

  native testCommonAttrsBorderRadius004(): number;

  native testCommonAttrsBorderRadius005(): number;

  native testCommonAttrsBorderRadius006(): number;

  native testCommonAttrsBorderStyle001(): number;

  native testCommonAttrsBorderStyle002(): number;

  native testCommonAttrsBorderStyle003(): number;

  native testCommonAttrsBorderStyle004(): number;

  native testCommonAttrsBorderStyle005(): number;

  native testCommonAttrsBorderStyle006(): number;

  native testCommonAttrsBorderWidth001(): number;

  native testCommonAttrsBorderWidth002(): number;

  native testCommonAttrsBorderWidth003(): number;

  native testCommonAttrsBorderWidth004(): number;

  native testCommonAttrsHeight001(): number;

  native testCommonAttrsHeight002(): number;

  native testCommonAttrsHeight003(): number;

  native testCommonAttrsPosition001(): number;

  native testCommonAttrsPosition002(): number;

  native testCommonAttrsWidth001(): number;

  native testCommonAttrsWidth002(): number;

  native testCommonAttrsWidth003(): number;

  native testCommonAttrsTransform001(): number;

  native testCommonAttrsTransform002(): number;

  native testCommonAttrsTransform003(): number;

  native testCommonAttrsTransform004(): number;

  native testCommonAttrsMask001(): number;

  native testCommonAttrsMask002(): number;

  native testCommonAttrsMask003(): number;

  native testCommonAttrsMask004(): number;

  native testCommonAttrsMask005(): number;

  native testCommonAttrsMask006(): number;

  native testCommonAttrsMask007(): number;

  native testCommonAttrsMask008(): number;

  native testCommonAttrsMask009(): number;

  native testCommonAttrsMask010(): number;

  native testCommonAttrsMask011(): number;

  native testCommonAttrsMask012(): number;

  native testCommonAttrsMask013(): number;

  native testCommonAttrsMask014(): number;

  native testCommonAttrsMask015(): number;

  native testCommonAttrsMask016(): number;

  native testCommonAttrsBlendMode001(): number;

  native testCommonAttrsBlendMode002(): number;

  native testCommonAttrsBlendMode003(): number;

  native testCommonAttrsBlendMode004(): number;

  native testCommonAttrsBlendMode005(): number;

  native testCommonAttrsBlendMode006(): number;

  native testCommonAttrsBlendMode007(): number;

  native testCommonAttrsBlendMode008(): number;

  native testCommonAttrsBlendMode009(): number;

  native testCommonAttrsBlendMode010(): number;

  native testCommonAttrsBlendMode011(): number;

  native testCommonAttrsBlendMode012(): number;

  native testCommonAttrsBlendMode013(): number;

  native testCommonAttrsBlendMode014(): number;

  native testCommonAttrsBlendMode015(): number;

  native testCommonAttrsBlendMode016(): number;

  native testCommonAttrsBlendMode017(): number;

  native testCommonAttrsBlendMode018(): number;

  native testCommonAttrsBlendMode019(): number;

  native testCommonAttrsBlendMode020(): number;

  native testCommonAttrsBlendMode021(): number;

  native testCommonAttrsBlendMode022(): number;

  native testCommonAttrsBlendMode023(): number;

  native testCommonAttrsBlendMode024(): number;

  native testCommonAttrsBlendMode025(): number;

  native testCommonAttrsBlendMode026(): number;

  native testCommonAttrsBlendMode027(): number;

  native testCommonAttrsBlendMode028(): number;

  native testCommonAttrsBlendMode029(): number;

  native testCommonAttrsBlendMode030(): number;

  native testCommonAttrsBlendMode031(): number;

  native testCommonAttrsBlendMode032(): number;

  native testCommonAttrsBlendMode033(): number;

  native testCommonAttrsBlendMode034(): number;

  native testCommonAttrsBlendMode035(): number;

  native testCommonAttrsBlendMode036(): number;

  native testCommonAttrsBlendMode037(): number;

  native testCommonAttrsBlendMode038(): number;

  native testCommonAttrsBlendMode039(): number;

  native testCommonAttrsBlendMode040(): number;

  native testCommonAttrsBlendMode041(): number;

  native testCommonAttrsBlendMode042(): number;

  native testCommonAttrsBlendMode043(): number;

  native testCommonAttrsBlendMode044(): number;

  native testCommonAttrsBlendMode045(): number;

  native testCommonAttrsBlendMode046(): number;

  native testCommonAttrsBlendMode047(): number;

  native testCommonAttrsBlendMode048(): number;

  native testCommonAttrsBlendMode049(): number;

  native testCommonAttrsBlendMode050(): number;

  native testCommonAttrsBlendMode051(): number;

  native testCommonAttrsBlendMode052(): number;

  native testCommonAttrsBlendMode053(): number;

  native testCommonAttrsBlendMode054(): number;

  native testCommonAttrsBlendMode055(): number;

  native testCommonAttrsBlendMode056(): number;

  native testCommonAttrsBlendMode057(): number;

  native testCommonAttrsBlendMode058(): number;

  native testCommonAttrsBlendMode059(): number;

  native testCommonAttrsBlendMode060(): number;

  native testCommonAttrsBlendMode061(): number;

  native testCommonAttrsForegroundBlurStyle001(): number;

  native testCommonAttrsForegroundBlurStyle002(): number;

  native testCommonAttrsForegroundBlurStyle003(): number;

  native testCommonAttrsForegroundBlurStyle004(): number;

  native testCommonAttrsForegroundBlurStyle005(): number;

  native testCommonAttrsForegroundBlurStyle006(): number;

  native testCommonAttrsForegroundBlurStyle007(): number;

  native testCommonAttrsForegroundBlurStyle008(): number;

  native testCommonAttrsForegroundBlurStyle009(): number;

  native testCommonAttrsForegroundBlurStyle010(): number;

  native testCommonAttrsForegroundBlurStyle011(): number;

  native testCommonAttrsForegroundBlurStyle012(): number;

  native testCommonAttrsForegroundBlurStyle013(): number;

  native testCommonAttrsForegroundBlurStyle014(): number;

  native testCommonAttrsForegroundBlurStyle015(): number;

  native testCommonAttrsForegroundBlurStyle016(): number;

  native testCommonAttrsForegroundBlurStyle017(): number;

  native testCommonAttrsForegroundBlurStyle018(): number;

  native testCommonAttrsForegroundBlurStyle019(): number;

  native testCommonAttrsForegroundBlurStyle020(): number;

  native testCommonAttrsForegroundBlurStyle021(): number;

  native testCommonAttrsForegroundBlurStyle022(): number;

  native testCommonAttrsForegroundBlurStyle023(): number;

  native testCommonAttrsForegroundBlurStyle024(): number;

  native testCommonAttrsForegroundBlurStyle025(): number;

  native testCommonAttrsForegroundBlurStyle026(): number;

  native testCommonAttrsForegroundBlurStyle027(): number;

  native testCommonAttrsForegroundBlurStyle028(): number;

  native testCommonAttrsForegroundBlurStyle029(): number;

  native testCommonAttrsForegroundBlurStyle030(): number;

  native testCommonAttrsForegroundBlurStyle031(): number;

  native testCommonAttrsForegroundBlurStyle032(): number;

  native testStackAlign001(): number;

  native testStackAlign002(): number;

  native testStackAlign003(): number;

  native testStackAlign004(): number;

  native testStackAlign005(): number;

  native testStackAlign006(): number;

  native testStackAlign007(): number;

  native testStackAlign008(): number;

  native testStackAlign009(): number;

  native testStackAlign010(): number;

  native testStackAlign011(): number;

  native testStackAlign012(): number;

  native testStackAlign013(): number;

  native testStackBackgroundBlurStyle001(): number;

  native testStackBackgroundBlurStyle002(): number;

  native testStackBackgroundBlurStyle003(): number;

  native testStackBackgroundBlurStyle004(): number;

  native testStackBackgroundBlurStyle005(): number;

  native testStackBackgroundBlurStyle006(): number;

  native testStackBackgroundBlurStyle007(): number;

  native testStackBackgroundBlurStyle008(): number;

  native testStackBackgroundBlurStyle009(): number;

  native testStackBackgroundBlurStyle010(): number;

  native testStackBackgroundBlurStyle011(): number;

  native testStackBackgroundBlurStyle012(): number;

  native testStackBackgroundBlurStyle013(): number;

  native testStackBackgroundBlurStyle014(): number;

  native testStackBackgroundColor001(): number;

  native testStackBackgroundColor002(): number;

  native testStackBackgroundColor003(): number;

  native testStackBackgroundImage001(): number;

  native testStackBackgroundImage002(): number;

  native testStackBackgroundImage003(): number;

  native testStackBackgroundImage004(): number;

  native testStackBackgroundImage005(): number;

  native testStackBackgroundImage006(): number;

  native testStackBackgroundImage007(): number;

  native testStackBackgroundImagePosition001(): number;

  native testStackBackgroundImagePosition002(): number;

  native testStackBackgroundImageSize001(): number;

  native testStackBackgroundImageSize002(): number;

  native testStackBackgroundImageSize003(): number;

  native testStackBorderColor001(): number;

  native testStackBorderColor002(): number;

  native testStackBorderColor003(): number;

  native testStackBorderColor004(): number;

  native testStackBorderColor005(): number;

  native testStackBorderColor006(): number;

  native testStackBorderRadius001(): number;

  native testStackBorderRadius002(): number;

  native testStackBorderRadius003(): number;

  native testStackBorderRadius004(): number;

  native testStackBorderRadius005(): number;

  native testStackBorderRadius006(): number;

  native testStackBorderRadius007(): number;

  native testStackBorderRadius008(): number;

  native testStackBorderStyle001(): number;

  native testStackBorderStyle002(): number;

  native testStackBorderStyle003(): number;

  native testStackBorderStyle004(): number;

  native testStackBorderStyle005(): number;

  native testStackBorderStyle006(): number;

  native testStackBorderWidth001(): number;

  native testStackBorderWidth002(): number;

  native testStackBorderWidth003(): number;

  native testStackBorderWidth004(): number;

  native testStackBorderWidth005(): number;

  native testStackBorderWidth006(): number;

  native testStackBrightness001(): number;

  native testStackBrightness002(): number;

  native testStackBrightness003(): number;

  native testStackBrightness004(): number;

  native testStackBrightness005(): number;

  native testStackBrightness006(): number;

  native testStackBrightness007(): number;

  native testStackClip001(): number;

  native testStackClip002(): number;

  native testStackClip003(): number;

  native testStackClip004(): number;

  native testStackClip005(): number;

  native testStackClip006(): number;

  native testStackClip007(): number;

  native testStackClip008(): number;

  native testStackClip009(): number;

  native testStackClip010(): number;

  native testStackClip011(): number;

  native testStackClip012(): number;

  native testStackClip013(): number;

  native testStackClip014(): number;

  native testStackClip015(): number;

  native testStackHeight001(): number;

  native testStackHeight002(): number;

  native testStackHeight003(): number;

  native testStackId001(): number;

  native testStackLinearGradient001(): number;

  native testStackLinearGradient002(): number;

  native testStackLinearGradient003(): number;

  native testStackLinearGradient004(): number;

  native testStackLinearGradient005(): number;

  native testStackLinearGradient006(): number;

  native testStackLinearGradient007(): number;

  native testStackLinearGradient008(): number;

  native testStackLinearGradient009(): number;

  native testStackLinearGradient010(): number;

  native testStackMargin001(): number;

  native testStackMargin002(): number;

  native testStackMargin003(): number;

  native testStackMargin004(): number;

  native testStackOpacity001(): number;

  native testStackOpacity002(): number;

  native testStackOpacity003(): number;

  native testStackOpacity004(): number;

  native testStackOpacity005(): number;

  native testStackOpacity006(): number;

  native testStackPosition001(): number;

  native testStackPosition002(): number;

  native testStackRotate001(): number;

  native testStackRotate002(): number;

  native testStackSaturate001(): number;

  native testStackSaturate002(): number;

  native testStackSaturate003(): number;

  native testStackSaturate004(): number;

  native testStackSaturate005(): number;

  native testStackSaturate006(): number;

  native testStackScale001(): number;

  native testStackScale002(): number;

  native testStackScale003(): number;

  native testStackShadow001(): number;

  native testStackShadow002(): number;

  native testStackShadow003(): number;

  native testStackShadow004(): number;

  native testStackShadow005(): number;

  native testStackShadow006(): number;

  native testStackShadow007(): number;

  native testStackTransform001(): number;

  native testStackTransform002(): number;

  native testStackTransition001(): number;

  native testStackTransition002(): number;

  native testStackTransition003(): number;

  native testStackTransition004(): number;

  native testStackTransition005(): number;

  native testStackTransition006(): number;

  native testStackTransition007(): number;

  native testStackTransition008(): number;

  native testStackTransition009(): number;

  native testStackTransition010(): number;

  native testStackTransition011(): number;

  native testStackTransition012(): number;

  native testStackTransition013(): number;

  native testStackTransition014(): number;

  native testStackTransition015(): number;

  native testStackTransition016(): number;

  native testStackTransition017(): number;

  native testStackTransition018(): number;

  native testStackTransition019(): number;

  native testStackTransition020(): number;

  native testStackTransition021(): number;

  native testStackTransition022(): number;

  native testStackTransition023(): number;

  native testStackTransition024(): number;

  native testStackTransition025(): number;

  native testStackTransition026(): number;

  native testStackTransition027(): number;

  native testStackTransition028(): number;

  native testStackTransition029(): number;

  native testStackTransition030(): number;

  native testStackTransition031(): number;

  native testStackTransition032(): number;

  native testStackTransition033(): number;

  native testStackTransition034(): number;

  native testStackTransition035(): number;

  native testStackTransition036(): number;

  native testStackTransition037(): number;

  native testStackTransition038(): number;

  native testStackTransition039(): number;

  native testStackTransition040(): number;

  native testStackTransition041(): number;

  native testStackTransition042(): number;

  native testStackTransition043(): number;

  native testStackTransition044(): number;

  native testStackTransition045(): number;

  native testStackTransition046(): number;

  native testStackTransition047(): number;

  native testStackTransition048(): number;

  native testStackTransition049(): number;

  native testStackTransition050(): number;

  native testStackTransition051(): number;

  native testStackTransition052(): number;

  native testStackTransition053(): number;

  native testStackTransition054(): number;

  native testStackTransition055(): number;

  native testStackTransition056(): number;

  native testStackTransition057(): number;

  native testStackTransition058(): number;

  native testStackTransition059(): number;

  native testStackTransition060(): number;

  native testStackTransition061(): number;

  native testStackTransition062(): number;

  native testStackTransition063(): number;

  native testStackTransition064(): number;

  native testStackTransition065(): number;

  native testStackTranslate001(): number;

  native testStackTranslate002(): number;

  native testStackWidth001(): number;

  native testStackWidth002(): number;

  native testStackWidth003(): number;

  native testToggleBackgroundColor001(): number;

  native testToggleBackgroundColor002(): number;

  native testToggleBackgroundColor003(): number;

  native testToggleClip001(): number;

  native testToggleClip002(): number;

  native testToggleClip003(): number;

  native testToggleClip004(): number;

  native testToggleClip005(): number;

  native testToggleClip006(): number;

  native testToggleClip007(): number;

  native testToggleClip008(): number;

  native testToggleClip009(): number;

  native testToggleClip010(): number;

  native testToggleClip011(): number;

  native testToggleClip012(): number;

  native testToggleClip013(): number;

  native testToggleClip014(): number;

  native testToggleClip015(): number;

  native testToggleFocusable001(): number;

  native testToggleFocusable002(): number;

  native testToggleFocusable003(): number;

  native testToggleHeight001(): number;

  native testToggleHeight002(): number;

  native testToggleHeight003(): number;

  native testToggleMargin001(): number;

  native testToggleMargin002(): number;

  native testToggleMargin003(): number;

  native testToggleMargin004(): number;

  native testToggleMargin005(): number;

  native testToggleMargin006(): number;

  native testTogglePosition001(): number;

  native testTogglePosition002(): number;

  native testTogglePosition003(): number;

  native testToggleSelectedColor001(): number;

  native testToggleSelectedColor002(): number;

  native testToggleSelectedColor003(): number;

  native testToggleSwitchPointColor001(): number;

  native testToggleSwitchPointColor002(): number;

  native testToggleSwitchPointColor003(): number;

  native testToggleWidth001(): number;

  native testToggleWidth002(): number;

  native testToggleWidth003(): number;

  native testToggleSwitch001(): number;

  native testSwiperAutoPlay001(): number;

  native testSwiperAutoPlay002(): number;

  native testSwiperAutoPlay003(): number;

  native testSwiperBackgroundColor001(): number;

  native testSwiperBackgroundColor002(): number;

  native testSwiperBackgroundColor003(): number;

  native testSwiperBackgroundImage001(): number;

  native testSwiperBackgroundImage002(): number;

  native testSwiperBackgroundImage003(): number;

  native testSwiperBackgroundImage004(): number;

  native testSwiperBackgroundImage005(): number;

  native testSwiperBackgroundImage006(): number;

  native testSwiperBackgroundImage007(): number;

  native testSwiperClip001(): number;

  native testSwiperClip002(): number;

  native testSwiperClip003(): number;

  native testSwiperClip004(): number;

  native testSwiperClip005(): number;

  native testSwiperClip006(): number;

  native testSwiperClip007(): number;

  native testSwiperClip008(): number;

  native testSwiperClip009(): number;

  native testSwiperClip010(): number;

  native testSwiperClip011(): number;

  native testSwiperClip012(): number;

  native testSwiperClip013(): number;

  native testSwiperClip014(): number;

  native testSwiperClip015(): number;

  native testSwiperCurve001(): number;

  native testSwiperCurve002(): number;

  native testSwiperCurve003(): number;

  native testSwiperCurve004(): number;

  native testSwiperCurve005(): number;

  native testSwiperCurve006(): number;

  native testSwiperCurve007(): number;

  native testSwiperCurve008(): number;

  native testSwiperCurve009(): number;

  native testSwiperCurve010(): number;

  native testSwiperCurve011(): number;

  native testSwiperCurve012(): number;

  native testSwiperCurve013(): number;

  native testSwiperCurve014(): number;

  native testSwiperDisableSwipe001(): number;

  native testSwiperDisableSwipe002(): number;

  native testSwiperDisableSwipe003(): number;

  native testSwiperDisplayArrow001(): number;

  native testSwiperDisplayArrow002(): number;

  native testSwiperDisplayArrow003(): number;

  native testSwiperDisplayArrow004(): number;

  native testSwiperDisplayCount001(): number;

  native testSwiperDisplayCount002(): number;

  native testSwiperDisplayCount004(): number;

  native testSwiperDuration001(): number;

  native testSwiperDuration002(): number;

  native testSwiperDuration003(): number;

  native testSwiperHeight001(): number;

  native testSwiperHeight002(): number;

  native testSwiperHeight003(): number;

  native testSwiperIndex001(): number;

  native testSwiperIndex002(): number;

  native testSwiperIndex003(): number;

  native testSwiperIndicator001(): number;

  native testSwiperIndicator002(): number;

  native testSwiperIndicator003(): number;

  native testSwiperIndicator004(): number;

  native testSwiperIndicator005(): number;

  native testSwiperIndicator006(): number;

  native testSwiperIndicator007(): number;

  native testSwiperIndicator008(): number;

  native testSwiperIndicator009(): number;

  native testSwiperIndicator010(): number;

  native testSwiperIndicator011(): number;

  native testSwiperInterval001(): number;

  native testSwiperInterval002(): number;

  native testSwiperInterval003(): number;

  native testSwiperItemSpace001(): number;

  native testSwiperItemSpace002(): number;

  native testSwiperItemSpace003(): number;

  native testSwiperLoop001(): number;

  native testSwiperLoop002(): number;

  native testSwiperLoop003(): number;

  native testSwiperPosition001(): number;

  native testSwiperPosition002(): number;

  native testSwiperVertical001(): number;

  native testSwiperVertical002(): number;

  native testSwiperVertical003(): number;

  native testSwiperWidth001(): number;

  native testSwiperWidth002(): number;

  native testSwiperWidth003(): number;

  native testSwiperCachedCount001(): number;

  native testSwiperCachedCount002(): number;

  native testSwiperEffectMode001(): number;

  native testSwiperEffectMode002(): number;

  native testSwiperEffectMode003(): number;

  native testSwiperEffectMode004(): number;

  native testSwiperEffectMode005(): number;

  native testSwiperEffectMode006(): number;

  native testSwiperEffectMode007(): number;

  native testSwiperNextMargin001(): number;

  native testSwiperNextMargin002(): number;

  native testSwiperNextMargin003(): number;

  native testSwiperNextMargin004(): number;

  native testSwiperNextMargin005(): number;

  native testSwiperNextMargin006(): number;

  native testSwiperNextMargin007(): number;

  native testSwiperPrevMargin001(): number;

  native testSwiperPrevMargin002(): number;

  native testSwiperPrevMargin003(): number;

  native testSwiperPrevMargin004(): number;

  native testSwiperPrevMargin005(): number;

  native testSwiperPrevMargin006(): number;

  native testSwiperPrevMargin007(): number;

  native testSwiperNestedScroll001(): number;

  native testSwiperNestedScroll002(): number;

  native testSwiperNestedScroll003(): number;

  native testSwiperNestedScroll004(): number;

  native testSwiperNestedScroll005(): number;

  native testSwiperNestedScroll006(): number;

  native testSwiperChangeIndex001(): number;

  native testSwiperChangeIndex002(): number;

  native testSwiperChangeIndex003(): number;

  native testSwiperChangeIndex004(): number;

  native testSwiperChangeIndex005(): number;

  native testImageHeight001(): number;

  native testImageHeight002(): number;

  native testImageHeight003(): number;

  native testTextHeight001(): number;

  native testTextHeight002(): number;

  native testTextHeight003(): number;

  native testScrollHeight001(): number;

  native testScrollHeight002(): number;

  native testScrollHeight003(): number;

  native testTextWidth001(): number;

  native testTextWidth002(): number;

  native testTextWidth003(): number;

  native testImageWidth001(): number;

  native testImageWidth002(): number;

  native testImageWidth003(): number;

  native testImageDraggable001(): number;

  native testImageDraggable002(): number;

  native testImageDraggable003(): number;

  native testImageDraggable004(): number;

  native testImageDraggable005(): number;

  native testImageRenderMode001(): number;

  native testImageRenderMode002(): number;

  native testImageRenderMode003(): number;

  native testImageRenderMode004(): number;

  native testImageRenderMode005(): number;

  native testImageFitOriginalSize001(): number;

  native testImageFitOriginalSize002(): number;

  native testImageFitOriginalSize003(): number;

  native testImageFitOriginalSize004(): number;

  native testImageFitOriginalSize005(): number;

  native testImageFillColor001(): number;

  native testImageFillColor002(): number;

  native testImageFillColor003(): number;

  native testImageFillColor004(): number;

  native testImageResizable001(): number;

  native testImageResizable002(): number;

  native testImageResizable003(): number;

  native testImageResizable004(): number;

  native testImageResizable005(): number;

  native testImageAlt001(): number;

  native testImageAutoResize001(): number;

  native testImageAutoResize002(): number;

  native testImageAutoResize003(): number;

  native testImageAutoResize004(): number;

  native testImageBackgroundColor001(): number;

  native testImageBackgroundColor002(): number;

  native testImageBlur001(): number;

  native testImageBlur002(): number;

  native testImageBlur003(): number;

  native testImageBlur004(): number;

  native testImageBorderColor001(): number;

  native testImageBorderColor002(): number;

  native testImageBorderColor003(): number;

  native testImageBorderColor004(): number;

  native testImageBorderRadius001(): number;

  native testImageBorderRadius002(): number;

  native testImageBorderRadius003(): number;

  native testImageBorderRadius004(): number;

  native testImageBorderRadius005(): number;

  native testImageBorderRadius006(): number;

  native testImageBorderRadius007(): number;

  native testImageBorderRadius008(): number;

  native testImageBorderStyle001(): number;

  native testImageBorderStyle002(): number;

  native testImageBorderStyle003(): number;

  native testImageBorderStyle004(): number;

  native testImageBorderStyle005(): number;

  native testImageBorderStyle006(): number;

  native testImageBorderStyle007(): number;

  native testImageBorderWidth001(): number;

  native testImageBorderWidth002(): number;

  native testImageBorderWidth003(): number;

  native testImageBorderWidth004(): number;

  native testImageBorderWidth005(): number;

  native testImageBorderWidth006(): number;

  native testImageBrightness001(): number;

  native testImageBrightness002(): number;

  native testImageBrightness003(): number;

  native testImageBrightness004(): number;

  native testImageBrightness005(): number;

  native testImageBrightness006(): number;

  native testImageBrightness007(): number;

  native testImageClip001(): number;

  native testImageClip002(): number;

  native testImageClip003(): number;

  native testImageClip004(): number;

  native testImageClip005(): number;

  native testImageClip006(): number;

  native testImageClip007(): number;

  native testImageColorFilter001(): number;

  native testImageColorFilter002(): number;

  native testImageColorFilter003(): number;

  native testImageInterpolation001(): number;

  native testImageInterpolation002(): number;

  native testImageInterpolation003(): number;

  native testImageInterpolation004(): number;

  native testImageInterpolation005(): number;

  native testImageInterpolation006(): number;

  native testImageLinearGradient001(): number;

  native testImageLinearGradient002(): number;

  native testImageLinearGradient003(): number;

  native testImageLinearGradient004(): number;

  native testImageLinearGradient005(): number;

  native testImageLinearGradient006(): number;

  native testImageLinearGradient007(): number;

  native testImageLinearGradient008(): number;

  native testImageLinearGradient009(): number;

  native testImageLinearGradient010(): number;

  native testImageLinearGradient011(): number;

  native testImageLinearGradient012(): number;

  native testImageLinearGradient013(): number;

  native testImageLinearGradient014(): number;

  native testImageLinearGradient015(): number;

  native testImageLinearGradient016(): number;

  native testImageLinearGradient017(): number;

  native testImageLinearGradient018(): number;

  native testImageLinearGradient019(): number;

  native testImageLinearGradient020(): number;

  native testImageLinearGradient021(): number;

  native testImageLinearGradient022(): number;

  native testImageObjectFit001(): number;

  native testImageObjectFit002(): number;

  native testImageObjectFit003(): number;

  native testImageObjectFit004(): number;

  native testImageObjectFit005(): number;

  native testImageObjectFit006(): number;

  native testImageObjectFit007(): number;

  native testImageObjectFit008(): number;

  native testImageObjectFit009(): number;

  native testImageObjectFit010(): number;

  native testImageObjectFit011(): number;

  native testImageObjectFit012(): number;

  native testImageObjectFit013(): number;

  native testImageObjectFit014(): number;

  native testImageObjectFit015(): number;

  native testImageObjectFit016(): number;

  native testImageObjectFit017(): number;

  native testImageObjectFit018(): number;

  native testImageObjectRepeat001(): number;

  native testImageObjectRepeat002(): number;

  native testImageObjectRepeat003(): number;

  native testImageObjectRepeat004(): number;

  native testImageObjectRepeat005(): number;

  native testImageObjectRepeat006(): number;

  native testImageOpacity001(): number;

  native testImageOpacity002(): number;

  native testImageOpacity003(): number;

  native testImageOpacity004(): number;

  native testImageOpacity005(): number;

  native testImageOpacity006(): number;

  native testImageRadialGradient001(): number;

  native testImageRadialGradient002(): number;

  native testImageRadialGradient003(): number;

  native testImageRadialGradient004(): number;

  native testImageRadialGradient005(): number;

  native testImageRadialGradient006(): number;

  native testImageRadialGradient007(): number;

  native testImageRadialGradient008(): number;

  native testImageRotate001(): number;

  native testImageRotate002(): number;

  native testImageRotate003(): number;

  native testImageRotate004(): number;

  native testImageSaturate001(): number;

  native testImageSaturate002(): number;

  native testImageSaturate003(): number;

  native testImageSaturate004(): number;

  native testImageSaturate005(): number;

  native testImageSaturate006(): number;

  native testImageSaturate007(): number;

  native testImageScale001(): number;

  native testImageScale002(): number;

  native testImageScale003(): number;

  native testImageScale004(): number;

  native testImageShadow001(): number;

  native testImageShadow002(): number;

  native testImageShadow003(): number;

  native testImageShadow004(): number;

  native testImageShadow005(): number;

  native testImageShadow006(): number;

  native testImageSrc001(): number;

  native testImageSrc002(): number;

  native testImageSrc003(): number;

  native testImageSrc004(): number;

  native testImageSrc005(): number;

  native testImageSweepGradient001(): number;

  native testImageSweepGradient002(): number;

  native testImageSweepGradient003(): number;

  native testImageSweepGradient004(): number;

  native testImageSweepGradient005(): number;

  native testImageSweepGradient006(): number;

  native testImageTransform001(): number;

  native testImageTransform002(): number;

  native testImageTransform003(): number;

  native testImageTransform004(): number;

  native testImageTransform005(): number;

  native testImageTranslate001(): number;

  native testImageTranslate002(): number;

  native testImageTranslate003(): number;

  native testImageTranslate004(): number;

  native testImageTranslate005(): number;

  native testScrollWidth001(): number;

  native testScrollWidth002(): number;

  native testScrollWidth003(): number;

  native testScrollPosition001(): number;

  native testScrollPosition002(): number;

  native testImagePosition001(): number;

  native testImagePosition002(): number;

  native testListScrollBarColor001(): number;

  native testListScrollBarColor002(): number;

  native testListScrollBarColor003(): number;

  native testListScrollBarWidth001(): number;

  native testListScrollBarWidth002(): number;

  native testListScrollBarWidth003(): number;

  native testListScrollBarWidth004(): number;

  native testListScrollBarWidth005(): number;

  native testListSpace001(): number;

  native testListSpace002(): number;

  native testListSpace003(): number;

  native testListSpace004(): number;

  native testListSpace005(): number;

  native testListAlignListItem001(): number;

  native testListAlignListItem002(): number;

  native testListAlignListItem003(): number;

  native testListAlignListItem004(): number;

  native testListAlignListItem005(): number;

  native testListAlignListItem006(): number;

  native testListListNodeAdapter001(): number;

  native testListListNodeAdapter002(): number;

  native testListListNodeAdapter003(): number;

  native testListInitialIndex001(): number;

  native testListInitialIndex002(): number;

  native testListInitialIndex003(): number;

  native testListInitialIndex004(): number;

  native testListInitialIndex005(): number;

  native testListDivider001(): number;

  native testListDivider002(): number;

  native testListDivider003(): number;

  native testListDivider004(): number;

  native testListDivider005(): number;

  native testListItemGroupSetHeader001(): number;

  native testListItemGroupSetHeader002(): number;

  native testListItemGroupSetHeader003(): number;

  native testListItemGroupSetFooter001(): number;

  native testListItemGroupSetFooter002(): number;

  native testListItemGroupSetFooter003(): number;

  native testListItemGroupSetDivider001(): number;

  native testListItemGroupSetDivider002(): number;

  native testListItemGroupSetDivider003(): number;

  native testListItemGroupSetDivider004(): number;

  native testListItemGroupSetDivider005(): number;

  native testListItemSwipeAction001(): number;

  native testListItemSwipeAction002(): number;

  native testListItemSwipeAction003(): number;

  native testListItemSwipeAction004(): number;

  native testListItemSwipeAction005(): number;

  native testListItemSwipeAction006(): number;

  native testListScrollEdge001(): number;

  native testListScrollEdge002(): number;

  native testListScrollEdge003(): number;

  native testListScrollEdge004(): number;

  native testListScrollEdge005(): number;

  native testListScrollEdge006(): number;

  native testListScrollEdge007(): number;

  native testListChildrenMainSize001(): number;

  native testListChildrenMainSize002(): number;

  native testListChildrenMainSize003(): number;

  native testListChildrenMainSize004(): number;

  native testListChildrenMainSize005(): number;

  native testListChildrenMainSize006(): number;

  native testListChildrenMainSize007(): number;

  native testListChildrenMainSize008(): number;

  native testListChildrenMainSize009(): number;

  native testListChildrenMainSize010(): number;

  native testListChildrenMainSize011(): number;

  native testListChildrenMainSize012(): number;

  native testListChildrenMainSize013(): number;

  native testListChildrenMainSize014(): number;

  native testListChildrenMainSize015(): number;

  native testListChildrenMainSize016(): number;

  native testListChildrenMainSize017(): number;

  native testListChildrenMainSize018(): number;

  native testListChildrenMainSize019(): number;

  native testListChildrenMainSize020(): number;

  native testListChildrenMainSize021(): number;

  native testListChildrenMainSize022(): number;

  native testListChildrenMainSize023(): number;

  native testListChildrenMainSize024(): number;

  native testListChildrenMainSize025(): number;

  native testListChildrenMainSize026(): number;

  native testListNestedScroll001(): number;

  native testListNestedScroll002(): number;

  native testListNestedScroll003(): number;

  native testListNestedScroll004(): number;

  native testListNestedScroll005(): number;

  native testListNestedScroll006(): number;

  native testListNestedScroll007(): number;

  native testListBackgroundColor001(): number;

  native testListBlur001(): number;

  native testListBlur002(): number;

  native testListSwipeActionCreate(): number;

  native testListSwipeActionSetActionAreaDistance001(): number;

  native testListSwipeActionOptionCreate(): number;

  native testListSwipeActionItem006(): number;

  native testListSwipeActionItem007(): number;

  native testListSwipeActionOptionEdgeEffect(): number;

  native testListBorderColor001(): number;

  native testListBorderColor002(): number;

  native testListBorderColor003(): number;

  native testListBorderRadius001(): number;

  native testListBorderRadius002(): number;

  native testListBorderRadius003(): number;

  native testListBorderRadius004(): number;

  native testListBorderRadius005(): number;

  native testListBorderWidth001(): number;

  native testListBorderWidth002(): number;

  native testListBorderWidth003(): number;

  native testListBorderWidth004(): number;

  native testListBorderWidth005(): number;

  native testListBrightness001(): number;

  native testListBrightness002(): number;

  native testListBrightness003(): number;

  native testListBrightness004(): number;

  native testListClip001(): number;

  native testListClip002(): number;

  native testListClip003(): number;

  native testListClip004(): number;

  native testListClip005(): number;

  native testListClip006(): number;

  native testListClip007(): number;

  native testListEdgeEffect001(): number;

  native testListEdgeEffect002(): number;

  native testListEdgeEffect003(): number;

  native testListEnableScrollInteraction001(): number;

  native testListEnableScrollInteraction002(): number;

  native testListEnableScrollInteraction003(): number;

  native testListFriction001(): number;

  native testListFriction002(): number;

  native testListHeight001(): number;

  native testListHeight002(): number;

  native testListHeight003(): number;

  native testListLinearGradient001(): number;

  native testListLinearGradient002(): number;

  native testListLinearGradient003(): number;

  native testListLinearGradient004(): number;

  native testListLinearGradient005(): number;

  native testListLinearGradient006(): number;

  native testListLinearGradient007(): number;

  native testListLinearGradient008(): number;

  native testListLinearGradient009(): number;

  native testListLinearGradient010(): number;

  native testListListDirection001(): number;

  native testListListDirection002(): number;

  native testListListDirection003(): number;

  native testListListDirection004(): number;

  native testListOpacity001(): number;

  native testListOpacity002(): number;

  native testListOpacity003(): number;

  native testListOpacity004(): number;

  native testListRotate001(): number;

  native testListRotate002(): number;

  native testListRotate003(): number;

  native testListRotate004(): number;

  native testListRotate005(): number;

  native testListSaturate001(): number;

  native testListSaturate002(): number;

  native testListSaturate003(): number;

  native testListSaturate004(): number;

  native testListSaturate005(): number;

  native testListSaturate006(): number;

  native testListSaturate007(): number;

  native testListScale001(): number;

  native testListScale002(): number;

  native testListScale003(): number;

  native testListScale004(): number;

  native testListScale005(): number;

  native testListScrollBar001(): number;

  native testListScrollBar002(): number;

  native testListScrollBar003(): number;

  native testListScrollBar004(): number;

  native testListShadow001(): number;

  native testListShadow002(): number;

  native testListShadow003(): number;

  native testListShadow004(): number;

  native testListShadow005(): number;

  native testListShadow006(): number;

  native testListSticky001(): number;

  native testListSticky002(): number;

  native testListSticky003(): number;

  native testListSticky004(): number;

  native testListSticky005(): number;

  native testListTranslate001(): number;

  native testListTranslate002(): number;

  native testListTranslate003(): number;

  native testListTranslate004(): number;

  native testListTranslate005(): number;

  native testListTranslate006(): number;

  native testListWidth001(): number;

  native testListWidth002(): number;

  native testListWidth003(): number;

  native testListNodeAdapter001(): number;

  native testListNodeAdapter002(): number;

  native testListNodeAdapter003(): number;

  native testListNodeAdapterEvent001(): number;

  native testListItemBackgroundColor001(): number;

  native testListItemBlur001(): number;

  native testListItemBlur002(): number;

  native testListItemBorderColor001(): number;

  native testListItemBorderColor002(): number;

  native testListItemBorderColor003(): number;

  native testListItemBorderRadius001(): number;

  native testListItemBorderRadius002(): number;

  native testListItemBorderRadius003(): number;

  native testListItemBorderRadius004(): number;

  native testListItemBorderRadius005(): number;

  native testListItemBorderWidth001(): number;

  native testListItemBorderWidth002(): number;

  native testListItemBorderWidth003(): number;

  native testListItemBorderWidth004(): number;

  native testListItemBorderWidth005(): number;

  native testListItemBrightness001(): number;

  native testListItemBrightness002(): number;

  native testListItemBrightness003(): number;

  native testListItemBrightness004(): number;

  native testListItemClip001(): number;

  native testListItemClip002(): number;

  native testListItemClip003(): number;

  native testListItemClip004(): number;

  native testListItemClip005(): number;

  native testListItemClip006(): number;

  native testListItemClip007(): number;

  native testListItemHeight001(): number;

  native testListItemHeight002(): number;

  native testListItemHeight003(): number;

  native testListItemLinearGradient001(): number;

  native testListItemLinearGradient002(): number;

  native testListItemLinearGradient003(): number;

  native testListItemLinearGradient004(): number;

  native testListItemLinearGradient005(): number;

  native testListItemLinearGradient006(): number;

  native testListItemLinearGradient007(): number;

  native testListItemLinearGradient008(): number;

  native testListItemLinearGradient009(): number;

  native testListItemLinearGradient010(): number;

  native testListItemOpacity001(): number;

  native testListItemOpacity002(): number;

  native testListItemOpacity003(): number;

  native testListItemOpacity004(): number;

  native testListItemRotate001(): number;

  native testListItemRotate002(): number;

  native testListItemRotate003(): number;

  native testListItemRotate004(): number;

  native testListItemRotate005(): number;

  native testListItemSaturate001(): number;

  native testListItemSaturate002(): number;

  native testListItemSaturate003(): number;

  native testListItemSaturate004(): number;

  native testListItemSaturate005(): number;

  native testListItemSaturate006(): number;

  native testListItemSaturate007(): number;

  native testListItemScale001(): number;

  native testListItemScale002(): number;

  native testListItemScale003(): number;

  native testListItemScale004(): number;

  native testListItemScale005(): number;

  native testListItemShadow001(): number;

  native testListItemShadow002(): number;

  native testListItemShadow003(): number;

  native testListItemShadow004(): number;

  native testListItemShadow005(): number;

  native testListItemShadow006(): number;

  native testListItemTranslate001(): number;

  native testListItemTranslate002(): number;

  native testListItemTranslate003(): number;

  native testListItemTranslate004(): number;

  native testListItemTranslate005(): number;

  native testListItemTranslate006(): number;

  native testListItemWidth001(): number;

  native testListItemWidth002(): number;

  native testListItemWidth003(): number;

  native testListChildMainSize001(): number;

  native testListChildMainSize002(): number;

  native testListChildMainSize003(): number;

  native testListChildMainSize004(): number;

  native testListChildMainSize005(): number;

  native testListSwipeOption007(): number;

  native testListChildMainSize006(): number;

  native testNodeUtils010(): number;

  native testNodeUtils020(): number;

  native testNodeUtils030(): number;

  native testNodeUtils040(): number;

  native testNodeUtils050(): number;

  native testNodeUtils060(): number;

  native testAccessibility070(): number;

  native testAccessibility080(): number;

  native testAccessibility090(): number;

  native testAccessibility010(): number;

  native testAccessibility011(): number;

  native testImageAniMator009(): number;

  native testImageAniMator010(): number;

  native testImageAniMator011(): number;

  native testImageAniMatorImageFramelnfo001(): number;

  native testImageAniMatorImageFramelnfo002(): number;

  native testImageAniMatorImageFramelnfo003(): number;

  native testImageAniMatorImageFramelnfo004(): number;

  native testImageAnimatorImages001(): number;

  native testImageAnimatorImages002(): number;

  native testImageAnimatorImages003(): number;

  native testImageAnimatorImages004(): number;

  native testImageAnimatorImages005(): number;

  native testImageAnimatorImages006(): number;

  native testImageAnimatorState001(): number;

  native testImageAnimatorState002(): number;

  native testImageAnimatorState003(): number;

  native testImageAnimatorState004(): number;

  native testImageAnimatorState005(): number;

  native testImageAnimatorState006(): number;

  native testImageAnimatorState007(): number;

  native testImageAnimatorState008(): number;

  native testImageAnimatorDuration001(): number;

  native testImageAnimatorDuration002(): number;

  native testImageAnimatorDuration003(): number;

  native testImageAnimatorDuration004(): number;

  native testImageAnimatorDuration005(): number;

  native testImageAnimatorReverse001(): number;

  native testImageAnimatorReverse002(): number;

  native testImageAnimatorReverse003(): number;

  native testImageAnimatorReverse004(): number;

  native testImageAnimatorFixedSize001(): number;

  native testImageAnimatorFixedSize002(): number;

  native testImageAnimatorFixedSize003(): number;

  native testImageAnimatorFixedSize004(): number;

  native testImageAnimatorFillMode001(): number;

  native testImageAnimatorFillMode002(): number;

  native testImageAnimatorFillMode003(): number;

  native testImageAnimatorFillMode004(): number;

  native testImageAnimatorFillMode005(): number;

  native testImageAnimatorFillMode006(): number;

  native testImageAnimatorFillMode007(): number;

  native testImageAnimatorFillMode008(): number;

  native testImageAnimatorIterations001(): number;

  native testImageAnimatorIterations002(): number;

  native testImageAnimatorIterations003(): number;

  native testImageAnimatorIterations004(): number;

  native testImageAnimatorIterations005(): number;

  native testImageAnimatorIterations006(): number;

  native testListSwipeActionItem008(): number;

  native testListSwipeActionItem009(): number;

  native textTextStyleGraphic002(): number;

  native testListSwipeOption008(): number;

  native testCommonAttrsClip001(): number;

  native testCommonAttrsClip002(): number;

  native testCommonAttrsClip003(): number;

  native testCommonAttrsClip004(): number;

  native testCommonAttrsClip005(): number;

  native testCommonAttrsClip006(): number;

  native testCommonAttrsClip007(): number;

  native testCommonAttrsConstraintSize001(): number;

  native testCommonAttrsConstraintSize002(): number;

  native testCommonAttrsConstraintSize003(): number;

  native testCommonAttrsConstraintSize004(): number;

  native testCommonAttrsLinearGradient001(): number;

  native testCommonAttrsLinearGradient002(): number;

  native testCommonAttrsLinearGradient003(): number;

  native testCommonAttrsLinearGradient004(): number;

  native testCommonAttrsLinearGradient005(): number;

  native testCommonAttrsLinearGradient006(): number;

  native testCommonAttrsLinearGradient007(): number;

  native testCommonAttrsLinearGradient008(): number;

  native testCommonAttrsLinearGradient009(): number;

  native testCommonAttrsLinearGradient010(): number;

  native testCommonAttrsMargin001(): number;

  native testCommonAttrsMargin002(): number;

  native testCommonAttrsMargin003(): number;

  native testCommonAttrsMargin004(): number;

  native testCommonAttrsScale001(): number;

  native testCommonAttrsScale002(): number;

  native testCommonAttrsScale003(): number;

  native testCommonAttrsScale004(): number;

  native testCommonAttrsScale005(): number;

  native testCommonAttrsScale006(): number;

  native testCommonAttrsScale007(): number;

  native testCommonAttrsScale008(): number;

  native testCommonAttrsScale009(): number;

  native testCommonAttrsScale010(): number;

  native testCommonAttrsShadow001(): number;

  native testCommonAttrsShadow002(): number;

  native testCommonAttrsShadow003(): number;

  native testCommonAttrsShadow004(): number;

  native testCommonAttrsShadow005(): number;

  native testCommonAttrsShadow006(): number;

  native testListCachedCount001(): number;

  native testListCachedCount002(): number;

  native testTextAlign001(): number;

  native testTextAlign002(): number;

  native testTextAlign003(): number;

  native testTextAlign004(): number;

  native testTextAlign005(): number;

  native testTextAlign006(): number;

  native testTextAlign007(): number;

  native testTextAlign008(): number;

  native testTextAlign009(): number;

  native testTextAlign010(): number;

  native testTextBackgroundColor001(): number;

  native testTextBackgroundColor002(): number;

  native testTextBackgroundColor003(): number;

  native testTextBackgroundImage001(): number;

  native testTextBackgroundImage002(): number;

  native testTextBackgroundImage003(): number;

  native testTextBackgroundImage004(): number;

  native testTextBackgroundImage005(): number;

  native testTextBackgroundImage006(): number;

  native testTextBackgroundImage007(): number;

  native testTextBaselineOffset001(): number;

  native testTextBaselineOffset002(): number;

  native testTextBaselineOffset003(): number;

  native testTextBorderColor001(): number;

  native testTextBorderColor002(): number;

  native testTextBorderColor003(): number;

  native testTextBorderColor004(): number;

  native testTextBorderRadius001(): number;

  native testTextBorderRadius002(): number;

  native testTextBorderRadius003(): number;

  native testTextBorderRadius004(): number;

  native testTextBorderRadius005(): number;

  native testTextBorderWidth001(): number;

  native testTextBorderWidth002(): number;

  native testTextBorderWidth003(): number;

  native testTextBorderWidth004(): number;

  native testTextClip001(): number;

  native testTextClip002(): number;

  native testTextClip003(): number;

  native testTextClip004(): number;

  native testTextClip005(): number;

  native testTextClip006(): number;

  native testTextClip007(): number;

  native testTextClip008(): number;

  native testTextClip009(): number;

  native testTextClip010(): number;

  native testTextClip011(): number;

  native testTextClip012(): number;

  native testTextContent001(): number;

  native testTextContent002(): number;

  native testTextCopyOption001(): number;

  native testTextCopyOption002(): number;

  native testTextCopyOption003(): number;

  native testTextCopyOption004(): number;

  native testTextCopyOption005(): number;

  native testTextDecoration001(): number;

  native testTextDecoration002(): number;

  native testTextDecoration003(): number;

  native testTextDecoration004(): number;

  native testTextDecoration005(): number;

  native testTextDecoration006(): number;

  native testTextFontColor001(): number;

  native testTextFontColor002(): number;

  native testTextFontColor003(): number;

  native testTextFontFamily001(): number;

  native testTextFontSize001(): number;

  native testTextFontSize002(): number;

  native testTextFontSize003(): number;

  native testTextFontSize004(): number;

  native testTextFontStyle001(): number;

  native testTextFontStyle002(): number;

  native testTextFontStyle003(): number;

  native testTextFontWeight001(): number;

  native testTextFontWeight002(): number;

  native testTextFontWeight003(): number;

  native testTextFontWeight004(): number;

  native testTextFontWeight005(): number;

  native testTextFontWeight006(): number;

  native testTextFontWeight007(): number;

  native testTextFontWeight008(): number;

  native testTextFontWeight009(): number;

  native testTextFontWeight010(): number;

  native testTextFontWeight011(): number;

  native testTextFontWeight012(): number;

  native testTextFontWeight013(): number;

  native testTextFontWeight014(): number;

  native testTextFontWeight015(): number;

  native testTextFontWeight016(): number;

  native testTextFont001(): number;

  native testTextFont002(): number;

  native testTextFont003(): number;

  native testTextFont004(): number;

  native testTextFont005(): number;

  native testTextFont006(): number;

  native testTextFont007(): number;

  native testTextFont008(): number;

  native testTextFont009(): number;

  native testTextFont010(): number;

  native testTextFont011(): number;

  native testTextFont012(): number;

  native testTextFont013(): number;

  native testTextFont014(): number;

  native testTextFont015(): number;

  native testTextFont016(): number;

  native testTextFont017(): number;

  native testTextFont018(): number;

  native testTextHeightAdaptivePolicy001(): number;

  native testTextHeightAdaptivePolicy002(): number;

  native testTextHeightAdaptivePolicy003(): number;

  native testTextHeightAdaptivePolicy004(): number;

  native testTextLetterSpacing001(): number;

  native testTextLetterSpacing002(): number;

  native testTextLetterSpacing003(): number;

  native testTextLinearGradient001(): number;

  native testTextLinearGradient002(): number;

  native testTextLinearGradient003(): number;

  native testTextLinearGradient004(): number;

  native testTextLinearGradient005(): number;

  native testTextLinearGradient006(): number;

  native testTextLinearGradient007(): number;

  native testTextLinearGradient008(): number;

  native testTextLinearGradient009(): number;

  native testTextLinearGradient010(): number;

  native testTextLinearGradient011(): number;

  native testTextLineHeight001(): number;

  native testTextLineHeight002(): number;

  native testTextLineHeight003(): number;

  native testTextLineHeight004(): number;

  native testTextMask001(): number;

  native testTextMask002(): number;

  native testTextMask003(): number;

  native testTextMask004(): number;

  native testTextMask005(): number;

  native testTextMask006(): number;

  native testTextMask007(): number;

  native testTextMaxFontSize001(): number;

  native testTextMaxFontSize002(): number;

  native testTextMaxFontSize003(): number;

  native testTextMaxLines001(): number;

  native testTextMaxLines002(): number;

  native testTextMaxLines003(): number;

  native testTextMinFontSize001(): number;

  native testTextMinFontSize002(): number;

  native testTextOffset001(): number;

  native testTextOffset002(): number;

  native testTextOffset003(): number;

  native testTextOpacity001(): number;

  native testTextOpacity002(): number;

  native testTextOpacity003(): number;

  native testTextOpacity004(): number;

  native testTextOverlay001(): number;

  native testTextOverlay002(): number;

  native testTextOverlay003(): number;

  native testTextOverlay004(): number;

  native testTextOverlay005(): number;

  native testTextOverlay006(): number;

  native testTextOverlay007(): number;

  native testTextOverlay008(): number;

  native testTextOverlay009(): number;

  native testTextOverlay010(): number;

  native testTextOverlay011(): number;

  native testTextOverlay012(): number;

  native testTextOverlay013(): number;

  native testTextPadding001(): number;

  native testTextPadding002(): number;

  native testTextPadding003(): number;

  native testTextPadding004(): number;

  native testTextPosition001(): number;

  native testTextPosition002(): number;

  native testTextRadialGradient001(): number;

  native testTextRadialGradient002(): number;

  native testTextRadialGradient003(): number;

  native testTextRadialGradient004(): number;

  native testTextRadialGradient005(): number;

  native testTextScale001(): number;

  native testTextScale002(): number;

  native testTextScale003(): number;

  native testTextShadow001(): number;

  native testTextShadow002(): number;

  native testTextShadow003(): number;

  native testTextShadow004(): number;

  native testTextShadow005(): number;

  native testTextShadow006(): number;

  native testTextShadow007(): number;

  native testTextSweepGradient001(): number;

  native testTextSweepGradient002(): number;

  native testTextSweepGradient003(): number;

  native testTextSweepGradient004(): number;

  native testTextSweepGradient005(): number;

  native testTextTextAlign001(): number;

  native testTextTextAlign002(): number;

  native testTextTextAlign003(): number;

  native testTextTextAlign004(): number;

  native testTextTextAlign005(): number;

  native testTextTextCase001(): number;

  native testTextTextCase002(): number;

  native testTextTextCase003(): number;

  native testTextTextCase004(): number;

  native testTextTextIndent001(): number;

  native testTextTextIndent002(): number;

  native testTextTextOverflow001(): number;

  native testTextTextOverflow002(): number;

  native testTextTextOverflow003(): number;

  native testTextTextOverflow004(): number;

  native testTextTextOverflow005(): number;

  native testTextTextShadow001(): number;

  native testTextTextShadow002(): number;

  native testTextTextShadow003(): number;

  native testTextTransform001(): number;

  native testTextTransform002(): number;

  native testTextTransform003(): number;

  native testTextTransform004(): number;

  native testTextVisibility001(): number;

  native testTextVisibility002(): number;

  native testTextVisibility003(): number;

  native testTextVisibility004(): number;

  native testTextLineBreakStrategy001(): number;

  native testTextLineBreakStrategy002(): number;

  native testTextLineBreakStrategy003(): number;

  native testTextLineBreakStrategy004(): number;

  native testTextAlignRules001(): number;

  native testTextAlignRules002(): number;

  native testTextAlignRules003(): number;

  native testTextAlignRules004(): number;

  native testTextAlignRules005(): number;

  native testTextAlignRules006(): number;

  native testTextAlignRules007(): number;

  native testTextAlignRules008(): number;

  native testTextAlignRules009(): number;

  native testCommonAttrsSweepGradient001(): number;

  native testCommonAttrsSweepGradient002(): number;

  native testCommonAttrsSweepGradient003(): number;

  native testCommonAttrsSweepGradient004(): number;

  native testCommonAttrsSweepGradient005(): number;

  native testCommonAttrsRadialGradient001(): number;

  native testCommonAttrsRadialGradient002(): number;

  native testCommonAttrsRadialGradient003(): number;

  native testCommonAttrsRadialGradient004(): number;

  native testScrollBackgroundColor001(): number;

  native testScrollBackgroundColor002(): number;

  native testScrollBackgroundColor003(): number;

  native testScrollBlur001(): number;

  native testScrollBlur002(): number;

  native testScrollBlur003(): number;

  native testScrollBorderColor001(): number;

  native testScrollBorderColor002(): number;

  native testScrollBorderRadius001(): number;

  native testScrollBorderRadius002(): number;

  native testScrollBorderRadius003(): number;

  native TestScrollBorderWidth001(): number;

  native testScrollBorderWidth002(): number;

  native testScrollBorderWidth003(): number;

  native testScrollBrightness001(): number;

  native testScrollBrightness002(): number;

  native testScrollBrightness003(): number;

  native testScrollClip001(): number;

  native testScrollClip002(): number;

  native testScrollClip003(): number;

  native testScrollEdgeEffect001(): number;

  native testScrollEdgeEffect002(): number;

  native testScrollEdgeEffect003(): number;

  native testScrollEnableScrollInteraction001(): number;

  native testScrollEnableScrollInteraction002(): number;

  native testScrollEnableScrollInteraction003(): number;

  native testScrollFriction001(): number;

  native testScrollFriction002(): number;

  native testScrollLinearGradient001(): number;

  native testScrollLinearGradient002(): number;

  native testScrollLinearGradient003(): number;

  native testScrollLinearGradient004(): number;

  native testScrollLinearGradient005(): number;

  native testScrollLinearGradient006(): number;

  native testScrollLinearGradient007(): number;

  native testScrollLinearGradient008(): number;

  native testScrollLinearGradient009(): number;

  native testScrollOpacity001(): number;

  native testScrollOpacity002(): number;

  native testScrollOpacity003(): number;

  native testScrollOpacity004(): number;

  native testScrollOverlay001(): number;

  native testScrollOverlay002(): number;

  native testScrollOverlay003(): number;

  native testScrollOverlay004(): number;

  native testScrollOverlay005(): number;

  native testScrollOverlay006(): number;

  native testScrollOverlay007(): number;

  native testScrollOverlay008(): number;

  native testScrollOverlay009(): number;

  native testScrollRotate001(): number;

  native testScrollRotate002(): number;

  native testScrollSaturate001(): number;

  native testScrollSaturate002(): number;

  native testScrollSaturate003(): number;

  native testScrollSaturate004(): number;

  native testScrollSaturate005(): number;

  native testScrollSaturate006(): number;

  native testScrollScale001(): number;

  native testScrollScale002(): number;

  native testScrollScale003(): number;

  native testScrollScrollAble001(): number;

  native testScrollScrollAble002(): number;

  native testScrollScrollAble003(): number;

  native testScrollScrollAble004(): number;

  native testScrollScrollBarColor001(): number;

  native testScrollScrollBarColor002(): number;

  native testScrollScrollBarColor003(): number;

  native testScrollScrollBar001(): number;

  native testScrollScrollBar002(): number;

  native testScrollScrollBar003(): number;

  native testScrollScrollBar004(): number;

  native testScrollScrollSnap001(): number;

  native testScrollScrollSnap002(): number;

  native testScrollScrollSnap003(): number;

  native testScrollScrollSnap004(): number;

  native testScrollScrollTo001(): number;

  native testScrollScrollTo002(): number;

  native testScrollScrollTo003(): number;

  native testScrollScrollTo004(): number;

  native testScrollScrollTo005(): number;

  native testScrollScrollTo006(): number;

  native testScrollScrollTo007(): number;

  native testScrollScrollTo008(): number;

  native testScrollScrollTo009(): number;

  native testScrollScrollTo010(): number;

  native testScrollScrollTo011(): number;

  native testScrollScrollTo012(): number;

  native testScrollScrollTo013(): number;

  native testScrollShadow001(): number;

  native testScrollShadow002(): number;

  native testScrollShadow003(): number;

  native testScrollShadow004(): number;

  native testScrollShadow005(): number;

  native testScrollShadow006(): number;

  native testScrollTranslate001(): number;

  native testScrollTranslate002(): number;

  native testScrollTranslate003(): number;

  native testScrollTranslate004(): number;

  native testScrollPageEnable001(): number;

  native testScrollPageEnable002(): number;

  native testScrollPageEnable003(): number;

  native testScrollPageEnable004(): number;

  native testScrollPageEnable005(): number;

  native testTextPickerDisappearTextStyle001(): number;

  native testTextPickerDisappearTextStyle002(): number;

  native testTextPickerTextStyle001(): number;

  native testTextPickerTextStyle002(): number;

  native testTextPickerSelectedTextStyle001(): number;

  native testTextPickerSelectedTextStyle002(): number;

  native testTextPickerSelectedIndex001(): number;

  native testTextPickerSelectedIndex002(): number;

  native testTextPickerSelectedIndex003(): number;

  native testTextPickerSelected001(): number;

  native testTextPickerSelected002(): number;

  native testTextPickerSelected003(): number;

  native testTextPickerCanLoop001(): number;

  native testTextPickerCanLoop002(): number;

  native testTextPickerDefaultPickerItemHeight001(): number;

  native testTextPickerDefaultPickerItemHeight002(): number;

  native testTextPickerDefaultPickerItemHeight003(): number;

  native testTextPickerValue001(): number;

  native testTextPickerValue002(): number;

  native testCustomDialogOpen001(): number;

  native testCustomDialogOpen002(): number;

  native testCustomDialogClose001(): number;

  native testCustomDialogClose002(): number;

  native testCustomDialogAlignment001(): number;

  native testCustomDialogAlignment002(): number;

  native testCustomDialogAlignment003(): number;

  native testCustomDialogAlignment004(): number;

  native testCustomDialogAlignment005(): number;

  native testCustomDialogAlignment006(): number;

  native testCustomDialogAlignment007(): number;

  native testCustomDialogAlignment008(): number;

  native testCustomDialogAlignment009(): number;

  native testCustomDialogAlignment010(): number;

  native testCustomDialogCustomStyle001(): number;

  native testCustomDialogCustomStyle002(): number;

  native testDatePickerLunar001(): number;

  native testDatePickerLunar002(): number;

  native testDatePickerLunar003(): number;

  native testDatePickerLunar004(): number;

  native testDatePickerStart001(): number;

  native testDatePickerStart002(): number;

  native testDatePickerEnd001(): number;

  native testDatePickerEnd002(): number;

  native testDatePickerSelected001(): number;

  native testDatePickerSelected002(): number;

  native testDatePickerSelectedTextStyle001(): number;

  native testDatePickerSelectedTextStyle002(): number;

  native testDatePickerDisappearTextStyle001(): number;

  native testDatePickerDisappearTextStyle002(): number;

  native testDatePickerTextStyle001(): number;

  native testDatePickerTextStyle002(): number;

  native testTimePickerUseMilitaryTime001(): number;

  native testTimePickerUseMilitaryTime002(): number;

  native testTimePickerUseMilitaryTime003(): number;

  native testTimePickerUseMilitaryTime004(): number;

  native testTimePickerHeight001(): number;

  native testTimePickerHeight002(): number;

  native testTimePickerHeight003(): number;

  native testTimePickerSelected001(): number;

  native testTimePickerSelected002(): number;

  native testTimePickerSelectedTextStyle001(): number;

  native testTimePickerSelectedTextStyle002(): number;

  native testTimePickerDisappearTextStyle001(): number;

  native testTimePickerDisappearTextStyle002(): number;

  native testTimePickerTextStyle001(): number;

  native testTimePickerTextStyle002(): number;

  native testXComponentSourceId001(): number;

  native testXComponentSourceId002(): number;

  native testXComponentSourceId003(): number;

  native testXComponentSourceId004(): number;

  native testXComponentType001(): number;

  native testXComponentType002(): number;

  native testXComponentType003(): number;

  native testXComponentType004(): number;

  native testCustomDialogMaskColor001(): number;

  native testCustomDialogMaskColor002(): number;

  native testTextPickerRange001(): number;

  native testTextPickerRange002(): number;

  native testTextPickerRange003(): number;

  native testTextPickerRange004(): number;

  native testTextInputAccessibilityDescription001(): number;

  native testTextInputAccessibilityDescription002(): number;

  native testTextInputAccessibilityGroup001(): number;

  native testTextInputAccessibilityGroup002(): number;

  native testTextInputAccessibilityGroup003(): number;

  native testTextInputAccessibilityGroup004(): number;

  native testTextInputAccessibilityLevel001(): number;

  native testTextInputAccessibilityLevel002(): number;

  native testTextInputAccessibilityLevel003(): number;

  native testTextInputAccessibilityLevel004(): number;

  native testTextInputAccessibilityText001(): number;

  native testTextInputAccessibilityText002(): number;

  native testTextAreaAccessibilityDescription001(): number;

  native testTextAreaAccessibilityDescription002(): number;

  native testTextAreaAccessibilityGroup001(): number;

  native testTextAreaAccessibilityGroup002(): number;

  native testTextAreaAccessibilityGroup003(): number;

  native testTextAreaAccessibilityGroup004(): number;

  native testTextAreaAccessibilityLevel001(): number;

  native testTextAreaAccessibilityLevel002(): number;

  native testTextAreaAccessibilityLevel003(): number;

  native testTextAreaAccessibilityLevel004(): number;

  native testTextAreaAccessibilityText001(): number;

  native testTextAreaAccessibilityText002(): number;

  native testSwiperAccessibilityDescription001(): number;

  native testSwiperAccessibilityDescription002(): number;

  native testSwiperAccessibilityGroup001(): number;

  native testSwiperAccessibilityGroup002(): number;

  native testSwiperAccessibilityGroup003(): number;

  native testSwiperAccessibilityGroup004(): number;

  native testSwiperAccessibilityLevel001(): number;

  native testSwiperAccessibilityLevel002(): number;

  native testSwiperAccessibilityLevel003(): number;

  native testSwiperAccessibilityLevel004(): number;

  native testSwiperAccessibilityText001(): number;

  native testSwiperAccessibilityText002(): number;

  native testScrollAccessibilityDescription001(): number;

  native testScrollAccessibilityDescription002(): number;

  native testScrollAccessibilityGroup001(): number;

  native testScrollAccessibilityGroup002(): number;

  native testScrollAccessibilityGroup003(): number;

  native testScrollAccessibilityGroup004(): number;

  native testScrollAccessibilityLevel001(): number;

  native testScrollAccessibilityLevel002(): number;

  native testScrollAccessibilityLevel003(): number;

  native testScrollAccessibilityLevel004(): number;

  native testScrollAccessibilityText001(): number;

  native testScrollAccessibilityText002(): number;

  native testListAccessibilityDescription001(): number;

  native testListAccessibilityDescription002(): number;

  native testListAccessibilityGroup001(): number;

  native testListAccessibilityGroup002(): number;

  native testListAccessibilityGroup003(): number;

  native testListAccessibilityGroup004(): number;

  native testListAccessibilityLevel001(): number;

  native testListAccessibilityLevel002(): number;

  native testListAccessibilityLevel003(): number;

  native testListAccessibilityLevel004(): number;

  native testListAccessibilityText001(): number;

  native testListAccessibilityText002(): number;

  native testToggleAccessibilityDescription001(): number;

  native testToggleAccessibilityDescription002(): number;

  native testToggleAccessibilityGroup001(): number;

  native testToggleAccessibilityGroup002(): number;

  native testToggleAccessibilityGroup003(): number;

  native testToggleAccessibilityGroup004(): number;

  native testToggleAccessibilityLevel001(): number;

  native testToggleAccessibilityLevel002(): number;

  native testToggleAccessibilityLevel003(): number;

  native testToggleAccessibilityLevel004(): number;

  native testToggleAccessibilityText001(): number;

  native testToggleAccessibilityText002(): number;

  native testTextAccessibilityDescription001(): number;

  native testTextAccessibilityDescription002(): number;

  native testTextAccessibilityGroup001(): number;

  native testTextAccessibilityGroup002(): number;

  native testTextAccessibilityGroup003(): number;

  native testTextAccessibilityGroup004(): number;

  native testTextAccessibilityLevel001(): number;

  native testTextAccessibilityLevel002(): number;

  native testTextAccessibilityLevel003(): number;

  native testTextAccessibilityLevel004(): number;

  native testTextAccessibilityText001(): number;

  native testTextAccessibilityText002(): number;

  native testRefreshAccessibilityDescription001(): number;

  native testRefreshAccessibilityDescription002(): number;

  native testRefreshAccessibilityGroup001(): number;

  native testRefreshAccessibilityGroup002(): number;

  native testRefreshAccessibilityGroup003(): number;

  native testRefreshAccessibilityGroup004(): number;

  native testRefreshAccessibilityLevel001(): number;

  native testRefreshAccessibilityLevel002(): number;

  native testRefreshAccessibilityLevel003(): number;

  native testRefreshAccessibilityLevel004(): number;

  native testRefreshAccessibilityText001(): number;

  native testRefreshAccessibilityText002(): number;

  native testDatePickerAccessibilityDescription001(): number;

  native testDatePickerAccessibilityDescription002(): number;

  native testDatePickerAccessibilityGroup001(): number;

  native testDatePickerAccessibilityGroup002(): number;

  native testDatePickerAccessibilityGroup003(): number;

  native testDatePickerAccessibilityGroup004(): number;

  native testDatePickerAccessibilityLevel001(): number;

  native testDatePickerAccessibilityLevel002(): number;

  native testDatePickerAccessibilityLevel003(): number;

  native testDatePickerAccessibilityLevel004(): number;

  native testDatePickerAccessibilityText001(): number;

  native testDatePickerAccessibilityText002(): number;

  native testTimePickerAccessibilityDescription001(): number;

  native testTimePickerAccessibilityDescription002(): number;

  native testTimePickerAccessibilityGroup001(): number;

  native testTimePickerAccessibilityGroup002(): number;

  native testTimePickerAccessibilityGroup003(): number;

  native testTimePickerAccessibilityGroup004(): number;

  native testTimePickerAccessibilityLevel001(): number;

  native testTimePickerAccessibilityLevel002(): number;

  native testTimePickerAccessibilityLevel003(): number;

  native testTimePickerAccessibilityLevel004(): number;

  native testTimePickerAccessibilityText001(): number;

  native testTimePickerAccessibilityText002(): number;

  native testSliderAccessibilityDescription001(): number;

  native testSliderAccessibilityDescription002(): number;

  native testSliderAccessibilityGroup001(): number;

  native testSliderAccessibilityGroup002(): number;

  native testSliderAccessibilityGroup003(): number;

  native testSliderAccessibilityGroup004(): number;

  native testSliderAccessibilityLevel001(): number;

  native testSliderAccessibilityLevel002(): number;

  native testSliderAccessibilityLevel003(): number;

  native testSliderAccessibilityLevel004(): number;

  native testSliderAccessibilityText001(): number;

  native testSliderAccessibilityText002(): number;

  native testButtonAccessibilityDescription001(): number;

  native testButtonAccessibilityDescription002(): number;

  native testButtonAccessibilityGroup001(): number;

  native testButtonAccessibilityGroup002(): number;

  native testButtonAccessibilityGroup003(): number;

  native testButtonAccessibilityGroup004(): number;

  native testButtonAccessibilityLevel001(): number;

  native testButtonAccessibilityLevel002(): number;

  native testButtonAccessibilityLevel003(): number;

  native testButtonAccessibilityLevel004(): number;

  native testButtonAccessibilityText001(): number;

  native testButtonAccessibilityText002(): number;

  native testTextPickerAccessibilityDescription001(): number;

  native testTextPickerAccessibilityDescription002(): number;

  native testTextPickerAccessibilityGroup001(): number;

  native testTextPickerAccessibilityGroup002(): number;

  native testTextPickerAccessibilityGroup003(): number;

  native testTextPickerAccessibilityGroup004(): number;

  native testTextPickerAccessibilityLevel001(): number;

  native testTextPickerAccessibilityLevel002(): number;

  native testTextPickerAccessibilityLevel003(): number;

  native testTextPickerAccessibilityLevel004(): number;

  native testTextPickerAccessibilityText001(): number;

  native testTextPickerAccessibilityText002(): number;

  native testCheckboxAccessibilityDescription001(): number;

  native testCheckboxAccessibilityDescription002(): number;

  native testCheckboxAccessibilityGroup001(): number;

  native testCheckboxAccessibilityGroup002(): number;

  native testCheckboxAccessibilityGroup003(): number;

  native testCheckboxAccessibilityGroup004(): number;

  native testCheckboxAccessibilityLevel001(): number;

  native testCheckboxAccessibilityLevel002(): number;

  native testCheckboxAccessibilityLevel003(): number;

  native testCheckboxAccessibilityLevel004(): number;

  native testCheckboxAccessibilityText001(): number;

  native testCheckboxAccessibilityText002(): number;

  native testProgressAccessibilityDescription001(): number;

  native testProgressAccessibilityDescription002(): number;

  native testProgressAccessibilityGroup001(): number;

  native testProgressAccessibilityGroup002(): number;

  native testProgressAccessibilityGroup003(): number;

  native testProgressAccessibilityGroup004(): number;

  native testProgressAccessibilityLevel001(): number;

  native testProgressAccessibilityLevel002(): number;

  native testProgressAccessibilityLevel003(): number;

  native testProgressAccessibilityLevel004(): number;

  native testProgressAccessibilityText001(): number;

  native testProgressAccessibilityText002(): number;

  native testCustomComponentAlign001(): number;

  native testCustomComponentAlign002(): number;

  native testCustomComponentAlign003(): number;

  native testCustomComponentAlign004(): number;

  native testCustomComponentAlign005(): number;

  native testCustomComponentAlign006(): number;

  native testCustomComponentAlign007(): number;

  native testCustomComponentAlign008(): number;

  native testCustomComponentAlign009(): number;

  native testCustomComponentAlign010(): number;

  native testCustomComponentAlign011(): number;

  native testCustomComponentAlignSelf001(): number;

  native testCustomComponentAlignSelf002(): number;

  native testCustomComponentAlignSelf003(): number;

  native testCustomComponentAlignSelf004(): number;

  native testCustomComponentAlignSelf005(): number;

  native testCustomComponentAlignSelf006(): number;

  native testCustomComponentFlexBasis001(): number;

  native testCustomComponentFlexBasis002(): number;

  native testCustomComponentFlexGrow001(): number;

  native testCustomComponentFlexGrow002(): number;

  native testCustomComponentFlexShrink001(): number;

  native testCustomComponentFlexShrink002(): number;

  native testCustomComponentDirection001(): number;

  native testCustomComponentDirection002(): number;

  native testCustomComponentDirection003(): number;

  native testCustomComponentDirection004(): number;

  native testCustomComponentDirection005(): number;

  native testCustomComponentOpacity001(): number;

  native testCustomComponentOpacity002(): number;

  native testCustomComponentOpacity003(): number;

  native testCustomComponentOpacity004(): number;

  native testCustomComponentOpacity005(): number;

  native testCustomComponentOpacity006(): number;

  native testCustomComponentInvert001(): number;

  native testCustomComponentInvert002(): number;

  native testCustomComponentInvert003(): number;

  native testCustomComponentInvert004(): number;

  native testCustomComponentInvert005(): number;

  native testCustomComponentInvert006(): number;

  native testCustomComponentContrast001(): number;

  native testCustomComponentContrast002(): number;

  native testCustomComponentContrast003(): number;

  native testCustomComponentContrast004(): number;

  native testCustomComponentContrast005(): number;

  native testCustomComponentContrast006(): number;

  native testCustomComponentSepia001(): number;

  native testCustomComponentSepia002(): number;

  native testCustomComponentSepia003(): number;

  native testCustomComponentSepia004(): number;

  native testCustomComponentSepia005(): number;

  native testCustomComponentSepia006(): number;

  native testCustomComponentGrayscale001(): number;

  native testCustomComponentGrayscale002(): number;

  native testCustomComponentGrayscale003(): number;

  native testCustomComponentGrayscale004(): number;

  native testCustomComponentGrayscale005(): number;

  native testCustomComponentGrayscale006(): number;

  native testCustomComponentBackgroundColor001(): number;

  native testCustomComponentBackgroundColor002(): number;

  native testCustomComponentBackgroundColor003(): number;

  native testCustomComponentBorderColor001(): number;

  native testCustomComponentBorderColor002(): number;

  native testCustomComponentBorderRadius001(): number;

  native testCustomComponentBorderRadius002(): number;

  native testCustomComponentBorderRadius003(): number;

  native testCustomComponentBorderRadius004(): number;

  native testCustomComponentBorderRadius005(): number;

  native testCustomComponentBorderRadius006(): number;

  native testCustomComponentBorderStyle001(): number;

  native testCustomComponentBorderStyle002(): number;

  native testCustomComponentBorderStyle003(): number;

  native testCustomComponentBorderStyle004(): number;

  native testCustomComponentBorderStyle005(): number;

  native testCustomComponentBorderStyle006(): number;

  native testCustomComponentBorderWidth001(): number;

  native testCustomComponentBorderWidth002(): number;

  native testCustomComponentBorderWidth003(): number;

  native testCustomComponentBorderWidth004(): number;

  native testCustomComponentHeight001(): number;

  native testCustomComponentHeight002(): number;

  native testCustomComponentHeight003(): number;

  native testCustomComponentPosition001(): number;

  native testCustomComponentPosition002(): number;

  native testCustomComponentWidth001(): number;

  native testCustomComponentWidth002(): number;

  native testCustomComponentWidth003(): number;

  native testCustomComponentTransform001(): number;

  native testCustomComponentTransform002(): number;

  native testCustomComponentTransform003(): number;

  native testCustomComponentTransform004(): number;

  native testCustomComponentMask001(): number;

  native testCustomComponentMask002(): number;

  native testCustomComponentMask003(): number;

  native testCustomComponentMask004(): number;

  native testCustomComponentMask005(): number;

  native testCustomComponentMask006(): number;

  native testCustomComponentMask007(): number;

  native testCustomComponentMask008(): number;

  native testCustomComponentMask009(): number;

  native testCustomComponentMask010(): number;

  native testCustomComponentMask011(): number;

  native testCustomComponentMask012(): number;

  native testCustomComponentMask013(): number;

  native testCustomComponentMask014(): number;

  native testCustomComponentMask015(): number;

  native testCustomComponentMask016(): number;

  native testCustomComponentBlendMode001(): number;

  native testCustomComponentBlendMode002(): number;

  native testCustomComponentBlendMode003(): number;

  native testCustomComponentBlendMode004(): number;

  native testCustomComponentBlendMode005(): number;

  native testCustomComponentBlendMode006(): number;

  native testCustomComponentBlendMode007(): number;

  native testCustomComponentBlendMode008(): number;

  native testCustomComponentBlendMode009(): number;

  native testCustomComponentBlendMode010(): number;

  native testCustomComponentBlendMode011(): number;

  native testCustomComponentBlendMode012(): number;

  native testCustomComponentBlendMode013(): number;

  native testCustomComponentBlendMode014(): number;

  native testCustomComponentBlendMode015(): number;

  native testCustomComponentBlendMode016(): number;

  native testCustomComponentBlendMode017(): number;

  native testCustomComponentBlendMode018(): number;

  native testCustomComponentBlendMode019(): number;

  native testCustomComponentBlendMode020(): number;

  native testCustomComponentBlendMode021(): number;

  native testCustomComponentBlendMode022(): number;

  native testCustomComponentBlendMode023(): number;

  native testCustomComponentBlendMode024(): number;

  native testCustomComponentBlendMode025(): number;

  native testCustomComponentBlendMode026(): number;

  native testCustomComponentBlendMode027(): number;

  native testCustomComponentBlendMode028(): number;

  native testCustomComponentBlendMode029(): number;

  native testCustomComponentBlendMode030(): number;

  native testCustomComponentBlendMode031(): number;

  native testCustomComponentBlendMode032(): number;

  native testCustomComponentBlendMode033(): number;

  native testCustomComponentBlendMode034(): number;

  native testCustomComponentBlendMode035(): number;

  native testCustomComponentBlendMode036(): number;

  native testCustomComponentBlendMode037(): number;

  native testCustomComponentBlendMode038(): number;

  native testCustomComponentBlendMode039(): number;

  native testCustomComponentBlendMode040(): number;

  native testCustomComponentBlendMode041(): number;

  native testCustomComponentBlendMode042(): number;

  native testCustomComponentBlendMode043(): number;

  native testCustomComponentBlendMode044(): number;

  native testCustomComponentBlendMode045(): number;

  native testCustomComponentBlendMode046(): number;

  native testCustomComponentBlendMode047(): number;

  native testCustomComponentBlendMode048(): number;

  native testCustomComponentBlendMode049(): number;

  native testCustomComponentBlendMode050(): number;

  native testCustomComponentBlendMode051(): number;

  native testCustomComponentBlendMode052(): number;

  native testCustomComponentBlendMode053(): number;

  native testCustomComponentBlendMode054(): number;

  native testCustomComponentBlendMode055(): number;

  native testCustomComponentBlendMode056(): number;

  native testCustomComponentBlendMode057(): number;

  native testCustomComponentBlendMode058(): number;

  native testCustomComponentBlendMode059(): number;

  native testCustomComponentBlendMode060(): number;

  native testCustomComponentBlendMode061(): number;

  native testCustomComponentForegroundBlurStyle001(): number;

  native testCustomComponentForegroundBlurStyle002(): number;

  native testCustomComponentForegroundBlurStyle003(): number;

  native testCustomComponentForegroundBlurStyle004(): number;

  native testCustomComponentForegroundBlurStyle005(): number;

  native testCustomComponentForegroundBlurStyle006(): number;

  native testCustomComponentForegroundBlurStyle007(): number;

  native testCustomComponentForegroundBlurStyle008(): number;

  native testCustomComponentForegroundBlurStyle009(): number;

  native testCustomComponentForegroundBlurStyle010(): number;

  native testCustomComponentForegroundBlurStyle011(): number;

  native testCustomComponentForegroundBlurStyle012(): number;

  native testCustomComponentForegroundBlurStyle013(): number;

  native testCustomComponentForegroundBlurStyle014(): number;

  native testCustomComponentForegroundBlurStyle015(): number;

  native testCustomComponentForegroundBlurStyle016(): number;

  native testCustomComponentForegroundBlurStyle017(): number;

  native testCustomComponentForegroundBlurStyle018(): number;

  native testCustomComponentForegroundBlurStyle019(): number;

  native testCustomComponentForegroundBlurStyle020(): number;

  native testCustomComponentForegroundBlurStyle021(): number;

  native testCustomComponentForegroundBlurStyle022(): number;

  native testCustomComponentForegroundBlurStyle023(): number;

  native testCustomComponentForegroundBlurStyle024(): number;

  native testCustomComponentForegroundBlurStyle025(): number;

  native testCustomComponentForegroundBlurStyle026(): number;

  native testCustomComponentForegroundBlurStyle027(): number;

  native testCustomComponentForegroundBlurStyle028(): number;

  native testCustomComponentForegroundBlurStyle029(): number;

  native testCustomComponentForegroundBlurStyle030(): number;

  native testCustomComponentForegroundBlurStyle031(): number;

  native testCustomComponentForegroundBlurStyle032(): number;

  native testCustomComponentClip001(): number;

  native testCustomComponentClip002(): number;

  native testCustomComponentClip003(): number;

  native testCustomComponentClip004(): number;

  native testCustomComponentClip005(): number;

  native testCustomComponentClip006(): number;

  native testCustomComponentClip007(): number;

  native testCustomComponentConstraintSize001(): number;

  native testCustomComponentConstraintSize002(): number;

  native testCustomComponentConstraintSize003(): number;

  native testCustomComponentConstraintSize004(): number;

  native testCustomComponentLinearGradient001(): number;

  native testCustomComponentLinearGradient002(): number;

  native testCustomComponentLinearGradient003(): number;

  native testCustomComponentLinearGradient004(): number;

  native testCustomComponentLinearGradient005(): number;

  native testCustomComponentLinearGradient006(): number;

  native testCustomComponentLinearGradient007(): number;

  native testCustomComponentLinearGradient008(): number;

  native testCustomComponentLinearGradient009(): number;

  native testCustomComponentLinearGradient010(): number;

  native testCustomComponentMargin001(): number;

  native testCustomComponentMargin002(): number;

  native testCustomComponentMargin003(): number;

  native testCustomComponentMargin004(): number;

  native testCustomComponentScale001(): number;

  native testCustomComponentScale002(): number;

  native testCustomComponentScale003(): number;

  native testCustomComponentScale004(): number;

  native testCustomComponentScale005(): number;

  native testCustomComponentShadow001(): number;

  native testCustomComponentShadow002(): number;

  native testCustomComponentShadow003(): number;

  native testCustomComponentShadow004(): number;

  native testCustomComponentShadow005(): number;

  native testCustomComponentShadow006(): number;

  native testCustomComponentSweepGradient001(): number;

  native testCustomComponentSweepGradient002(): number;

  native testCustomComponentSweepGradient003(): number;

  native testCustomComponentSweepGradient004(): number;

  native testCustomComponentSweepGradient005(): number;

  native testCustomComponentRadialGradient001(): number;

  native testCustomComponentRadialGradient002(): number;

  native testCustomComponentRadialGradient003(): number;

  native testCustomComponentRadialGradient004(): number;

  native testCustomComponentAccessibilityDescription001(): number;

  native testCustomComponentAccessibilityDescription002(): number;

  native testCustomComponentAccessibilityGroup001(): number;

  native testCustomComponentAccessibilityGroup002(): number;

  native testCustomComponentAccessibilityGroup003(): number;

  native testCustomComponentAccessibilityGroup004(): number;

  native testCustomComponentAccessibilityLevel001(): number;

  native testCustomComponentAccessibilityLevel002(): number;

  native testCustomComponentAccessibilityLevel003(): number;

  native testCustomComponentAccessibilityLevel004(): number;

  native testCustomComponentAccessibilityText001(): number;

  native testCustomComponentAccessibilityText002(): number;

  native testTextInputBackgroundColor001(): number;

  native testTextInputBackgroundColor002(): number;

  native testTextInputBackgroundImage001(): number;

  native testTextInputBackgroundImage002(): number;

  native testTextInputBackgroundImage003(): number;

  native testTextInputBackgroundImage004(): number;

  native testTextInputBackgroundImage005(): number;

  native testTextInputBackgroundImage006(): number;

  native testTextInputCaretColor001(): number;

  native testTextInputCaretColor002(): number;

  native testTextInputClip001(): number;

  native testTextInputClip002(): number;

  native testTextInputClip003(): number;

  native testTextInputClip004(): number;

  native testTextInputClip005(): number;

  native testTextInputClip006(): number;

  native testTextInputClip007(): number;

  native testTextInputFontColor001(): number;

  native testTextInputFontColor002(): number;

  native testTextInputFontSize001(): number;

  native testTextInputFontSize002(): number;

  native testTextInputFontSize003(): number;

  native testTextInputFontSize004(): number;

  native testTextInputFontStyle001(): number;

  native testTextInputFontStyle002(): number;

  native testTextInputFontStyle003(): number;

  native testTextInputFontWeight001(): number;

  native testTextInputFontWeight002(): number;

  native testTextInputFontWeight003(): number;

  native testTextInputFontWeight004(): number;

  native testTextInputFontWeight005(): number;

  native testTextInputFontWeight006(): number;

  native testTextInputFontWeight007(): number;

  native testTextInputFontWeight008(): number;

  native testTextInputFontWeight009(): number;

  native testTextInputFontWeight010(): number;

  native testTextInputFontWeight011(): number;

  native testTextInputFontWeight012(): number;

  native testTextInputFontWeight013(): number;

  native testTextInputFontWeight014(): number;

  native testTextInputFontWeight015(): number;

  native testTextInputFontWeight016(): number;

  native testTextInputPadding001(): number;

  native testTextInputPadding002(): number;

  native testTextInputPadding003(): number;

  native testTextInputPadding004(): number;

  native testTextInputPadding005(): number;

  native testTextInputPadding006(): number;

  native testTextInputShowUnderLine001(): number;

  native testTextInputShowUnderLine002(): number;

  native testTextInputTextAlign001(): number;

  native testTextInputTextAlign002(): number;

  native testTextInputTextAlign003(): number;

  native testTextInputTextAlign004(): number;

  native testTextInputTextAlign005(): number;

  native testImageSpanWidth001(): number;

  native testImageSpanWidth002(): number;

  native testImageSpanWidth003(): number;

  native testImageSpanHeight001(): number;

  native testImageSpanHeight002(): number;

  native testImageSpanHeight003(): number;

  native testImageSpanObjectFit001(): number;

  native testImageSpanObjectFit002(): number;

  native testImageSpanObjectFit003(): number;

  native testImageSpanObjectFit004(): number;

  native testImageSpanObjectFit005(): number;

  native testImageSpanObjectFit006(): number;

  native testImageSpanObjectFit007(): number;

  native testImageSpanVerticalAlign001(): number;

  native testImageSpanVerticalAlign002(): number;

  native testImageSpanVerticalAlign003(): number;

  native testImageSpanVerticalAlign004(): number;

  native testImageSpanVerticalAlign005(): number;

  native testImageSpanPadding001(): number;

  native testImageSpanPadding002(): number;

  native testImageSpanPadding003(): number;

  native testImageSpanPadding004(): number;

  native testImageSpanSrc001(): number;

  native testImageSpanSrc002(): number;

  native testImageSpanSrc003(): number;

  native testImageSpanSrc004(): number;

  native testImageSpanSrc005(): number;

  native testImageSpanAlt001(): number;

  native testImageSpanAlt002(): number;

  native testImageSpanAlt003(): number;

  native testImageSpanAlt004(): number;

  native testImageSpanAlt005(): number;

  native testSpanDecoration001(): number;

  native testSpanDecoration002(): number;

  native testSpanDecoration003(): number;

  native testSpanDecoration004(): number;

  native testSpanDecoration005(): number;

  native testSpanLetterSpacing001(): number;

  native testSpanLetterSpacing002(): number;

  native testSpanLetterSpacing003(): number;

  native testSpanTextCase001(): number;

  native testSpanTextCase002(): number;

  native testSpanTextCase003(): number;

  native testSpanTextCase004(): number;

  native testSpanLineHeight001(): number;

  native testSpanLineHeight002(): number;

  native testSpanLineHeight003(): number;

  native testSpanFontColor001(): number;

  native testSpanFontColor002(): number;

  native testSpanFontColor003(): number;

  native testSpanFontSize001(): number;

  native testSpanFontSize002(): number;

  native testSpanFontSize003(): number;

  native testSpanFontStyle001(): number;

  native testSpanFontStyle002(): number;

  native testSpanFontStyle003(): number;

  native testSpanFontWeight001(): number;

  native testSpanFontWeight002(): number;

  native testSpanFontWeight003(): number;

  native testSpanFontWeight004(): number;

  native testSpanFontWeight005(): number;

  native testSpanFontWeight006(): number;

  native testSpanFontWeight007(): number;

  native testSpanFontWeight008(): number;

  native testSpanFontWeight009(): number;

  native testSpanFontWeight010(): number;

  native testSpanFontWeight011(): number;

  native testSpanFontWeight012(): number;

  native testSpanFontWeight013(): number;

  native testSpanFontWeight014(): number;

  native testSpanFontWeight015(): number;

  native testSpanFontWeight016(): number;

  native testSpanContent001(): number;

  native testSpanContent002(): number;

  native testSpanTextBackgroundStyle001(): number;

  native testSpanTextBackgroundStyle002(): number;

  native testSpanTextBackgroundStyle003(): number;

  native testSpanTextBackgroundStyle004(): number;

  native testSpanTextBackgroundStyle005(): number;

  native testSpanTextBackgroundStyle006(): number;

  native testSpanTextShadow001(): number;

  native testSpanTextShadow002(): number;

  native testSpanTextShadow003(): number;

  native testSpanTextShadow004(): number;

  native testSpanFontFamily001(): number;

  native testSpanFontFamily002(): number;

  native testSpanFontFamily003(): number;

  native testSpanBaseLineOffset001(): number;

  native testSpanBaseLineOffset002(): number;

  native testSpanBaseLineOffset003(): number;

  native testSpanBaseLineOffset004(): number;

  native testColumnHeight001(): number;

  native testColumnHeight002(): number;

  native testColumnHeight003(): number;

  native testColumnWidth001(): number;

  native testColumnWidth002(): number;

  native testColumnWidth003(): number;

  native testColumnPadding001(): number;

  native testColumnPadding002(): number;

  native testColumnPadding003(): number;

  native testColumnPadding004(): number;

  native testColumnJustifyContent001(): number;

  native testColumnJustifyContent002(): number;

  native testColumnJustifyContent003(): number;

  native testColumnJustifyContent004(): number;

  native testColumnJustifyContent005(): number;

  native testColumnJustifyContent006(): number;

  native testColumnJustifyContent007(): number;

  native testColumnAlignItems001(): number;

  native testColumnAlignItems002(): number;

  native testColumnAlignItems003(): number;

  native testColumnAlignItems004(): number;

  native testColumnForegroundBlurStyle001(): number;

  native testColumnForegroundBlurStyle002(): number;

  native testColumnForegroundBlurStyle003(): number;

  native testColumnForegroundBlurStyle004(): number;

  native testColumnForegroundBlurStyle005(): number;

  native testColumnForegroundBlurStyle006(): number;

  native testColumnForegroundBlurStyle007(): number;

  native testColumnForegroundBlurStyle008(): number;

  native testColumnForegroundBlurStyle009(): number;

  native testColumnForegroundBlurStyle010(): number;

  native testColumnForegroundBlurStyle011(): number;

  native testColumnForegroundBlurStyle012(): number;

  native testColumnForegroundBlurStyle013(): number;

  native testColumnForegroundBlurStyle014(): number;

  native testColumnForegroundBlurStyle015(): number;

  native testColumnForegroundBlurStyle016(): number;

  native testColumnForegroundBlurStyle017(): number;

  native testColumnForegroundBlurStyle018(): number;

  native testColumnForegroundBlurStyle019(): number;

  native testColumnForegroundBlurStyle020(): number;

  native testColumnForegroundBlurStyle021(): number;

  native testColumnForegroundBlurStyle022(): number;

  native testColumnForegroundBlurStyle023(): number;

  native testColumnForegroundBlurStyle024(): number;

  native testColumnForegroundBlurStyle025(): number;

  native testColumnForegroundBlurStyle026(): number;

  native testColumnForegroundBlurStyle027(): number;

  native testColumnForegroundBlurStyle028(): number;

  native testColumnForegroundBlurStyle029(): number;

  native testColumnForegroundBlurStyle030(): number;

  native testColumnForegroundBlurStyle031(): number;

  native testColumnForegroundBlurStyle032(): number;

  native testTextAreaHeight001(): number;

  native testTextAreaHeight002(): number;

  native testTextAreaHeight003(): number;

  native testTextAreaBlurOnSubmit001(): number;

  native testTextAreaBlurOnSubmit002(): number;

  native testTextAreaBlurOnSubmit003(): number;

  native testTextAreaShowCounter001(): number;

  native testTextAreaShowCounter002(): number;

  native testTextAreaShowCounter003(): number;

  native testTextAreaShowCounter004(): number;

  native testTextAreaShowCounter005(): number;

  native testTextAreaShowCounter006(): number;

  native testTextAreaShowCounter007(): number;

  native testTextAreaSelectedBackgroundColor001(): number;

  native testTextAreaSelectedBackgroundColor002(): number;

  native testTextAreaSelectedBackgroundColor003(): number;

  native testTextAreaPlaceholder001(): number;

  native testTextAreaType001(): number;

  native testTextAreaType002(): number;

  native testTextAreaType003(): number;

  native testTextAreaType004(): number;

  native testTextAreaType005(): number;

  native testTextAreaWidth001(): number;

  native testTextAreaWidth002(): number;

  native testTextAreaWidth003(): number;

  native testTextAreaPosition001(): number;

  native testTextAreaPosition002(): number;

  native testTextInputBlurOnSubmit001(): number;

  native testTextInputBlurOnSubmit002(): number;

  native testTextInputBlurOnSubmit003(): number;

  native testTextInputPlaceholder001(): number;

  native testTextInputWidth001(): number;

  native testTextInputWidth002(): number;

  native testTextInputWidth003(): number;

  native testTextInputHeight001(): number;

  native testTextInputHeight002(): number;

  native testTextInputHeight003(): number;

  native testTextInputCaretStyle001(): number;

  native testTextInputCaretStyle002(): number;

  native testTextInputCaretStyle003(): number;

  native testTextInputSelectedBackgroundColor001(): number;

  native testTextInputSelectedBackgroundColor002(): number;

  native testTextInputSelectedBackgroundColor003(): number;

  native testTextInputShowPasswordIcon001(): number;

  native testTextInputShowPasswordIcon002(): number;

  native testTextInputShowPasswordIcon003(): number;

  native testTextInputPosition001(): number;

  native testTextInputPosition002(): number;

  native testTextInputType001(): number;

  native testTextInputType002(): number;

  native testTextInputType003(): number;

  native testTextInputType004(): number;

  native testTextInputType005(): number;

  native testTextInputType006(): number;

  native testTextInputType007(): number;

  native testTextInputType008(): number;

  native testTextInputType009(): number;

  native testTextInputType010(): number;

  native testTextInputType011(): number;

  native testTextInputEnterKeyType001(): number;

  native testTextInputEnterKeyType002(): number;

  native testTextInputEnterKeyType003(): number;

  native testTextInputEnterKeyType004(): number;

  native testTextInputEnterKeyType005(): number;

  native testTextInputEnterKeyType006(): number;

  native testTextInputEnterKeyType007(): number;

  native testTextInputEnterKeyType008(): number;

  native testTextInputEnableKeyboardOnFocus001(): number;

  native testTextInputEnableKeyboardOnFocus002(): number;

  native testTextInputEnableKeyboardOnFocus003(): number;

  native testDatePickerWidth001(): number;

  native testDatePickerWidth002(): number;

  native testDatePickerWidth003(): number;

  native testCheckboxWidth001(): number;

  native testCheckboxWidth002(): number;

  native testCheckboxWidth003(): number;

  native testCheckboxHeight001(): number;

  native testCheckboxHeight002(): number;

  native testCheckboxHeight003(): number;

  native testTextPickerWidth001(): number;

  native testTextPickerWidth002(): number;

  native testTextPickerWidth003(): number;

  native testTextPickerHeight001(): number;

  native testTextPickerHeight002(): number;

  native testTextPickerHeight003(): number;

  native testFlexWidth001(): number;

  native testFlexWidth002(): number;

  native testFlexWidth003(): number;

  native testFlexHeight001(): number;

  native testFlexHeight002(): number;

  native testFlexHeight003(): number;

  native testFlexOption001(): number;

  native testFlexOption002(): number;

  native testFlexOption003(): number;

  native testFlexOption004(): number;

  native testFlexOption005(): number;

  native testFlexOption006(): number;

  native testFlexOption007(): number;

  native testFlexOption008(): number;

  native testFlexOption009(): number;

  native testFlexOption010(): number;

  native testFlexOption011(): number;

  native testFlexOption012(): number;

  native testFlexOption013(): number;

  native testFlexOption014(): number;

  native testFlexOption015(): number;

  native testFlexOption016(): number;

  native testFlexOption017(): number;

  native testFlexOption018(): number;

  native testFlexOption019(): number;

  native testFlexOption020(): number;

  native testFlexOption021(): number;

  native testFlexOption022(): number;

  native testFlexOption023(): number;

  native testXComponentWidth001(): number;

  native testXComponentWidth002(): number;

  native testXComponentWidth003(): number;

  native testXComponentHeight001(): number;

  native testXComponentHeight002(): number;

  native testXComponentHeight003(): number;

  native testRowHeight001(): number;

  native testRowHeight002(): number;

  native testRowHeight003(): number;

  native testRowJustifyContent001(): number;

  native testRowJustifyContent002(): number;

  native testRowJustifyContent003(): number;

  native testRowJustifyContent004(): number;

  native testRowJustifyContent005(): number;

  native testRowJustifyContent006(): number;

  native testRowJustifyContent007(): number;

  native testRowAlignItems001(): number;

  native testRowAlignItems002(): number;

  native testRowAlignItems003(): number;

  native testRowAlignItems004(): number;

  native testSliderWidth001(): number;

  native testSliderWidth002(): number;

  native testSliderWidth003(): number;

  native testSliderHeight001(): number;

  native testSliderHeight002(): number;

  native testSliderHeight003(): number;

  native testLoadingProgressColor001(): number;

  native testLoadingProgressEnableLoading001(): number;

  native testLoadingProgressEnableLoading002(): number;

  native testProgressColor001(): number;

  native testProgressBackgroundColor001(): number;

  native testProgressStyle001(): number;

  native testProgressStyle002(): number;

  native testProgressStyle003(): number;

  native testProgressStyle004(): number;

  native testProgressStyle005(): number;

  native testProgressStyle006(): number;

  native testProgressTotal001(): number;

  native testProgressTotal002(): number;

  native testProgressTotal003(): number;

  native testProgressTotal004(): number;

  native testProgressTotal005(): number;

  native testProgressTotal006(): number;

  native testProgressValue001(): number;

  native testProgressValue002(): number;

  native testProgressValue003(): number;

  native testProgressValue004(): number;

  native testProgressValue005(): number;

  native testProgressValue006(): number;

  native testProgressValue007(): number;

  native testRefreshOffset001(): number;

  native testRefreshOffset002(): number;

  native testRefreshOffset003(): number;

  native testRefreshOffset004(): number;

  native testRefreshPullDownRatio001(): number;

  native testRefreshPullDownRatio002(): number;

  native testRefreshPullDownRatio003(): number;

  native testRefreshPullDownRatio004(): number;

  native testRefreshPullDownRatio005(): number;

  native testRefreshPullDownRatio006(): number;

  native testRefreshPullDownRatio007(): number;

  native testRefreshPullToRefresh001(): number;

  native testRefreshPullToRefresh002(): number;

  native testRefreshPullToRefresh003(): number;

  native testRefreshPullToRefresh004(): number;

  native testRefreshPullToRefresh005(): number;

  native testRefreshPullToRefresh006(): number;

  native testRefreshRefreshing001(): number;

  native testRefreshRefreshing002(): number;

  native testRefreshRefreshing003(): number;

  native testRefreshRefreshing004(): number;

  native testRefreshContent001(): number;

  native testRefreshContent002(): number;

  native testTextAreaBackgroundColor001(): number;

  native testTextAreaBackgroundColor002(): number;

  native testTextAreaBackgroundColor003(): number;

  native testTextAreaBorderRadius001(): number;

  native testTextAreaBorderRadius002(): number;

  native testTextAreaBorderRadius003(): number;

  native testTextAreaCaretColor001(): number;

  native testTextAreaCaretColor002(): number;

  native testTextAreaCaretColor003(): number;

  native testTextAreaFontColor001(): number;

  native testTextAreaFontFamily001(): number;

  native testTextAreaFontFamily002(): number;

  native testTextAreaFontSize001(): number;

  native testTextAreaFontSize002(): number;

  native testTextAreaFontSize003(): number;

  native testTextAreaFontStyle001(): number;

  native testTextAreaFontStyle002(): number;

  native testTextAreaFontWeight001(): number;

  native testTextAreaFontWeight002(): number;

  native testTextAreaFontWeight003(): number;

  native testTextAreaFontWeight004(): number;

  native testTextAreaFontWeight005(): number;

  native testTextAreaFontWeight006(): number;

  native testTextAreaFontWeight007(): number;

  native testTextAreaFontWeight008(): number;

  native testTextAreaFontWeight009(): number;

  native testTextAreaFontWeight010(): number;

  native testTextAreaFontWeight011(): number;

  native testTextAreaFontWeight012(): number;

  native testTextAreaFontWeight013(): number;

  native testTextAreaFontWeight014(): number;

  native testTextAreaFontWeight015(): number;

  native testTextAreaFontWeight016(): number;

  native testTextAreaLineHeight001(): number;

  native testTextAreaLineHeight002(): number;

  native testTextAreaMaxLength001(): number;

  native testTextAreaMaxLength002(): number;

  native testTextAreaMaxLength003(): number;

  native testTextAreaPadding001(): number;

  native testTextAreaPadding002(): number;

  native testTextAreaPlaceholderColor001(): number;

  native testTextAreaPlaceholderColor002(): number;

  native testTextAreaPlaceholderColor003(): number;

  native testTextAreaPlaceholderFont001(): number;

  native testTextAreaPlaceholderFont002(): number;

  native testTextAreaPlaceholderFont003(): number;

  native testTextAreaPlaceholderFont004(): number;

  native testTextAreaPlaceholderFont005(): number;

  native testTextAreaPlaceholderFont006(): number;

  native testTextAreaPlaceholderFont007(): number;

  native testTextAreaPlaceholderFont008(): number;

  native testTextAreaPlaceholderFont009(): number;

  native testTextAreaPlaceholderFont010(): number;

  native testTextAreaPlaceholderFont011(): number;

  native testTextAreaPlaceholderFont012(): number;

  native testTextAreaPlaceholderFont013(): number;

  native testTextAreaPlaceholderFont014(): number;

  native testTextAreaPlaceholderFont015(): number;

  native testTextAreaPlaceholderFont016(): number;

  native testTextAreaPlaceholderFont017(): number;

  native testTextAreaPlaceholderFont018(): number;

  native testTextAreaPlaceholderFont019(): number;

  native testTextAreaPlaceholderFont020(): number;

  native testTextAreaStopEditing001(): number;

  native testTextAreaStopEditing002(): number;

  native testTextAreaTextAlign001(): number;

  native testTextAreaTextAlign002(): number;

  native testTextAreaTextAlign003(): number;

  native testTextAreaTextAlign004(): number;

  native testTextAreaTextAlign005(): number;

  native testTextAreatestCase001(): number;

  native testTextAreatestCase002(): number;

  native testTextAreatestCase003(): number;

  native testTextInputFontFamily001(): number;

  native testTextInputFontFamily002(): number;

  native testTextInputMaxLength001(): number;

  native testTextInputMaxLength002(): number;

  native testTextInputMaxLength003(): number;

  native testTextInputPlaceholderColor001(): number;

  native testTextInputPlaceholderColor002(): number;

  native testTextInputPlaceholderColor003(): number;

  native testTextInputPlaceholderFont001(): number;

  native testTextInputPlaceholderFont002(): number;

  native testTextInputPlaceholderFont003(): number;

  native testTextInputPlaceholderFont004(): number;

  native testTextInputPlaceholderFont005(): number;

  native testTextInputPlaceholderFont006(): number;

  native testTextInputPlaceholderFont007(): number;

  native testTextInputPlaceholderFont008(): number;

  native testTextInputPlaceholderFont009(): number;

  native testTextInputPlaceholderFont010(): number;

  native testTextInputPlaceholderFont011(): number;

  native testTextInputPlaceholderFont012(): number;

  native testTextInputPlaceholderFont013(): number;

  native testTextInputPlaceholderFont014(): number;

  native testTextInputPlaceholderFont015(): number;

  native testTextInputPlaceholderFont016(): number;

  native testTextInputPlaceholderFont017(): number;

  native testTextInputPlaceholderFont018(): number;

  native testTextInputPlaceholderFont019(): number;

  native testTextInputPlaceholderFont020(): number;

  native testTextInputClearButtonMode001(): number;

  native testTextInputClearButtonMode002(): number;

  native testTextInputClearButtonMode003(): number;

  native testTextInputClearButtonMode004(): number;

  native testTextInputResponseRegion001(): number;

  native testTextInputResponseRegion002(): number;

  native testTextAreaDefaultFocus001(): number;

  native testTextAreaDefaultFocus002(): number;

  native testTextAreaResponseRegion001(): number;

  native testTextAreaResponseRegion002(): number;

  native testSliderBlockColor001(): number;

  native testSliderBlockColor002(): number;

  native testSliderBlockColor003(): number;

  native testSliderBlockColor004(): number;

  native testSliderBlockColor005(): number;

  native testSliderBlockColor006(): number;

  native testSliderBlockColor007(): number;

  native testSliderBlockStyle001(): number;

  native testSliderBlockStyle002(): number;

  native testSliderBlockStyle003(): number;

  native testSliderBlockStyle004(): number;

  native testSliderBlockStyle005(): number;

  native testSliderBlockStyle006(): number;

  native testSliderBlockStyle007(): number;

  native testSliderBlockStyle008(): number;

  native testSliderBlockStyle009(): number;

  native testSliderBlockStyle010(): number;

  native testSliderBlockStyle011(): number;

  native testSliderBlockStyle012(): number;

  native testSliderDirection001(): number;

  native testSliderDirection002(): number;

  native testSliderDirection003(): number;

  native testSliderDirection004(): number;

  native testSliderDirection005(): number;

  native testSliderMax001(): number;

  native testSliderMax002(): number;

  native testSliderMax003(): number;

  native testSliderMax004(): number;

  native testSliderMax005(): number;

  native testSliderMin001(): number;

  native testSliderMin002(): number;

  native testSliderMin003(): number;

  native testSliderMin004(): number;

  native testSliderMin005(): number;

  native testSliderReverse001(): number;

  native testSliderReverse002(): number;

  native testSliderReverse003(): number;

  native testSliderReverse004(): number;

  native testSliderReverse005(): number;

  native testSliderSelectedColor002(): number;

  native testSliderSelectedColor003(): number;

  native testSliderSelectedColor004(): number;

  native testSliderSelectedColor005(): number;

  native testSliderSelectedColor006(): number;

  native testSliderSelectedColor007(): number;

  native testSliderShowSteps001(): number;

  native testSliderShowSteps002(): number;

  native testSliderShowSteps003(): number;

  native testSliderShowSteps004(): number;

  native testSliderShowSteps005(): number;

  native testSliderStep001(): number;

  native testSliderStep002(): number;

  native testSliderStep003(): number;

  native testSliderStep004(): number;

  native testSliderStep005(): number;

  native testSliderStyle001(): number;

  native testSliderStyle002(): number;

  native testSliderStyle003(): number;

  native testSliderStyle004(): number;

  native testSliderStyle005(): number;

  native testSliderTrackColor001(): number;

  native testSliderTrackColor002(): number;

  native testSliderTrackColor003(): number;

  native testSliderTrackColor004(): number;

  native testSliderTrackColor005(): number;

  native testSliderTrackColor006(): number;

  native testSliderTrackThickness001(): number;

  native testSliderTrackThickness002(): number;

  native testSliderTrackThickness003(): number;

  native testSliderTrackThickness004(): number;

  native testSliderTrackThickness005(): number;

  native testSliderTrackThickness006(): number;

  native testSliderTrackThickness007(): number;

  native testSliderTrackThickness008(): number;

  native testSliderTrackThickness009(): number;

  native testSliderTrackThickness010(): number;

  native testSliderTrackThickness011(): number;

  native testSliderTrackThickness012(): number;

  native testSliderTrackThickness013(): number;

  native testSliderTrackThickness014(): number;

  native testSliderTrackThickness015(): number;

  native testSliderValue001(): number;

  native testSliderValue002(): number;

  native testSliderValue003(): number;

  native testSliderValue004(): number;

  native testSliderValue005(): number;

  native testTextInputLineHeight001(): number;

  native testTextInputLineHeight002(): number;

  native testTextInputLineHeight003(): number;

  native testTextInputLineHeight004(): number;

  native testTextInputLineHeight005(): number;

  native testTextInputStopEditing001(): number;

  native testTextInputStopEditing002(): number;

  native testTextPickerDefaultPickerItemHeight004(): number;

  native testLoadingProgressColor002(): number;

  native testLoadingProgressColor003(): number;

  native testProgressColor002(): number;

  native testProgressColor003(): number;

  native testProgressBackgroundColor002(): number;

  native testProgressBackgroundColor003(): number;

  native testLoadingProgressEnableLoading003(): number;

  native testTextAreaFontColor002(): number;

  native testTextAreaFontColor003(): number;

  native testTextAreaFontFamily003(): number;

  native testScrollLinearGradient010(): number;


  native testTextInputAccessibilityLevel005(): number;

  native testTextInputAccessibilityLevel006(): number;

  native testTextAreaAccessibilityLevel005(): number;

  native testTextAreaAccessibilityLevel006(): number;

  native testSwiperAccessibilityLevel005(): number;

  native testSwiperAccessibilityLevel006(): number;

  native testScrollAccessibilityLevel005(): number;

  native testScrollAccessibilityLevel006(): number;

  native testListAccessibilityLevel005(): number;

  native testListAccessibilityLevel006(): number;

  native testToggleAccessibilityLevel005(): number;

  native testToggleAccessibilityLevel006(): number;

  native testTextAccessibilityLevel005(): number;

  native testTextAccessibilityLevel006(): number;

  native testRefreshAccessibilityLevel005(): number;

  native testRefreshAccessibilityLevel006(): number;

  native testDatePickerAccessibilityLevel005(): number;

  native testDatePickerAccessibilityLevel006(): number;

  native testTimePickerAccessibilityLevel005(): number;

  native testTimePickerAccessibilityLevel006(): number;

  native testSliderAccessibilityLevel005(): number;

  native testSliderAccessibilityLevel006(): number;

  native testButtonAccessibilityLevel005(): number;

  native testButtonAccessibilityLevel006(): number;

  native testTextPickerAccessibilityLevel005(): number;

  native testTextPickerAccessibilityLevel006(): number;

  native testCheckboxAccessibilityLevel005(): number;

  native testCheckboxAccessibilityLevel006(): number;

  native testProgressAccessibilityLevel005(): number;

  native testProgressAccessibilityLevel006(): number;

  native testTextInputDefaultFocus001(): number;

  native testTextInputDefaultFocus002(): number;

  native testTextInputStopEditing003(): number;

  native testTextInputStopEditing004(): number;

  native testTextInputStopEditing005(): number;

  native TestArkUIAddApi001(): number;

  native TestArkUIAddApi002(): number;

  native TestArkUIAddApi003(): number;

  native TestArkUIAddApi004(): number;

  native TestArkUIAddApi005(): number;

  native TestArkUIAddApi006(): number;

  native TestArkUIAddApi007(): number;

  native TestArkUIAddApi008(): number;

  native TestArkUIAddApi009(): number;

  native TestArkUIAddApi010(): number;

  native TestArkUIAddApi011(): number;

  native TestArkUIAddApi012(): number;

  native TestArkUIAddApi013(): number;

  native TestArkUIAddApi014(): number;

  native TestArkUIAddApi015(): number;

  native TestArkUIAddApi016(): number;

  native TestArkUIAddApi017(): number;

  native TestArkUIAddApi018(): number;

  native TestArkUIAddApi019(): number;

  native TestArkUIAddApi020(): number;

  native TestArkUIAddApi021(): number;

  native TestArkUIAddApi022(): number;

  native TestArkUIAddApi023(): number;

  native TestArkUIAddApi024(): number;

  native testAnimation_001(): number;

  native testAnimation_002(): number;

  native testAnimation_003(): number;

  native testAnimation_004(): number;

  native testAnimation_005(): number;

  native testWaterFlower_001(): number;

  native testWaterFlower_002(): number;

  native testWaterFlower_003(): number;

  native testWaterFlower_004(): number;

  native testWaterFlower_005(): number;

  native testLayoutDirection001(): number;

  native testLayoutDirection002(): number;

  native testLayoutDirection003(): number;

  native testLayoutDirection004(): number;

  native testLayoutDirection005(): number;

  native testLayoutDirection006(): number;

  native testLayoutDirection007(): number;

  native testColumnsTemplate001(): number;

  native testColumnsTemplate002(): number;

  native testColumnsTemplate003(): number;

  native testRowsTemplate001(): number;

  native testRowsTemplate002(): number;

  native testRowsTemplate003(): number;

  native testColumnsGap001(): number;

  native testColumnsGap002(): number;

  native testColumnsGap003(): number;

  native testRowsGap001(): number;

  native testRowsGap002(): number;

  native testRowsGap003(): number;

  native testNestedScroll001(): number;

  native testNestedScroll002(): number;

  native testNestedScroll003(): number;

  native testNestedScroll004(): number;

  native testNestedScroll005(): number;

  native testNestedScroll006(): number;

  native testCachedCount001(): number;

  native testCachedCount002(): number;

  native testCachedCount003(): number;

  native testCachedCount004(): number;

  native testScrollBar001(): number;

  native testScrollBar002(): number;

  native testScrollBar003(): number;

  native testScrollBar004(): number;

  native testScrollBar005(): number;

  native testWaterFlowScrollBarWidth001(): number;

  native testWaterFlowScrollBarWidth002(): number;

  native testWaterFlowScrollBarWidth003(): number;

  native testWaterFlowScrollBarWidth004(): number;

  native testScrollBarColor001(): number;

  native testScrollBarColor002(): number;

  native testScrollBarColor003(): number;

  native testItemConstraintSize001(): number;

  native testItemConstraintSize002(): number;

  native testItemConstraintSize003(): number;

  native testItemConstraintSize004(): number;

  native testEnableScrollInteraction001(): number;

  native testEnableScrollInteraction002(): number;

  native testEnableScrollInteraction003(): number;

  native testEdgeEffect001(): number;

  native testEdgeEffect002(): number;

  native testEdgeEffect003(): number;

  native testEdgeEffect004(): number;

  native testEdgeEffect005(): number;

  native testScrollOffset001(): number;

  native testScrollOffset002(): number;

  native testScrollOffset003(): number;

  native testScrollOffset004(): number;

  native testScrollOffset005(): number;

  native testScrollOffset006(): number;

  native testScrollOffset007(): number;

  native testScrollOffset008(): number;

  native testScrollOffset009(): number;

  native testScrollOffset0010(): number;

  native testScrollOffset0011(): number;

  native testScrollOffset0012(): number;

  native testScrollOffset0013(): number;

  native testScrollOffset0014(): number;

  native testScrollOffset0015(): number;

  native testScrollOffset0016(): number;

  native testScrollOffset0017(): number;

  native testScrollOffset0018(): number;

  native testScrollOffset0019(): number;

  native testScrollEdge001(): number;

  native testScrollEdge002(): number;

  native testScrollEdge003(): number;

  native testScrollEdge004(): number;

  native testScrollEdge005(): number;

  native testScrollPage001(): number;

  native testScrollPage002(): number;

  native testScrollPage003(): number;

  native testScrollBy001(): number;

  native testScrollBy002(): number;

  native testScrollBy003(): number;

  native testScrollBy004(): number;

  native testSectionOption001(): number;

  native testSectionOption002(): number;

  native testSectionOption003(): number;

  native testSectionOption004(): number;

  native testSectionOption005(): number;

  native testSectionOption006(): number;

  native testSectionOption007(): number;

  native testSectionOption008(): number;

  native testSectionOption009(): number;

  native testSectionOption010(): number;

  native testSectionOption011(): number;

  native testSectionOption012(): number;

  native testWaterFlowNodeAdapter001(): number;

  native testWaterFlowFooter001(): number;

  native testWaterFlowScrollFriction001(): number;

  native testWaterFlowScrollFriction002(): number;

  native accessibilityState_001(): number;

  native accessibilityState_002(): number;

  native accessibilityState_003(): number;

  native testRelativeContaineAlignmentRuleOptionCreate001(): number;

  native testRelativeContaineAlignmentRuleOptionDispose001(): number;

  native testRelativeContaineAlignmentRuleOptionSetStart001(): number;

  native testRelativeContaineAlignmentRuleOptionSetStart002(): number;

  native testRelativeContaineAlignmentRuleOptionSetStart003(): number;

  native testRelativeContaineAlignmentRuleOptionSetEnd001(): number;

  native testRelativeContaineAlignmentRuleOptionSetEnd002(): number;

  native testRelativeContaineAlignmentRuleOptionSetEnd003(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterHorizontal001(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterHorizontal002(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterHorizontal003(): number;

  native testRelativeContaineAlignmentRuleOptionSetTop001(): number;

  native testRelativeContaineAlignmentRuleOptionSetTop002(): number;

  native testRelativeContaineAlignmentRuleOptionSetTop003(): number;

  native testRelativeContaineAlignmentRuleOptionSetBottom001(): number;

  native testRelativeContaineAlignmentRuleOptionSetBottom002(): number;

  native testRelativeContaineAlignmentRuleOptionSetBottom003(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterVertical001(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterVertical002(): number;

  native testRelativeContaineAlignmentRuleOptionSetCenterVertical003(): number;

  native testRelativeContaineAlignmentRuleOptionSetBiasHorizontal001(): number;

  native testRelativeContaineAlignmentRuleOptionSetBiasHorizontal002(): number;

  native testRelativeContaineAlignmentRuleOptionSetBiasVertical001(): number;

  native testRelativeContaineAlignmentRuleOptionSetBiasVertical002(): number;

  native testRelativeContainerGuidelineOptionCreate001(): number;

  native testRelativeContainerGuidelineOptionDispose001(): number;

  native testRelativeContainerGuidelineOptionSetId001(): number;

  native testRelativeContainerGuidelineOptionSetId002(): number;

  native testRelativeContainerGuidelineOptionSetId003(): number;

  native testRelativeContainerGuidelineOptionSetId004(): number;

  native testRelativeContainerGuidelineOptionGetId001(): number;

  native testRelativeContainerGuidelineOptionGetId002(): number;

  native testRelativeContainerGuidelineOptionSetDirection001(): number;

  native testRelativeContainerGuidelineOptionSetDirection002(): number;

  native testRelativeContainerGuidelineOptionGetDirection001(): number;

  native testRelativeContainerGuidelineOptionGetDirection002(): number;

  native testRelativeContainerGuidelineOptionSetPositionStart001(): number;

  native testRelativeContainerGuidelineOptionSetPositionStart002(): number;

  native testRelativeContainerGuidelineOptionSetPositionStart003(): number;

  native testRelativeContainerGuidelineOptionSetPositionStart004(): number;

  native testRelativeContainerGuidelineOptionGetPositionStart001(): number;

  native testRelativeContainerGuidelineOptionGetPositionStart002(): number;

  native testRelativeContainerGuidelineOptionSetPositionEnd001(): number;

  native testRelativeContainerGuidelineOptionSetPositionEnd002(): number;

  native testRelativeContainerGuidelineOptionSetPositionEnd003(): number;

  native testRelativeContainerGuidelineOptionSetPositionEnd004(): number;

  native testRelativeContainerGuidelineOptionGetPositionEnd001(): number;

  native testRelativeContainerGuidelineOptionGetPositionEnd002(): number;

  native testRelativeContainerBarrierOptionCreate001(): number;

  native testRelativeContainerBarrierOptionDispose001(): number;

  native testRelativeContainerBarrierOptionSetId001(): number;

  native testRelativeContainerBarrierOptionSetId002(): number;

  native testRelativeContainerBarrierOptionSetId003(): number;

  native testRelativeContainerBarrierOptionSetId004(): number;

  native testRelativeContainerBarrierOptionGetId001(): number;

  native testRelativeContainerBarrierOptionGetId002(): number;

  native testRelativeContainerBarrierOptionSetDirection001(): number;

  native testRelativeContainerBarrierOptionSetDirection002(): number;

  native testRelativeContainerBarrierOptionSetDirection003(): number;

  native testRelativeContainerBarrierOptionSetDirection004(): number;

  native testRelativeContainerBarrierOptionSetDirection005(): number;

  native testRelativeContainerBarrierOptionSetDirection006(): number;

  native testRelativeContainerBarrierOptionGetDirection001(): number;

  native testRelativeContainerBarrierOptionGetDirection002(): number;

  native testRelativeContainerBarrierOptionSetReferencedId001(): number;

  native testRelativeContainerBarrierOptionSetReferencedId002(): number;

  native testRelativeContainerBarrierOptionSetReferencedId003(): number;

  native testRelativeContainerBarrierOptionGetReferencedId001(): number;

  native testRelativeContainerBarrierOptionGetReferencedId002(): number;

  native testRelativeContainerBarrierOptionGetReferencedId003(): number;

  native testRelativeContainerBarrierOptionGetReferencedSize001(): number;

  native testRelativeContainerBarrierOptionGetReferencedSize002(): number;

  native testRelativeContaineAlignmentRuleOption001(): number;

  native testRelativeContaineAlignmentRuleOption002(): number;

  native testRelativeContaineAlignmentRuleOption003(): number;

  native testRelativeContaineBarrierOption001(): number;

  native testRelativeContaineBarrierOption002(): number;

  native testRelativeContaineBarrierOption003(): number;

  native customComponentEventNullTest001(): number;

  native customComponentEventNullTest002(): number;

  native testCommonAttrsAnimate001(): number;

  native testCommonAttrsAnimate002(): number;

  native testCommonAttrsAnimate003(): number;

  native testCommonAttrsAnimate004(): number;

  native testDrawableDescriptorCreate001(): number;

  native testDrawableDescriptorCreate002(): number;

  native testDrawableDescriptorCreate003(): number;

  native testNodeContent001(): number;

  native testNodeContent002(): number;

  native testNodeContent003(): number;

  native testNodeContent004(): number;

  native testNodeContent005(): number;

  native testNodeContent006(): number;

  native testNodeContent007(): number;

  native testNativeXComponent001(): number;

  native testMouseEvent001(): number;

  native testMouseEvent002(): number;

  native testPointerEvent001(): number;

  native testTextDecoration007(): number;

  native testTextDecoration008(): number;

  native testTextDecoration009(): number;

  native testTextDecoration010(): number;

  native testTextDecoration011(): number;

  native testTextDecoration012(): number;

  native testTextDecoration013(): number;

  native testTextDecoration014(): number;

  native testTextDecoration015(): number;

  native testTextDecoration016(): number;

  native testTextWordBreak001(): number;

  native testTextWordBreak002(): number;

  native testTextWordBreak003(): number;

  native testTextWordBreak004(): number;

  native testTextWordBreak005(): number;

  native testTextWordBreak006(): number;

  native testTextWordBreak007(): number;

  native testTextLineSpacing001(): number;

  native testTextLineSpacing002(): number;

  native testTextLineSpacing003(): number;

  native testTextLineSpacing004(): number;

  native testTextFontFeature001(): number;

  native testTextFontFeature002(): number;

  native testTextFontFeature003(): number;

  native testTextFontFeature004(): number;

  native testTextSelectedBackgroundColor001(): number;

  native testTextSelectedBackgroundColor002(): number;

  native testTextSelectedBackgroundColor003(): number;

  native testTextSelectedBackgroundColor004(): number;

  native testTextEnableDataDetector001(): number;

  native testTextEnableDataDetector002(): number;

  native testTextEnableDataDetector003(): number;

  native testTextEnableDataDetector004(): number;

  native testTextEllipsisMode001(): number;

  native testTextEllipsisMode002(): number;

  native testTextEllipsisMode003(): number;

  native testTextEllipsisMode004(): number;

  native testTextEllipsisMode005(): number;

  native testTextEllipsisMode006(): number;

  native testTextEllipsisMode007(): number;

  native testTextParagraph001(): number;

  native testTextParagraph002(): number;

  native testTextParagraph003(): number;

  native testTextDataDetectorConfig001(): number;

  native testTextDataDetectorConfig002(): number;

  native testTextDataDetectorConfig003(): number;

  native testTextDataDetectorConfig004(): number;

  native testTextDataDetectorConfig005(): number;

  native testTextDataDetectorConfig006(): number;

  native testTextDataDetectorConfig007(): number;

  native testTextDataDetectorConfig008(): number;

  native testSpanDecoration006(): number;

  native testSpanDecoration007(): number;

  native testSpanDecoration008(): number;

  native testSpanDecoration009(): number;

  native testSpanDecoration010(): number;

  native testSpanDecoration011(): number;

  native testSpanDecoration012(): number;

  native testDatePickerStart003(): number;

  native testDatePickerStart004(): number;

  native testDatePickerEnd003(): number;

  native testDatePickerEnd004(): number;

  native testDatePickerSelected003(): number;

  native testDatePickerSelected004(): number;

  native testDatePickerSelectedTextStyle003(): number;

  native testDatePickerSelectedTextStyle004(): number;

  native testDatePickerSelectedTextStyle005(): number;

  native testDatePickerSelectedTextStyle006(): number;

  native testDatePickerSelectedTextStyle007(): number;

  native testDatePickerSelectedTextStyle008(): number;

  native testDatePickerSelectedTextStyle009(): number;

  native testDatePickerSelectedTextStyle010(): number;

  native testDatePickerSelectedTextStyle011(): number;

  native testDatePickerSelectedTextStyle012(): number;

  native testDatePickerSelectedTextStyle013(): number;

  native testStackPosition003(): number;

  native testDatePickerDisappearTextStyle003(): number;

  native testDatePickerDisappearTextStyle004(): number;

  native testDatePickerDisappearTextStyle005(): number;

  native testDatePickerDisappearTextStyle006(): number;

  native testDatePickerDisappearTextStyle007(): number;

  native testDatePickerDisappearTextStyle008(): number;

  native testDatePickerDisappearTextStyle009(): number;

  native testDatePickerDisappearTextStyle010(): number;

  native testDatePickerDisappearTextStyle011(): number;

  native testDatePickerDisappearTextStyle012(): number;

  native testDatePickerDisappearTextStyle013(): number;

  native testDatePickerTextStyle003(): number;

  native testDatePickerTextStyle004(): number;

  native testDatePickerTextStyle005(): number;

  native testDatePickerTextStyle006(): number;

  native testDatePickerTextStyle007(): number;

  native testDatePickerTextStyle008(): number;

  native testDatePickerTextStyle009(): number;

  native testDatePickerTextStyle010(): number;

  native testDatePickerTextStyle011(): number;

  native testDatePickerTextStyle012(): number;

  native testDatePickerTextStyle013(): number;

  native testTextPickerTextStyle003(): number;

  native testTextPickerTextStyle004(): number;

  native testTextPickerTextStyle005(): number;

  native testTextPickerTextStyle006(): number;

  native testTextPickerTextStyle007(): number;

  native testTextPickerTextStyle008(): number;

  native testTextPickerTextStyle009(): number;

  native testTextPickerTextStyle010(): number;

  native testTextPickerTextStyle011(): number;

  native testTextPickerTextStyle012(): number;

  native testTextPickerTextStyle013(): number;

  native testTextPickerDisappearTextStyle003(): number;

  native testTextPickerDisappearTextStyle004(): number;

  native testTextPickerDisappearTextStyle005(): number;

  native testTextPickerDisappearTextStyle006(): number;

  native testTextPickerDisappearTextStyle007(): number;

  native testTextPickerDisappearTextStyle008(): number;

  native testTextPickerDisappearTextStyle009(): number;

  native testTextPickerDisappearTextStyle010(): number;

  native testTextPickerDisappearTextStyle011(): number;

  native testTextPickerDisappearTextStyle012(): number;

  native testTextPickerDisappearTextStyle013(): number;

  native testTextPickerSelectedTextStyle003(): number;

  native testTextPickerSelectedTextStyle004(): number;

  native testTextPickerSelectedTextStyle005(): number;

  native testTextPickerSelectedTextStyle006(): number;

  native testTextPickerSelectedTextStyle007(): number;

  native testTextPickerSelectedTextStyle008(): number;

  native testTextPickerSelectedTextStyle009(): number;

  native testTextPickerSelectedTextStyle010(): number;

  native testTextPickerSelectedTextStyle011(): number;

  native testTextPickerSelectedTextStyle012(): number;

  native testTextPickerSelectedTextStyle013(): number;

  native testTimePickerDisappearTextStyle003(): number;

  native testTimePickerDisappearTextStyle004(): number;

  native testTimePickerDisappearTextStyle005(): number;

  native testTimePickerDisappearTextStyle006(): number;

  native testTimePickerDisappearTextStyle007(): number;

  native testTimePickerDisappearTextStyle008(): number;

  native testTimePickerDisappearTextStyle009(): number;

  native testTimePickerDisappearTextStyle010(): number;

  native testTimePickerDisappearTextStyle011(): number;

  native testTimePickerDisappearTextStyle012(): number;

  native testTimePickerDisappearTextStyle013(): number;

  native testTimePickerSelectedTextStyle003(): number;

  native testTimePickerSelectedTextStyle004(): number;

  native testTimePickerSelectedTextStyle005(): number;

  native testTimePickerSelectedTextStyle006(): number;

  native testTimePickerSelectedTextStyle007(): number;

  native testTimePickerSelectedTextStyle008(): number;

  native testTimePickerSelectedTextStyle009(): number;

  native testTimePickerSelectedTextStyle010(): number;

  native testTimePickerSelectedTextStyle011(): number;

  native testTimePickerSelectedTextStyle012(): number;

  native testTimePickerSelectedTextStyle013(): number;

  native testTimePickerTextStyle003(): number;

  native testTimePickerTextStyle004(): number;

  native testTimePickerTextStyle005(): number;

  native testTimePickerTextStyle006(): number;

  native testTimePickerTextStyle007(): number;

  native testTimePickerTextStyle008(): number;

  native testTimePickerTextStyle009(): number;

  native testTimePickerTextStyle010(): number;

  native testTimePickerTextStyle011(): number;

  native testTimePickerTextStyle012(): number;

  native testTimePickerTextStyle013(): number;

  native testToggleSelectedColor004(): number;

  native testToggleSelectedColor005(): number;

  native testToggleUnSelectedColor001(): number;

  native testToggleUnSelectedColor002(): number;

  native testToggleUnSelectedColor003(): number;

  native testToggleUnSelectedColor004(): number;

  native testToggleSwitchPointColor004(): number;

  native testToggleSwitchPointColor005(): number;

  native testAnimateOption002(): number;

  native testAnimateOption003(): number;

  native testAnimateOption004(): number;

  native testAnimateOption005(): number;

  native testAnimateOption006(): number;

  native testAnimateOption007(): number;

  native testAnimateOption008(): number;

  native testAnimateOption009(): number;

  native testAnimateOption010(): number;

  native testAnimateOption011(): number;

  native testAnimateOption012(): number;

  native testAnimateOption013(): number;

  native testAnimateOption014(): number;

  native testAnimateOption015(): number;

  native testAnimateOption016(): number;

  native testAnimateOption017(): number;

  native testAnimateOption018(): number;

  native testAnimateOption019(): number;

  native testAnimateOption020(): number;

  native testAnimateOption021(): number;

  native testAnimateOption022(): number;

  native testAnimateOption023(): number;

  native testAnimateOption024(): number;

  native testAnimateOption025(): number;

  native testAnimateOption026(): number;

  native testAnimateOption027(): number;

  native testAnimateOption028(): number;

  native testAnimateOption029(): number;

  native testAnimateOption030(): number;

  native testAnimateOption031(): number;

  native testAnimateOption032(): number;

  native testAnimateOption033(): number;

  native testAnimateOption034(): number;

  native testAnimateOption035(): number;

  native testAnimateOption036(): number;

  native testAnimateOption037(): number;

  native testAnimateOption038(): number;

  native testAnimateOption039(): number;

  native testAnimateOption040(): number;

  native testAnimateOption041(): number;

  native testAnimateOption042(): number;

  native testAnimateOption043(): number;

  native testAnimateCurve001(): number;

  native testAnimateCurve002(): number;

  native testAnimateCurve003(): number;

  native testAnimateCurve004(): number;

  native testAnimateCurve005(): number;

  native testAnimateCurve006(): number;

  native testAnimateCurve007(): number;

  native testAnimateCurve008(): number;

  native testAnimateCurve009(): number;

  native testAnimateCurve010(): number;

  native testAnimateCurve011(): number;

  native testKeyframeAnimateOption001(): number;

  native testKeyframeAnimateOption002(): number;

  native testKeyframeAnimateOption003(): number;

  native testKeyframeAnimateOption004(): number;

  native testKeyframeAnimateOption005(): number;

  native testKeyframeAnimateOption006(): number;

  native testKeyframeAnimateOption007(): number;

  native testKeyframeAnimateOption008(): number;

  native testKeyframeAnimateOption009(): number;

  native testKeyframeAnimateOption010(): number;

  native testKeyframeAnimateOption011(): number;

  native testKeyframeAnimateOption013(): number;

  native testKeyframeAnimateOption014(): number;

  native testKeyframeAnimateOption015(): number;

  native testKeyframeAnimateOption016(): number;

  native testKeyframeAnimateOption017(): number;

  native testKeyframeAnimateOption018(): number;

  native testKeyframeAnimateOption019(): number;

  native testKeyframeAnimateOption020(): number;

  native testKeyframeAnimateOption021(): number;

  native testKeyframeAnimateOption022(): number;

  native testKeyframeAnimateOption024(): number;

  native testKeyframeAnimateOption025(): number;

  native testGeometryTransition001(): number;

  native testGeometryTransition002(): number;

  native testGeometryTransition003(): number;

  native testGeometryTransition004(): number;

  native testGeometryTransition005(): number;

  native testAnimatorOption001(): number;

  native testAnimatorOption002(): number;

  native testAnimatorOption003(): number;

  native testAnimatorOption004(): number;

  native testAnimatorOption005(): number;

  native testAnimatorOption006(): number;

  native testAnimatorOption007(): number;

  native testAnimatorOption008(): number;

  native testAnimatorOption009(): number;

  native testAnimatorOption010(): number;

  native testAnimatorOption011(): number;

  native testAnimatorOption012(): number;

  native testAnimatorOption013(): number;

  native testAnimatorOption014(): number;

  native testAnimatorOption015(): number;

  native testAnimatorOption016(): number;

  native testAnimatorOption017(): number;

  native testAnimatorOption018(): number;

  native testAnimatorOption019(): number;

  native testAnimatorOption020(): number;

  native testAnimatorOption021(): number;

  native testAnimatorOption022(): number;

  native testAnimatorOption023(): number;

  native testAnimatorOption024(): number;

  native testAnimatorOption025(): number;

  native testAnimatorOption026(): number;

  native testAnimatorOption027(): number;

  native testAnimatorOption028(): number;

  native testAnimatorOption029(): number;

  native testAnimatorOption030(): number;

  native testAnimatorOption031(): number;

  native testAnimatorOption032(): number;

  native testAnimatorOption033(): number;

  native testAnimatorOption034(): number;

  native testAnimatorOption035(): number;

  native testAnimatorOption036(): number;

  native testAnimatorOption037(): number;

  native testAnimatorOption038(): number;

  native testAnimatorOption039(): number;

  native testAnimatorOption040(): number;

  native testAnimatorOption041(): number;

  native testAnimatorOption042(): number;

  native testAnimatorOption043(): number;

  native testAnimatorOption044(): number;

  native testAnimatorOption045(): number;

  native testAnimatorOption046(): number;

  native testAnimatorOption048(): number;

  native testAnimatorOption049(): number;

  native testAnimatorOption051(): number;

  native testAnimatorOption052(): number;

  native testAnimatorOption054(): number;

  native testAnimatorOption055(): number;

  native testAnimatorOption057(): number;

  native testAnimatorOption058(): number;

  native testAnimatorOption059(): number;

  native testAnimatorOption060(): number;

  native testAnimatorOption061(): number;

  native testAnimatorOption063(): number;

  native testAnimatorOption064(): number;

  native testAnimatorOption065(): number;

  native testAnimatorOption066(): number;

  native testAnimatorOption067(): number;

  native native_001(): number;

  native native_002(): number;

  native native_003(): number;

  native native_005(): number;

  native native_006(): number;

  native native_007(): number;

  native native_008(): number;

  native native_009(): number;

  native native_010(): number;

  native native_011(): number;

  native native_012(): number;

  native native_013(): number;

  native native_014(): number;

  native DialogModelTest_001(): number;

  native DialogModelTest_002(): number;

  native DialogModelTest_003(): number;

  native drag_getDragEvent_001(): number;

  native drag_getDataTypes_001(): number;

  native drag_setGetUdmfData_001(): number;

  native drag_setGetUdmfData_002(): number;

  native drag_setGetUdmfData_003(): number;

  native gestureTestParaMeter001(): number;

  native gestureTestParaMeter002(): number;

  native gestureTestParaMeter003(): number;

  native gestureTestParaMeter004(): number;

  native gestureTestParaMeter005(): number;

  native gestureTestParaMeter006(): number;

  native gestureTestParaMeter007(): number;

  native gestureTestParaMeter008(): number;

  native gestureTestParaMeter009(): number;

  native testGridColumnsGap001(): number;

  native testGridColumnsGap002(): number;

  native testGridColumnsGap003(): number;

  native testGridColumnsGap004(): number;

  native testGridRowsTemplate001(): number;

  native testGridRowsTemplate002(): number;

  native testGridRowsTemplate003(): number;

  native testGridColumnTemplate001(): number;

  native testGridColumnTemplate002(): number;

  native testGridColumnTemplate003(): number;

  native testGridRowsGap001(): number;

  native testGridRowsGap002(): number;

  native testGridRowsGap003(): number;

  native testGridRowsGap004(): number;

  native testGridCachedCount001(): number;

  native testGridCachedCount002(): number;

  native testGridCachedCount003(): number;

  native testGridCachedCount004(): number;

  native testGridCachedCount005(): number;

  native testRadioValue001(): number;

  native testRadioValue002(): number;

  native testRadioValue003(): number;

  native testRadioGroup001(): number;

  native testRadioGroup002(): number;

  native testRadioGroup003(): number;

  native testRadioRadioStyle001(): number;

  native testRadioRadioStyle002(): number;

  native testRadioRadioStyle003(): number;

  native testRadioRadioStyle004(): number;

  native testRadioRadioStyle005(): number;

  native testRadioChecked001(): number;

  native testRadioChecked002(): number;

  native testRadioChecked003(): number;

  native testRadioChecked004(): number;

  native testRadioChecked005(): number;

  native testRadioChecked006(): number;

  native testRadioChecked007(): number;

  native drag_setDragEventStrictReportWidthNode_001(): number;

  native drag_setDragEventStrictReportWidthNode_002(): number;

  native drag_setDragEventStrictReportWidthContext_003(): number;

  native drag_setDragEventStrictReportWidthContext_004(): number;

  native testAddChildGesture001(): number;

  native testAddChildGesture002(): number;

  native testAddChildGesture003(): number;

  native testAddChildGesture004(): number;

  native testAddChildGesture005(): number;

  native testAddChildGesture006(): number;

  native testRemoveChildGesture001(): number;

  native testRemoveChildGesture002(): number;

  native testRemoveChildGesture003(): number;

  native testRemoveChildGesture004(): number;

  native testRemoveChildGesture005(): number;

  native testRemoveChildGesture006(): number;

  native testSetGestureEventTarget001(): number;

  native testSetGestureEventTarget002(): number;

  native testSetGestureEventTarget003(): number;

  native testSetGestureEventTarget004(): number;

  native testAddGestureToNode001(): number;

  native testAddGestureToNode002(): number;

  native testAddGestureToNode003(): number;

  native testAddGestureToNode004(): number;

  native testAddGestureToNode005(): number;

  native testAddGestureToNode006(): number;

  native testRemoveGestureFromNode001(): number;

  native testSetGestureInterrupterToNode001(): number;

  native testDisposeToNode001(): number;

  native drag_setNodeAllowedDropDataTypes_001(): number;

  native drag_disallowNodeAnyDropDataTypes_002(): number;

  native drag_allowNodeAllDropDataTypes_003(): number;

  native drag_setNodeDraggable_004(): number;

  native drag_SetNodeDragPreview_001(): number;

  native drag_DragPreviewOption_Dispose_001(): number;

  native drag_DragPreviewOption_SetScaleMode_002(): number;

  native drag_DragPreviewOption_SetDefaultShadowEnabled_003(): number;

  native drag_DragPreviewOption_SetDefaultRadiusEnabled_004(): number;

  native drag_DragPreviewOption_SetNumberBadgeEnabled_005(): number;

  native drag_DragPreviewOption_SetBadgeNumber_006(): number;

  native drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007(): number;

  native drag_DragPreviewOption_SetNodeDragPreviewOption_008(): number;

  native drag_DragAction_Dispose_001(): number;

  native drag_DragAction_SetPointerId_002(): number;

  native drag_DragAction_SetPixelMaps_003(): number;

  native drag_DragAction_SetTouchPointX_004(): number;

  native drag_DragAction_SetTouchPointY_005(): number;

  native drag_DragAction_SetDragPreviewOption_006(): number;

  native drag_DragAction_RegisterStatusListener_007(): number;

  native drag_DragAction_UnregisterStatusListener_008(): number;

  native drag_DragAction_StartDrag_009(): number;

  native drag_DragAction_DragAndDropInfo_0010(): number;

  native textCustomSpanTest001(): number;

  native textCustomSpanTest002(): number;

  native textCustomSpanTest003(): number;

  native textCustomSpanTest004(): number;

  native textCustomSpanTest005(): number;

  native textCustomSpanTest006(): number;

  native textCustomSpanTest007(): number;

  native textCustomSpanTest008(): number;

  native textCustomSpanTest009(): number;

  native testRegisterSystemColorModeChangeEvent_001(): number;

  native testUnregisterSystemColorModeChangeEvent_002(): number;

  native testRegisterSystemFontStyleChangeEvent_003(): number;

  native testUnregisterSystemFontStyleChangeEvent_004(): number;

  native testSystemFontStyleEvent_GetFontSizeScale_005(): number;

  native testSystemFontStyleEvent_GetFontWeightScale_006(): number;

  native textImageSpanTest001(): number;

  native testInputEvent121(): number;

  native testInputEvent122(): number;

  native testInputEvent123(): number;

  native testInputEvent124(): number;

  native testInputEvent125(): number;

  native testInputEvent126(): number;

  native testInputEvent127(): number;

  native testInputEvent128(): number;

  native testInputEvent129(): number;

  native testInputEvent130(): number;

  native testInputEvent131(): number;

  native testInputEvent132(): number;

  native testInputEvent133(): number;

  native testInputEvent134(): number;

  native testInputEvent135(): number;

  native testInputEvent136(): number;

  native testInputEvent137(): number;

  native testInputEvent138(): number;

  native testInputEvent139(): number;

  native testInputEvent140(): number;

  native testInputEvent141(): number;

  native testInputEvent142(): number;

  native testInputEvent143(): number;

  native testInputEvent144(): number;

  native testInputEvent145(): number;

  native testInputEvent146(): number;

  native testInputEvent147(): number;

  native testInputEvent148(): number;

  native testInputEvent149(): number;

  native testInputEvent150(): number;

  native testInputEvent151(): number;

  native testInputEvent152(): number;

  native testInputEvent153(): number;

  native testInputEvent154(): number;

  native testInputEvent155(): number;

  native testInputEvent156(): number;

  native testInputEvent157(): number;

  native testInputEvent158(): number;

  native testInputEvent159(): number;

  native testInputEvent160(): number;

  native testInputEvent161(): number;

  native testInputEvent162(): number;

  native testInputEvent163(): number;

  native testInputEvent164(): number;

  native testInputEvent165(): number;

  native testTextAreaText001(): number;

  native testTextAreaFontFeature001(): number;

  native testTextAreaFontFeature002(): number;

  native testTextAreaFontFeature003(): number;

  native testTextAreaMaxLines001(): number;

  native testTextAreaMaxLines002(): number;

  native testTextAreaMaxLines003(): number;

  native testTextAreaMaxLines004(): number;

  native testTextAreaEnterKeyType001(): number;

  native testTextAreaEnterKeyType002(): number;

  native testTextAreaEnterKeyType003(): number;

  native testTextAreaEnterKeyType004(): number;

  native testTextAreaEnterKeyType005(): number;

  native testTextAreaEnterKeyType006(): number;

  native testTextAreaEnterKeyType007(): number;

  native testTextAreaEnterKeyType008(): number;

  native testTextAreaEnterKeyType009(): number;

  native testTextAreaEnterKeyType010(): number;

  native testTextAreaEnableKeyboardOnFocus001(): number;

  native testTextAreaEnableKeyboardOnFocus002(): number;

  native testTextAreaEnableKeyboardOnFocus003(): number;

  native testTextAreaShowKeyboardOnFocus001(): number;

  native testTextAreaShowKeyboardOnFocus002(): number;

  native testTextAreaShowKeyboardOnFocus003(): number;

  native testTextAreaCaretOffset001(): number;

  native testTextAreaCaretOffset002(): number;

  native testTextAreaCaretOffset003(): number;

  native testTextAreaGetTextContentRect001(): number;

  native testTextAreaContentLineCount001(): number;

  native testTextAreaContentLineCount002(): number;

  native testTextAreaContentLineCount003(): number;

  native testTextAreaTextSelection001(): number;

  native testTextAreaTextSelection002(): number;

  native testTextAreaTextSelection003(): number;

  native testTextAreaTextSelection004(): number;

  native testTextAreaEnableAutoFill001(): number;

  native testTextAreaEnableAutoFill002(): number;

  native testTextAreaEnableAutoFill003(): number;

  native testTextAreaEnableAutoFill004(): number;

  native testTextAreaNumberOfLines001(): number;

  native testTextAreaNumberOfLines002(): number;

  native testTextAreaNumberOfLines003(): number;

  native testTextAreaContentType001(): number;

  native testTextAreaContentType002(): number;

  native testTextAreaContentType003(): number;

  native testTextAreaContentType004(): number;

  native testTextAreaContentType005(): number;

  native testTextAreaContentType006(): number;

  native testTextAreaContentType007(): number;

  native testTextAreaContentType008(): number;

  native testTextAreaContentType009(): number;

  native testTextAreaContentType010(): number;

  native testTextAreaContentType011(): number;

  native testTextAreaContentType012(): number;

  native testTextAreaContentType013(): number;

  native testTextAreaContentType014(): number;

  native testTextAreaContentType015(): number;

  native testTextAreaContentType016(): number;

  native testTextAreaContentType017(): number;

  native testTextAreaContentType018(): number;

  native testTextAreaContentType019(): number;

  native testTextAreaContentType020(): number;

  native testTextAreaContentType021(): number;

  native testTextAreaContentType022(): number;

  native testTextAreaContentType023(): number;

  native testTextAreaContentType024(): number;

  native testTextInputCancelButton001(): number;

  native testTextInputCancelButton002(): number;

  native testTextInputCancelButton003(): number;

  native testTextInputCancelButton004(): number;

  native testTextInputCancelButton005(): number;

  native testTextInputCancelButton006(): number;

  native testTextInputCancelButton007(): number;

  native testTextInputText001(): number;

  native testTextInputSelection001(): number;

  native testTextInputSelection002(): number;

  native testTextInputSelection003(): number;

  native testTextInputSelection004(): number;

  native testTextInputUnderlineColor001(): number;

  native testTextInputUnderlineColor002(): number;

  native testTextInputFontFeature001(): number;

  native testTextInputFontFeature002(): number;

  native testTextInputFontFeature003(): number;

  native testTextInputStyle001(): number;

  native testTextInputStyle002(): number;

  native testTextInputStyle003(): number;

  native testTextInputStyle004(): number;

  native testTextInputStyle005(): number;

  native testTextInputEnableAutoFill001(): number;

  native testTextInputEnableAutoFill002(): number;

  native testTextInputEnableAutoFill003(): number;

  native testTextInputContentType001(): number;

  native testTextInputContentType002(): number;

  native testTextInputContentType003(): number;

  native testTextInputContentType004(): number;

  native testTextInputContentType005(): number;

  native testTextInputContentType006(): number;

  native testTextInputContentType007(): number;

  native testTextInputContentType008(): number;

  native testTextInputContentType009(): number;

  native testTextInputContentType010(): number;

  native testTextInputContentType011(): number;

  native testTextInputContentType012(): number;

  native testTextInputContentType013(): number;

  native testTextInputContentType014(): number;

  native testTextInputContentType015(): number;

  native testTextInputContentType016(): number;

  native testTextInputContentType017(): number;

  native testTextInputContentType018(): number;

  native testTextInputContentType019(): number;

  native testTextInputContentType020(): number;

  native testTextInputContentType021(): number;

  native testTextInputContentType022(): number;

  native testTextInputContentType023(): number;

  native testTextInputMinFontSize001(): number;

  native testTextInputMinFontSize002(): number;

  native testTextInputMinFontSize003(): number;

  native testTextInputMaxFontSize001(): number;

  native testTextInputMaxFontSize002(): number;

  native testTextInputMaxFontSize003(): number;

  native testTextInputPasswordRules001(): number;

  native testTextInputPasswordRules002(): number;

  native testTextInputPasswordRules003(): number;

  native testTextInputCustomKeyboard001(): number;

  native testTextInputCustomKeyboard002(): number;

  native testTextInputCustomKeyboard003(): number;

  native testTextInputSelectAll001(): number;

  native testTextInputSelectAll002(): number;

  native testTextInputSelectAll003(): number;

  native testTextInputMaxLines001(): number;

  native testTextInputMaxLines002(): number;

  native testTextInputMaxLines003(): number;

  native testTextInputNumberOfLines001(): number;

  native testTextInputNumberOfLines002(): number;

  native testTextInputNumberOfLines003(): number;

  native testTextInputNumberOfLines004(): number;

  native testTextInputShowKeyboardOnFocus001(): number;

  native testTextInputShowKeyboardOnFocus002(): number;

  native testTextInputShowKeyboardOnFocus003(): number;

  native testTextInputCaretOffset001(): number;

  native testTextInputCaretOffset002(): number;

  native testTextInputCaretOffset003(): number;

  native testTextInputContentLineCount001(): number;

  native testTextInputContentLineCount002(): number;

  native testTextInputContentLineCount003(): number;

  native testTextInputGetTextContentRect001(): number;

  native testCommonAttrsSaturate001(): number;

  native testCommonAttrsSaturate002(): number;

  native testCommonAttrsSaturate003(): number;

  native testCommonAttrsSaturate004(): number;

  native testCommonAttrsSaturate005(): number;

  native testCommonAttrsSaturate006(): number;

  native testCommonAttrsSaturate007(): number;

  native testCommonAttrsBlur001(): number;

  native testCommonAttrsBlur002(): number;

  native testCommonAttrsBlur003(): number;

  native testCommonAttrsBlur004(): number;

  native testCommonAttrsBlur005(): number;

  native testCommonAttrsBlur006(): number;

  native testCommonAttrsZIndex001(): number;

  native testCommonAttrsZIndex002(): number;

  native testCommonAttrsZIndex003(): number;

  native testCommonAttrsZIndex004(): number;

  native testCommonAttrsZIndex005(): number;

  native testCommonAttrsZIndex006(): number;

  native testCommonAttrsVisibility001(): number;

  native testCommonAttrsVisibility002(): number;

  native testCommonAttrsVisibility003(): number;

  native testCommonAttrsVisibility004(): number;

  native testCommonAttrsVisibility005(): number;

  native testCommonAttrsVisibility006(): number;

  native testCommonAttrsClipShape001(): number;

  native testCommonAttrsClipShape002(): number;

  native testCommonAttrsClipShape003(): number;

  native testCommonAttrsClipShape004(): number;

  native testCommonAttrsClipShape005(): number;

  native testCommonAttrsClipShape006(): number;

  native testCommonAttrsClipShape007(): number;

  native testCommonAttrsClipShape008(): number;

  native testCommonAttrsClipShape009(): number;

  native testCommonAttrsClipShape010(): number;

  native testCommonAttrsClipShape011(): number;

  native testCommonAttrsClipShape012(): number;

  native testCommonAttrsClipShape013(): number;

  native testCommonAttrsClipShape014(): number;

  native testCommonAttrsClipShape015(): number;

  native testCommonAttrsClipShape016(): number;

  native testCommonAttrsClipShape017(): number;

  native testCommonAttrsClipShape018(): number;

  native testCommonAttrsClipShape019(): number;

  native testCommonAttrsClipShape020(): number;

  native testCommonAttrsClipShape021(): number;

  native testCommonAttrsBackgroundImage001(): number;

  native testCommonAttrsBackgroundImage002(): number;

  native testCommonAttrsBackgroundImage003(): number;

  native testCommonAttrsBackgroundImage004(): number;

  native testCommonAttrsBackgroundImage005(): number;

  native testCommonAttrsBackgroundImage006(): number;

  native testCommonAttrsBackgroundImage007(): number;

  native testCommonAttrsBackgroundImage008(): number;

  native testCommonAttrsBackgroundImage009(): number;

  native testCommonAttrsBackgroundImage010(): number;

  native testCommonAttrsBackgroundImage011(): number;

  native testCommonAttrsBackgroundImagePixelMap001(): number;

  native testCommonAttrsBackgroundImagePixelMap002(): number;

  native testCommonAttrsBackgroundImagePixelMap003(): number;

  native testCommonAttrsBackgroundImagePixelMap004(): number;

  native testCommonAttrsBackgroundImagePixelMap005(): number;

  native testCommonAttrsBackgroundImagePixelMap006(): number;

  native testCommonAttrsBackgroundImagePixelMap007(): number;

  native testCommonAttrsPadding001(): number;

  native testCommonAttrsPadding002(): number;

  native testCommonAttrsPadding003(): number;

  native testCommonAttrsPadding004(): number;

  native testCommonAttrsPadding005(): number;

  native testCommonAttrsPadding006(): number;

  native testCommonAttrsTranslate001(): number;

  native testCommonAttrsTranslate002(): number;

  native testCommonAttrsTranslate003(): number;

  native testCommonAttrsTranslate004(): number;

  native testCommonAttrsTranslate005(): number;

  native testCommonAttrsTranslate006(): number;

  native testCommonAttrsTranslate007(): number;

  native testCommonAttrsTranslate008(): number;

  native testCommonAttrsTranslate009(): number;

  native testCommonAttrsTranslate010(): number;

  native testCommonAttrsTranslate011(): number;

  native testCommonAttrsTranslate012(): number;

  native testCommonAttrsTranslate013(): number;

  native testCommonAttrsTranslate014(): number;

  native testCommonAttrsTranslate015(): number;

  native testCommonAttrsTranslate016(): number;

  native testCommonAttrsTranslate017(): number;

  native testCommonAttrsRotate001(): number;

  native testCommonAttrsRotate002(): number;

  native testCommonAttrsRotate003(): number;

  native testCommonAttrsRotate004(): number;

  native testCommonAttrsRotate005(): number;

  native testCommonAttrsRotate006(): number;

  native testCommonAttrsRotate007(): number;

  native testCommonAttrsRotate008(): number;

  native testCommonAttrsRotate009(): number;

  native testCommonAttrsBrightness001(): number;

  native testCommonAttrsBrightness002(): number;

  native testCommonAttrsBrightness003(): number;

  native testCommonAttrsBrightness004(): number;

  native testCommonAttrsBrightness005(): number;

  native testCommonAttrsBrightness006(): number;

  native testCommonAttrsBrightness007(): number;

  native testCommonAttrsBrightness008(): number;

  native testCommonAttrsBrightness009(): number;

  native testCommonAttrsCustomShadow001(): number;

  native testCommonAttrsCustomShadow002(): number;

  native testCommonAttrsCustomShadow003(): number;

  native testCommonAttrsCustomShadow004(): number;

  native testCommonAttrsCustomShadow005(): number;

  native testCommonAttrsCustomShadow006(): number;

  native testCommonAttrsCustomShadow007(): number;

  native testCommonAttrsCustomShadow008(): number;

  native testCommonAttrsCustomShadow009(): number;

  native testCommonAttrsBackgroundImageSize001(): number;

  native testCommonAttrsBackgroundImageSize002(): number;

  native testCommonAttrsBackgroundImageSize003(): number;

  native testCommonAttrsBackgroundImageSize004(): number;

  native testCommonAttrsBackgroundImageSize005(): number;

  native testCommonAttrsBackgroundImageSize006(): number;

  native testCommonAttrsBackgroundImageSize007(): number;

  native testCommonAttrsBackgroundImageSize008(): number;

  native testCommonAttrsBackgroundImageSize009(): number;

  native testCommonAttrsBackgroundImageSize010(): number;

  native testCommonAttrsBackgroundImageSize011(): number;

  native testCommonAttrsBackgroundImageSize012(): number;

  native testCommonAttrsBackgroundImageSize013(): number;

  native testCommonAttrsBackgroundImageSize014(): number;

  native testCommonAttrsBackgroundBlurStyle001(): number;

  native testCommonAttrsBackgroundBlurStyle002(): number;

  native testCommonAttrsBackgroundBlurStyle003(): number;

  native testCommonAttrsBackgroundBlurStyle004(): number;

  native testCommonAttrsBackgroundBlurStyle005(): number;

  native testCommonAttrsBackgroundBlurStyle006(): number;

  native testCommonAttrsBackgroundBlurStyle007(): number;

  native testCommonAttrsBackgroundBlurStyle008(): number;

  native testCommonAttrsBackgroundBlurStyle009(): number;

  native testCommonAttrsBackgroundBlurStyle010(): number;

  native testCommonAttrsBackgroundBlurStyle011(): number;

  native testCommonAttrsBackgroundBlurStyle012(): number;

  native testCommonAttrsBackgroundBlurStyle013(): number;

  native testCommonAttrsBackgroundBlurStyle014(): number;

  native testCommonAttrsBackgroundBlurStyle015(): number;

  native testCommonAttrsBackgroundBlurStyle016(): number;

  native testCommonAttrsBackgroundBlurStyle017(): number;

  native testCommonAttrsBackgroundBlurStyle018(): number;

  native testCommonAttrsBackgroundBlurStyle019(): number;

  native testCommonAttrsBackgroundBlurStyle020(): number;

  native testCommonAttrsBackgroundBlurStyle021(): number;

  native testCommonAttrsBackgroundBlurStyle022(): number;

  native testCommonAttrsBackgroundBlurStyle023(): number;

  native testCommonAttrsBackgroundBlurStyle024(): number;

  native testCommonAttrsBackgroundBlurStyle025(): number;

  native testCommonAttrsBackgroundBlurStyle026(): number;

  native testCommonAttrsBackgroundBlurStyle027(): number;

  native testCommonAttrsBackgroundBlurStyle028(): number;

  native testCommonAttrsBackgroundBlurStyle029(): number;

  native testCommonAttrsBackgroundBlurStyle030(): number;

  native testCommonAttrsBackgroundBlurStyle031(): number;

  native testCommonAttrsBackgroundBlurStyle032(): number;

  native testCommonAttrsBackgroundBlurStyle033(): number;

  native testCommonAttrsTransformCenter001(): number;

  native testCommonAttrsTransformCenter002(): number;

  native testCommonAttrsTransformCenter003(): number;

  native testCommonAttrsTransformCenter004(): number;

  native testCommonAttrsTransformCenter005(): number;

  native testCommonAttrsTransformCenter006(): number;

  native testCommonAttrsTransformCenter007(): number;

  native testCommonAttrsTransitionOpacity001(): number;

  native testCommonAttrsTransitionOpacity002(): number;

  native testCommonAttrsTransitionOpacity003(): number;

  native testCommonAttrsTransitionOpacity004(): number;

  native testCommonAttrsTransitionOpacity005(): number;

  native testCommonAttrsTransitionOpacity006(): number;

  native testCommonAttrsTransitionOpacity007(): number;

  native testCommonAttrsTransitionOpacity008(): number;

  native testCommonAttrsTransitionOpacity009(): number;

  native testCommonAttrsTransitionOpacity010(): number;

  native testCommonAttrsTransitionOpacity011(): number;

  native testCommonAttrsTransitionOpacity012(): number;

  native testCommonAttrsTransitionOpacity013(): number;

  native testCommonAttrsTransitionOpacity014(): number;

  native testCommonAttrsTransitionOpacity015(): number;

  native testCommonAttrsTransitionRotate001(): number;

  native testCommonAttrsTransitionRotate002(): number;

  native testCommonAttrsTransitionRotate003(): number;

  native testCommonAttrsTransitionRotate004(): number;

  native testCommonAttrsTransitionRotate005(): number;

  native testCommonAttrsTransitionRotate006(): number;

  native testCommonAttrsTransitionRotate007(): number;

  native testCommonAttrsTransitionRotate008(): number;

  native testCommonAttrsTransitionScale001(): number;

  native testCommonAttrsTransitionScale002(): number;

  native testCommonAttrsTransitionScale003(): number;

  native testCommonAttrsTransitionScale004(): number;

  native testCommonAttrsTransitionScale005(): number;

  native testCommonAttrsTransitionScale006(): number;

  native testCommonAttrsTransitionScale007(): number;

  native testCommonAttrsTransitionTranslate001(): number;

  native testCommonAttrsTransitionTranslate002(): number;

  native testCommonAttrsTransitionTranslate003(): number;

  native testCommonAttrsTransitionTranslate004(): number;

  native testCommonAttrsTransitionTranslate005(): number;

  native testCommonAttrsTransitionTranslate006(): number;

  native testCommonAttrsTransitionTranslate007(): number;

  native testCommonAttrsTransitionTranslate008(): number;

  native testCommonAttrsTransitionMove001(): number;

  native testCommonAttrsTransitionMove002(): number;

  native testCommonAttrsTransitionMove003(): number;

  native testCommonAttrsTransitionMove004(): number;

  native testCommonAttrsTransitionMove005(): number;

  native testCommonAttrsTransitionMove006(): number;

  native testCommonAttrsTransitionMove007(): number;

  native testCommonAttrsDefaultFocus001(): number;

  native testCommonAttrsDefaultFocus002(): number;

  native testCommonAttrsDefaultFocus003(): number;

  native testCommonAttrsDefaultFocus004(): number;

  native testCommonAttrsResponseRegion001(): number;

  native testCommonAttrsResponseRegion002(): number;

  native testCommonAttrsResponseRegion003(): number;

  native testCommonAttrsResponseRegion004(): number;

  native testCommonAttrsResponseRegion005(): number;

  native testCommonAttrsResponseRegion006(): number;

  native testCommonAttrsResponseRegion007(): number;

  native testCommonAttrsOverlay001(): number;

  native testCommonAttrsOverlay002(): number;

  native testCommonAttrsOverlay003(): number;

  native testCommonAttrsOverlay004(): number;

  native testCommonAttrsOverlay005(): number;

  native testCommonAttrsOverlay006(): number;

  native testCommonAttrsOverlay007(): number;

  native testCommonAttrsForegroundColor001(): number;

  native testCommonAttrsForegroundColor002(): number;

  native testCommonAttrsForegroundColor003(): number;

  native testCommonAttrsForegroundColor004(): number;

  native testCommonAttrsForegroundColor005(): number;

  native testCommonAttrsOffset001(): number;

  native testCommonAttrsOffset002(): number;

  native testCommonAttrsOffset003(): number;

  native testCommonAttrsOffset004(): number;

  native testCommonAttrsOffset005(): number;

  native testCommonAttrsOffset006(): number;

  native testCommonAttrsMarkAnchorTest001(): number;

  native testCommonAttrsMarkAnchorTest002(): number;

  native testCommonAttrsMarkAnchorTest003(): number;

  native testCommonAttrsMarkAnchorTest004(): number;

  native testCommonAttrsBackgroundImagePosition001(): number;

  native testCommonAttrsBackgroundImagePosition002(): number;

  native testCommonAttrsBackgroundImagePosition003(): number;

  native testCommonAttrsBackgroundImagePosition004(): number;

  native testCommonAttrsBackgroundImagePosition005(): number;

  native testCommonAttrsBackgroundImagePosition006(): number;

  native testCommonAttrsBackgroundImagePosition007(): number;

  native testCommonAttrsBackgroundImagePosition008(): number;

  native testCommonAttrsFocusStatus001(): number;

  native testCommonAttrsAspectRatioTest001(): number;

  native testCommonAttrsAspectRatioTest002(): number;

  native testCommonAttrsAspectRatioTest003(): number;

  native testCommonAttrsAspectRatioTest004(): number;

  native testCommonAttrsLayoutWeight001(): number;

  native testCommonAttrsLayoutWeight002(): number;

  native testCommonAttrsLayoutWeight003(): number;

  native testCommonAttrsLayoutWeight004(): number;

  native testCommonAttrsDisplayPriority001(): number;

  native testCommonAttrsDisplayPriority002(): number;

  native testCommonAttrsDisplayPriority003(): number;

  native testCommonAttrsDisplayPriority004(): number;

  native testCommonAttrsDisplayPriority005(): number;

  native testCommonAttrsDisplayPriority006(): number;

  native testCommonAttrsOutlineWidth001(): number;

  native testCommonAttrsOutlineWidth002(): number;

  native testCommonAttrsOutlineWidth003(): number;

  native testCommonAttrsOutlineColor001(): number;

  native testCommonAttrsOutlineColor002(): number;

  native testCommonAttrsOutlineColor003(): number;

  native testCommonAttrsOutlineColor004(): number;

  native testCommonAttrsRenderFit001(): number;

  native testCommonAttrsRenderFit002(): number;

  native testCommonAttrsRenderFit003(): number;

  native testCommonAttrsRenderFit004(): number;

  native testCommonAttrsRenderFit005(): number;

  native testCommonAttrsRenderFit006(): number;

  native testCommonAttrsRenderFit007(): number;

  native testCommonAttrsRenderFit008(): number;

  native testCommonAttrsRenderFit009(): number;

  native testCommonAttrsRenderFit010(): number;

  native testCommonAttrsRenderFit011(): number;

  native testCommonAttrsRenderFit012(): number;

  native testCommonAttrsRenderFit013(): number;

  native testCommonAttrsRenderFit014(): number;

  native testCommonAttrsRenderFit015(): number;

  native testCommonAttrsRenderFit016(): number;

  native testCommonAttrsRenderFit017(): number;

  native testCommonAttrsRenderFit018(): number;

  native testCommonAttrsRenderFit019(): number;

  native testCommonAttrsColorBlend001(): number;

  native testCommonAttrsColorBlend002(): number;

  native testCommonAttrsColorBlend003(): number;

  native testCommonAttrsColorBlend004(): number;

  native testCommonAttrsColorBlend005(): number;

  native testCommonAttrsTouchable002(): number;

  native testCommonAttrsTouchable003(): number;

  native testCommonAttrsTouchable004(): number;

  native testCommonAttrsRenderGroup001(): number;

  native testCommonAttrsRenderGroup002(): number;

  native testCommonAttrsRenderGroup003(): number;

  native testCommonAttrsRenderGroup004(): number;

  native testCommonAttrsSize001(): number;

  native testCommonAttrsSize002(): number;

  native testCommonAttrsSize003(): number;

  native testCommonAttrsSize004(): number;

  native testCommonAttrsSize005(): number;

  native testCommonAttrsSize006(): number;

  native testCommonAttrsSize007(): number;

  native testCommonAttrsSize008(): number;

  native testCommonAttrsSize009(): number;

  native testCommonAttrsSize010(): number;

  native testCommonAttrsSize011(): number;

  native testCommonAttrsSize012(): number;

  native testCommonAttrsChainMode001(): number;

  native testCommonAttrsChainMode002(): number;

  native testCommonAttrsChainMode003(): number;

  native testCommonAttrsChainMode004(): number;

  native testCommonAttrsChainMode005(): number;

  native testCommonAttrsChainMode006(): number;

  native testCommonAttrsChainMode007(): number;

  native testCommonAttrsChainMode008(): number;

  native testCommonAttrsAccessibilityId001(): number;

  native testCommonAttrsAccessibilityActions001(): number;

  native testCommonAttrsAccessibilityActions002(): number;

  native testCommonAttrsAccessibilityActions003(): number;

  native testCommonAttrsAccessibilityActions004(): number;

  native testCommonAttrsAccessibilityActions005(): number;

  native testCommonAttrsAccessibilityActions006(): number;

  native testCommonAttrsAccessibilityRole001(): number;

  native testCommonAttrsAccessibilityRole002(): number;

  native testCommonAttrsAccessibilityRole003(): number;

  native testCommonAttrsAccessibilityRole004(): number;

  native testCommonAttrsAccessibilityRole005(): number;

  native testCommonAttrsAccessibilityRole006(): number;

  native testCommonAttrsAccessibilityRole007(): number;

  native testCommonAttrsAccessibilityRole008(): number;

  native testCommonAttrsAccessibilityRole009(): number;

  native testCommonAttrsAccessibilityRole010(): number;

  native testCommonAttrsAccessibilityRole011(): number;

  native testCommonAttrsAccessibilityRole012(): number;

  native testCommonAttrsAccessibilityRole013(): number;

  native testCommonAttrsAccessibilityRole014(): number;

  native testCommonAttrsAccessibilityRole015(): number;

  native testCommonAttrsAccessibilityRole016(): number;

  native testCommonAttrsAccessibilityRole017(): number;

  native testCommonAttrsAccessibilityRole018(): number;

  native testCommonAttrsAccessibilityRole019(): number;

  native testCommonAttrsAccessibilityRole020(): number;

  native testCommonAttrsAccessibilityRole021(): number;

  native testCommonAttrsAccessibilityRole022(): number;

  native testCommonAttrsAccessibilityRole023(): number;

  native testCommonAttrsAccessibilityRole024(): number;

  native testCommonAttrsAccessibilityRole025(): number;

  native testCommonAttrsAccessibilityRole026(): number;

  native testCommonAttrsAccessibilityRole027(): number;

  native testCommonAttrsAccessibilityRole028(): number;

  native testCommonAttrsAccessibilityRole029(): number;

  native testCommonAttrsAccessibilityRole030(): number;

  native testCommonAttrsAccessibilityRole031(): number;

  native testCommonAttrsAccessibilityRole032(): number;

  native testCommonAttrsAccessibilityRole033(): number;

  native testCommonAttrsAccessibilityRole034(): number;

  native testCommonAttrsAccessibilityRole035(): number;

  native testCommonAttrsAccessibilityRole036(): number;

  native testCommonAttrsAccessibilityRole037(): number;

  native testCommonAttrsAccessibilityRole038(): number;

  native testCommonAttrsAccessibilityRole039(): number;

  native testCommonAttrsAccessibilityRole040(): number;

  native testCommonAttrsAccessibilityRole041(): number;

  native testCommonAttrsAccessibilityRole042(): number;

  native testCommonAttrsAccessibilityState001(): number;

  native testCommonAttrsAccessibilityState002(): number;

  native testCommonAttrsAccessibilityState003(): number;

  native testCommonAttrsAccessibilityState004(): number;

  native testCommonAttrsAccessibilityState005(): number;

  native testCommonAttrsAccessibilityState006(): number;

  native testCommonAttrsAccessibilityState007(): number;

  native testCommonAttrsAccessibilityState008(): number;

  native testCommonAttrsAccessibilityState009(): number;

  native testCommonAttrsAccessibilityState010(): number;

  native testCommonAttrsAccessibilityState011(): number;

  native testCommonAttrsAccessibilityState012(): number;

  native testCommonAttrsAccessibilityState013(): number;

  native testCommonAttrsAccessibilityState014(): number;

  native testCommonAttrsAccessibilityState015(): number;

  native testCommonAttrsAccessibilityState016(): number;

  native testCommonAttrsAccessibilityState017(): number;

  native testCommonAttrsAccessibilityState018(): number;

  native testCommonAttrsAccessibilityState019(): number;

  native testCommonAttrsAccessibilityState020(): number;

  native testCommonAttrsAccessibilityState021(): number;

  native testCommonAttrsAccessibilityValue001(): number;

  native testCommonAttrsAccessibilityValue002(): number;

  native testCommonAttrsAccessibilityValue003(): number;

  native testCommonAttrsAccessibilityValue004(): number;

  native testCommonAttrsAccessibilityValue005(): number;

  native testCommonAttrsAccessibilityValue006(): number;

  native testCommonAttrsAccessibilityValue007(): number;

  native testCommonAttrsAccessibilityValue008(): number;

  native testCommonAttrsAccessibilityValue009(): number;

  native testCommonAttrsAccessibilityValue010(): number;

  native testCommonAttrsAccessibilityValue011(): number;

  native testCommonAttrsAccessibilityValue012(): number;

  native testCommonAttrsAccessibilityValue013(): number;

  native testCommonAttrsAccessibilityValue014(): number;

  native testCommonAttrsAccessibilityValue015(): number;

  native testCommonAttrsFocusOnTouch002(): number;

  native testCommonAttrsFocusOnTouch003(): number;

  native testCommonAttrsFocusOnTouch004(): number;

  native testCommonAttrsFocusOnTouch005(): number;

  native testCommonAttrsExpandSafeArea001(): number;

  native testCommonAttrsExpandSafeArea002(): number;

  native testCommonAttrsExpandSafeArea003(): number;

  native testCommonAttrsExpandSafeArea004(): number;

  native testCommonAttrsTransitionEffectAsymmetric001(): number;

  native testCommonAttrsAlign012(): number;

  native testCommonAttrsAlign013(): number;

  native testCommonAttrsAlign014(): number;

  native testCommonAttrsAlign015(): number;

  native testCommonAttrsAlign016(): number;

  native testCommonAttrsAlign017(): number;

  native testCommonAttrsAlign018(): number;

  native testCommonAttrsAlign019(): number;

  native testCommonAttrsAlign020(): number;

  native testCommonAttrsAlign021(): number;

  native testCommonAttrsAlign022(): number;

  native testCommonAttrsAlign023(): number;

  native testCommonAttrsAlign024(): number;

  native testCommonAttrsAlign025(): number;

  native testCommonAttrsAlign026(): number;

  native testCommonAttrsAlign027(): number;

  native testCommonAttrsAlign028(): number;

  native testCommonAttrsAlign029(): number;

  native testCommonAttrsAlign030(): number;

  native testCommonAttrsAlign031(): number;

  native testCommonAttrsAlign032(): number;

  native testCommonAttrsAlign033(): number;

  native testCommonAttrsAlign034(): number;

  native testCommonAttrsAlign035(): number;

  native testCommonAttrsAlign036(): number;

  native testCommonAttrsAlign037(): number;

  native testCommonAttrsAlign038(): number;

  native testCommonAttrsAlign039(): number;

  native testCommonAttrsAlign040(): number;

  native testCommonAttrsAlign041(): number;

  native testCommonAttrsAlign042(): number;

  native testCommonAttrsAlign043(): number;

  native testAttributeSetting001(): number;

  native testAttributeSetting002(): number;

  native testAttributeSetting003(): number;

  native testAttributeSetting004(): number;

  native testAttributeSetting005(): number;

  native testAttributeSetting006(): number;

  native testAttributeSetting007(): number;

  native testAttributeSetting008(): number;

  native testAttributeSetting009(): number;

  native testAttributeSetting010(): number;

  native testNodeTree001(): number;

  native testNodeTree002(): number;

  native testNodeTree003(): number;

  native testNodeTree004(): number;

  native testNodeTree005(): number;

  native testNodeTree006(): number;

  native testNodeTree007(): number;

  native testNodeTree008(): number;

  native testNodeTree009(): number;

  native testNodeTree010(): number;

  native testNodeTree011(): number;

  native testNodeTree012(): number;

  native testNodeTree013(): number;

  native testNodeTree014(): number;

  native testNodeTree015(): number;

  native testNodeTree016(): number;

  native testNodeTree017(): number;

  native testNodeTree018(): number;

  native testNodeTree019(): number;

  native testNodeTree020(): number;

  native testNodeTree021(): number;

  native testNodeTree022(): number;

  native testUnitLengthMetrics001(): number;

  native testUnitLengthMetrics002(): number;

  native testUnitLengthMetrics003(): number;

  native testUnitLengthMetrics004(): number;

  native testUnitWidthPercent001(): number;

  native testUnitWidthPercent002(): number;

  native testUnitWidthPercent003(): number;

  native testUnitWidthPercent004(): number;

  native testUnitWidthPercent005(): number;

  native testUnitHeightPercent001(): number;

  native testUnitHeightPercent002(): number;

  native testUnitHeightPercent003(): number;

  native testUnitHeightPercent004(): number;

  native testUnitHeightPercent005(): number;

  native testUnitMarginPercent001(): number;

  native testUnitMarginPercent002(): number;

  native testUnitMarginPercent003(): number;

  native testUnitMarginPercent004(): number;

  native testUnitMarginPercent005(): number;

  native testUnitPaddingPercent001(): number;

  native testUnitPaddingPercent002(): number;

  native testUnitPaddingPercent003(): number;

  native testUnitPaddingPercent004(): number;

  native testUnitPaddingPercent005(): number;

  native testUnitBorderRadiusPercent001(): number;

  native testUnitBorderRadiusPercent002(): number;

  native testUnitBorderRadiusPercent003(): number;

  native testUnitBorderRadiusPercent004(): number;

  native testUnitBorderRadiusPercent005(): number;

  native testToolsLayoutRect001(): number;

  native testCustomComponentGetChildTotalCount001(): number;

  native testCustomComponentGetChildTotalCount002(): number;

  native testCustomComponentGetChildTotalCount003(): number;

  native testCustomComponentGetChildAt001(): number;

  native testCustomComponentGetChildAt002(): number;

  native testCustomComponentGetChildAt003(): number;

  native testCustomComponentGetChildAt004(): number;

  native testCustomComponentGetFirstChild001(): number;

  native testCustomComponentGetFirstChild002(): number;

  native testCustomComponentGetFirstChild003(): number;

  native testCustomComponentGetLastChild001(): number;

  native testCustomComponentGetLastChild002(): number;

  native testCustomComponentGetLastChild003(): number;

  native testCustomComponentGetPreviousSibling001(): number;

  native testCustomComponentGetPreviousSibling002(): number;

  native testCustomComponentGetPreviousSibling003(): number;

  native testCustomComponentGetNextSibling001(): number;

  native testCustomComponentGetNextSibling002(): number;

  native testCustomComponentGetNextSibling003(): number;

  native testCustomComponentMeasuredSize001(): number;

  native testCustomComponentMeasuredSize002(): number;

  native testCustomComponentLayoutPosition001(): number;

  native testCustomComponentLayoutPosition002(): number;

  native testCustomComponentLayoutConstraintDispose001(): number;

  native testCustomComponentLayoutConstraintCreate001(): number;

  native testLayoutConstraintCreate001(): number;

  native testLayoutConstraintCopy001(): number;

  native testLayoutConstraintMinWidth001(): number;

  native testLayoutConstraintMinWidth002(): number;

  native testLayoutConstraintMaxWidth001(): number;

  native testLayoutConstraintMaxWidth002(): number;

  native testLayoutConstraintMinHeight001(): number;

  native testLayoutConstraintMinHeight002(): number;

  native testLayoutConstraintMaxHeight001(): number;

  native testLayoutConstraintMaxHeight002(): number;

  native testLayoutConstraintPercentReferenceWidth001(): number;

  native testLayoutConstraintPercentReferenceWidth002(): number;

  native testLayoutConstraintPercentReferenceHeight001(): number;

  native testLayoutConstraintPercentReferenceHeight002(): number;

  native testLayoutConstraintMeasuredSize001(): number;

  native testLayoutConstraintMeasuredSize002(): number;

  native testLayoutConstraintLayoutPosition001(): number;

  native testLayoutConstraintLayoutPosition002(): number;

  native testLayoutConstraintMeasureNode001(): number;

  native testLayoutConstraintMeasureNode002(): number;

  native testLayoutConstraintLayoutNode001(): number;

  native testLayoutConstraintLayoutNode002(): number;

  native testCustomDialogSetContent001(): number;

  native testCustomDialogSetContent002(): number;

  native testCustomDialogSetContent003(): number;

  native testCustomDialogSetContent004(): number;

  native testCustomDialogRemoveContent001(): number;

  native testCustomDialogRemoveContent002(): number;

  native testCustomDialogSetContentAlignment001(): number;

  native testCustomDialogSetContentAlignment002(): number;

  native testCustomDialogSetContentAlignment003(): number;

  native testCustomDialogSetContentAlignment004(): number;

  native testCustomDialogSetContentAlignment005(): number;

  native testCustomDialogSetContentAlignment006(): number;

  native testCustomDialogResetContentAlignment001(): number;

  native testCustomDialogResetContentAlignment002(): number;

  native testCustomDialogSetModalMode001(): number;

  native testCustomDialogSetModalMode002(): number;

  native testCustomDialogSetModalMode003(): number;

  native testCustomDialogSetModalMode004(): number;

  native testCustomDialogSetAutoCancel002(): number;

  native testCustomDialogSetAutoCancel003(): number;

  native testCustomDialogSetAutoCancel004(): number;

  native testCustomDialogSetMask001(): number;

  native testCustomDialogSetMask002(): number;

  native testCustomDialogSetMask003(): number;

  native testCustomDialogSetMask004(): number;

  native testCustomDialogSetBackgroundColor001(): number;

  native testCustomDialogSetBackgroundColor002(): number;

  native testCustomDialogSetBackgroundColor003(): number;

  native testCustomDialogSetBackgroundColor004(): number;

  native testCustomDialogSetCornerRadius001(): number;

  native testCustomDialogSetCornerRadius002(): number;

  native testCustomDialogSetCornerRadius003(): number;

  native testCustomDialogSetCornerRadius004(): number;

  native testCustomDialogSetCornerRadius005(): number;

  native testCustomDialogSetCornerRadius006(): number;

  native testCustomDialogSetGridColumnCount001(): number;

  native testCustomDialogSetGridColumnCount002(): number;

  native testCustomDialogSetGridColumnCount003(): number;

  native testCustomDialogSetGridColumnCount004(): number;

  native testCustomDialogEnableCustomAnimation001(): number;

  native testCustomDialogEnableCustomAnimation002(): number;

  native testCustomDialogEnableCustomAnimation003(): number;

  native testCustomDialogEnableCustomAnimation004(): number;

  native testCustomDialogRegisterOnWillDismiss002(): number;

  native testCustomDialogRegisterOnWillDismiss003(): number;

  native testCustomDialogShow001(): number;

  native testCustomDialogShow002(): number;

  native testCustomDialogShow003(): number;

  native testCustomDialogShow004(): number;

  native testCustomDialogShow005(): number;

  native testLazyForEachCreate001(): number;

  native testLazyForEachDispose001(): number;

  native testLazyForEachDispose002(): number;

  native testLazyForEachGetAllItems002(): number;

  native testLazyForEachGetAllItems003(): number;

  native testLazyForEachGetHostNode002(): number;

  native testLazyForEachGetItemIndex002(): number;

  native testLazyForEachGetRemovedNode002(): number;

  native testLazyForEachGetTotalNodeCount001(): number;

  native testLazyForEachGetType002(): number;

  native testLazyForEachGetUserData002(): number;

  native testLazyForEachInsertItem002(): number;

  native testLazyForEachMoveItem002(): number;

  native testLazyForEachRegisterEventReceiver001(): number;

  native testLazyForEachRegisterEventReceiver002(): number;

  native testLazyForEachRegisterEventReceiver003(): number;

  native testLazyForEachRegisterEventReceiver004(): number;

  native testLazyForEachReloadAllItems002(): number;

  native testLazyForEachReloadItem002(): number;

  native testLazyForEachRemoveItem002(): number;

  native testLazyForEachSetItem002(): number;

  native testLazyForEachSetNodeId002(): number;

  native testLazyForEachSetTotalNodeCount001(): number;

  native testLazyForEachSetTotalNodeCount002(): number;

  native testLazyForEachSetTotalNodeCount003(): number;

  native testLazyForEachSetUserData001(): number;

  native testLazyForEachSetUserData002(): number;

  native testLazyForEachSetUserData003(): number;

  native testLazyForEachUnregisterEventReceiver001(): number;

  native testLazyForEachUnregisterEventReceiver002(): number;

  native testLazyForEachUnregisterEventReceiver003(): number;

  native testProgressType001(): number;

  native testProgressType002(): number;

  native testProgressType003(): number;

  native testProgressType004(): number;

  native testProgressType005(): number;

  native testProgressType006(): number;

  native testProgressType007(): number;

  native testProgressType008(): number;

  native testProgressType009(): number;

  native testScrollBarWidth001(): number;

  native testScrollBarWidth002(): number;

  native testScrollBarWidth003(): number;

  native testScrollBarWidth004(): number;

  native testScrollBarWidth005(): number;

  native testScrollBarWidth006(): number;

  native buttonOnClickTest(a: Content): void;

  native checkboxOnChangeTest(a: Content): void;

  native commonAttrsEnabledTest(a: Content): void;

  native commonAttrsFocusableTest(a: Content): void;

  native commonEventOnAreaChangeTest(a: Content): void;

  native commonEventOnAppearTest(a: Content): void;

  native commonEventOnBlurTest(a: Content): void;

  native commonEventOnTouchTest(a: Content): void;

  native pointEventOnTouchTest(a: Content): void;

  native commonEventOnFocusTest(a: Content): void;

  native commonEventOnClickTest(a: Content): void;

  native commonAttrsHitTestBehaviorTest(a: Content): void;

  native commonAttrsIdTest(a: Content): void;

  native customComponentOnMeasureTest(a: Content): void;

  native customComponentOnLayoutTest(a: Content): void;

  native customComponentOnDrawTest(a: Content): void;

  native imageHitTestBehaviorTest(a: Content): void;

  native imageIdTest(a: Content): void;

  native imageOnCompleteTest(a: Content): void;

  native imageOnErrorTest(a: Content): void;

  native listHitTestBehaviorDefaultTest(a: Content): void;

  native listHitTestBehaviorBlockTest(a: Content): void;

  native listHitTestBehaviorTransparentTest(a: Content): void;

  native listHitTestBehaviorNoneTest(a: Content): void;

  native listItemHitTestBehaviorDefaultTest(a: Content): void;

  native listItemHitTestBehaviorBlockTest(a: Content): void;

  native listItemHitTestBehaviorTransparentTest(a: Content): void;

  native listItemHitTestBehaviorNoneTest(a: Content): void;

  native listOnScrollTest(a: Content): void;

  native listOnScrollFrameBeginTest(a: Content): void;

  native listOnScrollStartTest(a: Content): void;

  native listOnScrollStopTest(a: Content): void;

  native listOnWillDidScrollTest(a: Content): void;

  native listOnWillScrollTest(a: Content): void;

  native listOnDidScrollTest(a: Content): void;

  native listScrollToIndexTest(a: Content, index: int, alignment: int): void;

  native listOnReachStartTest(a: Content): void;

  native listOnReachEndTest(a: Content): void;

  native listOnScrollIndexTest(a: Content): void;

  native listGetOnWillScrollData(): number[][];

  native listGetOnDidScrollData(): number[][];

  native listGetOnWillDidScrollData(): number[][];

  native listGetOnScrollIndexData(): number[][];

  native listGetOnScrollData(): number[][];

  native listGetScrollOffsetData(): number[][];

  native listScrollOffset001Test(a: Content): void;

  native listScrollOffset002Test(a: Content): void;

  native listScrollOffset003Test(a: Content): void;

  native listScrollOffset004Test(a: Content): void;

  native listScrollOffset005Test(a: Content): void;

  native listScrollOffset006Test(a: Content): void;

  native listScrollOffset007Test(a: Content): void;

  native listScrollOffset008Test(a: Content): void;

  native listScrollOffset009Test(a: Content): void;

  native listScrollOffset010Test(a: Content): void;

  native listScrollOffset011Test(a: Content): void;

  native listScrollOffset012Test(a: Content): void;

  native listScrollOffset013Test(a: Content): void;

  native listScrollOffset014Test(a: Content): void;

  native listScrollOffset015Test(a: Content): void;

  native listScrollOffset016Test(a: Content): void;

  native listScrollOffset017Test(a: Content): void;

  native listScrollOffset018Test(a: Content): void;

  native listScrollOffset019Test(a: Content): void;

  native listScrollOffset020Test(a: Content): void;

  native listScrollOffset021Test(a: Content): void;

  native listScrollOffset022Test(a: Content): void;

  native listScrollPageTest(a: Content): void;

  native listGetScrollPageData(): number[][];

  native listScrollBy001Test(a: Content): void;

  native listScrollBy002Test(a: Content): void;

  native listScrollBy003Test(a: Content): void;

  native listScrollBy004Test(a: Content): void;

  native listGetScrollByData(): number[][];

  native listCloseAllActionTest(a: Content): void;

  native listGetCloseAllActionRetData(): number[][];

  native listNestedScroll001Test(a: Content): void;

  native listNestedScroll002Test(a: Content): void;

  native listNestedScroll003Test(a: Content): void;

  native listGetNestedScrollRetData(): number[][];

  native toggleOnChangeTest(a: Content): void;

  native toggleEnabledTest(a: Content): void;

  native scrollNestedScrollTest(a: Content): void;

  native scrollNestedScrollChangeTestType(b: int): void;

  native scrollOnScrollTest(a: Content): void;

  native scrollCurrentOffsetTest(a: Content): void;

  native scrollFrictionTest(a: Content): void;

  native scrollOnAppearTest(a: Content): void;

  native scrollOnScrollEdgeTest(a: Content): void;

  native scrollOnScrollStartTest(a: Content): void;

  native scrollPageTest(a: Content): void;

  native scrollOnScrollStopTest(a: Content): void;

  native scrollOverlayTest(a: Content): void;

  native scrollScrollEdgeTest(a: Content, b: int): void;

  native scrollScrollSnapTest(a: Content): void;

  native scrollScrollToLinearTest(a: Content): void;

  native scrollScrollToEaseTest(a: Content): void;

  native scrollScrollToEaseInOutTest(a: Content): void;

  native scrollScrollToEaseInTest(a: Content): void;

  native scrollScrollToEaseOutTest(a: Content): void;

  native scrollScrollToExtremeDecelerationTest(a: Content): void;

  native scrollScrollToFastOutLinearInTest(a: Content): void;

  native scrollScrollToFastOutSlowInTest(a: Content): void;

  native scrollScrollToFrictionTest(a: Content): void;

  native scrollScrollToLinearOutSlowInTest(a: Content): void;

  native scrollScrollToRhythmTest(a: Content): void;

  native scrollScrollToSharpTest(a: Content): void;

  native scrollScrollToSmoothTest(a: Content): void;

  native scrollScrollToCanOverScrollTest(a: Content): void;

  native scrollScrollToCanOverScrollOffTest(a: Content): void;

  native scrollCurrentOffsetLinearTest(a: Content): void;

  native scrollCurrentOffsetEaseTest(a: Content): void;

  native scrollCurrentOffsetEaseInOutTest(a: Content): void;

  native scrollCurrentOffsetEaseInTest(a: Content): void;

  native scrollCurrentOffsetEaseOutTest(a: Content): void;

  native scrollCurrentOffsetExtremeDecelerationTest(a: Content): void;

  native scrollCurrentOffsetFastOutLinearInTest(a: Content): void;

  native scrollCurrentOffsetFastOutSlowInTest(a: Content): void;

  native scrollCurrentOffsetFrictionTest(a: Content): void;

  native scrollCurrentOffsetLinearOutSlowInTest(a: Content): void;

  native scrollCurrentOffsetRhythmTest(a: Content): void;

  native scrollCurrentOffsetSharpTest(a: Content): void;

  native scrollCurrentOffsetSmoothTest(a: Content): void;

  native scrollOnScrollFrameBeginTest(a: Content): void;

  native scrollHitTestBehaviorDefaultTest(a: Content): void;

  native scrollHitTestBehaviorBlockTest(a: Content): void;

  native scrollHitTestBehaviorTransparentTest(a: Content): void;

  native scrollHitTestBehaviorNoneTest(a: Content): void;

  native stackHitTestBehaviorTest(a: Content): void;

  native stackOnAreaChangeTest(a: Content): void;

  native stackOnTouchTest(a: Content): void;

  native textAreaEnabledTest(a: Content): void;

  native textInputEnabledTest(a: Content): void;

  native textInputOnChangeTest(a: Content): void;

  native checkboxEnabledTest(a: Content): void;

  native datePickerEnabledTest(a: Content): void;

  native sliderEnabledTest(a: Content): void;

  native SliderColorTest(a: Content): void;

  native textEnabledTest(a: Content): void;

  native textPickerOnChangeTest(a: Content): void;

  native datePickerOnDateChangeTest(a: Content): void;

  native timePickerOnChangeTest(a: Content): void;

  native customComponentEnabledTest(a: Content): void;

  native customComponentFocusableTest(a: Content): void;

  native customComponentOnAreaChangeTest(a: Content): void;

  native customComponentOnAppearTest(a: Content): void;

  native customComponentOnBlurTest(a: Content): void;

  native customComponentOnTouchTest(a: Content): void;

  native customComponentOnFocusTest(a: Content): void;

  native customComponentOnClickTest(a: Content): void;

  native customComponentHitTestBehaviorTest(a: Content): void;

  native customComponentIdTest(a: Content): void;

  native refreshOnStateChangeTest(a: Content): void;

  native refreshOnOffsetChangeTest(a: Content): void;

  native refreshOnRefreshingTest(a: Content): void;

  native textAreaOnFocusTest(a: Content): void;

  native textAreaOnBlurTest(a: Content): void;

  native textAreaKeyTest(a: Content): void;

  native textInputKeyTest(a: Content): void;

  native textAreaOnChangeTest(a: Content): void;

  native sliderOnChangeTest(a: Content): void;

  native textInputOnBlurTest(a: Content): void;

  native textInputOnFocusTest(a: Content): void;

  native textInputOnSubmitTest(a: Content): void;

  native gestureTest(a: Content): void;

  native longPressGestureTest(a: Content): void;

  native swipeGestureTest(a: Content): void;

  native panGestureTest(a: Content): void;

  native rotateGestureTest(a: Content): void;

  native pinchGestureTest(a: Content): void;

  native interruptGestureTest(a: Content): void;

  native gestureCreateGestureTest(a: Content): void;

  native gestureCreateGesture1Test(a: Content): void;

  native gestureCreateGesture2Test(a: Content): void;

  native gestureCreateGesture3Test(a: Content): void;

  native gestureCreateGesture4Test(a: Content): void;

  native gestureGestureInterrupterTest(a: Content): void;

  native gestureGestureInfoTest(a: Content): void;

  native dragTest(a: Content): void;

  native disableDefaultDropAnimationTest(a: Content): void;

  native getPreDragStatusTest(a: Content): void;

  native setSuggestedDropOperationTest(a: Content): void;

  native setDragResultTest(a: Content): void;

  native getDataTypesCountTest(a: Content): void;

  native getDragResultTest(a: Content): void;

  native getDropOperationTest(a: Content): void;

  native gestureNestScrollTest(a: Content): void;

  native getXYTest(a: Content): void;

  native getWidthHeightTest(a: Content): void;

  native getModifierKeyStatesTest(a: Content): void;

  native createDragActionTest(a: Content): void;

  native setPointerIdTest(a: Content): void;

  native setTouchPointXYTest(a: Content): void;

  native setDragPreviewOptionTest(a: Content): void;

  native registerStatusListenerTest(a: Content): void;

  native animatorEventTest(a: Content): void;

  native testKeyframeRegisterOnFinish(a: Content): void;

  native testKeyframeRegisterOnEvent(a: Content): void;

  native testAnimatorRegisterOnFrame(a: Content): void;

  native testAnimatorRegisterOnFinish(a: Content): void;

  native testAnimatorRegisterOnCancel(a: Content): void;

  native testAnimatorRegisterOnRepeat(a: Content): void;

  native animateToTest(a: Content): void;

  native keyframeRegisterOnFinishTest(a: Content): void;

  native keyframeRegisterOnEventTest(a: Content): void;

  native animatorRegisterOnFrameTest(a: Content): void;

  native animatorRegisterOnFinishTest(a: Content): void;

  native animatorRegisterOnCancelTest(a: Content): void;

  native animatorRegisterOnRepeatTest(a: Content): void;

  native animatorReverseTest(a: Content): void;

  native imageAnimatorOnCancelTest(a: Content): void;

  native imageAnimatorOnPauseTest(a: Content): void;

  native imageAnimatorOnRepeatTest(a: Content): void;

  native imageAnimatorOnFinishTest(a: Content): void;

  native inputEventTest(a: Content, b: string): void;

  native getEventState(): number;

  native setFuncName(a: string): void;

  native inputEventMouseTest(a: Content): void;

  native inputEventAxisTest(a: Content, b: string): void;

  native swiperOnChangeTest(a: Content): void;

  native swiperOnAnimationStartTest(a: Content): void;

  native swiperOnAnimationEndTest(a: Content): void;

  native swiperAdapterTest(a: Content): void;

  native swiperOnContentDidScrollTest(a: Content): void;

  native swiperOnGestureSwipeTest(a: Content): void;

  native radioOnChangeTest(a: Content): void;

  native radioOnChangeCheckedTest(a: Content): void;

  native textAreaOnTextSelectionChangeTest(a: Content): void;

  native getTextAreaData(): number[][];

  native textAreaOnContentScrollTest(a: Content): void;

  native textAreaOnContentDidChangeTest(a: Content): void;

  native getTextAreaContentDidData(): number[][];

  native textAreaOnEditChangeTest(a: Content): void;

  native getTextAreaEditChangeData(): number[][];

  native textAreaOnInsertTest(a: Content): void;

  native getTextAreaInsertData(): number[][];

  native textAreaOnDeleteTest(a: Content): void;

  native getTextAreaDeleteData(): number[][];

  native textAreaOnSubmitTest(a: Content): void;

  native swiperSwipeToIndexTest(a: Content): void;

  native swiperNestedScrollTest(a: Content): void;

  native swiperNestedScrollChildTest(a: Content): void;

  native getTextAreaSubmitData(): number[][];

  native textInputOnTextSelectionChangeTest(a: Content): void;

  native getTextInputData(): number[][];

  native textInputOnContentScrollTest(a: Content): void;

  native textInputOnContentDidChangeTest(a: Content): void;

  native getTextInputContentDidData(): number[][];

  native textInputOnEditChangeTest(a: Content): void;

  native getTextInputEditChangeData(): number[][];

  native textInputOnInsertTest(a: Content): void;

  native getTextInputInsertData(): number[][];

  native textInputOnDeleteTest(a: Content): void;

  native getTextInputDeleteData(): number[][];

  native commonAttrsFocusStatusTest(a: Content): void;

  native commonAttrsTouchableTest(a: Content): void;

  native commonAttrsFocusOnTouchTest(a: Content): void;

  native eventCallbackAddReceiverTest(a: Content): void;

  native eventCallbackRemoveReceiverTest(a: Content): void;

  native eventCallbackRegisterEventTest(a: Content): void;

  native eventCallbackUnregisterEventTest(a: Content): void;

  native eventCallbackRegisterReceiverTest(a: Content): void;

  native eventCallbackUnregisterReceiverTest(a: Content): void;

  native eventCallbackAddReceiver401Test(a: Content): void;

  native eventCallbackRemoveReceiver401Test(a: Content): void;

  native eventCallbackRegisterEvent401Test(a: Content): void;

  native eventCallbackRegisterEvent001Test(a: Content): void;

  native eventCallbackRegisterEvent002Test(a: Content): void;

  native commonEventOnHoverTest(a: Content): void;

  native commonEventOnMouseTest(a: Content): void;

  native commonEventOnDisappearTest(a: Content): void;

  native commonEventOnVisibleAreaChangeTest(a: Content): void;

  native commonEventOnTouchPropagationTest(a: Content): void;

  native commonEventOnTouchInterceptDefaultTest(a: Content): void;

  native commonEventOnTouchInterceptBlockTest(a: Content): void;

  native commonEventOnTouchInterceptTransparentTest(a: Content): void;

  native commonEventOnTouchInterceptNoneTest(a: Content): void;

  native nodeTreeXComponentTest(a: Content): void;

  native nodeTreeXComponentDetach002Test(a: Content): void;

  native nodeTreeXComponentDetach001Test(a: Content): void;

  native nodeTreeXComponent401Test(a: Content): void;

  native nodeTreeXComponentDetach401Test(a: Content): void;

  native gridAdapterTest(a: Content): void;

  native refreshOffsetTest(a: Content): void;

  native refreshOffsetLessThanOffsetTest(a: Content): void;

  native hybirdGetNodeHandleTest(a: Content): void;

  native requirementPanGestureTest(a: Content): void;

  native customComponentMeasureNodeTest(a: Content): void;

  native getMeasureNodeData(): number[][];

  native customComponentGetContextDrawCanvasTest(a: Content): void;

  native customComponentDrawContextGetSizeTest(a: Content): void;

  native customComponentEventOnDrawTest(a: Content): void;

  native customComponentRegisterNodeCustomEventTest(a: Content): void;

  native customComponentUnregisterNodeCustomEventTest(a: Content): void;

  native customDialogSetAutoCancelTest(a: Content): void;

  native customDialogRegisterOnWillDismissTest(a: Content): void;

  native lazyForEachGetHostNodeTest(a: Content): void;

  native lazyForEachSetNodeIdTest(a: Content): void;

  native lazyForEachReloadAllItemsTest(a: Content): void;

  native lazyForEachGetAllItemsTest(a: Content): void;

  native lazyForEachReloadItemTest(a: Content): void;

  native lazyForEachInsertItemTest(a: Content): void;

  native lazyForEachRemoveItemTest(a: Content): void;

  native lazyForEachMoveItemTest(a: Content): void;

  native lazyForEachGetUserDataTest(a: Content): void;

  native lazyForEachGetTypeTest(a: Content): void;

  native lazyForEachGetRemovedNodeTest(a: Content): void;

  native lazyForEachGetItemIndexTest(a: Content): void;

  native lazyForEachSetItemTest(a: Content): void;

  native textAreaSelectionMenuHiddenTest(a: Content): void;

  native textAreaInputFilterTest(a: Content): void;

  native imageOnfinishTest(a: Content): void;

  native imageDownProgressTest(a: Content): void;

  native imageSpanOnClickTest(a: Content): void;

  native spanOnClickTest(a: Content): void;

  native imageDraggableEventTest(a: Content): void;

  native scrollScrollEventOnWillScrollTest(a: Content): void;

  native scrollScrollEventOnDidScrollTest(a: Content): void;

  native scrollScrollEventOnWillDidScrollTest(a: Content): void;

  native scrollScrollEventOnReachStartTest(a: Content): void;

  native scrollScrollEventOnReachEndTest(a: Content): void;

  native scrollScrollEventScrollBy001Test(a: Content): void;

  native scrollScrollEventScrollBy002Test(a: Content): void;

  native scrollScrollEventScrollBy003Test(a: Content): void;

  native scrollScrollEventScrollBy004Test(a: Content): void;

  native scrollScrollEventScrollBy005Test(a: Content): void;

  native scrollScrollEventScrollBy006Test(a: Content): void;

  native getOnWillDidDataTest(): number[][];

  native scrollScrollTo001Test(a: Content): void;

  native scrollScrollTo002Test(a: Content): void;

  native scrollScrollTo003Test(a: Content): void;

  native scrollScrollTo004Test(a: Content): void;

  native scrollScrollTo005Test(a: Content): void;

  native scrollScrollTo006Test(a: Content): void;

  native scrollScrollTo007Test(a: Content): void;

  native buttonLabel001Test(a: Content): void;

  native buttonLabel002Test(a: Content): void;

  native buttonLabel003Test(a: Content): void;

  native buttonLabel004Test(a: Content): void;

  native xComponentId001Test(a: Content): void;

  native xComponentId002Test(a: Content): void;

  native xComponentId003Test(a: Content): void;

  native xComponentId004Test(a: Content): void;

  native scrollScrollEdge001Test(a: Content): void;

  native scrollScrollEdge002Test(a: Content): void;

  native scrollScrollEdge003Test(a: Content): void;

  native waterFlowOnReachStartTest(a: Content): void;

  native waterFlowOnReachEndTest(a: Content): void;

  native waterFlowOnScrollStopTest(a: Content): void;

  native waterFlowOnWillDidScrollTest(a: Content): void;

  native getOnWillDidScrollData(): number[][];

  native waterFlowOnScrollIndexTest(a: Content): void;

  native getOnScrollIndexData(): number[][];

  native waterFlowOnScrollFrameBeginTest(a: Content, b: number): void;

  native waterFlowScrollToIndexTest(a: Content, index: number, alignment: number): void;

  native waterFlowScrollOffsetTest(a: Content): void;

  native waterFlowScrollOffsetData(): number[][];

  native waterFlowScrollPageTest(a: Content): void;

  native waterFlowGetScrollPageData(): number[][];

  native waterFlowScrollBy001Test(a: Content): void;

  native waterFlowScrollBy002Test(a: Content): void;

  native waterFlowScrollBy003Test(a: Content): void;

  native waterFlowScrollBy004Test(a: Content): void;

  native waterFlowGetScrollByData(): number[][];

  native waterFlowNestedScroll1Test(a: Content): void;

  native waterFlowNestedScroll2Test(a: Content): void;

  native waterFlowNestedScroll3Test(a: Content): void;

  native waterFlowGetNestedScrollData(): number[][];

  native customComponentSecondaryLayoutTest(a: Content): void;

  native getSecondaryLayoutData(): number[][];

  native textInputSelectionMenuHiddenTest(a: Content): void;

  native textInputInputFilterTest(a: Content): void;

  native textInputOnTextSelectionAllChangeTest(a: Content): void;

  native getTextInputSelectAllData(): number[][];

  native requirementRouterPageStateTest(a: Content): void;

  native getRouterData(): number[][];

  native resourceNapiValueTest(a: Content, b: Resource): void;

  native swipeAxisGestureTest(a: Content): void;

  native customComponentEventTest(a: Content): void;

  native scrollScrollEventTest(a: Content): void;
}