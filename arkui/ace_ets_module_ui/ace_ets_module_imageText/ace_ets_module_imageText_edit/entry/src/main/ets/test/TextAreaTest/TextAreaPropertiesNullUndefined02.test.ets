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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';

export default function TextAreaPropertiesNullUndefined02Test() {
  describe('TextAreaPropertiesNullUndefined02Test', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextArea/TextAreaPropertiesNullUndefined02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaPropertiesNullUndefined02Test state success " + JSON.stringify(pages));
        if (!("TextAreaPropertiesNullUndefined02" == pages.name)) {
          console.info("get TextAreaPropertiesNullUndefined02Test state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextAreaPropertiesNullUndefined02Test page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaPropertiesNullUndefined02Test page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextAreaPropertiesNullUndefined02Test after each called");
    });

    /**
     * @tc.name   textAreaMinLines_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINLINES_NULL_0100
     * @tc.desc   Test TextArea minLines property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinLines_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinLines_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minLines_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minLines_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinLines_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinLines_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinLines_null_0100] default minLines is: " + objCompare.$attrs.minLines);
      console.info("[textAreaMinLines_null_0100] null minLines is: " + obj.$attrs.minLines);

      // null 应该恢复为默认值
      expect(obj.$attrs.minLines).assertEqual(objCompare.$attrs.minLines);
      console.info('[textAreaMinLines_null_0100] END');
    })

    /**
     * @tc.name   textAreaMinLines_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINLINES_UNDEFINED_0100
     * @tc.desc   Test TextArea minLines property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinLines_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinLines_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minLines_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minLines_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinLines_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinLines_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinLines_undefined_0100] default minLines is: " + objCompare.$attrs.minLines);
      console.info("[textAreaMinLines_undefined_0100] undefined minLines is: " + obj.$attrs.minLines);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minLines).assertEqual(objCompare.$attrs.minLines);
      console.info('[textAreaMinLines_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaWordBreak_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_WORDBREAK_NULL_0100
     * @tc.desc   Test TextArea wordBreak property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaWordBreak_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaWordBreak_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_wordBreak_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_wordBreak_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaWordBreak_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaWordBreak_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaWordBreak_null_0100] default wordBreak is: " + objCompare.$attrs.wordBreak);
      console.info("[textAreaWordBreak_null_0100] null wordBreak is: " + obj.$attrs.wordBreak);

      // null 应该恢复为默认值
      expect(obj.$attrs.wordBreak).assertEqual(objCompare.$attrs.wordBreak);
      console.info('[textAreaWordBreak_null_0100] END');
    })

    /**
     * @tc.name   textAreaWordBreak_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_WORDBREAK_UNDEFINED_0100
     * @tc.desc   Test TextArea wordBreak property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaWordBreak_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaWordBreak_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_wordBreak_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_wordBreak_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaWordBreak_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaWordBreak_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaWordBreak_undefined_0100] default wordBreak is: " + objCompare.$attrs.wordBreak);
      console.info("[textAreaWordBreak_undefined_0100] undefined wordBreak is: " + obj.$attrs.wordBreak);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.wordBreak).assertEqual(objCompare.$attrs.wordBreak);
      console.info('[textAreaWordBreak_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaLineBreakStrategy_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINEBREAKSTRATEGY_NULL_0100
     * @tc.desc   Test TextArea lineBreakStrategy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineBreakStrategy_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineBreakStrategy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineBreakStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineBreakStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineBreakStrategy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineBreakStrategy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineBreakStrategy_null_0100] default lineBreakStrategy is: " + objCompare.$attrs.lineBreakStrategy);
      console.info("[textAreaLineBreakStrategy_null_0100] null lineBreakStrategy is: " + obj.$attrs.lineBreakStrategy);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objCompare.$attrs.lineBreakStrategy);
      console.info('[textAreaLineBreakStrategy_null_0100] END');
    })

    /**
     * @tc.name   textAreaLineBreakStrategy_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINEBREAKSTRATEGY_UNDEFINED_0100
     * @tc.desc   Test TextArea lineBreakStrategy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineBreakStrategy_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineBreakStrategy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineBreakStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineBreakStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineBreakStrategy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineBreakStrategy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineBreakStrategy_undefined_0100] default lineBreakStrategy is: " + objCompare.$attrs.lineBreakStrategy);
      console.info("[textAreaLineBreakStrategy_undefined_0100] undefined lineBreakStrategy is: " + obj.$attrs.lineBreakStrategy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objCompare.$attrs.lineBreakStrategy);
      console.info('[textAreaLineBreakStrategy_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaDecoration_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_NULL_0100
     * @tc.desc   Test TextArea decoration property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaDecoration_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecoration_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_decoration_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecoration_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaDecoration_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecoration_null_0100] default decoration is: " + objCompare.$attrs.decoration);
      console.info("[textAreaDecoration_null_0100] null decoration is: " + obj.$attrs.decoration);

      // null 应该恢复为默认值
      expect(obj.$attrs.decoration).assertEqual(objCompare.$attrs.decoration);
      console.info('[textAreaDecoration_null_0100] END');
    })

    /**
     * @tc.name   textAreaDecoration_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_UNDEFINED_0100
     * @tc.desc   Test TextArea decoration property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaDecoration_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecoration_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_decoration_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecoration_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaDecoration_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecoration_undefined_0100] default decoration is: " + objCompare.$attrs.decoration);
      console.info("[textAreaDecoration_undefined_0100] undefined decoration is: " + obj.$attrs.decoration);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.decoration).assertEqual(objCompare.$attrs.decoration);
      console.info('[textAreaDecoration_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaLineSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINESPACING_NULL_0100
     * @tc.desc   Test TextArea lineSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineSpacing_null_0100] default lineSpacing is: " + objCompare.$attrs.lineSpacing);
      console.info("[textAreaLineSpacing_null_0100] null lineSpacing is: " + obj.$attrs.lineSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineSpacing).assertContain('0.00');
      console.info('[textAreaLineSpacing_null_0100] END');
    })

    /**
     * @tc.name   textAreaLineSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINESPACING_UNDEFINED_0100
     * @tc.desc   Test TextArea lineSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineSpacing_undefined_0100] default lineSpacing is: " + objCompare.$attrs.lineSpacing);
      console.info("[textAreaLineSpacing_undefined_0100] undefined lineSpacing is: " + obj.$attrs.lineSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineSpacing).assertContain('0.00');
      console.info('[textAreaLineSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaContentType_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CONTENTTYPE_NULL_0100
     * @tc.desc   Test TextArea contentType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaContentType_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaContentType_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_contentType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_contentType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaContentType_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaContentType_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaContentType_null_0100] default contentType is: " + objCompare.$attrs.contentType);
      console.info("[textAreaContentType_null_0100] null contentType is: " + obj.$attrs.contentType);

      // null 应该恢复为默认值
      expect(obj.$attrs.contentType).assertEqual(objCompare.$attrs.contentType);
      console.info('[textAreaContentType_null_0100] END');
    })

    /**
     * @tc.name   textAreaContentType_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CONTENTTYPE_UNDEFINED_0100
     * @tc.desc   Test TextArea contentType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaContentType_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaContentType_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_contentType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_contentType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaContentType_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaContentType_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaContentType_undefined_0100] default contentType is: " + objCompare.$attrs.contentType);
      console.info("[textAreaContentType_undefined_0100] undefined contentType is: " + obj.$attrs.contentType);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.contentType).assertEqual(objCompare.$attrs.contentType);
      console.info('[textAreaContentType_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_NULL_0100
     * @tc.desc   Test TextArea enableSelectedDataDetector property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableSelectedDataDetector_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableSelectedDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableSelectedDataDetector_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableSelectedDataDetector_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableSelectedDataDetector_null_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[textAreaEnableSelectedDataDetector_null_0100] null enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[textAreaEnableSelectedDataDetector_null_0100] END');
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_UNDEFINED_0100
     * @tc.desc   Test TextArea enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableSelectedDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[textAreaEnableSelectedDataDetector_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaAutoCapitalizationMode_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_AUTOCAPITALIZATIONMODE_NULL_0100
     * @tc.desc   Test TextArea autoCapitalizationMode property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaAutoCapitalizationMode_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaAutoCapitalizationMode_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_autoCapitalizationMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaAutoCapitalizationMode_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaAutoCapitalizationMode_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaAutoCapitalizationMode_null_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[textAreaAutoCapitalizationMode_null_0100] null autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // null 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[textAreaAutoCapitalizationMode_null_0100] END');
    })

    /**
     * @tc.name   textAreaAutoCapitalizationMode_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_AUTOCAPITALIZATIONMODE_UNDEFINED_0100
     * @tc.desc   Test TextArea autoCapitalizationMode property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaAutoCapitalizationMode_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaAutoCapitalizationMode_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_autoCapitalizationMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaAutoCapitalizationMode_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaAutoCapitalizationMode_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaAutoCapitalizationMode_undefined_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[textAreaAutoCapitalizationMode_undefined_0100] undefined autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[textAreaAutoCapitalizationMode_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaStopBackPress_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STOPBACKPRESS_NULL_0100
     * @tc.desc   Test TextArea stopBackPress property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStopBackPress_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStopBackPress_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_stopBackPress_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStopBackPress_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStopBackPress_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStopBackPress_null_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[textAreaStopBackPress_null_0100] null stopBackPress is: " + obj.$attrs.stopBackPress);

      // null 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[textAreaStopBackPress_null_0100] END');
    })

    /**
     * @tc.name   textAreaStopBackPress_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STOPBACKPRESS_UNDEFINED_0100
     * @tc.desc   Test TextArea stopBackPress property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStopBackPress_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStopBackPress_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_stopBackPress_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStopBackPress_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStopBackPress_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStopBackPress_undefined_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[textAreaStopBackPress_undefined_0100] undefined stopBackPress is: " + obj.$attrs.stopBackPress);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[textAreaStopBackPress_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaKeyboardAppearance_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_KEYBOARDAPPEARANCE_NULL_0100
     * @tc.desc   Test TextArea keyboardAppearance property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaKeyboardAppearance_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaKeyboardAppearance_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_keyboardAppearance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaKeyboardAppearance_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaKeyboardAppearance_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaKeyboardAppearance_null_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[textAreaKeyboardAppearance_null_0100] null keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // null 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[textAreaKeyboardAppearance_null_0100] END');
    })

    /**
     * @tc.name   textAreaKeyboardAppearance_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_KEYBOARDAPPEARANCE_UNDEFINED_0100
     * @tc.desc   Test TextArea keyboardAppearance property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaKeyboardAppearance_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaKeyboardAppearance_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_keyboardAppearance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaKeyboardAppearance_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaKeyboardAppearance_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaKeyboardAppearance_undefined_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[textAreaKeyboardAppearance_undefined_0100] undefined keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[textAreaKeyboardAppearance_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEWIDTH_NULL_0100
     * @tc.desc   Test TextArea strokeWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeWidth_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStrokeWidth_null_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textAreaStrokeWidth_null_0100] null strokeWidth is: " + obj.$attrs.strokeWidth);

      // null 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textAreaStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test TextArea strokeWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeWidth_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStrokeWidth_undefined_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textAreaStrokeWidth_undefined_0100] undefined strokeWidth is: " + obj.$attrs.strokeWidth);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textAreaStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeColor_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKECOLOR_NULL_0100
     * @tc.desc   Test TextArea strokeColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_strokeColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStrokeColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStrokeColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStrokeColor_null_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textAreaStrokeColor_null_0100] null strokeColor is: " + obj.$attrs.strokeColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textAreaStrokeColor_null_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKECOLOR_UNDEFINED_0100
     * @tc.desc   Test TextArea strokeColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_strokeColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaStrokeColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaStrokeColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaStrokeColor_undefined_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textAreaStrokeColor_undefined_0100] undefined strokeColor is: " + obj.$attrs.strokeColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textAreaStrokeColor_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOSPACING_NULL_0100
     * @tc.desc   Test TextArea enableAutoSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableAutoSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableAutoSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoSpacing_null_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[textAreaEnableAutoSpacing_null_0100] null enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[textAreaEnableAutoSpacing_null_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOSPACING_UNDEFINED_0100
     * @tc.desc   Test TextArea enableAutoSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableAutoSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableAutoSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoSpacing_undefined_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[textAreaEnableAutoSpacing_undefined_0100] undefined enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[textAreaEnableAutoSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaCompressLeadingPunctuation_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_COMPRESSLEADINGPUNCTUATION_NULL_0100
     * @tc.desc   Test TextArea compressLeadingPunctuation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCompressLeadingPunctuation_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCompressLeadingPunctuation_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_compressLeadingPunctuation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCompressLeadingPunctuation_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCompressLeadingPunctuation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCompressLeadingPunctuation_null_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[textAreaCompressLeadingPunctuation_null_0100] null compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // null 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[textAreaCompressLeadingPunctuation_null_0100] END');
    })

    /**
     * @tc.name   textAreaCompressLeadingPunctuation_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_COMPRESSLEADINGPUNCTUATION_UNDEFINED_0100
     * @tc.desc   Test TextArea compressLeadingPunctuation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCompressLeadingPunctuation_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCompressLeadingPunctuation_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_compressLeadingPunctuation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCompressLeadingPunctuation_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCompressLeadingPunctuation_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCompressLeadingPunctuation_undefined_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[textAreaCompressLeadingPunctuation_undefined_0100] undefined compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[textAreaCompressLeadingPunctuation_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaIncludeFontPadding_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_INCLUDEFONTPADDING_NULL_0100
     * @tc.desc   Test TextArea includeFontPadding property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaIncludeFontPadding_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaIncludeFontPadding_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_includeFontPadding_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaIncludeFontPadding_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaIncludeFontPadding_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaIncludeFontPadding_null_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[textAreaIncludeFontPadding_null_0100] null includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // null 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[textAreaIncludeFontPadding_null_0100] END');
    })

    /**
     * @tc.name   textAreaIncludeFontPadding_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_INCLUDEFONTPADDING_UNDEFINED_0100
     * @tc.desc   Test TextArea includeFontPadding property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaIncludeFontPadding_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaIncludeFontPadding_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_includeFontPadding_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaIncludeFontPadding_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaIncludeFontPadding_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaIncludeFontPadding_undefined_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[textAreaIncludeFontPadding_undefined_0100] undefined includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[textAreaIncludeFontPadding_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaFallbackLineSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FALLBACKLINESPACING_NULL_0100
     * @tc.desc   Test TextArea fallbackLineSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFallbackLineSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFallbackLineSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fallbackLineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFallbackLineSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFallbackLineSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFallbackLineSpacing_null_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[textAreaFallbackLineSpacing_null_0100] null fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[textAreaFallbackLineSpacing_null_0100] END');
    })

    /**
     * @tc.name   textAreaFallbackLineSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FALLBACKLINESPACING_UNDEFINED_0100
     * @tc.desc   Test TextArea fallbackLineSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFallbackLineSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFallbackLineSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fallbackLineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFallbackLineSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFallbackLineSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFallbackLineSpacing_undefined_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[textAreaFallbackLineSpacing_undefined_0100] undefined fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[textAreaFallbackLineSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaTextDirection_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTDIRECTION_NULL_0100
     * @tc.desc   Test TextArea textDirection property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextDirection_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextDirection_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextDirection_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextDirection_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextDirection_null_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[textAreaTextDirection_null_0100] null textDirection is: " + obj.$attrs.textDirection);

      // null 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[textAreaTextDirection_null_0100] END');
    })

    /**
     * @tc.name   textAreaTextDirection_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTDIRECTION_UNDEFINED_0100
     * @tc.desc   Test TextArea textDirection property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextDirection_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextDirection_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextDirection_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextDirection_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextDirection_undefined_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[textAreaTextDirection_undefined_0100] undefined textDirection is: " + obj.$attrs.textDirection);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[textAreaTextDirection_undefined_0100] END');
    })
  })
}
