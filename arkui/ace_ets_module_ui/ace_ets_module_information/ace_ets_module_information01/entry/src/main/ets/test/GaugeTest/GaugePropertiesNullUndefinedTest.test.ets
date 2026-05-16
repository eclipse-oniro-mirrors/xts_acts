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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';

export default function GaugePropertiesNullUndefinedTest() {
  describe('GaugePropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("GaugePropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gauge/GaugePropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("GaugePropertiesNullUndefinedTest" == pages.name)) {
          console.info("get GaugePropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GaugePropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GaugePropertiesNullUndefinedTest page error: " + err);
      }
    });

    /**
     * @tc.name   gaugeValue_null_0100
     * @tc.number SUB_ARKUI_GAUGE_VALUE_NULL_0100
     * @tc.desc   Test Gauge value property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeValue_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeValue_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_value_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeValue_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeValue_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeValue_null_0100] default value is: " + JSON.stringify(objCompare.$attrs.value));
      console.info("[gaugeValue_null_0100] null value is: " + JSON.stringify(obj.$attrs.value));

      // null 应该恢复为默认值
      expect(obj.$attrs.value).assertEqual(objCompare.$attrs.value);
      console.info('[gaugeValue_null_0100] END');
    })

    /**
     * @tc.name   gaugeValue_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_VALUE_UNDEFINED_0100
     * @tc.desc   Test Gauge value property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeValue_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeValue_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_value_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeValue_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeValue_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeValue_undefined_0100] default value is: " + JSON.stringify(objCompare.$attrs.value));
      console.info("[gaugeValue_undefined_0100] undefined value is: " + JSON.stringify(obj.$attrs.value));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.value).assertEqual(objCompare.$attrs.value);
      console.info('[gaugeValue_undefined_0100] END');
    })

    /**
     * @tc.name   gaugeStartAngle_null_0100
     * @tc.number SUB_ARKUI_GAUGE_STARTANGLE_NULL_0100
     * @tc.desc   Test Gauge startAngle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeStartAngle_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeStartAngle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_startAngle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_startAngle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeStartAngle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeStartAngle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeStartAngle_null_0100] default startAngle is: " + JSON.stringify(objCompare.$attrs.startAngle));
      console.info("[gaugeStartAngle_null_0100] null startAngle is: " + JSON.stringify(obj.$attrs.startAngle));

      // null 应该恢复为默认值
      expect(obj.$attrs.startAngle).assertEqual(objCompare.$attrs.startAngle);
      console.info('[gaugeStartAngle_null_0100] END');
    })

    /**
     * @tc.name   gaugeStartAngle_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_STARTANGLE_UNDEFINED_0100
     * @tc.desc   Test Gauge startAngle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeStartAngle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeStartAngle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_startAngle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_startAngle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeStartAngle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeStartAngle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeStartAngle_undefined_0100] default startAngle is: " + JSON.stringify(objCompare.$attrs.startAngle));
      console.info("[gaugeStartAngle_undefined_0100] undefined startAngle is: " + JSON.stringify(obj.$attrs.startAngle));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.startAngle).assertEqual(objCompare.$attrs.startAngle);
      console.info('[gaugeStartAngle_undefined_0100] END');
    })

    /**
     * @tc.name   gaugeEndAngle_null_0100
     * @tc.number SUB_ARKUI_GAUGE_ENDANGLE_NULL_0100
     * @tc.desc   Test Gauge endAngle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeEndAngle_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeEndAngle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_endAngle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_endAngle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeEndAngle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeEndAngle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeEndAngle_null_0100] default endAngle is: " + JSON.stringify(objCompare.$attrs.endAngle));
      console.info("[gaugeEndAngle_null_0100] null endAngle is: " + JSON.stringify(obj.$attrs.endAngle));

      // null 应该恢复为默认值
      expect(obj.$attrs.endAngle).assertEqual(objCompare.$attrs.endAngle);
      console.info('[gaugeEndAngle_null_0100] END');
    })

    /**
     * @tc.name   gaugeEndAngle_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_ENDANGLE_UNDEFINED_0100
     * @tc.desc   Test Gauge endAngle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeEndAngle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeEndAngle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_endAngle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_endAngle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeEndAngle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeEndAngle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeEndAngle_undefined_0100] default endAngle is: " + JSON.stringify(objCompare.$attrs.endAngle));
      console.info("[gaugeEndAngle_undefined_0100] undefined endAngle is: " + JSON.stringify(obj.$attrs.endAngle));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.endAngle).assertEqual(objCompare.$attrs.endAngle);
      console.info('[gaugeEndAngle_undefined_0100] END');
    })

    /**
     * @tc.name   gaugeStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_GAUGE_STROKEWIDTH_NULL_0100
     * @tc.desc   Test Gauge strokeWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeStrokeWidth_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeStrokeWidth_null_0100] default strokeWidth is: " + JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info("[gaugeStrokeWidth_null_0100] null strokeWidth is: " + JSON.stringify(obj.$attrs.strokeWidth));

      // null 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual('0.00px');
      console.info('[gaugeStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   gaugeStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test Gauge strokeWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeStrokeWidth_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeStrokeWidth_undefined_0100] default strokeWidth is: " + JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info("[gaugeStrokeWidth_undefined_0100] undefined strokeWidth is: " + JSON.stringify(obj.$attrs.strokeWidth));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual('0.00px');
      console.info('[gaugeStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   gaugeDescription_null_0100
     * @tc.number SUB_ARKUI_GAUGE_DESCRIPTION_NULL_0100
     * @tc.desc   Test Gauge description property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeDescription_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeDescription_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_description_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_description_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeDescription_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeDescription_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugeDescription_null_0100] default description is: " + JSON.stringify(objCompare.$attrs.description));
      console.info("[gaugeDescription_null_0100] null description is: " + JSON.stringify(obj.$attrs.description));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.description)).assertEqual(JSON.stringify(objCompare.$attrs.description));
      console.info('[gaugeDescription_null_0100] END');
    })

    /**
     * @tc.name   gaugeDescription_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_DESCRIPTION_UNDEFINED_0100
     * @tc.desc   Test Gauge description property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeDescription_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeDescription_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_description_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_description_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeDescription_null_0100] default description is: " + JSON.stringify(objCompare.$attrs.description));
      console.info("[gaugeDescription_null_0100] null description is: " + JSON.stringify(obj.$attrs.description));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.description)).assertEqual(JSON.stringify(objCompare.$attrs.description));
      console.info('[gaugeDescription_undefined_0100] END');
    })

    /**
     * @tc.name   gaugePrivacySensitive_null_0100
     * @tc.number SUB_ARKUI_GAUGE_PRIVACYSENSITIVE_NULL_0100
     * @tc.desc   Test Gauge privacySensitive property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugePrivacySensitive_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugePrivacySensitive_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_privacySensitive_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_privacySensitive_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugePrivacySensitive_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugePrivacySensitive_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugePrivacySensitive_null_0100] default privacySensitive is: " + JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info("[gaugePrivacySensitive_null_0100] null privacySensitive is: " + JSON.stringify(obj.$attrs.privacySensitive));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.privacySensitive)).assertEqual(JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info('[gaugePrivacySensitive_null_0100] END');
    })

    /**
     * @tc.name   gaugePrivacySensitive_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_PRIVACYSENSITIVE_UNDEFINED_0100
     * @tc.desc   Test Gauge privacySensitive property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugePrivacySensitive_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugePrivacySensitive_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_privacySensitive_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_privacySensitive_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugePrivacySensitive_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugePrivacySensitive_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[gaugePrivacySensitive_null_0100] default privacySensitive is: " + JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info("[gaugePrivacySensitive_null_0100] undefined privacySensitive is: " + JSON.stringify(obj.$attrs.privacySensitive));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.privacySensitive)).assertEqual(JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info('[gaugePrivacySensitive_undefined_0100] END');
    })

    /**
     * @tc.name   gaugeContentModifier_null_0100
     * @tc.number SUB_ARKUI_GAUGE_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test Gauge contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeContentModifier_null_0100', Level.LEVEL0, async () => {
      console.info('[gaugeContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值
      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[gaugeContentModifier_null_0100] END');
    })

    /**
     * @tc.name   gaugeContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_GAUGE_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test Gauge contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gaugeContentModifier_undefined_0100', Level.LEVEL0, async () => {
      console.info('[gaugeContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Gauge_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Gauge_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gaugeContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gaugeContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值
      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[gaugeContentModifier_undefined_0100] END');
    })
  })
}
