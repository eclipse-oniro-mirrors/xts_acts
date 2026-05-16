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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function MarqueePropertiesNullUndefinedTest() {
  describe('MarqueePropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Marquee/MarqueePropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueePropertiesNullUndefined state success " + JSON.stringify(pages));
        if (!("MarqueePropertiesNullUndefined" == pages.name)) {
          console.info("get MarqueePropertiesNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push MarqueePropertiesNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueePropertiesNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   marqueeFontColor_null_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTCOLOR_NULL_0100
     * @tc.desc   Test Marquee fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontColor_null_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[marqueeFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let nullColor: string = obj.$attrs.fontColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[marqueeFontColor_null_0100] END');
    })

    /**
     * @tc.name   marqueeFontColor_undefined_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test Marquee fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[marqueeFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let undefinedColor: string = obj.$attrs.fontColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[marqueeFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   marqueeFontColor_empty_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test Marquee fontColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontColor_empty_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[marqueeFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let emptyColor: string = obj.$attrs.fontColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[marqueeFontColor_empty_0100] END');
    })

    /**
     * @tc.name   marqueeFontSize_null_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTSIZE_NULL_0100
     * @tc.desc   Test Marquee fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontSize_null_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[marqueeFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[marqueeFontSize_null_0100] END');
    })

    /**
     * @tc.name   marqueeFontSize_undefined_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test Marquee fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontSize_undefined_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[marqueeFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[marqueeFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   marqueeFontSize_empty_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTSIZE_EMPTY_0100
     * @tc.desc   Test Marquee fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontSize_empty_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontSize_empty_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[marqueeFontSize_empty_0100] empty fontSize is: " + obj.$attrs.fontSize);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[marqueeFontSize_empty_0100] END');
    })

    /**
     * @tc.name   marqueeFontWeight_null_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTWEIGHT_NULL_0100
     * @tc.desc   Test Marquee fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontWeight_null_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[marqueeFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[marqueeFontWeight_null_0100] END');
    })

    /**
     * @tc.name   marqueeFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test Marquee fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontWeight_undefined_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[marqueeFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[marqueeFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   marqueeFontWeight_empty_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test Marquee fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontWeight_empty_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[marqueeFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[marqueeFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   marqueeFontFamily_null_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTFAMILY_NULL_0100
     * @tc.desc   Test Marquee fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontFamily_null_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontFamily_null_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[marqueeFontFamily_null_0100] null fontFamily is: " + obj.$attrs.fontFamily);

      // null 应该恢复为默认值
      let defaultFamily: string = objCompare.$attrs.fontFamily as string;
      let nullFamily: string = obj.$attrs.fontFamily as string;
      expect(nullFamily).assertEqual(defaultFamily);
      console.info('[marqueeFontFamily_null_0100] END');
    })

    /**
     * @tc.name   marqueeFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test Marquee fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontFamily_undefined_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontFamily_undefined_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[marqueeFontFamily_undefined_0100] undefined fontFamily is: " + obj.$attrs.fontFamily);

      // undefined 应该恢复为默认值
      let defaultFamily: string = objCompare.$attrs.fontFamily as string;
      let undefinedFamily: string = obj.$attrs.fontFamily as string;
      expect(undefinedFamily).assertEqual(defaultFamily);
      console.info('[marqueeFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   marqueeFontFamily_empty_0100
     * @tc.number SUB_ARKUI_MARQUEE_FONTFAMILY_EMPTY_0100
     * @tc.desc   Test Marquee fontFamily property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeFontFamily_empty_0100', Level.LEVEL0, async () => {
      console.info('[marqueeFontFamily_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_fontFamily_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeFontFamily_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeFontFamily_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeFontFamily_empty_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[marqueeFontFamily_empty_0100] empty fontFamily is: " + obj.$attrs.fontFamily);

      // 空字符串 应该恢复为默认值
      let defaultFamily: string = objCompare.$attrs.fontFamily as string;
      let emptyFamily: string = obj.$attrs.fontFamily as string;
      expect(emptyFamily).assertEqual(defaultFamily);
      console.info('[marqueeFontFamily_empty_0100] END');
    })

    /**
     * @tc.name   marqueeMarqueeUpdateStrategy_null_0100
     * @tc.number SUB_ARKUI_MARQUEE_MARQUEEUPDATESTRATEGY_NULL_0100
     * @tc.desc   Test Marquee marqueeUpdateStrategy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeMarqueeUpdateStrategy_null_0100', Level.LEVEL0, async () => {
      console.info('[marqueeMarqueeUpdateStrategy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_marqueeUpdateStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_marqueeUpdateStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeMarqueeUpdateStrategy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeMarqueeUpdateStrategy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeMarqueeUpdateStrategy_null_0100] default marqueeUpdateStrategy is: " + objCompare.$attrs.marqueeUpdateStrategy);
      console.info("[marqueeMarqueeUpdateStrategy_null_0100] null marqueeUpdateStrategy is: " + obj.$attrs.marqueeUpdateStrategy);

      // null 应该恢复为默认值
      expect(obj.$attrs.marqueeUpdateStrategy).assertEqual(objCompare.$attrs.marqueeUpdateStrategy);
      console.info('[marqueeMarqueeUpdateStrategy_null_0100] END');
    })

    /**
     * @tc.name   marqueeMarqueeUpdateStrategy_undefined_0100
     * @tc.number SUB_ARKUI_MARQUEE_MARQUEEUPDATESTRATEGY_UNDEFINED_0100
     * @tc.desc   Test Marquee marqueeUpdateStrategy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('marqueeMarqueeUpdateStrategy_undefined_0100', Level.LEVEL0, async () => {
      console.info('[marqueeMarqueeUpdateStrategy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Marquee_marqueeUpdateStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Marquee_marqueeUpdateStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[marqueeMarqueeUpdateStrategy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[marqueeMarqueeUpdateStrategy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[marqueeMarqueeUpdateStrategy_undefined_0100] default marqueeUpdateStrategy is: " + objCompare.$attrs.marqueeUpdateStrategy);
      console.info("[marqueeMarqueeUpdateStrategy_undefined_0100] undefined marqueeUpdateStrategy is: " + obj.$attrs.marqueeUpdateStrategy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.marqueeUpdateStrategy).assertEqual(objCompare.$attrs.marqueeUpdateStrategy);
      console.info('[marqueeMarqueeUpdateStrategy_undefined_0100] END');
    })
  })
}
