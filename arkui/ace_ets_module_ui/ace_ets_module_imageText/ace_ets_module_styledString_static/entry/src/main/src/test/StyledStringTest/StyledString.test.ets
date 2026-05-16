/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import {
  DecorationStyle,
  TextDecorationType,
  BaselineOffsetStyle,
  LetterSpacingStyle,
  LineHeightStyle,
  ImageAttachment,
  UrlStyle
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

export default function StyledStringTest() {
  describe('StyledStringTest', () => {
    const SCROLL_RETRY_TIMES: number = 8;

    const swipeUpForSearch = async (): Promise<void> => {
      let x: number = 360;
      let downY: number = 1100;
      let upY: number = 300;
      try {
        let anchorRect = CommonFunc.getComponentRect('btnStrLen');
        x = Number((anchorRect.left + anchorRect.right) / 2);
        let anchorHeight = Number(anchorRect.bottom - anchorRect.top);
        downY = Number(anchorRect.bottom + anchorHeight * 8);
        upY = Number(anchorRect.top + anchorHeight * 2);
      } catch (err) {
        console.info('swipeUpForSearch fallback coords, err=' + JSON.stringify(err));
      }
      if (downY <= upY + 80) {
        downY = upY + 320;
      }
      await Utils.drag(x, downY, x, upY, 12);
      await CommonFunc.sleep(300);
    };

    const clickByIdWithScroll = async (driver: Driver, compId: string): Promise<void> => {
      for (let i: number = 0; i <= SCROLL_RETRY_TIMES; i++) {
        let btn = await driver.findComponent(ON.id(compId));
        if (btn) {
          await btn.click();
          return;
        }
        await swipeUpForSearch();
      }
      expect().assertFail();
    };

    beforeAll(async (): Promise<void> => {
      console.info("StyledStringTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("StyledStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("StyledStringTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "StyledStringIndex") {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("StyledStringTest pushUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("StyledStringTest after each called");
    });

    /**
     * @tc.number StyledStringTest_001
     * @tc.name styledStringLength
     * @tc.desc new StyledString("Hello World").length → 11
     */
    it('styledStringLength', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: styledStringLength START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnStrLen');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnStrLen');
      console.info('[styledStringLength] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('str_len:11');
      console.info('StyledStringTest: styledStringLength END');
      done();
    });

    /**
     * @tc.number StyledStringTest_002
     * @tc.name styledStringGetString
     * @tc.desc new StyledString("Hello").getString() → "Hello"
     */
    it('styledStringGetString', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: styledStringGetString START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnStrGet');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnStrGet');
      console.info('[styledStringGetString] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('str_get:Hello');
      console.info('StyledStringTest: styledStringGetString END');
      done();
    });

    /**
     * @tc.number StyledStringTest_003
     * @tc.name styledStringEqualsTrue
     * @tc.desc StyledString("Hello").equals(StyledString("Hello")) → true
     */
    it('styledStringEqualsTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: styledStringEqualsTrue START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnStrEqTrue');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnStrEqTrue');
      console.info('[styledStringEqualsTrue] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('str_eq:match');
      console.info('StyledStringTest: styledStringEqualsTrue END');
      done();
    });

    /**
     * @tc.number StyledStringTest_004
     * @tc.name styledStringEqualsFalse
     * @tc.desc StyledString("Hello").equals(StyledString("World")) → false
     */
    it('styledStringEqualsFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: styledStringEqualsFalse START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnStrEqFalse');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnStrEqFalse');
      console.info('[styledStringEqualsFalse] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('str_eq2:nomatch');
      console.info('StyledStringTest: styledStringEqualsFalse END');
      done();
    });

    /**
     * @tc.number StyledStringTest_005
     * @tc.name styledStringSubStyledString
     * @tc.desc StyledString("Hello World").subStyledString(0,5).getString() → "Hello"
     */
    it('styledStringSubStyledString', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: styledStringSubStyledString START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnStrSub');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnStrSub');
      console.info('[styledStringSubStyledString] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('str_sub:Hello');
      console.info('StyledStringTest: styledStringSubStyledString END');
      done();
    });

    /**
     * @tc.number StyledStringTest_006
     * @tc.name mutableStyledStringAppend
     * @tc.desc MutableStyledString("Hello").appendStyledString(StyledString("XYZ")) → "HelloXYZ"
     */
    it('mutableStyledStringAppend', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: mutableStyledStringAppend START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnMstrApp');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnMstrApp');
      console.info('[mutableStyledStringAppend] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('mstr_app:HelloXYZ');
      console.info('StyledStringTest: mutableStyledStringAppend END');
      done();
    });

    /**
     * @tc.number StyledStringTest_007
     * @tc.name mutableStyledStringInsert
     * @tc.desc MutableStyledString("Hello").insertString(0,"Hi") → "HiHello"
     */
    it('mutableStyledStringInsert', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: mutableStyledStringInsert START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnMstrIns');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnMstrIns');
      console.info('[mutableStyledStringInsert] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('mstr_ins:HiHello');
      console.info('StyledStringTest: mutableStyledStringInsert END');
      done();
    });

    /**
     * @tc.number StyledStringTest_008
     * @tc.name mutableStyledStringReplace
     * @tc.desc MutableStyledString("Hello").replaceString(0,5,"Hi") → "Hi"
     */
    it('mutableStyledStringReplace', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: mutableStyledStringReplace START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnMstrRep');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnMstrRep');
      console.info('[mutableStyledStringReplace] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('mstr_rep:Hi');
      console.info('StyledStringTest: mutableStyledStringReplace END');
      done();
    });

    /**
     * @tc.number StyledStringTest_009
     * @tc.name paragraphStyleTextDirectionLTR
     * @tc.desc ParagraphStyle({textDirection:TextDirection.LTR}).textDirection === TextDirection.LTR
     */
    it('paragraphStyleTextDirectionLTR', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleTextDirectionLTR START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaDirLtr');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaDirLtr');
      console.info('[paragraphStyleTextDirectionLTR] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_dir_ltr:match');
      console.info('StyledStringTest: paragraphStyleTextDirectionLTR END');
      done();
    });

    /**
     * @tc.number StyledStringTest_010
     * @tc.name paragraphStyleTextDirectionRTL
     * @tc.desc ParagraphStyle({textDirection:TextDirection.RTL}).textDirection === TextDirection.RTL
     */
    it('paragraphStyleTextDirectionRTL', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleTextDirectionRTL START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaDirRtl');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaDirRtl');
      console.info('[paragraphStyleTextDirectionRTL] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_dir_rtl:match');
      console.info('StyledStringTest: paragraphStyleTextDirectionRTL END');
      done();
    });

    /**
     * @tc.number StyledStringTest_011
     * @tc.name paragraphStyleTextAlign
     * @tc.desc ParagraphStyle({textAlign:TextAlign.Center}).textAlign === TextAlign.Center
     */
    it('paragraphStyleTextAlign', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleTextAlign START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaAlign');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaAlign');
      console.info('[paragraphStyleTextAlign] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_align:match');
      console.info('StyledStringTest: paragraphStyleTextAlign END');
      done();
    });

    /**
     * @tc.number StyledStringTest_012
     * @tc.name paragraphStyleMaxLines
     * @tc.desc ParagraphStyle({maxLines:3}).maxLines === 3
     */
    it('paragraphStyleMaxLines', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleMaxLines START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaMaxLines');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaMaxLines');
      console.info('[paragraphStyleMaxLines] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_maxlines:3');
      console.info('StyledStringTest: paragraphStyleMaxLines END');
      done();
    });

    /**
     * @tc.number StyledStringTest_013
     * @tc.name paragraphStyleOverflow
     * @tc.desc ParagraphStyle({overflow:TextOverflow.Ellipsis}).overflow === TextOverflow.Ellipsis
     */
    it('paragraphStyleOverflow', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleOverflow START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaOverflow');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaOverflow');
      console.info('[paragraphStyleOverflow] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_overflow:match');
      console.info('StyledStringTest: paragraphStyleOverflow END');
      done();
    });

    /**
     * @tc.number StyledStringTest_014
     * @tc.name paragraphStyleWordBreak
     * @tc.desc ParagraphStyle({wordBreak:WordBreak.BREAK_WORD}).wordBreak === WordBreak.BREAK_WORD
     */
    it('paragraphStyleWordBreak', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: paragraphStyleWordBreak START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnParaWordBreak');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnParaWordBreak');
      console.info('[paragraphStyleWordBreak] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('para_wordbreak:match');
      console.info('StyledStringTest: paragraphStyleWordBreak END');
      done();
    });

    /**
     * @tc.number StyledStringTest_015
     * @tc.name textStyleFontColor
     * @tc.desc new TextStyle({fontColor:Color.Red}).fontColor === Color.Red
     */
    it('textStyleFontColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: textStyleFontColor START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnTstyleColor');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTstyleColor');
      console.info('[textStyleFontColor] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('tstyle_color:match');
      console.info('StyledStringTest: textStyleFontColor END');
      done();
    });

    /**
     * @tc.number StyledStringTest_016
     * @tc.name textStyleFontWeight
     * @tc.desc new TextStyle({fontWeight:FontWeight.Bold}).fontWeight === FontWeight.Bold
     */
    it('textStyleFontWeight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: textStyleFontWeight START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      await clickByIdWithScroll(driver, 'btnTstyleWeight');
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTstyleWeight');
      console.info('[textStyleFontWeight] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('tstyle_weight:match');
      console.info('StyledStringTest: textStyleFontWeight END');
      done();
    });

    /**
     * @tc.number StyledStringTest_017
     * @tc.name decorationStyleUnderline
     * @tc.desc new DecorationStyle(TextDecorationType.Underline).type === TextDecorationType.Underline
     */
    it('decorationStyleUnderline', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: decorationStyleUnderline START');
      let deco = new DecorationStyle({ type: TextDecorationType.Underline });
      expect(deco.type === TextDecorationType.Underline).assertTrue();
      console.info('StyledStringTest: decorationStyleUnderline END');
      done();
    });

    /**
     * @tc.number StyledStringTest_018
     * @tc.name decorationStyleLineThrough
     * @tc.desc new DecorationStyle(TextDecorationType.LineThrough).type === TextDecorationType.LineThrough
     */
    it('decorationStyleLineThrough', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: decorationStyleLineThrough START');
      let deco = new DecorationStyle({ type: TextDecorationType.LineThrough });
      expect(deco.type === TextDecorationType.LineThrough).assertTrue();
      console.info('StyledStringTest: decorationStyleLineThrough END');
      done();
    });

    /**
     * @tc.number StyledStringTest_019
     * @tc.name baselineOffsetStyle
     * @tc.desc new BaselineOffsetStyle(LengthMetrics.vp(10)).baselineOffset === 10
     */
    it('baselineOffsetStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: baselineOffsetStyle START');
      let style = new BaselineOffsetStyle(LengthMetrics.vp(10));
      expect(style.baselineOffset as number).assertEqual(10);
      console.info('StyledStringTest: baselineOffsetStyle END');
      done();
    });

    /**
     * @tc.number StyledStringTest_020
     * @tc.name letterSpacingStyle
     * @tc.desc new LetterSpacingStyle(LengthMetrics.vp(2)).letterSpacing === 2
     */
    it('letterSpacingStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: letterSpacingStyle START');
      let style = new LetterSpacingStyle(LengthMetrics.vp(2));
      expect(style.letterSpacing as number).assertEqual(2);
      console.info('StyledStringTest: letterSpacingStyle END');
      done();
    });

    /**
     * @tc.number StyledStringTest_021
     * @tc.name lineHeightStyle
     * @tc.desc new LineHeightStyle(LengthMetrics.vp(24)).lineHeight === 24
     */
    it('lineHeightStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: lineHeightStyle START');
      let style = new LineHeightStyle(LengthMetrics.vp(24));
      expect(style.lineHeight as number).assertEqual(24);
      console.info('StyledStringTest: lineHeightStyle END');
      done();
    });

    /**
     * @tc.number StyledStringTest_022
     * @tc.name imageAttachmentResourceValue
     * @tc.desc new ImageAttachment({resourceValue:'icon.png'}).resourceValue === 'icon.png'
     */
    it('imageAttachmentResourceValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: imageAttachmentResourceValue START');
      let img = new ImageAttachment({ resourceValue: 'icon.png' });
      expect((img.resourceValue as string).indexOf('ico') >= 0).assertTrue();
      console.info('StyledStringTest: imageAttachmentResourceValue END');
      done();
    });

    /**
     * @tc.number StyledStringTest_023
     * @tc.name urlStyleUrl
     * @tc.desc new UrlStyle('local_resource_link').url === 'local_resource_link'
     */
    it('urlStyleUrl', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('StyledStringTest: urlStyleUrl START');
      let urlStyle = new UrlStyle('local_resource_link');
      expect(urlStyle.url).assertEqual('local_resource_link');
      console.info('StyledStringTest: urlStyleUrl END');
      done();
    });

  });
}
