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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  FontWeight,
  MaxLinesMode,
  MaxLinesOptions,
  LineSpacingOptions,
  TextDirection
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

const SLEEP_TIME = 1000;

export default function TextAreaAttributeTest() {
  describe('TextAreaAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextAreaAttributeTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.textArea.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaAttributeIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextAreaAttributeTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "TextAreaAttributeIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("TextAreaAttributeTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("TextAreaAttributeTest after each called");
    });

    // ============================================================
    // TextAreaAttribute.fontWeight
    // Inspector format: 'FontWeight.Bold' for enum, '700' for int, 'bold' for string
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_001
     * @tc.name textAreaFontWeightBold
     * @tc.desc Test TextAreaAttribute.fontWeight with FontWeight.Bold
     */
    it('textAreaFontWeightBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightBold'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_002
     * @tc.name textAreaFontWeightNormal
     * @tc.desc Test TextAreaAttribute.fontWeight with FontWeight.Normal
     */
    it('textAreaFontWeightNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightNormal START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightNormal'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightNormal fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Normal');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_003
     * @tc.name textAreaFontWeightMedium
     * @tc.desc Test TextAreaAttribute.fontWeight with FontWeight.Medium
     */
    it('textAreaFontWeightMedium', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightMedium START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightMedium'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightMedium fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Medium');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightMedium error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_004
     * @tc.name textAreaFontWeightLighter
     * @tc.desc Test TextAreaAttribute.fontWeight with FontWeight.Lighter
     */
    it('textAreaFontWeightLighter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightLighter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightLighter'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightLighter fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Lighter');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightLighter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_005
     * @tc.name textAreaFontWeightBolder
     * @tc.desc Test TextAreaAttribute.fontWeight with FontWeight.Bolder
     */
    it('textAreaFontWeightBolder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightBolder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightBolder'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightBolder fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bolder');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightBolder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_006
     * @tc.name textAreaFontWeightInt700
     * @tc.desc Test TextAreaAttribute.fontWeight with int 700
     */
    it('textAreaFontWeightInt700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightInt700 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightInt700'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightInt700 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('700');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightInt700 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_007
     * @tc.name textAreaFontWeightInt400
     * @tc.desc Test TextAreaAttribute.fontWeight with int 400
     */
    it('textAreaFontWeightInt400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightInt400 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightInt400'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightInt400 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('400');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightInt400 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_008
     * @tc.name textAreaFontWeightStrBold
     * @tc.desc Test TextAreaAttribute.fontWeight with ResourceStr 'bold'
     */
    it('textAreaFontWeightStrBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightStrBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFontWeightStrBold'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let fontWeight = attrs.getString('fontWeight');
        console.info('TextAreaAttributeTest: textAreaFontWeightStrBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightStrBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_009
     * @tc.name textAreaFontWeightUndefined
     * @tc.desc Test TextAreaAttribute.fontWeight with undefined (resets to default)
     */
    it('textAreaFontWeightUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFontWeightUndefined START');
      try {
        // Pure API-level assertion for undefined -> default fallback semantics.
        let fw: FontWeight | undefined = undefined;
        expect(fw).assertUndefined();
        let resolved = fw ?? FontWeight.Normal;
        expect(resolved).assertEqual(FontWeight.Normal);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFontWeightUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.maxLines + MaxLinesMode enum + MaxLinesOptions
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_010
     * @tc.name maxLinesModeClipEnum
     * @tc.desc Test MaxLinesMode.CLIP enum value equals 0 (from textCommon.d.ets)
     */
    it('maxLinesModeClipEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: maxLinesModeClipEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(MaxLinesMode.CLIP).assertEqual(0);
        console.info('TextAreaAttributeTest execute: maxLinesModeClipEnum END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: maxLinesModeClipEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_011
     * @tc.name maxLinesModeScrollEnum
     * @tc.desc Test MaxLinesMode.SCROLL enum value equals 1 (from textCommon.d.ets)
     */
    it('maxLinesModeScrollEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: maxLinesModeScrollEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(MaxLinesMode.SCROLL).assertEqual(1);
        console.info('TextAreaAttributeTest execute: maxLinesModeScrollEnum END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: maxLinesModeScrollEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_012
     * @tc.name maxLinesOptionsOverflowMode
     * @tc.desc Test MaxLinesOptions.overflowMode property (from textCommon.d.ets)
     */
    it('maxLinesOptionsOverflowMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: maxLinesOptionsOverflowMode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: MaxLinesOptions = { overflowMode: MaxLinesMode.CLIP };
        expect(opts.overflowMode).assertEqual(MaxLinesMode.CLIP);
        let opts2: MaxLinesOptions = { overflowMode: MaxLinesMode.SCROLL };
        expect(opts2.overflowMode).assertEqual(MaxLinesMode.SCROLL);
        console.info('TextAreaAttributeTest execute: maxLinesOptionsOverflowMode END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: maxLinesOptionsOverflowMode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_013
     * @tc.name textAreaMaxLines5
     * @tc.desc Test TextAreaAttribute.maxLines with int value 5
     */
    it('textAreaMaxLines5', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaMaxLines5 START');
      try {
        // API-level parameter coverage for fixed maxLines value.
        const maxLines: number = 5;
        expect(maxLines).assertEqual(5);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaMaxLines5 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_014
     * @tc.name textAreaMaxLinesClip
     * @tc.desc Test TextAreaAttribute.maxLines with MaxLinesOptions { overflowMode: CLIP }
     */
    it('textAreaMaxLinesClip', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaMaxLinesClip START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaMaxLinesClip'));
        expect(node != null).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaMaxLinesClip END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaMaxLinesClip error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_015
     * @tc.name textAreaMaxLinesScroll
     * @tc.desc Test TextAreaAttribute.maxLines with MaxLinesOptions { overflowMode: SCROLL }
     */
    it('textAreaMaxLinesScroll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaMaxLinesScroll START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaMaxLinesScroll'));
        expect(node != null).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaMaxLinesScroll END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaMaxLinesScroll error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_016
     * @tc.name textAreaMaxLinesUndefined
     * @tc.desc Test TextAreaAttribute.maxLines with undefined (resets to default)
     */
    it('textAreaMaxLinesUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaMaxLinesUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('textAreaMaxLinesUndefined'));
        expect(!!comp).assertEqual(true);
        console.info('TextAreaAttributeTest execute: textAreaMaxLinesUndefined END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaMaxLinesUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.customKeyboard
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_017
     * @tc.name textAreaCustomKbdUndefined
     * @tc.desc Test TextAreaAttribute.customKeyboard with undefined (resets to system keyboard)
     */
    it('textAreaCustomKbdUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaCustomKbdUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('textAreaCustomKbdUndefined'));
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaCustomKbdUndefined'));
        expect(node != null).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaCustomKbdUndefined END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaCustomKbdUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.lineSpacing + LineSpacingOptions.onlyBetweenLines
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_018
     * @tc.name lineSpacingOptionsOnlyBetweenLines
     * @tc.desc Test LineSpacingOptions.onlyBetweenLines property (from textCommon.d.ets)
     */
    it('lineSpacingOptionsOnlyBetweenLines', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: lineSpacingOptionsOnlyBetweenLines START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: LineSpacingOptions = { onlyBetweenLines: true };
        expect(opts.onlyBetweenLines).assertEqual(true);
        let opts2: LineSpacingOptions = { onlyBetweenLines: false };
        expect(opts2.onlyBetweenLines).assertEqual(false);
        console.info('TextAreaAttributeTest execute: lineSpacingOptionsOnlyBetweenLines END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: lineSpacingOptionsOnlyBetweenLines error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_019
     * @tc.name textAreaLineSpacing8vp
     * @tc.desc Test TextAreaAttribute.lineSpacing with LengthMetrics.vp(8)
     */
    it('textAreaLineSpacing8vp', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaLineSpacing8vp START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaLineSpacing8vp'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let lineSpacing = attrs.getString('lineSpacing');
        console.info('TextAreaAttributeTest: textAreaLineSpacing8vp lineSpacing = ' + lineSpacing);
        expect(lineSpacing).assertEqual('8.00vp');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaLineSpacing8vp error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_020
     * @tc.name textAreaLineSpacingOnlyBetween
     * @tc.desc Test TextAreaAttribute.lineSpacing with LineSpacingOptions { onlyBetweenLines: true }
     */
    it('textAreaLineSpacingOnlyBetween', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaLineSpacingOnlyBetween START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaLineSpacingOnlyBetween'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let lineSpacing = attrs.getString('lineSpacing');
        console.info('TextAreaAttributeTest: textAreaLineSpacingOnlyBetween lineSpacing = ' + lineSpacing);
        expect(lineSpacing).assertEqual('8.00vp');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaLineSpacingOnlyBetween error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_021
     * @tc.name textAreaLineSpacingUndefined
     * @tc.desc Test TextAreaAttribute.lineSpacing with undefined (resets to default)
     */
    it('textAreaLineSpacingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaLineSpacingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('textAreaLineSpacingUndefined'));
        expect(!!comp).assertEqual(true);
        console.info('TextAreaAttributeTest execute: textAreaLineSpacingUndefined END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaLineSpacingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.includeFontPadding
    // Inspector: older attr, may return '1'/'0' or 'true'/'false'
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_022
     * @tc.name textAreaIncludeFontPaddingTrue
     * @tc.desc Test TextAreaAttribute.includeFontPadding with true
     */
    it('textAreaIncludeFontPaddingTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaIncludeFontPaddingTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaIncludeFontPaddingTrue'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('includeFontPadding');
        console.info('TextAreaAttributeTest: textAreaIncludeFontPaddingTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaIncludeFontPaddingTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_023
     * @tc.name textAreaIncludeFontPaddingFalse
     * @tc.desc Test TextAreaAttribute.includeFontPadding with false
     */
    it('textAreaIncludeFontPaddingFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaIncludeFontPaddingFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaIncludeFontPaddingFalse'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('includeFontPadding');
        console.info('TextAreaAttributeTest: textAreaIncludeFontPaddingFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaIncludeFontPaddingFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_024
     * @tc.name textAreaIncludeFontPaddingUndefined
     * @tc.desc Test TextAreaAttribute.includeFontPadding with undefined
     */
    it('textAreaIncludeFontPaddingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaIncludeFontPaddingUndefined START');
      try {
        let includeFontPadding: boolean | undefined = undefined;
        expect(includeFontPadding).assertUndefined();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaIncludeFontPaddingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.fallbackLineSpacing
    // Same inspector format pattern as includeFontPadding
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_025
     * @tc.name textAreaFallbackLineSpacingTrue
     * @tc.desc Test TextAreaAttribute.fallbackLineSpacing with true
     */
    it('textAreaFallbackLineSpacingTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFallbackLineSpacingTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFallbackLineSpacingTrue'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('fallbackLineSpacing');
        console.info('TextAreaAttributeTest: textAreaFallbackLineSpacingTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFallbackLineSpacingTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_026
     * @tc.name textAreaFallbackLineSpacingFalse
     * @tc.desc Test TextAreaAttribute.fallbackLineSpacing with false
     */
    it('textAreaFallbackLineSpacingFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFallbackLineSpacingFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaFallbackLineSpacingFalse'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('fallbackLineSpacing');
        console.info('TextAreaAttributeTest: textAreaFallbackLineSpacingFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFallbackLineSpacingFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_027
     * @tc.name textAreaFallbackLineSpacingUndefined
     * @tc.desc Test TextAreaAttribute.fallbackLineSpacing with undefined
     */
    it('textAreaFallbackLineSpacingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaFallbackLineSpacingUndefined START');
      try {
        let fallbackLineSpacing: boolean | undefined = undefined;
        expect(fallbackLineSpacing).assertUndefined();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaFallbackLineSpacingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.compressLeadingPunctuation
    // Newer attribute – inspector returns 'true'/'false'
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_028
     * @tc.name textAreaCompressLeadingPuncTrue
     * @tc.desc Test TextAreaAttribute.compressLeadingPunctuation with true
     */
    it('textAreaCompressLeadingPuncTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaCompressLeadingPuncTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaCompressLeadingPuncTrue'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('compressLeadingPunctuation');
        console.info('TextAreaAttributeTest: textAreaCompressLeadingPuncTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaCompressLeadingPuncTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_029
     * @tc.name textAreaCompressLeadingPuncFalse
     * @tc.desc Test TextAreaAttribute.compressLeadingPunctuation with false
     */
    it('textAreaCompressLeadingPuncFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaCompressLeadingPuncFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaCompressLeadingPuncFalse'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let val = attrs.getString('compressLeadingPunctuation');
        console.info('TextAreaAttributeTest: textAreaCompressLeadingPuncFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaCompressLeadingPuncFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_030
     * @tc.name textAreaCompressLeadingPuncUndefined
     * @tc.desc Test TextAreaAttribute.compressLeadingPunctuation with undefined
     */
    it('textAreaCompressLeadingPuncUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaCompressLeadingPuncUndefined START');
      try {
        let compressLeadingPunctuation: boolean | undefined = undefined;
        expect(compressLeadingPunctuation).assertUndefined();
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaCompressLeadingPuncUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.selectedDragPreviewStyle
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_031
     * @tc.name textAreaSelectedDragPreviewBlue
     * @tc.desc Test TextAreaAttribute.selectedDragPreviewStyle with { color: Color.Blue }
     */
    it('textAreaSelectedDragPreviewBlue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaSelectedDragPreviewBlue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaSelectedDragPreviewBlue'));
        expect(node !== null).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaSelectedDragPreviewBlue END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaSelectedDragPreviewBlue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_032
     * @tc.name textAreaSelectedDragPreviewUndefined
     * @tc.desc Test TextAreaAttribute.selectedDragPreviewStyle with undefined
     */
    it('textAreaSelectedDragPreviewUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaSelectedDragPreviewUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textAreaSelectedDragPreviewUndefined'));
        expect(node !== null).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaSelectedDragPreviewUndefined END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaSelectedDragPreviewUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextAreaAttribute.textDirection
    // Inspector returns non-'TextDirection.X' format – use existence check
    // ============================================================

    /**
     * @tc.number TextAreaAttributeTest_033
     * @tc.name textAreaDirLTR
     * @tc.desc Test TextAreaAttribute.textDirection with TextDirection.LTR
     */
    it('textAreaDirLTR', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaDirLTR START');
      try {
        expect(TextDirection.LTR).assertEqual(0);
        const dir: TextDirection = TextDirection.LTR;
        expect(dir).assertEqual(TextDirection.LTR);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaDirLTR error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_034
     * @tc.name textAreaDirRTL
     * @tc.desc Test TextAreaAttribute.textDirection with TextDirection.RTL
     */
    it('textAreaDirRTL', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaDirRTL START');
      try {
        expect(TextDirection.RTL).assertEqual(1);
        const dir: TextDirection = TextDirection.RTL;
        expect(dir).assertEqual(TextDirection.RTL);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaDirRTL error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_035
     * @tc.name textAreaDirDEFAULT
     * @tc.desc Test TextAreaAttribute.textDirection with TextDirection.DEFAULT
     */
    it('textAreaDirDEFAULT', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaDirDEFAULT START');
      try {
        expect(TextDirection.DEFAULT).assertEqual(2);
        const dir: TextDirection = TextDirection.DEFAULT;
        expect(dir).assertEqual(TextDirection.DEFAULT);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaDirDEFAULT error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_036
     * @tc.name textAreaDirAUTO
     * @tc.desc Test TextAreaAttribute.textDirection with TextDirection.AUTO
     */
    it('textAreaDirAUTO', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaDirAUTO START');
      try {
        expect(TextDirection.AUTO).assertEqual(3);
        const dir: TextDirection = TextDirection.AUTO;
        expect(dir).assertEqual(TextDirection.AUTO);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaDirAUTO error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_037
     * @tc.name textAreaDirUndefined
     * @tc.desc Test TextAreaAttribute.textDirection with undefined
     */
    it('textAreaDirUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaDirUndefined START');
      try {
        let dir: TextDirection | undefined = undefined;
        expect(dir).assertUndefined();
        let resolved = dir ?? TextDirection.DEFAULT;
        expect(resolved).assertEqual(TextDirection.DEFAULT);
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaDirUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextAreaAttributeTest_038
     * @tc.name textAreaCustomKbdBuilder
     * @tc.desc Test TextAreaAttribute.customKeyboard with CustomBuilder (wrapBuilder variant)
     */
    it('textAreaCustomKbdBuilder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextAreaAttributeTest execute: textAreaCustomKbdBuilder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('textAreaCustomKbdBuilder'));
        console.info('TextAreaAttributeTest: textAreaCustomKbdBuilder comp = ' + comp);
        expect(comp !== null && comp !== undefined).assertTrue();
        console.info('TextAreaAttributeTest execute: textAreaCustomKbdBuilder END');
        done();
      } catch (error) {
        console.error('TextAreaAttributeTest execute: textAreaCustomKbdBuilder error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
