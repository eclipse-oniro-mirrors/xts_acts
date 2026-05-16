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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextSpecialOptionsNullTest() {
  describe('TextSpecialOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSpecialOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextSpecialOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSpecialOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextSpecialOptionsNull" == pages.name)) {
          console.info("get TextSpecialOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSpecialOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSpecialOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== dataDetectorConfig 属性测试 ====================

    /**
     * @tc.name   textDataDetectorConfigNull_0100
     * @tc.number SUB_ARKUI_TEXT_DATADETECTORCONFIG_NULL_PARAM_001
     * @tc.desc   Test Text dataDetectorConfig property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textDataDetectorConfigNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textDataDetectorConfigNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_dataDetectorConfig_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.dataDetectorConfig).assertEqual(objDefault.$attrs.dataDetectorConfig);
      
      console.info('TextSpecialOptionsNullTest', 'textDataDetectorConfigNull_0100 END');
    });

    /**
     * @tc.name   textDataDetectorConfigUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_DATADETECTORCONFIG_UNDEFINED_PARAM_001
     * @tc.desc   Test Text dataDetectorConfig property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textDataDetectorConfigUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textDataDetectorConfigUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_dataDetectorConfig_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.dataDetectorConfig).assertEqual(objDefault.$attrs.dataDetectorConfig);
      console.info('TextSpecialOptionsNullTest', 'textDataDetectorConfigUndefined_0100 END');
    });

    // ==================== enableSelectedDataDetector 属性测试 ====================

    /**
     * @tc.name   textEnableSelectedDataDetectorNull_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_NULL_PARAM_001
     * @tc.desc   Test Text enableSelectedDataDetector property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableSelectedDataDetectorNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textEnableSelectedDataDetectorNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableSelectedDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objDefault.$attrs.enableSelectedDataDetector);
      
      console.info('TextSpecialOptionsNullTest', 'textEnableSelectedDataDetectorNull_0100 END');
    });

    /**
     * @tc.name   textEnableSelectedDataDetectorUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_UNDEFINED_PARAM_001
     * @tc.desc   Test Text enableSelectedDataDetector property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableSelectedDataDetectorUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textEnableSelectedDataDetectorUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableSelectedDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objDefault.$attrs.enableSelectedDataDetector);
      
      console.info('TextSpecialOptionsNullTest', 'textEnableSelectedDataDetectorUndefined_0100 END');
    });

    // ==================== textSelectable 属性测试 ====================

    /**
     * @tc.name   textTextSelectableNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTSELECTABLE_NULL_PARAM_001
     * @tc.desc   Test Text textSelectable property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextSelectableNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textTextSelectableNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_textSelectable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.textSelectable).assertEqual(objDefault.$attrs.textSelectable);
      
      console.info('TextSpecialOptionsNullTest', 'textTextSelectableNull_0100 END');
    });

    /**
     * @tc.name   textTextSelectableUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTSELECTABLE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text textSelectable property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextSelectableUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textTextSelectableUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_textSelectable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.textSelectable).assertEqual(objDefault.$attrs.textSelectable);
      
      console.info('TextSpecialOptionsNullTest', 'textTextSelectableUndefined_0100 END');
    });

    // ==================== marqueeOptions 属性测试 ====================

    /**
     * @tc.name   textMarqueeOptionsNull_0100
     * @tc.number SUB_ARKUI_TEXT_MARQUEEOPTIONS_NULL_PARAM_001
     * @tc.desc   Test Text marqueeOptions property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMarqueeOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textMarqueeOptionsNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_marqueeOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.marqueeOptions).assertEqual(objDefault.$attrs.marqueeOptions);
      console.info('TextSpecialOptionsNullTest', 'textMarqueeOptionsNull_0100 END');
    });

    /**
     * @tc.name   textMarqueeOptionsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_MARQUEEOPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test Text marqueeOptions property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMarqueeOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textMarqueeOptionsUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_marqueeOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.marqueeOptions).assertEqual(objDefault.$attrs.marqueeOptions);
      console.info('TextSpecialOptionsNullTest', 'textMarqueeOptionsUndefined_0100 END');
    });

    // ==================== editMenuOptions 属性测试 ====================

    /**
     * @tc.name   textEditMenuOptionsNull_0100
     * @tc.number SUB_ARKUI_TEXT_EDITMENUOPTIONS_NULL_PARAM_001
     * @tc.desc   Test Text editMenuOptions property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEditMenuOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textEditMenuOptionsNull_0100 START');
      
      let strJson: string = getInspectorByKey('text_editMenuOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.editMenuOptions).assertUndefined();
      
      console.info('TextSpecialOptionsNullTest', 'textEditMenuOptionsNull_0100 END');
    });

    /**
     * @tc.name   textEditMenuOptionsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_EDITMENUOPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test Text editMenuOptions property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEditMenuOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialOptionsNullTest', 'textEditMenuOptionsUndefined_0100 START');
      
      let strJson: string = getInspectorByKey('text_editMenuOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.editMenuOptions).assertUndefined();
      
      console.info('TextSpecialOptionsNullTest', 'textEditMenuOptionsUndefined_0100 END');
    });
  });
}
