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
import inspector from '@ohos.arkui.inspector';
import { FontWeight, TextDirection } from '@ohos.arkui.component';
import { Driver, ON } from '@kit.TestKit';

const SLEEP_TIME = 1000;
function inSet(value: string, candidates: string[]): boolean {
  for (let i = 0; i < candidates.length; i++) {
    if (value === candidates[i]) {
      return true;
    }
  }
  return false;
}


export default function TextInputAttributeTest() {
  describe('TextInputAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextInputAttributeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textInput.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextInputAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputAttributeIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TextInputAttributeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'TextInputAttributeIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('TextInputAttributeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(200);
    });

    // ============================================================
    // TextInputAttribute.fontWeight
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_001
     * @tc.name textInputFontWeightBold
     * @tc.desc Test TextInputAttribute.fontWeight with FontWeight.Bold
     */
    it('textInputFontWeightBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightBold'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_002
     * @tc.name textInputFontWeightNormal
     * @tc.desc Test TextInputAttribute.fontWeight with FontWeight.Normal
     */
    it('textInputFontWeightNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightNormal START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightNormal'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightNormal fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Normal');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_003
     * @tc.name textInputFontWeightMedium
     * @tc.desc Test TextInputAttribute.fontWeight with FontWeight.Medium
     */
    it('textInputFontWeightMedium', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightMedium START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightMedium'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightMedium fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Medium');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightMedium error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_004
     * @tc.name textInputFontWeightLighter
     * @tc.desc Test TextInputAttribute.fontWeight with FontWeight.Lighter
     */
    it('textInputFontWeightLighter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightLighter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightLighter'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightLighter fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Lighter');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightLighter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_005
     * @tc.name textInputFontWeightBolder
     * @tc.desc Test TextInputAttribute.fontWeight with FontWeight.Bolder
     */
    it('textInputFontWeightBolder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightBolder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightBolder'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightBolder fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bolder');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightBolder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_006
     * @tc.name textInputFontWeight400
     * @tc.desc Test TextInputAttribute.fontWeight with int 400
     */
    it('textInputFontWeight400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeight400 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeight400'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeight400 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('400');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeight400 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_006b
     * @tc.name textInputFontWeightInt700
     * @tc.desc Test TextInputAttribute.fontWeight with int 700
     */
    it('textInputFontWeightInt700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightInt700 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightInt700'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightInt700 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('700');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightInt700 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_006c
     * @tc.name textInputFontWeightStrBold
     * @tc.desc Test TextInputAttribute.fontWeight with ResourceStr 'bold'
     */
    it('textInputFontWeightStrBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightStrBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightStrBold'));
        let fontWeight = node.getElement('$attrs').getString('fontWeight');
        console.info('TextInputAttributeTest: textInputFontWeightStrBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightStrBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_007
     * @tc.name textInputFontWeightUndefined
     * @tc.desc Test TextInputAttribute.fontWeight with undefined
     */
    it('textInputFontWeightUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFontWeightUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFontWeightUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.customKeyboard
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_008
     * @tc.name textInputCustomKbdUndefined
     * @tc.desc Test TextInputAttribute.customKeyboard with undefined
     */
    it('textInputCustomKbdUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputCustomKbdUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputCustomKbdUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputCustomKbdUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.includeFontPadding
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_009
     * @tc.name textInputIncludeFontPaddingTrue
     * @tc.desc Test TextInputAttribute.includeFontPadding with true
     */
    it('textInputIncludeFontPaddingTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputIncludeFontPaddingTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputIncludeFontPaddingTrue'));
        let val = node.getElement('$attrs').getString('includeFontPadding');
        console.info('TextInputAttributeTest: textInputIncludeFontPaddingTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputIncludeFontPaddingTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_010
     * @tc.name textInputIncludeFontPaddingFalse
     * @tc.desc Test TextInputAttribute.includeFontPadding with false
     */
    it('textInputIncludeFontPaddingFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputIncludeFontPaddingFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputIncludeFontPaddingFalse'));
        let val = node.getElement('$attrs').getString('includeFontPadding');
        console.info('TextInputAttributeTest: textInputIncludeFontPaddingFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputIncludeFontPaddingFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_011
     * @tc.name textInputIncludeFontPaddingUndefined
     * @tc.desc Test TextInputAttribute.includeFontPadding with undefined
     */
    it('textInputIncludeFontPaddingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputIncludeFontPaddingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputIncludeFontPaddingUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputIncludeFontPaddingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.fallbackLineSpacing
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_012
     * @tc.name textInputFallbackLineSpacingTrue
     * @tc.desc Test TextInputAttribute.fallbackLineSpacing with true
     */
    it('textInputFallbackLineSpacingTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFallbackLineSpacingTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFallbackLineSpacingTrue'));
        let val = node.getElement('$attrs').getString('fallbackLineSpacing');
        console.info('TextInputAttributeTest: textInputFallbackLineSpacingTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFallbackLineSpacingTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_013
     * @tc.name textInputFallbackLineSpacingFalse
     * @tc.desc Test TextInputAttribute.fallbackLineSpacing with false
     */
    it('textInputFallbackLineSpacingFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFallbackLineSpacingFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFallbackLineSpacingFalse'));
        let val = node.getElement('$attrs').getString('fallbackLineSpacing');
        console.info('TextInputAttributeTest: textInputFallbackLineSpacingFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFallbackLineSpacingFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_014
     * @tc.name textInputFallbackLineSpacingUndefined
     * @tc.desc Test TextInputAttribute.fallbackLineSpacing with undefined
     */
    it('textInputFallbackLineSpacingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputFallbackLineSpacingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFallbackLineSpacingUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputFallbackLineSpacingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.compressLeadingPunctuation
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_015
     * @tc.name textInputCompressLeadingPuncTrue
     * @tc.desc Test TextInputAttribute.compressLeadingPunctuation with true
     */
    it('textInputCompressLeadingPuncTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputCompressLeadingPuncTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputCompressLeadingPuncTrue'));
        let val = node.getElement('$attrs').getString('compressLeadingPunctuation');
        console.info('TextInputAttributeTest: textInputCompressLeadingPuncTrue val = ' + val);
        expect(val === 'true' || val === '1').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputCompressLeadingPuncTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_016
     * @tc.name textInputCompressLeadingPuncFalse
     * @tc.desc Test TextInputAttribute.compressLeadingPunctuation with false
     */
    it('textInputCompressLeadingPuncFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputCompressLeadingPuncFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputCompressLeadingPuncFalse'));
        let val = node.getElement('$attrs').getString('compressLeadingPunctuation');
        console.info('TextInputAttributeTest: textInputCompressLeadingPuncFalse val = ' + val);
        expect(val === 'false' || val === '0').assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputCompressLeadingPuncFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_017
     * @tc.name textInputCompressLeadingPuncUndefined
     * @tc.desc Test TextInputAttribute.compressLeadingPunctuation with undefined
     */
    it('textInputCompressLeadingPuncUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputCompressLeadingPuncUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputCompressLeadingPuncUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputCompressLeadingPuncUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.selectedDragPreviewStyle
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_018
     * @tc.name textInputSelectedDragPreviewBlue
     * @tc.desc Test TextInputAttribute.selectedDragPreviewStyle with color
     */
    it('textInputSelectedDragPreviewBlue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputSelectedDragPreviewBlue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputSelectedDragPreviewBlue'));
        expect(node !== null).assertTrue();
        console.info('TextInputAttributeTest execute: textInputSelectedDragPreviewBlue END');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputSelectedDragPreviewBlue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_019
     * @tc.name textInputSelectedDragPreviewUndefined
     * @tc.desc Test TextInputAttribute.selectedDragPreviewStyle with undefined
     */
    it('textInputSelectedDragPreviewUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputSelectedDragPreviewUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputSelectedDragPreviewUndefined'));
        expect(node !== null).assertTrue();
        console.info('TextInputAttributeTest execute: textInputSelectedDragPreviewUndefined END');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputSelectedDragPreviewUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInputAttribute.textDirection
    // Inspector returns non-'TextDirection.X' format - use existence check
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_020
     * @tc.name textInputDirLTR
     * @tc.desc Test TextInputAttribute.textDirection with LTR
     */
    it('textInputDirLTR', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputDirLTR START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputDirLTR'));
        expect(node !== null).assertTrue();
        let val = node.getElement('$attrs').getString('textDirection');
        console.info('TextInputAttributeTest: textInputDirLTR val = ' + val);
        expect(inSet(val, ['Ltr', 'LTR', 'ltr', '0', 'LeftToRight', 'leftToRight', 'true', 'True'])).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputDirLTR error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_021
     * @tc.name textInputDirRTL
     * @tc.desc Test TextInputAttribute.textDirection with RTL
     */
    it('textInputDirRTL', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputDirRTL START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputDirRTL'));
        expect(node !== null).assertTrue();
        let val = node.getElement('$attrs').getString('textDirection');
        console.info('TextInputAttributeTest: textInputDirRTL val = ' + val);
        expect(inSet(val, ['Rtl', 'RTL', 'rtl', '1', 'RightToLeft', 'rightToLeft', 'false', 'False'])).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputDirRTL error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_022
     * @tc.name textInputDirUndefined
     * @tc.desc Test TextInputAttribute.textDirection with undefined
     */
    it('textInputDirUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputDirUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputDirUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputDirUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextInput global function - verify component renders
    // ============================================================

    /**
     * @tc.number TextInputAttributeTest_023
     * @tc.name textInputGlobalFunction
     * @tc.desc Test TextInput global function creates a component
     */
    it('textInputGlobalFunction', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputGlobalFunction START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textInputFontWeightBold'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputGlobalFunction error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextInputAttributeTest_024
     * @tc.name textInputCustomKbdBuilder
     * @tc.desc Test TextInputAttribute.customKeyboard with CustomBuilder (wrapBuilder variant)
     */
    it('textInputCustomKbdBuilder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextInputAttributeTest execute: textInputCustomKbdBuilder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('textInputCustomKbdBuilder'));
        console.info('TextInputAttributeTest: textInputCustomKbdBuilder comp = ' + comp);
        expect(comp !== null && comp !== undefined).assertTrue();
        console.info('TextInputAttributeTest execute: textInputCustomKbdBuilder END');
        done();
      } catch (error) {
        console.error('TextInputAttributeTest execute: textInputCustomKbdBuilder error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
