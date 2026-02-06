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

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
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
     * @tc.number    : testTextAlignStatic
     * @tc.name      : testTextAlignStatic
     * @tc.desc      : To test the enum value of TextAlign.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testTextDirectionStatic
     * @tc.name      : testTextDirectionStatic
     * @tc.desc      : To test the enum value of TextDirection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testBreakStrategyStatic
     * @tc.name      : testBreakStrategyStatic
     * @tc.desc      : To test the enum value of BreakStrategy.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testWordBreakStatic
     * @tc.name      : testWordBreakStatic
     * @tc.desc      : To test the enum value of WordBreak.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testTextDecorationTypeStatic
     * @tc.name      : testTextDecorationTypeStatic
     * @tc.desc      : To test the enum value of TextDecorationType.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testTextDecorationStyleStatic
     * @tc.name      : testTextDecorationStyleStatic
     * @tc.desc      : To test the enum value of TextDecorationStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testFontWeightStatic
     * @tc.name      : testFontWeightStatic
     * @tc.desc      : To test the enum value of FontWeight.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testFontStyleStatic
     * @tc.name      : testFontStyleStatic
     * @tc.desc      : To test the enum value of FontStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testTextBaselineStatic
     * @tc.name      : testTextBaselineStatic
     * @tc.desc      : To test the enum value of TextBaseline.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testEllipsisModeStatic
     * @tc.name      : testEllipsisModeStatic
     * @tc.desc      : To test the enum value of EllipsisMode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testFontWidthStatic_01
     * @tc.name      : testFontWidthStatic_01
     * @tc.desc      : To test the enum value of EllipsisMode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : testHeightBehaviorStatic
     * @tc.name      : testHeightBehaviorStatic
     * @tc.desc      : To test the enum value of EllipsisMode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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

  })
}