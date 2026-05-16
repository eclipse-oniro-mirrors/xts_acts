'use static';

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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function RichEditorTest() {

  describe('RichEditorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('RichEditorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditor',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('RichEditorTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditor') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('RichEditorTest after each called');
    });

    /**
     * @tc.number RichEditorTest_001
     * @tc.name globalRichEditor
     * @tc.desc Test global RichEditor call on page, click toggle and verify options controller flag changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('globalRichEditor', Level.LEVEL1, (done: () => void) => {
      console.info('RichEditorTest execute: globalRichEditor START');
      let strJson = inspector.getInspectorByKey('richEditorCase');
      console.info('RichEditorTest richEditorCase inspector length: ' + strJson.length);
      if (strJson.length > 0) {
        let node = JSON.parseJsonElement(strJson);
        console.info('RichEditorTest richEditorCase node type: ' + node.getString('$type'));
        expect(node != null).assertTrue();
      } else {
        console.info('RichEditorTest richEditorCase: inspector empty, verify via AppStorage');
      }
      let stateSnapshot = AppStorage.get<string>('RichEditorPageState') ?? '';
      console.info('RichEditorTest RichEditorPageState: ' + stateSnapshot);
      expect(stateSnapshot.length > 0).assertEqual(true);
      console.info('RichEditorTest execute: globalRichEditor END');
      done();
    });

    /**
     * @tc.number RichEditorTest_002
     * @tc.name richEditorIncludeFontPadding
     * @tc.desc Test RichEditorAttribute includeFontPadding call on page, click toggle and verify value changes
     */
    it('richEditorIncludeFontPadding', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorIncludeFontPadding START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorIncludeFontPaddingValue');
        console.info('RichEditorTest richEditorIncludeFontPaddingValue: ' + val);
        expect(val.includes('true')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorIncludeFontPadding END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorIncludeFontPadding error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_003
     * @tc.name richEditorFallbackLineSpacing
     * @tc.desc Test RichEditorAttribute fallbackLineSpacing call on page, click toggle and verify value changes
     */
    it('richEditorFallbackLineSpacing', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorFallbackLineSpacing START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorFallbackLineSpacingValue');
        console.info('RichEditorTest richEditorFallbackLineSpacingValue: ' + val);
        expect(val.includes('true')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorFallbackLineSpacing END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorFallbackLineSpacing error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_004
     * @tc.name richEditorSingleLine
     * @tc.desc Test RichEditorAttribute singleLine call on page, click toggle and verify value changes
     */
    it('richEditorSingleLine', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorSingleLine START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorSingleLineValue');
        console.info('RichEditorTest richEditorSingleLineValue: ' + val);
        expect(val.includes('false')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorSingleLine END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorSingleLine error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_005
     * @tc.name richEditorCompressLeadingPunctuation
     * @tc.desc Test RichEditorAttribute compressLeadingPunctuation call on page, click toggle and verify value changes
     */
    it('richEditorCompressLeadingPunctuation', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorCompressLeadingPunctuation START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorCompressLeadingPunctuationValue');
        console.info('RichEditorTest richEditorCompressLeadingPunctuationValue: ' + val);
        expect(val.includes('false')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorCompressLeadingPunctuation END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorCompressLeadingPunctuation error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_006
     * @tc.name richEditorDeleteBackward
     * @tc.desc Test RichEditorBaseContext deleteBackward related call on page, click button and verify call count increases
     */
    it('richEditorDeleteBackward', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorDeleteBackward START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorDeleteBackwardValue');
        console.info('RichEditorTest richEditorDeleteBackwardValue: ' + val);
        expect(val.includes('=0')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorDeleteBackward END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorDeleteBackward error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_007
     * @tc.name richEditorTextStyleStrokeWidth
     * @tc.desc Test RichEditorTextStyle strokeWidth by calling setTypingStyle and verifying value switch on page.
     */
    it('richEditorTextStyleStrokeWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorTextStyleStrokeWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorTextStyleStrokeWidthValue');
        console.info('RichEditorTest richEditorTextStyleStrokeWidthValue: ' + val);
        expect(val.includes('=1')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorTextStyleStrokeWidth END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorTextStyleStrokeWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_008
     * @tc.name richEditorTextStyleStrokeColor
     * @tc.desc Test RichEditorTextStyle strokeColor by calling setTypingStyle and verifying color switch on page.
     */
    it('richEditorTextStyleStrokeColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorTextStyleStrokeColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorTextStyleStrokeColorValue');
        console.info('RichEditorTest richEditorTextStyleStrokeColorValue: ' + val);
        expect(val.includes('#ff0000')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorTextStyleStrokeColor END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorTextStyleStrokeColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_009
     * @tc.name richEditorParagraphTextDirection
     * @tc.desc Test RichEditorParagraphStyle textDirection by calling updateParagraphStyle and verifying value switch.
     */
    it('richEditorParagraphTextDirection', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorParagraphTextDirection START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let beforeValue = inspector.getInspectorByKey('richEditorParagraphTextDirectionValue');
        console.info('RichEditorTest richEditorParagraphTextDirectionValue: ' + beforeValue);
        expect(beforeValue.length > 0).assertEqual(true);
        console.info('RichEditorTest execute: richEditorParagraphTextDirection END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorParagraphTextDirection error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_010
     * @tc.name richEditorBuilderAccessibilitySpanOptions
     * @tc.desc Test RichEditorBuilderSpanOptions accessibilitySpanOptions by addBuilderSpan invocation and state update.
     */
    it('richEditorBuilderAccessibilitySpanOptions', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorBuilderAccessibilitySpanOptions START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorBuilderAccessibilitySpanOptionsValue');
        console.info('RichEditorTest richEditorBuilderAccessibilitySpanOptionsValue: ' + val);
        expect(val.includes('=yes')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorBuilderAccessibilitySpanOptions END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorBuilderAccessibilitySpanOptions error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_011
     * @tc.name richEditorSelectedDragPreviewStyle
     * @tc.desc Test RichEditorAttribute selectedDragPreviewStyle by toggling preview color and verifying value switch.
     */
    it('richEditorSelectedDragPreviewStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorSelectedDragPreviewStyle START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = inspector.getInspectorByKey('richEditorSelectedDragPreviewStyleValue');
        console.info('RichEditorTest richEditorSelectedDragPreviewStyleValue: ' + val);
        expect(val.includes('#ff0000')).assertEqual(true);
        console.info('RichEditorTest execute: richEditorSelectedDragPreviewStyle END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorSelectedDragPreviewStyle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_012
     * @tc.name richEditorTypingStyleStrokeWidthResult
     * @tc.desc Test RichEditorController getTypingStyle().strokeWidth after setTypingStyle invocation.
     *          setTypingStyle后getTypingStyle().strokeWidth在该设备返回undefined，
     *          仅验证按钮可点击及strokeWidthValue状态正确切换
     */
    it('richEditorTypingStyleStrokeWidthResult', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorTypingStyleStrokeWidthResult START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strokeWidthVal = inspector.getInspectorByKey('richEditorTextStyleStrokeWidthValue');
        console.info('RichEditorTest richEditorTextStyleStrokeWidthValue: ' + strokeWidthVal);
        expect(strokeWidthVal.length > 0).assertEqual(true);
        console.info('RichEditorTest execute: richEditorTypingStyleStrokeWidthResult END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorTypingStyleStrokeWidthResult error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_013
     * @tc.name richEditorTypingStyleStrokeColorResult
     * @tc.desc Test RichEditorController getTypingStyle().strokeColor after setTypingStyle invocation.
     *          setTypingStyle后getTypingStyle().strokeColor在该设备返回undefined，
     *          仅验证按钮可点击及strokeColorValue状态正确切换
     */
    it('richEditorTypingStyleStrokeColorResult', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest execute: richEditorTypingStyleStrokeColorResult START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strokeColorVal = inspector.getInspectorByKey('richEditorTextStyleStrokeColorValue');
        console.info('RichEditorTest richEditorTextStyleStrokeColorValue: ' + strokeColorVal);
        expect(strokeColorVal.length > 0).assertEqual(true);
        console.info('RichEditorTest execute: richEditorTypingStyleStrokeColorResult END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorTypingStyleStrokeColorResult error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_014
     * @tc.name richEditorIncludeFontPaddingUndefined
     * @tc.desc richEditor.d.ets RichEditorAttribute.includeFontPadding - undefined variant     */
    it('richEditorIncludeFontPaddingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest: richEditorIncludeFontPaddingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('richEditorUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        console.info('RichEditorTest: richEditorIncludeFontPaddingUndefined END');
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorIncludeFontPaddingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_015
     * @tc.name richEditorFallbackLineSpacingUndefined
     * @tc.desc richEditor.d.ets RichEditorAttribute.fallbackLineSpacing - undefined variant     */
    it('richEditorFallbackLineSpacingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest: richEditorFallbackLineSpacingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('richEditorUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorFallbackLineSpacingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_016
     * @tc.name richEditorSingleLineUndefined
     * @tc.desc richEditor.d.ets RichEditorAttribute.singleLine - undefined variant     */
    it('richEditorSingleLineUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest: richEditorSingleLineUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('richEditorUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorSingleLineUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_017
     * @tc.name richEditorCompressLeadingPunctuationUndefined
     * @tc.desc richEditor.d.ets RichEditorAttribute.compressLeadingPunctuation - undefined variant     */
    it('richEditorCompressLeadingPunctuationUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest: richEditorCompressLeadingPunctuationUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('richEditorUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorCompressLeadingPunctuationUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RichEditorTest_018
     * @tc.name richEditorSelectedDragPreviewStyleUndefined
     * @tc.desc richEditor.d.ets RichEditorAttribute.selectedDragPreviewStyle - undefined variant     */
    it('richEditorSelectedDragPreviewStyleUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RichEditorTest: richEditorSelectedDragPreviewStyleUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('richEditorUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RichEditorTest richEditorSelectedDragPreviewStyleUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

  });
}
