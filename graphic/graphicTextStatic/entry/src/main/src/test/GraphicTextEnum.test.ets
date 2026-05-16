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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import text from "@ohos.graphics.text"
import image from '@ohos.multimedia.image';
import type drawing from '@ohos.graphics.drawing';
import type common2D from '@ohos.graphics.common2D';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function GraphicTextEnum() {
  describe("GraphicTextEnum", (): void => {
    let globalFontCollection: text.FontCollection;
    let globalTextStyle: text.TextStyle;
    let globalParagraphStyle: text.ParagraphStyle;
    let globalStructStyle: text.StrutStyle;
    let globalCanvas: drawing.Canvas;
    let checkFontStyle: text.FontStyle;

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
    })

    /**
     * @tc.name   testTextAlignStatic
     * @tc.number testTextAlignStatic
     * @tc.desc   To test the enum value of TextAlign.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextAlignStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextAlign"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.TextAlign.LEFT + '');
        expect('1').assertEqual(text.TextAlign.RIGHT + '');
        expect('2').assertEqual(text.TextAlign.CENTER + '');
        expect('3').assertEqual(text.TextAlign.JUSTIFY + '');
        expect('4').assertEqual(text.TextAlign.START + '');
        expect('5').assertEqual(text.TextAlign.END + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of TextAlign error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTextDirectionStatic
     * @tc.number testTextDirectionStatic
     * @tc.desc   To test the enum value of TextDirection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDirectionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextDirection"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.TextDirection.RTL + '');
        expect('1').assertEqual(text.TextDirection.LTR + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of TextDirection error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testBreakStrategyStatic
     * @tc.number testBreakStrategyStatic
     * @tc.desc   To test the enum value of BreakStrategy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBreakStrategyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testBreakStrategy"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.BreakStrategy.GREEDY + '');
        expect('1').assertEqual(text.BreakStrategy.HIGH_QUALITY + '');
        expect('2').assertEqual(text.BreakStrategy.BALANCED + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of BreakStrategy error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testWordBreakStatic
     * @tc.number testWordBreakStatic
     * @tc.desc   To test the enum value of WordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWordBreakStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testWordBreak"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.WordBreak.NORMAL + '');
        expect('1').assertEqual(text.WordBreak.BREAK_ALL + '');
        expect('2').assertEqual(text.WordBreak.BREAK_WORD + '');
        expect('3').assertEqual(text.WordBreak.BREAK_HYPHEN + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of WordBreak error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTextDecorationTypeStatic
     * @tc.number testTextDecorationTypeStatic
     * @tc.desc   To test the enum value of TextDecorationType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecorationTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextDecorationType"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.TextDecorationType.NONE + '');
        expect('1').assertEqual(text.TextDecorationType.UNDERLINE + '');
        expect('2').assertEqual(text.TextDecorationType.OVERLINE + '');
        expect('4').assertEqual(text.TextDecorationType.LINE_THROUGH + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of TextDecorationType error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTextDecorationStyleStatic
     * @tc.number testTextDecorationStyleStatic
     * @tc.desc   To test the enum value of TextDecorationStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecorationStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextDecorationStyle"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.TextDecorationStyle.SOLID + '');
        expect('1').assertEqual(text.TextDecorationStyle.DOUBLE + '');
        expect('2').assertEqual(text.TextDecorationStyle.DOTTED + '');
        expect('3').assertEqual(text.TextDecorationStyle.DASHED + '');
        expect('4').assertEqual(text.TextDecorationStyle.WAVY + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of TextDecorationStyle error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testFontWeightStatic
     * @tc.number testFontWeightStatic
     * @tc.desc   To test the enum value of FontWeight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontWeightStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testFontWeight"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.FontWeight.W100 + '');
        expect('1').assertEqual(text.FontWeight.W200 + '');
        expect('2').assertEqual(text.FontWeight.W300 + '');
        expect('3').assertEqual(text.FontWeight.W400 + '');
        expect('4').assertEqual(text.FontWeight.W500 + '');
        expect('5').assertEqual(text.FontWeight.W600 + '');
        expect('6').assertEqual(text.FontWeight.W700 + '');
        expect('7').assertEqual(text.FontWeight.W800 + '');
        expect('8').assertEqual(text.FontWeight.W900 + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of FontWeight error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testFontStyleStatic
     * @tc.number testFontStyleStatic
     * @tc.desc   To test the enum value of FontStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testFontStyle"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.FontStyle.NORMAL + '');
        expect('1').assertEqual(text.FontStyle.ITALIC + '');
        expect('2').assertEqual(text.FontStyle.OBLIQUE + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of FontStyle error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTextBaselineStatic
     * @tc.number testTextBaselineStatic
     * @tc.desc   To test the enum value of TextBaseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBaselineStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextBaseline"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.TextBaseline.ALPHABETIC + '');
        expect('1').assertEqual(text.TextBaseline.IDEOGRAPHIC + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of TextBaseline error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEllipsisModeStatic
     * @tc.number testEllipsisModeStatic
     * @tc.desc   To test the enum value of EllipsisMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEllipsisModeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testEllipsisMode"
      console.info(msg + 'begin');
      try {
        expect('0').assertEqual(text.EllipsisMode.START + '');
        expect('1').assertEqual(text.EllipsisMode.MIDDLE + '');
        expect('2').assertEqual(text.EllipsisMode.END + '');
        done();
      } catch (err) {
        console.info(msg + 'test enum value of EllipsisMode error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testFontWidthStatic_01
     * @tc.number testFontWidthStatic_01
     * @tc.desc   To test the enum value of EllipsisMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontWidthStatic_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testEllipsisMode"
        console.info(msg + 'begin');
        try {
          expect('1').assertEqual(text.FontWidth.ULTRA_CONDENSED + '');
          expect('2').assertEqual(text.FontWidth.EXTRA_CONDENSED + '');
          expect('3').assertEqual(text.FontWidth.CONDENSED + '');
          expect('4').assertEqual(text.FontWidth.SEMI_CONDENSED + '');
          expect('5').assertEqual(text.FontWidth.NORMAL + '');
          expect('6').assertEqual(text.FontWidth.SEMI_EXPANDED + '');
          expect('7').assertEqual(text.FontWidth.EXPANDED + '');
          expect('8').assertEqual(text.FontWidth.EXTRA_EXPANDED + '');
          expect('9').assertEqual(text.FontWidth.ULTRA_EXPANDED + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of fontWidth error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeightBehaviorStatic
     * @tc.number testHeightBehaviorStatic
     * @tc.desc   To test the enum value of EllipsisMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeightBehaviorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testEllipsisMode"
        console.info(msg + 'begin');
        try {
          expect('0').assertEqual(text.TextHeightBehavior.ALL + '');
          expect('1').assertEqual(text.TextHeightBehavior.DISABLE_FIRST_ASCENT + '');
          expect('2').assertEqual(text.TextHeightBehavior.DISABLE_LAST_ASCENT + '');
          expect('3').assertEqual(text.TextHeightBehavior.DISABLE_ALL + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testHeightBehaviorStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPlaceholderAlignmentStatic
     * @tc.number testPlaceholderAlignmentStatic
     * @tc.desc   To test the enum value of PlaceholderAlignment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlaceholderAlignmentStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testPlaceholderAlignmentStatic"
        console.info(msg + 'begin');
        try {
          expect('0').assertEqual(text.PlaceholderAlignment.OFFSET_AT_BASELINE + '');
          expect('1').assertEqual(text.PlaceholderAlignment.ABOVE_BASELINE + '');
          expect('2').assertEqual(text.PlaceholderAlignment.BELOW_BASELINE + '');
          expect('3').assertEqual(text.PlaceholderAlignment.TOP_OF_ROW_BOX + '');
          expect('4').assertEqual(text.PlaceholderAlignment.BOTTOM_OF_ROW_BOX + '');
          expect('5').assertEqual(text.PlaceholderAlignment.CENTER_OF_ROW_BOX + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testPlaceholderAlignmentStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRectWidthStyleStatic
     * @tc.number testRectWidthStyleStatic
     * @tc.desc   To test the enum value of RectWidthStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectWidthStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testRectWidthStyleStatic"
        console.info(msg + 'begin');
        try {
          expect('0').assertEqual(text.RectWidthStyle.TIGHT + '');
          expect('1').assertEqual(text.RectWidthStyle.MAX + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testRectWidthStyleStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRectHeightStyleStatic
     * @tc.number testRectHeightStyleStatic
     * @tc.desc   To test the enum value of RectHeightStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectHeightStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testRectHeightStyleStatic"
        console.info(msg + 'begin');
        try {
          expect('0').assertEqual(text.RectHeightStyle.TIGHT + '');
          expect('1').assertEqual(text.RectHeightStyle.MAX + '');
          expect('2').assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE + '');
          expect('3').assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_TOP + '');
          expect('4').assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_BOTTOM + '');
          expect('5').assertEqual(text.RectHeightStyle.STRUT + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testRectHeightStyleStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testAffinityStatic
     * @tc.number testAffinityStatic
     * @tc.desc   To test the enum value of Affinity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAffinityStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testAffinityStatic"
        console.info(msg + 'begin');
        try {
          expect('0').assertEqual(text.Affinity.UPSTREAM + '');
          expect('1').assertEqual(text.Affinity.DOWNSTREAM + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testAffinityStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTextVerticalAlignStatic
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_ENUM_TEXTVERTICALALIGN
     * @tc.desc   To test the enum value of TextVerticalAlign.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextVerticalAlignStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextVerticalAlignStatic"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextVerticalAlign.BASELINE);
        expect(1).assertEqual(text.TextVerticalAlign.BOTTOM);
        expect(2).assertEqual(text.TextVerticalAlign.CENTER);
        expect(3).assertEqual(text.TextVerticalAlign.TOP);
        done();
      } catch (err) {
        console.info(msg + 'test enum value of testTextVerticalAlignStatic error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextBadgeTypeStatic
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_ENUM_TEXTBADGETYPE
     * @tc.desc   To test the enum value of TextBadgeType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBadgeTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testTextBadgeTypeStatic"
        console.info(msg + 'begin');
        try {
          expect(0).assertEqual(text.TextBadgeType.TEXT_BADGE_NONE);
          expect(1).assertEqual(text.TextBadgeType.TEXT_SUPERSCRIPT);
          expect(2).assertEqual(text.TextBadgeType.TEXT_SUBSCRIPT);
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testTextBadgeTypeStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTextHighContrastStatic
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_ENUM_TEXTHIGHCONTRAST
     * @tc.desc   To test the enum value of TextBadgeType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextHighContrastStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testTextHighContrastStatic"
        console.info(msg + 'begin');
        try {
          expect(0).assertEqual(text.TextHighContrast.TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
          expect(1).assertEqual(text.TextHighContrast.TEXT_APP_DISABLE_HIGH_CONTRAST);
          expect(2).assertEqual(text.TextHighContrast.TEXT_APP_ENABLE_HIGH_CONTRAST);
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testTextHighContrastStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTextUndefinedGlyphDisplayStatic
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_ENUM_TEXTUNDEFINEDGLYPHDISPLAY
     * @tc.desc   To test the enum value of TextUndefinedGlyphDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextUndefinedGlyphDisplayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testTextUndefinedGlyphDisplayStatic"
        console.info(msg + 'begin');
        try {
          expect(0).assertEqual(text.TextUndefinedGlyphDisplay.USE_DEFAULT);
          expect(1).assertEqual(text.TextUndefinedGlyphDisplay.USE_TOFU);
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testTextUndefinedGlyphDisplayStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testLineHeightStyleStatic
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_ENUM_LINEHEIGHTSTYLE
     * @tc.desc   To test the enum value of LineHeightStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLineHeightStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testLineHeightStyleStatic"
        console.info(msg + 'begin');
        try {
          expect(0).assertEqual(text.LineHeightStyle.FONT_SIZE);
          expect(1).assertEqual(text.LineHeightStyle.FONT_HEIGHT);
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testLineHeightStyleStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}