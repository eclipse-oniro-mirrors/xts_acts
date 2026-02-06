/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import { resourceManager } from '@kit.LocalizationKit';

let emitKey = "emitUserAgent";

function progressFontWeight(sysFontWeight: Resource) {
  let fontWeightArr: string[] = [
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900',
    'FontWeight.Bold',
    'FontWeight.Normal',
    'FontWeight.Bolder',
    'FontWeight.Lighter',
    'FontWeight.Medium',
    'FontWeight.Regular']
  let resourceFontWeight = getContext().resourceManager.getNumber(sysFontWeight.id)
  let newFontWeight: string = fontWeightArr[resourceFontWeight]
  return newFontWeight;
}

export default function progressSecTest() {
  describe('ActsProgressSecTest', () => {

    beforeEach(async (done: Function) => {
      console.info("ActsProgressSecTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressSec',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ActsProgressSecTest state success " + JSON.stringify(pages));
        if (!("ProgressSec" == pages.name)) {
          console.info("get ActsProgressSecTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push ActsProgressSecTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActsProgressSecTest page error: " + err);
      }

      await CommonFunc.sleep(2000);
      console.info("ActsProgressSecTest beforeEach start");
      done()
    });


    afterEach(async (done: Function) => {
      console.info("ActsProgressSecTest afterEach start");
      let progress_capsule_borderWidth_number: number = 0
      let progress_capsule_borderWidth_string: string = '0vp'
      let progress_capsule_borderWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_capsule_borderColor_number: number = 0xFF000000
      let progress_capsule_borderColor_string: string = '#FFFF9535'
      let progress_capsule_borderColor_color: Color = Color.Red
      let progress_capsule_borderColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
      let progress_capsule_fontSize_number: number = 0
      let progress_capsule_fontSize_string: string = '0vp'
      let progress_capsule_fontSize_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_capsule_fontWeight_number: number = 400
      let progress_capsule_fontWeight_string: string = '400'
      let progress_capsule_fontWeight_fontWeight: FontWeight = FontWeight.Normal
      let progress_capsule_fontStyle_fontStyle: FontStyle = FontStyle.Normal
      let progress_capsule_fontColor_number: number = 0xFF000000
      let progress_capsule_fontColor_string: string = '#FFFF9535'
      let progress_capsule_fontColor_color: Color = Color.Red
      let progress_capsule_fontColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
      let progress_capsule_content_string: string = '下载'
      let progress_capsule_enableScanEffect_boolean: boolean = false
      let progress_capsule_showDefaultPercentage_boolean: boolean = false
      let progress_capsule_enableSmoothEffect_boolean: boolean = false

      let progress_ring_strokeWidth_number: number = 4
      let progress_ring_strokeWidth_string: string = '4vp'
      let progress_ring_strokeWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let progress_ring_shadow_bool: boolean = false
      let progress_ring_status_progressStatus: ProgressStatus = ProgressStatus.PROGRESSING
      let progress_ring_color_purity: number = 0x000000
      let progress_ring_color_linear_number: LinearGradient = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }])
      let progress_ring_color_linear_string: LinearGradient = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }])
      let progress_ring_color_linear_color: LinearGradient = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }])
      let progress_ring_color_linear_resource: LinearGradient = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }])
      let progress_ring_color_linear_null: LinearGradient | null = null
      let progress_ring_color_linear_undefined: LinearGradient | undefined = undefined
      let progress_ring_enableScanEffect_boolean: boolean = false
      let progress_ring_enableSmoothEffect_boolean: boolean = false

      let progress_linear_enableScanEffect_boolean: boolean = false
      let progress_linear_enableSmoothEffect_boolean: boolean = false

      let progress_scaleRing_enableSmoothEffect_boolean: boolean = false
      let progress_eclipse_enableSmoothEffect_boolean: boolean = false

      try {
        let eventData: events_emitter.EventData = {
          data: {
            'progress_capsule_borderWidth_number': progress_capsule_borderWidth_number,
            'progress_capsule_borderWidth_string': progress_capsule_borderWidth_string,
            'progress_capsule_borderWidth_resource': progress_capsule_borderWidth_resource,
            'progress_capsule_borderColor_number': progress_capsule_borderColor_number,
            'progress_capsule_borderColor_string': progress_capsule_borderColor_string,
            'progress_capsule_borderColor_color': progress_capsule_borderColor_color,
            'progress_capsule_borderColor_resource': progress_capsule_borderColor_resource,
            'progress_capsule_fontSize_number': progress_capsule_fontSize_number,
            'progress_capsule_fontSize_string': progress_capsule_fontSize_string,
            'progress_capsule_fontSize_resource': progress_capsule_fontSize_resource,
            'progress_capsule_fontWeight_number': progress_capsule_fontWeight_number,
            'progress_capsule_fontWeight_string': progress_capsule_fontWeight_string,
            'progress_capsule_fontWeight_fontWeight': progress_capsule_fontWeight_fontWeight,
            'progress_capsule_fontStyle_fontStyle': progress_capsule_fontStyle_fontStyle,
            'progress_capsule_fontColor_number': progress_capsule_fontColor_number,
            'progress_capsule_fontColor_string': progress_capsule_fontColor_string,
            'progress_capsule_fontColor_color': progress_capsule_fontColor_color,
            'progress_capsule_fontColor_resource': progress_capsule_fontColor_resource,
            'progress_capsule_content_string': progress_capsule_content_string,
            'progress_capsule_enableScanEffect_boolean': progress_capsule_enableScanEffect_boolean,
            'progress_capsule_showDefaultPercentage_boolean': progress_capsule_showDefaultPercentage_boolean,
            'progress_capsule_enableSmoothEffect_boolean': progress_capsule_enableSmoothEffect_boolean,

            'progress_ring_strokeWidth_number': progress_ring_strokeWidth_number,
            'progress_ring_strokeWidth_string': progress_ring_strokeWidth_string,
            'progress_ring_strokeWidth_resource': progress_ring_strokeWidth_resource,
            'progress_ring_shadow_bool': progress_ring_shadow_bool,
            'progress_ring_status_progressStatus': progress_ring_status_progressStatus,
            'progress_ring_color_purity': progress_ring_color_purity,
            'progress_ring_color_linear_number': progress_ring_color_linear_number,
            'progress_ring_color_linear_string': progress_ring_color_linear_string,
            'progress_ring_color_linear_color': progress_ring_color_linear_color,
            'progress_ring_color_linear_resource': progress_ring_color_linear_resource,
            'progress_ring_color_linear_null': progress_ring_color_linear_null,
            'progress_ring_color_linear_undefined': progress_ring_color_linear_undefined,
            'progress_ring_enableScanEffect_boolean': progress_ring_enableScanEffect_boolean,
            'progress_ring_enableSmoothEffect_boolean': progress_ring_enableSmoothEffect_boolean,

            'progress_linear_enableScanEffect_boolean': progress_linear_enableScanEffect_boolean,
            'progress_linear_enableSmoothEffect_boolean': progress_linear_enableSmoothEffect_boolean,

            'progress_scaleRing_enableSmoothEffect_boolean': progress_scaleRing_enableSmoothEffect_boolean,
            'progress_eclipse_enableSmoothEffect_boolean': progress_eclipse_enableSmoothEffect_boolean,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ActsProgressSecTest afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("ActsProgressSecTest afterEach start to publish change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      done();
    })

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BackgroundColor_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_BackgroundColor_0100
     * @tc.desc   Get the default value of backgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BackgroundColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.backgroundColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.padding);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " +
      JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Color_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_Color_0100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Color_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJsonDefault));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.color);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0100
     * @tc.desc   Get the default value of capsuleStyle.borderWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertContain('vp');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0200
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 3;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0300
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 3vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '3vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0400
     * @tc.desc   Set the value of capsuleStyle.borderWidth as ohos_id_text_margin_vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(newJson));
      let progress_capsule_borderWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({
        name: 'progress_capsule_borderWidth_resource', value: progress_capsule_borderWidth_resource
      });
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objJudge.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0500
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 9px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0600
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 9vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0700
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 9fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0800
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 9lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_0900
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_0900
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0900', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_1000
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1000
     * @tc.desc   Set the value of capsuleStyle.borderWidth as -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1000', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertContain('vp');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_1100
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1100
     * @tc.desc   Set the value of capsuleStyle.borderWidth as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_1200
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1200
     * @tc.desc   Set the value of capsuleStyle.borderWidth as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertContain('vp');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderWidth_1300
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderWidth_1300
     * @tc.desc   Set the value of capsuleStyle.borderWidth as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertContain('vp');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0100
     * @tc.desc   Get the default value of capsuleStyle.borderColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0200
     * @tc.desc   Set the value of capsuleStyle.borderColor as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_number = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_number": progress_capsule_borderColor_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0300
     * @tc.desc   Set the value of capsuleStyle.borderColor as '#FFFF9535'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = '#FFFF9535';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0400
     * @tc.desc   Set the value of capsuleStyle.borderColor as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_color = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_color": progress_capsule_borderColor_color
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0500
     * @tc.desc   Set the value of capsuleStyle.borderColor as ohos_id_color_connected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_resource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'progress_capsule_borderColor_resource', value: progress_capsule_borderColor_resource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(objJudge.$attrs.capsuleStyle.borderColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0600
     * @tc.desc   Set the value of capsuleStyle.borderColor as 'abcdefghijk'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJsonDefault));

      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0700
     * @tc.desc   Set the value of capsuleStyle.borderColor as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJsonDefault));

      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_BorderColor_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_BorderColor_0800
     * @tc.desc   Set the value of capsuleStyle.borderColor as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJsonDefault));

      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0100
     * @tc.desc   Get the default value of capsuleStyle.font.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertContain('fp');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0200
     * @tc.desc   Set the value of capsuleStyle.font.size as 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("16.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0300
     * @tc.desc   Set the value of capsuleStyle.font.size as '16vp'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '16vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("16.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0400
     * @tc.desc   Set the value of capsuleStyle.font.size as ohos_id_text_margin_vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({
        name: 'progress_capsule_fontSize_resource', value: progress_capsule_fontSize_resource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objJudge.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0500
     * @tc.desc   Set the value of capsuleStyle.font.size as '18px'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0600
     * @tc.desc   Set the value of capsuleStyle.font.size as '18vp'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0700
     * @tc.desc   Set the value of capsuleStyle.font.size as '18fp'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0800
     * @tc.desc   Set the value of capsuleStyle.font.size as '18lpx'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_0900
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_0900
     * @tc.desc   Set the value of capsuleStyle.font.size as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0900', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("0.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_1000
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_1000
     * @tc.desc   Set the value of capsuleStyle.font.size as -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1000', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertContain('fp');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_1100
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_1100
     * @tc.desc   Set the value of capsuleStyle.font.size as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("10000.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_1200
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_1200
     * @tc.desc   Set the value of capsuleStyle.font.size as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertContain('fp');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Size_1300
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Size_1300
     * @tc.desc   Set the value of capsuleStyle.font.size as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertContain('fp');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0100
     * @tc.desc   Get the default value of capsuleStyle.font.weight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0200
     * @tc.desc   Set the value of capsuleStyle.font.weight as 700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 700;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0300
     * @tc.desc   Set the value of capsuleStyle.font.weight as '700'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_string = '700';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_string": progress_capsule_fontWeight_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0400
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Lighter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Lighter;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Lighter");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0500
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Normal;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0600
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Regular
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Regular;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Regular");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0700
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Medium
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Medium;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Medium");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0800
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Bold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bold;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Bold");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_0900
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_0900
     * @tc.desc   Set the value of capsuleStyle.font.weight as FontWeight.Bolder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0900', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bolder;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Bolder");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_1000
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_1000
     * @tc.desc   Set the value of capsuleStyle.font.weight as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1000', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_1100
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_1100
     * @tc.desc   Set the value of capsuleStyle.font.weight as -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_1200
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_1200
     * @tc.desc   Set the value of capsuleStyle.font.weight as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_1300
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_1300
     * @tc.desc   Set the value of capsuleStyle.font.weight as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual(progressFontWeight($r('sys.float.font_weight')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Weight_1400
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Weight_1400
     * @tc.desc   Set the value of capsuleStyle.font.weight as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Style_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_0100
     * @tc.desc   Get the default value of capsuleStyle.font.style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Style_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_0200
     * @tc.desc   Set the value of capsuleStyle.font.style as FontStyle.Italic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Italic;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Italic");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Style_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_0300
     * @tc.desc   Set the value of capsuleStyle.font.style as FontStyle.Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Normal;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Style_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_0400
     * @tc.desc   Set the value of capsuleStyle.font.style as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Font_Style_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_Font_Style_0500
     * @tc.desc   Set the value of capsuleStyle.font.style as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0100
     * @tc.desc   Get the default value of capsuleStyle.fontColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0200
     * @tc.desc   Set the value of capsuleStyle.fontColor as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_number = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_number": progress_capsule_fontColor_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0300
     * @tc.desc   Set the value of capsuleStyle.fontColor as '#FFFF9535'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = '#FFFF9535';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0400
     * @tc.desc   Set the value of capsuleStyle.fontColor as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_color = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_color": progress_capsule_fontColor_color
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0500
     * @tc.desc   Set the value of capsuleStyle.fontColor as ohos_id_color_connected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(newJson));


      let progress_capsule_fontColor_resource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'progress_capsule_fontColor_resource', value: progress_capsule_fontColor_resource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objJudge.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0600
     * @tc.desc   Set the value of capsuleStyle.fontColor as 'abcdefghijk'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0700
     * @tc.desc   Set the value of capsuleStyle.fontColor as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_FontColor_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_FontColor_0800
     * @tc.desc   Set the value of capsuleStyle.fontColor as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0100
     * @tc.desc   Get the default value of capsuleStyle.content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] start");
      let newJson = getInspectorByKey('progress_capsule_showDefaultPercentage_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0200
     * @tc.desc   Set the value of capsuleStyle.fontColor as '下载'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '下载';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("下载");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0300
     * @tc.desc   Set the value of capsuleStyle.fontColor as '继续'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '继续';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("继续");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0400
     * @tc.desc   Set the value of capsuleStyle.fontColor as '安装中'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '安装中';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("安装中");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0500
     * @tc.desc   Set the value of capsuleStyle.fontColor as '打开'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '打开';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("打开");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0600
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0600
     * @tc.desc   Set the value of capsuleStyle.fontColor as ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0700
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0700
     * @tc.desc   Set the value of capsuleStyle.fontColor as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = null;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_Content_0800
     * @tc.number ArkUI_Stage_Progress_Capsule_Content_0800
     * @tc.desc   Set the value of capsuleStyle.fontColor as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = undefined;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100
     * @tc.desc   Get the default value of capsuleStyle.enableScanEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200
     * @tc.desc   Set the value of capsuleStyle.enableScanEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300
     * @tc.desc   Set the value of capsuleStyle.enableScanEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400
     * @tc.desc   Set the value of capsuleStyle.enableScanEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500
     * @tc.desc   Set the value of capsuleStyle.enableScanEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100
     * @tc.desc   Get the default value of capsuleStyle.showDefaultPercentage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200
     * @tc.desc   Set the value of capsuleStyle.showDefaultPercentage as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300
     * @tc.desc   Set the value of capsuleStyle.showDefaultPercentage as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400
     * @tc.desc   Set the value of capsuleStyle.showDefaultPercentage as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500
     * @tc.desc   Set the value of capsuleStyle.showDefaultPercentage as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " +
      JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] end");
      done();
    });


    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_BackgroundColor_0100
     * @tc.number ArkUI_Stage_Progress_Ring_BackgroundColor_0100
     * @tc.desc   Get the default value of backgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_BackgroundColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      let newJsonDefault = getInspectorByKey('progress_ring_default_default');
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.backgroundColor);
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + strColor);

      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertContain("#");
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0100
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0100
     * @tc.desc   Get the default value of ringStyle.strokeWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0200
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0200
     * @tc.desc   Set the value of ringStyle.strokeWidth as 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0300
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0300
     * @tc.desc   Set the value of ringStyle.strokeWidth as 10vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '10vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0400
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0400
     * @tc.desc   Set the value of ringStyle.strokeWidth as ohos_id_text_margin_vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] start");
      let newJson = getInspectorByKey('progress_ring_resource');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(newJson));


      let progress_ring_strokeWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({
        name: 'progress_ring_strokeWidth_resource', value: progress_ring_strokeWidth_resource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual(objJudge.$attrs.ringStyle.strokeWidth);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0500
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0500
     * @tc.desc   Set the value of ringStyle.strokeWidth as 20px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00px");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0600
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0600
     * @tc.desc   Set the value of ringStyle.strokeWidth as 20vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0700
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0700
     * @tc.desc   Set the value of ringStyle.strokeWidth as 20fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0800
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0800
     * @tc.desc   Set the value of ringStyle.strokeWidth as 20lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00lpx");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_0900
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_0900
     * @tc.desc   Set the value of ringStyle.strokeWidth as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0900', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_1000
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_1000
     * @tc.desc   Set the value of ringStyle.strokeWidth as -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1000', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_1100
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_1100
     * @tc.desc   Set the value of ringStyle.strokeWidth as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_1200
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_1200
     * @tc.desc   Set the value of ringStyle.strokeWidth as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_StrokeWidth_1300
     * @tc.number ArkUI_Stage_Progress_Ring_StrokeWidth_1300
     * @tc.desc   Set the value of ringStyle.strokeWidth as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Shadow_0100
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_0100
     * @tc.desc   Get the default value of ringStyle.shadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Shadow_0200
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_0200
     * @tc.desc   Set the value of ringStyle.shadow as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Shadow_0300
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_0300
     * @tc.desc   Set the value of ringStyle.shadow as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Shadow_0400
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_0400
     * @tc.desc   Set the value of ringStyle.shadow as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Shadow_0500
     * @tc.number ArkUI_Stage_Progress_Ring_Shadow_0500
     * @tc.desc   Set the value of ringStyle.shadow as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Status_0100
     * @tc.number ArkUI_Stage_Progress_Ring_Status_0100
     * @tc.desc   Get the default value of ringStyle.status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Status_0200
     * @tc.number ArkUI_Stage_Progress_Ring_Status_0200
     * @tc.desc   Set the value of ringStyle.status as ProgressStatus.LOADING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.LOADING;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.LOADING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Status_0300
     * @tc.number ArkUI_Stage_Progress_Ring_Status_0300
     * @tc.desc   Set the value of ringStyle.status as ProgressStatus.PROGRESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.PROGRESSING;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Status_0400
     * @tc.number ArkUI_Stage_Progress_Ring_Status_0400
     * @tc.desc   Set the value of ringStyle.status as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Status_0500
     * @tc.number ArkUI_Stage_Progress_Ring_Status_0500
     * @tc.desc   Set the value of ringStyle.status as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0100
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefaultColorBegin: ESObject = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0200
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0200
     * @tc.desc   Set the value of color as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0300
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0300
     * @tc.desc   Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] start");
      let newJson = getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0400
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0400
     * @tc.desc   Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] start");
      let newJson = getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      });
      await CommonFunc.sleep(2000);


      let strJson = getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0500
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0500
     * @tc.desc   Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] start");
      let newJson = getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0600
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0600
     * @tc.desc   Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] start");
      let newJson = getInspectorByKey('progress_ring_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0700
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0700
     * @tc.desc   Set the value of color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] start");
      let newJson = getInspectorByKey('progress_ring_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_0800
     * @tc.number ArkUI_Stage_Progress_Ring_Color_0800
     * @tc.desc   Set the value of color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_0800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] start");
      let newJson = getInspectorByKey('progress_ring_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1100
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefaultColorBegin: ESObject = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1200
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1200
     * @tc.desc   Set the value of color as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1300
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1300
     * @tc.desc   Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(newJson));


      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      })
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1400
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1400
     * @tc.desc   Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      })
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1500
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1500
     * @tc.desc   Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      })
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1600
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1600
     * @tc.desc   Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      })
      await CommonFunc.sleep(2000);


      let strJson = getInspectorByKey('progress_linear_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1700
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1700
     * @tc.desc   Set the value of color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_1800
     * @tc.number ArkUI_Stage_Progress_Ring_Color_1800
     * @tc.desc   Set the value of color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_1800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2100
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] start");
      let newJson = getInspectorByKey('progress_eclipse_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefaultColorBegin: ESObject = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2200
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2200
     * @tc.desc   Set the value of color as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2300
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2300
     * @tc.desc   Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2400
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2400
     * @tc.desc   Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2500
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2500
     * @tc.desc   Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2600
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2600
     * @tc.desc   Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);

      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      });

      await CommonFunc.sleep(2000);


      let strJson = getInspectorByKey('progress_eclipse_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2700
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2700
     * @tc.desc   Set the value of color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_2800
     * @tc.number ArkUI_Stage_Progress_Ring_Color_2800
     * @tc.desc   Set the value of color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_2800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3100
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefaultColorBegin: ESObject = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3200
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3200
     * @tc.desc   Set the value of color as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3300
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3300
     * @tc.desc   Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }]);

      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3400
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3400
     * @tc.desc   Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);

      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3500
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3500
     * @tc.desc   Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3600
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3600
     * @tc.desc   Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);

      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      });


      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3700
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3700
     * @tc.desc   Set the value of color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_3800
     * @tc.number ArkUI_Stage_Progress_Ring_Color_3800
     * @tc.desc   Set the value of color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_3800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4100
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4100
     * @tc.desc   Get the default value of color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] start");
      let newJson = getInspectorByKey('progress_capsule_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let objDefaultColorBegin: ESObject = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4200
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4200
     * @tc.desc   Set the value of color as 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] start");
      let newJson = getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4300
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4300
     * @tc.desc   Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000, offset: 0
      }, {
        color: 0xFFFFFFFF, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_number', value: progress_ring_color_linear_number
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4400
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4400
     * @tc.desc   Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_string', value: progress_ring_color_linear_string
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4500
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4500
     * @tc.desc   Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_color', value: progress_ring_color_linear_color
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor)
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4600
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4600
     * @tc.desc   Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4600', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      globalThis.value.message.notify({
        name: 'progress_ring_color_linear_resource', value: progress_ring_color_linear_resource
      });

      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objJudge: ESObject = JSON.parse(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4700
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4700
     * @tc.desc   Set the value of color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4700', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_Color_4800
     * @tc.number ArkUI_Stage_Progress_Ring_Color_4800
     * @tc.desc   Set the value of color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_4800', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(strJson))

      let obj: ESObject = JSON.parse(strJson);
      let objDefaultColorBegin: ESObject = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd: ESObject = JSON.parse(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertContain('#');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableScanEffect_0100
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_0100
     * @tc.desc   Get the default value of ringStyle.enableScanEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " +
      JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableScanEffect_0200
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_0200
     * @tc.desc   Set the value of ringStyle.enableScanEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " +
      JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableScanEffect_0300
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_0300
     * @tc.desc   Set the value of ringStyle.enableScanEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " +
      JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableScanEffect_0400
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_0400
     * @tc.desc   Set the value of ringStyle.enableScanEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " +
      JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableScanEffect_0500
     * @tc.number ArkUI_Stage_Progress_Ring_EnableScanEffect_0500
     * @tc.desc   Set the value of ringStyle.enableScanEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " +
      JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableScanEffect_0100
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_0100
     * @tc.desc   Get the default value of linearStyle.enableScanEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " +
      JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableScanEffect_0200
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_0200
     * @tc.desc   Set the value of linearStyle.enableScanEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " +
      JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableScanEffect_0300
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_0300
     * @tc.desc   Set the value of linearStyle.enableScanEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " +
      JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableScanEffect_0400
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_0400
     * @tc.desc   Set the value of linearStyle.enableScanEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " +
      JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableScanEffect_0500
     * @tc.number ArkUI_Stage_Progress_Linear_EnableScanEffect_0500
     * @tc.desc   Set the value of linearStyle.enableScanEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " +
      JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100
     * @tc.desc   Get the default value of enableSmoothEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200
     * @tc.desc   Set the value of enableSmoothEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300
     * @tc.desc   Set the value of enableSmoothEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400
     * @tc.desc   Set the value of enableSmoothEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500
     * @tc.number ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500
     * @tc.desc   Set the value of enableSmoothEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100
     * @tc.desc   Get the default value of enableSmoothEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200
     * @tc.desc   Set the value of enableSmoothEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300
     * @tc.desc   Set the value of enableSmoothEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400
     * @tc.desc   Set the value of enableSmoothEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500
     * @tc.number ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500
     * @tc.desc   Set the value of enableSmoothEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100
     * @tc.desc   Get the default value of enableSmoothEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200
     * @tc.desc   Set the value of enableSmoothEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300
     * @tc.desc   Set the value of enableSmoothEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400
     * @tc.desc   Set the value of enableSmoothEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500
     * @tc.number ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500
     * @tc.desc   Set the value of enableSmoothEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100
     * @tc.desc   Get the default value of enableSmoothEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200
     * @tc.desc   Set the value of enableSmoothEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300
     * @tc.desc   Set the value of enableSmoothEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400
     * @tc.desc   Set the value of enableSmoothEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500
     * @tc.number ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500
     * @tc.desc   Set the value of enableSmoothEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100
     * @tc.desc   Get the default value of enableSmoothEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_eclipse_color_default');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200
     * @tc.desc   Set the value of enableSmoothEffect as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = true;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300
     * @tc.desc   Set the value of enableSmoothEffect as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = false;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400
     * @tc.desc   Set the value of enableSmoothEffect as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500
     * @tc.number ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500
     * @tc.desc   Set the value of enableSmoothEffect as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500', Level.LEVEL0, async (done: Function) => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] end");
      done();
    });
  })
}
