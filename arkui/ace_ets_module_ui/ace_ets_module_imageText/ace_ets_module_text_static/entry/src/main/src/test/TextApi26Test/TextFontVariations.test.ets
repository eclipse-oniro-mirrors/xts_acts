'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextFontVariationsTest() {
  describe('TextFontVariationsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextFontVariationsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextFontVariationsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextFontVariations',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextFontVariationsTest state pages:" + JSON.stringify(pages));
        if (!("TextFontVariations" == pages.name)) {
          console.info("get TextFontVariationsTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextFontVariationsTest success ");
        }
      } catch (err) {
        console.error("push TextFontVariationsTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textFontVariations_array_0100
     * @tc.number SUB_ARKUI_TEXT_FONTVARIATIONS_PARAM_0100
     * @tc.desc   Test Text fontVariations property with Array<FontVariation> parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontVariations_array_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textFontVariations_array_0100] START');

      let strJson = inspector.getInspectorByKey('text_fontVariations_array');

      console.info("[textFontVariations_array_0100] fontVariations axis is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('axis'));
      console.info("[textFontVariations_array_0100] fontVariations value is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('value'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('axis')).assertEqual('weight');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('value')).assertEqual('900.000000');
      console.info('[textFontVariations_array_0100] END');
      done();
    })

    /**
     * @tc.name   textFontVariations_multi_0100
     * @tc.number SUB_ARKUI_TEXT_FONTVARIATIONS_PARAM_0200
     * @tc.desc   Test Text fontVariations property with multiple FontVariation axes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontVariations_multi_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textFontVariations_multi_0100] START');

      let strJson = inspector.getInspectorByKey('text_fontVariations_multi');
      
      console.info("[textFontVariations_multi_0100] fontVariations[0] axis is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('axis'));
      console.info("[textFontVariations_multi_0100] fontVariations[0] value is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('value'));
      console.info("[textFontVariations_multi_0100] fontVariations[1] axis is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[1].getString('axis'));
      console.info("[textFontVariations_multi_0100] fontVariations[1] value is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[1].getString('value'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('axis')).assertEqual('weight');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[0].getString('value')).assertEqual('700.000000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[1].getString('axis')).assertEqual('ital');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('fontVariations')[1].getString('value')).assertEqual('1.000000');
      console.info('[textFontVariations_multi_0100] END');
      done();
    })
    /**
     * @tc.name   textFontVariations_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_FONTVARIATIONS_PARAM_0400
     * @tc.desc   Test Text fontVariations property with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontVariations_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textFontVariations_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_fontVariations_default');
    
      let strJson = inspector.getInspectorByKey('text_fontVariations_undefined');
      
      console.info("[textFontVariations_undefined_0100] default fontVariations is: " 
        + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getElement('fontVariations')));
      console.info("[textFontVariations_undefined_0100] undefined fontVariations is: " 
        + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontVariations')));

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontVariations')))
        .assertEqual(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getElement('fontVariations')));
      console.info('[textFontVariations_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textFontVariations_empty_0100
     * @tc.number SUB_ARKUI_TEXT_FONTVARIATIONS_PARAM_0500
     * @tc.desc   Test Text fontVariations property with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontVariations_empty_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textFontVariations_empty_0100] START');
      let strJsonCompare = inspector.getInspectorByKey('text_fontVariations_default');
      
      let strJson = inspector.getInspectorByKey('text_fontVariations_empty');

      console.info("[textFontVariations_empty_0100] fontVariations is: " 
        + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontVariations')));
      console.info("[textFontVariations_empty_0100] default fontVariations is: " 
        + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getElement('fontVariations')));

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontVariations')))
        .assertEqual(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getElement('fontVariations')));
      console.info('[textFontVariations_empty_0100] END');
      done();
    })

  })
}