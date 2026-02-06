/**
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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextAreaSpecialAttrsTest() {
  describe('TextAreaSpecialAttrsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DataPanelCloseEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaSpecialAttrs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DataPanelCloseEffectTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaSpecialAttrs" == pages.name)) {
          console.info("get DataPanelCloseEffectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DataPanelCloseEffectTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanelCloseEffectTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   textAreaEnablePreviewText_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEPREVIEWTEXT_0100
     * @tc.desc   Test TextArea enablePreviewText property with null, should revert to default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaEnablePreviewText_0100', Level.LEVEL0, async () => {
      console.info('[textAreaEnablePreviewText_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_enablePreviewText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaEnablePreviewText_0100] obj is: " + JSON.stringify(obj.$attrs.enablePreviewText));
      expect(obj.$attrs.enablePreviewText).assertEqual(true);
      console.info('[textAreaEnablePreviewText_0100] END');
    });

    /**
     * @tc.name   textAreaEnablePreviewText_0200
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEPREVIEWTEXT_0200
     * @tc.desc   Test TextArea enablePreviewText property with undefined, should revert to default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaEnablePreviewText_0200', Level.LEVEL0, async () => {
      console.info('[textAreaEnablePreviewText_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_enablePreviewText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaEnablePreviewText_0200] obj is: " + JSON.stringify(obj.$attrs.enablePreviewText));
      expect(obj.$attrs.enablePreviewText).assertEqual(true);
      console.info('[textAreaEnablePreviewText_0200] END');
    });

    /**
     * @tc.name   textAreaFontColor_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTCOLOR_0100
     * @tc.desc   Test TextArea fontColor property with null, should revert to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontColor_0100', Level.LEVEL0, async () => {
      console.info('[textAreaFontColor_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_fontColor_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontColor_0100] obj is: " + JSON.stringify(obj.$attrs.fontColor));
      let strJson2: string = getInspectorByKey('key_textArea_fontColor_null');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[textAreaFontColor_0100] obj2 is: " + JSON.stringify(obj2.$attrs.fontColor));
      // Default font color from system theme
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info('[textAreaFontColor_0100] END');
    });

    /**
     * @tc.name   textAreaFontColor_0200
     * @tc.number SUB_ARKUI_TEXTAREA_FONTCOLOR_0200
     * @tc.desc   Test TextArea fontColor property with undefined, should revert to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontColor_0200', Level.LEVEL0, async () => {
      console.info('[textAreaFontColor_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_fontColor_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontColor_0100] obj is: " + JSON.stringify(obj.$attrs.fontColor));
      let strJson2: string = getInspectorByKey('key_textArea_fontColor_undefined');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[textAreaFontColor_0200] obj2 is: " + JSON.stringify(obj2.$attrs.fontColor));
      // Default font color from system theme
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info('[textAreaFontColor_0200] END');
    });

    /**
     * @tc.name   textAreaFontColor_0300
     * @tc.number SUB_ARKUI_TEXTAREA_FONTCOLOR_0300
     * @tc.desc   Test TextArea fontColor property with empty string, should handle gracefully
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontColor_0300', Level.LEVEL0, async () => {
      console.info('[textAreaFontColor_0300] START');
      let strJson: string = getInspectorByKey('key_textArea_fontColor_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontColor_0100] obj is: " + JSON.stringify(obj.$attrs.fontColor));
      let strJson2: string = getInspectorByKey('key_textArea_fontColor_emptyString');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[textAreaFontColor_0300] obj2 is: " + JSON.stringify(obj2.$attrs.fontColor));
      // Empty string should be handled gracefully
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info('[textAreaFontColor_0300] END');
    });

    /**
     * @tc.name   textAreaFontSize_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTSIZE_0100
     * @tc.desc   Test TextArea fontSize property with null, should revert to default value 16fp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontSize_0100', Level.LEVEL0, async () => {
      console.info('[textAreaFontSize_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontSize_0100] obj is: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[textAreaFontSize_0100] END');
    });

    /**
     * @tc.name   textAreaFontSize_0200
     * @tc.number SUB_ARKUI_TEXTAREA_FONTSIZE_0200
     * @tc.desc   Test TextArea fontSize property with undefined, should revert to default value 16fp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontSize_0200', Level.LEVEL0, async () => {
      console.info('[textAreaFontSize_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontSize_0200] obj is: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[textAreaFontSize_0200] END');
    });

    /**
     * @tc.name   textAreaFontSize_0300
     * @tc.number SUB_ARKUI_TEXTAREA_FONTSIZE_0300
     * @tc.desc   Test TextArea fontSize property with empty string, should handle gracefully or use default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontSize_0300', Level.LEVEL0, async () => {
      console.info('[textAreaFontSize_0300] START');
      let strJson: string = getInspectorByKey('key_textArea_fontSize_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontSize_0300] obj is: " + JSON.stringify(obj.$attrs.fontSize));
      // Empty string should revert to default value
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[textAreaFontSize_0300] END');
    });

    /**
     * @tc.name   textAreaFontWeight_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTWEIGHT_0100
     * @tc.desc   Test TextArea fontWeight property with null, should revert to default value FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontWeight_0100', Level.LEVEL0, async () => {
      console.info('[textAreaFontWeight_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontWeight_0100] obj is: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textAreaFontWeight_0100] END');
    });

    /**
     * @tc.name   textAreaFontWeight_0200
     * @tc.number SUB_ARKUI_TEXTAREA_FONTWEIGHT_0200
     * @tc.desc   Test TextArea fontWeight property with undefined, should revert to default value FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontWeight_0200', Level.LEVEL0, async () => {
      console.info('[textAreaFontWeight_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontWeight_0200] obj is: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textAreaFontWeight_0200] END');
    });

    /**
     * @tc.name   textAreaFontWeight_0300
     * @tc.number SUB_ARKUI_TEXTAREA_FONTWEIGHT_0300
     * @tc.desc   Test TextArea fontWeight property with empty string, should handle gracefully or use default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaFontWeight_0300', Level.LEVEL0, async () => {
      console.info('[textAreaFontWeight_0300] START');
      let strJson: string = getInspectorByKey('key_textArea_fontWeight_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaFontWeight_0300] obj is: " + JSON.stringify(obj.$attrs.fontWeight));
      // Empty string should revert to default value
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textAreaFontWeight_0300] END');
    });

    /**
     * @tc.name   textAreaEnableKeyboardOnFocus_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEKEYBOARDONFOCUS_0100
     * @tc.desc   Test TextArea enableKeyboardOnFocus property with null, should revert to default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaEnableKeyboardOnFocus_0100', Level.LEVEL0, async () => {
      console.info('[textAreaEnableKeyboardOnFocus_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_enableKeyboardOnFocus_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strJson2: string = getInspectorByKey('key_textArea_enableKeyboardOnFocus_null');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[textAreaEnableKeyboardOnFocus_0100] obj is: " + JSON.stringify(obj.$attrs.enableKeyboardOnFocus));
      console.info("[textAreaEnableKeyboardOnFocus_0100] obj2 is: " + JSON.stringify(obj2.$attrs.enableKeyboardOnFocus));
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual(obj2.$attrs.enableKeyboardOnFocus);
      console.info('[textAreaEnableKeyboardOnFocus_0100] END');
    });

    /**
     * @tc.name   textAreaEnableKeyboardOnFocus_0200
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEKEYBOARDONFOCUS_0200
     * @tc.desc   Test TextArea enableKeyboardOnFocus property with undefined, should revert to default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaEnableKeyboardOnFocus_0200', Level.LEVEL0, async () => {
      console.info('[textAreaEnableKeyboardOnFocus_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_enableKeyboardOnFocus_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaEnableKeyboardOnFocus_0200] obj is: " + JSON.stringify(obj.$attrs.enableKeyboardOnFocus));
      let strJson2: string = getInspectorByKey('key_textArea_enableKeyboardOnFocus_undefined');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[textAreaEnableKeyboardOnFocus_0200] obj2 is: " + JSON.stringify(obj2.$attrs.enableKeyboardOnFocus));
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual(obj2.$attrs.enableKeyboardOnFocus);
      console.info('[textAreaEnableKeyboardOnFocus_0200] END');
    });

    /**
     * @tc.name   textAreaType_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TYPE_0100
     * @tc.desc   Test TextArea type property with null, should revert to default value TextAreaType.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaType_0100', Level.LEVEL0, async () => {
      console.info('[textAreaType_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_type_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaType_0100] obj is: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[textAreaType_0100] END');
    });

    /**
     * @tc.name   textAreaType_0200
     * @tc.number SUB_ARKUI_TEXTAREA_TYPE_0200
     * @tc.desc   Test TextArea type property with undefined, should revert to default value TextAreaType.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaType_0200', Level.LEVEL0, async () => {
      console.info('[textAreaType_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_type_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaType_0200] obj is: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[textAreaType_0200] END');
    });
  })
}
