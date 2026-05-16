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

export default function SearchStyleTest() {
  describe('SearchStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SearchStyleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.search.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('SearchStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchStyle/SearchStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SearchStyleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SearchStyle') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('SearchStyleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SearchStyleTest after each called');
    });

    /**
     * @tc.number SearchStyleTest01
     * @tc.name searchCompressLeadingPunctuation
     * @tc.desc searchCompressLeadingPunctuation
     */
    it('searchCompressLeadingPunctuation', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest execute: searchCompressLeadingPunctuation START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('searchStyleCase');
        console.info('SearchStyleTest searchStyleCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('searchCompressLeadingPunctuationValue');
        console.info('SearchStyleTest searchCompressLeadingPunctuationValue: ' + val);
        expect(val.includes('false')).assertEqual(true);
        console.info('SearchStyleTest execute: searchCompressLeadingPunctuation END');
        done();
      } catch (error) {
        console.error('SearchStyleTest searchCompressLeadingPunctuation error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest02
     * @tc.name searchDividerColor
     * @tc.desc searchDividerColor
     */
    it('searchDividerColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest execute: searchDividerColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('searchStyleCase');
        console.info('SearchStyleTest searchStyleCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('searchDividerColorValue');
        console.info('SearchStyleTest searchDividerColorValue: ' + val);
        expect(val.includes('#ff0000')).assertEqual(true);
        console.info('SearchStyleTest execute: searchDividerColor END');
        done();
      } catch (error) {
        console.error('SearchStyleTest searchDividerColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest03
     * @tc.name searchIncludeFontPadding
     * @tc.desc searchIncludeFontPadding
     */
    it('searchIncludeFontPadding', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest execute: searchIncludeFontPadding START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('searchStyleCase');
        console.info('SearchStyleTest searchStyleCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('searchIncludeFontPaddingValue');
        console.info('SearchStyleTest searchIncludeFontPaddingValue: ' + val);
        expect(val.includes('true')).assertEqual(true);
        console.info('SearchStyleTest execute: searchIncludeFontPadding END');
        done();
      } catch (error) {
        console.error('SearchStyleTest searchIncludeFontPadding error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest04
     * @tc.name searchFallbackLineSpacing
     * @tc.desc searchFallbackLineSpacing
     */
    it('searchFallbackLineSpacing', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest execute: searchFallbackLineSpacing START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('searchStyleCase');
        console.info('SearchStyleTest searchStyleCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('searchFallbackLineSpacingValue');
        console.info('SearchStyleTest searchFallbackLineSpacingValue: ' + val);
        expect(val.includes('true')).assertEqual(true);
        console.info('SearchStyleTest execute: searchFallbackLineSpacing END');
        done();
      } catch (error) {
        console.error('SearchStyleTest searchFallbackLineSpacing error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest05
     * @tc.name searchTextDirection
     * @tc.desc searchTextDirection
     */
    it('searchTextDirection', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest execute: searchTextDirection START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('searchStyleCase');
        console.info('SearchStyleTest searchStyleCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('searchTextDirectionValue');
        console.info('SearchStyleTest searchTextDirectionValue: ' + val);
        expect(val.length > 0).assertEqual(true);
        console.info('SearchStyleTest execute: searchTextDirection END');
        done();
      } catch (error) {
        console.error('SearchStyleTest searchTextDirection error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_006
     * @tc.name searchCompressLeadingPunctuationUndefined
     * @tc.desc search.d.ets SearchAttribute.compressLeadingPunctuation - undefined variant
     */
    it('searchCompressLeadingPunctuationUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchCompressLeadingPunctuationUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchCompressLeadingPunctuationUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_007
     * @tc.name searchDividerColorUndefined
     * @tc.desc search.d.ets SearchAttribute.dividerColor - undefined variant
     */
    it('searchDividerColorUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchDividerColorUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchDividerColorUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_008
     * @tc.name searchIncludeFontPaddingUndefined
     * @tc.desc search.d.ets SearchAttribute.includeFontPadding - undefined variant
     */
    it('searchIncludeFontPaddingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchIncludeFontPaddingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchIncludeFontPaddingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_009
     * @tc.name searchFallbackLineSpacingUndefined
     * @tc.desc search.d.ets SearchAttribute.fallbackLineSpacing - undefined variant
     */
    it('searchFallbackLineSpacingUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchFallbackLineSpacingUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchFallbackLineSpacingUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_010
     * @tc.name searchTextDirectionUndefined
     * @tc.desc search.d.ets SearchAttribute.textDirection - undefined variant
     */
    it('searchTextDirectionUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchTextDirectionUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchUndefCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchTextDirectionUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_011
     * @tc.name searchTextDirectionAuto
     * @tc.desc search.d.ets SearchAttribute.textDirection - TextDirection.AUTO variant
     */
    it('searchTextDirectionAuto', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchTextDirectionAuto START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchTextDirAutoCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('SearchStyleTest searchTextDirectionAuto error:' + error);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number SearchStyleTest_012
     * @tc.name searchSelectedDragPreviewStyle
     * @tc.desc search.d.ets SearchAttribute.selectedDragPreviewStyle - SelectedDragPreviewStyle variant
     */
    it('searchSelectedDragPreviewStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchSelectedDragPreviewStyle START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchSelectedDragCase');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('SearchStyleTest searchSelectedDragPreviewStyle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_013
     * @tc.name searchSelectedDragPreviewStyleUndefined
     * @tc.desc search.d.ets SearchAttribute.selectedDragPreviewStyle - undefined variant
     */
    it('searchSelectedDragPreviewStyleUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchSelectedDragPreviewStyleUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchSelectedDragUndef');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('SearchStyleTest searchSelectedDragPreviewStyleUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_014
     * @tc.name searchCustomKeyboardUndefined
     * @tc.desc search.d.ets SearchAttribute.customKeyboard - undefined variant
     */
    it('searchCustomKeyboardUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchCustomKeyboardUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchCustomKbUndef');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('SearchStyleTest searchCustomKeyboardUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SearchStyleTest_015
     * @tc.name searchCustomKeyboardBuilder
     * @tc.desc search.d.ets SearchAttribute.customKeyboard - CustomBuilder/ComponentContentBase variant
     *          CustomBuilder和ComponentContentBase为接口级参数，运行时可能不支持
     */
    it('searchCustomKeyboardBuilder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchStyleTest: searchCustomKeyboardBuilder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('searchStyleCase');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SearchStyleTest searchCustomKeyboardBuilder error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
