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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
import {MessageManager,Callback} from './MessageManager';

let emitKey = "emitUserAgent";
export default function progressSecTest() {
  describe('ActsProgressSecTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri:  "TestAbility/pages/IndexSec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexSec state success " + JSON.stringify(pages));
        if (!("IndexSec" == pages.name)) {
          console.info("get IndexSec state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push IndexSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexSec page error " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      console.info("progress beforeEach start");
      done();
    })

    afterEach(async function (done) {
      console.info("progress afterEach start");
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
      let progress_capsule_fontStyle_fontStyle : FontStyle = FontStyle.Normal
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
      let progress_ring_color_linear_number: LinearGradient = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}])
      let progress_ring_color_linear_string: LinearGradient = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}])
      let progress_ring_color_linear_color: LinearGradient = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}])
      let progress_ring_color_linear_resource: LinearGradient = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}])
      let progress_ring_color_linear_null: LinearGradient = null
      let progress_ring_color_linear_undefined: LinearGradient = undefined
      let progress_ring_enableScanEffect_boolean: boolean = false
      let progress_ring_enableSmoothEffect_boolean: boolean = false

      let progress_linear_enableScanEffect_boolean: boolean = false
      let progress_linear_enableSmoothEffect_boolean: boolean = false

      let progress_scaleRing_enableSmoothEffect_boolean: boolean = false
      let progress_eclipse_enableSmoothEffect_boolean: boolean = false

      try {
        var eventData = {
          data: {
            'progress_capsule_borderWidth_number' : progress_capsule_borderWidth_number,
            'progress_capsule_borderWidth_string' : progress_capsule_borderWidth_string,
            'progress_capsule_borderWidth_resource' : progress_capsule_borderWidth_resource,
            'progress_capsule_borderColor_number' : progress_capsule_borderColor_number,
            'progress_capsule_borderColor_string' : progress_capsule_borderColor_string,
            'progress_capsule_borderColor_color' : progress_capsule_borderColor_color,
            'progress_capsule_borderColor_resource' : progress_capsule_borderColor_resource,
            'progress_capsule_fontSize_number' : progress_capsule_fontSize_number,
            'progress_capsule_fontSize_string' : progress_capsule_fontSize_string,
            'progress_capsule_fontSize_resource' : progress_capsule_fontSize_resource,
            'progress_capsule_fontWeight_number' : progress_capsule_fontWeight_number,
            'progress_capsule_fontWeight_string' : progress_capsule_fontWeight_string,
            'progress_capsule_fontWeight_fontWeight' : progress_capsule_fontWeight_fontWeight,
            'progress_capsule_fontStyle_fontStyle' : progress_capsule_fontStyle_fontStyle,
            'progress_capsule_fontColor_number' : progress_capsule_fontColor_number,
            'progress_capsule_fontColor_string' : progress_capsule_fontColor_string,
            'progress_capsule_fontColor_color' : progress_capsule_fontColor_color,
            'progress_capsule_fontColor_resource' : progress_capsule_fontColor_resource,
            'progress_capsule_content_string' : progress_capsule_content_string,
            'progress_capsule_enableScanEffect_boolean' : progress_capsule_enableScanEffect_boolean,
            'progress_capsule_showDefaultPercentage_boolean' : progress_capsule_showDefaultPercentage_boolean,
            'progress_capsule_enableSmoothEffect_boolean' : progress_capsule_enableSmoothEffect_boolean,

            'progress_ring_strokeWidth_number' : progress_ring_strokeWidth_number,
            'progress_ring_strokeWidth_string' : progress_ring_strokeWidth_string,
            'progress_ring_strokeWidth_resource' : progress_ring_strokeWidth_resource,
            'progress_ring_shadow_bool' : progress_ring_shadow_bool,
            'progress_ring_status_progressStatus' : progress_ring_status_progressStatus,
            'progress_ring_color_purity' : progress_ring_color_purity,
            'progress_ring_color_linear_number' : progress_ring_color_linear_number,
            'progress_ring_color_linear_string' : progress_ring_color_linear_string,
            'progress_ring_color_linear_color' : progress_ring_color_linear_color,
            'progress_ring_color_linear_resource' : progress_ring_color_linear_resource,
            'progress_ring_color_linear_null' : progress_ring_color_linear_null,
            'progress_ring_color_linear_undefined' : progress_ring_color_linear_undefined,
            'progress_ring_enableScanEffect_boolean' : progress_ring_enableScanEffect_boolean,
            'progress_ring_enableSmoothEffect_boolean' : progress_ring_enableSmoothEffect_boolean,

            'progress_linear_enableScanEffect_boolean' : progress_linear_enableScanEffect_boolean,
            'progress_linear_enableSmoothEffect_boolean' : progress_linear_enableSmoothEffect_boolean,

            'progress_scaleRing_enableSmoothEffect_boolean' : progress_scaleRing_enableSmoothEffect_boolean,
            'progress_eclipse_enableSmoothEffect_boolean' : progress_eclipse_enableSmoothEffect_boolean,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("progress afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("progress afterEach start to publish change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      done();
    })

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BackgroundColor_0100
     * @tc.name      Tests the backgroundColor property of the progress capsule component
     * @tc.desc      Get the default value of backgroundColor
     */
    it('ArkUI_Stage_Progress_Capsule_BackgroundColor_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.backgroundColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.padding);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Color_0100
     * @tc.name      Tests the color property of the progress capsule component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Capsule_Color_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.color);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.borderWidth
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objDefault.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 3
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 3;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 3vp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '3vp';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(newJson));
      let progress_capsule_borderWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({name:'progress_capsule_borderWidth_resource',value:progress_capsule_borderWidth_resource});
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objJudge.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 9px
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9px';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 9vp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9vp';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 9fp
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9fp';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 9lpx
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9lpx';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_string": progress_capsule_borderWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("9.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_0900
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_0900', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 0;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_1000
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as -10
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1000', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objDefault.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_1100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 10000;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_1200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as null
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objDefault.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderWidth_1300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderWidth as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_1300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderWidth_number": progress_capsule_borderWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderWidth));
      expect(obj.$attrs.capsuleStyle.borderWidth).assertEqual(objDefault.$attrs.capsuleStyle.borderWidth);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.borderColor
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_number = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_number": progress_capsule_borderColor_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as '#FFFF9535'
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = '#FFFF9535';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as Color.Red
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_color = Color.Red;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_color": progress_capsule_borderColor_color
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as ohos_id_color_connected
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_resource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({name:'progress_capsule_borderColor_resource',value:progress_capsule_borderColor_resource});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(objJudge.$attrs.capsuleStyle.borderColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as 'abcdefghijk'
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = 'abcdefghijk';
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_BorderColor_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.borderColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_borderColor_string": progress_capsule_borderColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.capsuleStyle.borderColor);
      let strOpicity = JSON.stringify(objDefault.$attrs.margin);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity_2);

      let calculatedOpicaty = parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.borderColor));
      expect(obj.$attrs.capsuleStyle.borderColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.font.size
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objDefault.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as 16
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 16;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("16.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as '16vp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '16vp';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("16.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({name:'progress_capsule_fontSize_resource',value:progress_capsule_fontSize_resource });
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objJudge.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as '18px'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18px';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as '18vp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18vp';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as '18fp'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18fp';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as '18lpx'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18lpx';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_string": progress_capsule_fontSize_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("18.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_0900
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as 0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_0900', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 0;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("0.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_1000
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as -10
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1000', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objDefault.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_1100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 10000;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual("10000.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_1200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objDefault.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Size_1300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.size as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_1300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontSize_number": progress_capsule_fontSize_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.size));
      expect(obj.$attrs.capsuleStyle.font.size).assertEqual(objDefault.$attrs.capsuleStyle.font.size);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.font.weight
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as 700
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 700;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as '700'
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_string = '700';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_string": progress_capsule_fontWeight_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
                     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Lighter
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Lighter;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Lighter");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Normal
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Normal;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Regular
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Regular;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Regular");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Medium
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Medium;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Medium");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Bold
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bold;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Bold");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_0900
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as FontWeight.Bolder
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_0900', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bolder;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_fontWeight": progress_capsule_fontWeight_fontWeight
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Bolder");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_1000
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as 0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1000', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 0;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_1100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as -10
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_1200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as 10000
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 10000;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_1300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Weight_1400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.weight as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_1400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontWeight_number": progress_capsule_fontWeight_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.weight));
      expect(obj.$attrs.capsuleStyle.font.weight).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Style_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.font.style
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Style_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.style as FontStyle.Italic
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Italic;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Italic");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Style_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.style as FontStyle.Normal
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Normal;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Style_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.style as null
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Font_Style_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.font.style as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontStyle_fontStyle": progress_capsule_fontStyle_fontStyle
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.font.style));
      expect(obj.$attrs.capsuleStyle.font.style).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.fontColor
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      let newJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_number = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_number": progress_capsule_fontColor_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as '#FFFF9535'
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = '#FFFF9535';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as Color.Red
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] start");
      let newJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_color = Color.Red;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_color": progress_capsule_fontColor_color
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as ohos_id_color_connected
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] start");
      let newJson = getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(newJson));


      let progress_capsule_fontColor_resource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({name:'progress_capsule_fontColor_resource',value:progress_capsule_fontColor_resource});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objJudge.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as 'abcdefghijk'
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = 'abcdefghijk';
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_FontColor_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_fontColor_string": progress_capsule_fontColor_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      let strJsonDefault = getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objDefault = JSON.parse(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.fontColor));
      expect(obj.$attrs.capsuleStyle.fontColor).assertEqual(objDefault.$attrs.capsuleStyle.fontColor);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.content
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] start");
      let newJson = getInspectorByKey('progress_capsule_showDefaultPercentage_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as '下载'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '下载';
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("下载");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as '继续'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '继续';
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("继续");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as '安装中'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '安装中';
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("安装中");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as '打开'
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '打开';
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("打开");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0600
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as ''
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '';
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0700
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as null
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = null;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_Content_0800
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.fontColor as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_Content_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] start");
      let newJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = undefined;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_capsule_content_string": progress_capsule_content_string,
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.$attrs.capsuleStyle.content));
      expect(obj.$attrs.capsuleStyle.content).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableScanEffect_boolean": progress_capsule_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.enableScanEffect));
      expect(obj.$attrs.capsuleStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of capsuleStyle.showDefaultPercentage
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " + JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.showDefaultPercentage as true
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.showDefaultPercentage as false
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.showDefaultPercentage as null
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of capsuleStyle.showDefaultPercentage as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_showDefaultPercentage_boolean": progress_capsule_showDefaultPercentage_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(obj.$attrs.capsuleStyle.showDefaultPercentage));
      expect(obj.$attrs.capsuleStyle.showDefaultPercentage).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] end");
      done();
    });


    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_BackgroundColor_0100
     * @tc.name      Tests the backgroundColor property of the progress ring component
     * @tc.desc      Get the default value of backgroundColor
     */
    it('ArkUI_Stage_Progress_Ring_BackgroundColor_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      let newJsonDefault = getInspectorByKey('progress_ring_default_default');
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefault = JSON.parse(newJsonDefault);

      let strColor = JSON.stringify(objDefault.$attrs.backgroundColor);
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + strColor);

      let finalResult = "#08" + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Get the default value of ringStyle.strokeWidth
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 10
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 10vp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '10vp';
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0400
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] start");
      let newJson = getInspectorByKey('progress_ring_resource');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(newJson));


      let progress_ring_strokeWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({name:'progress_ring_strokeWidth_resource',value:progress_ring_strokeWidth_resource});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual(objJudge.$attrs.ringStyle.strokeWidth);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0500
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 20px
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20px';
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00px");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0600
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 20vp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20vp';
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0700
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 20fp
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20fp';
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0800
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 20lpx
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] start");
      let newJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20lpx';
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_string": progress_ring_strokeWidth_string
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("20.00lpx");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_0900
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_0900', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 0;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_1000
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as -10
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1000', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_1100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as 10000
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10000;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_1200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as null
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = null;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_StrokeWidth_1300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.strokeWidth as undefined
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_1300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = undefined;
      try {
        var eventData = {
          data: {
            "progress_ring_strokeWidth_number": progress_ring_strokeWidth_number
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.$attrs.ringStyle.strokeWidth));
      expect(obj.$attrs.ringStyle.strokeWidth).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Shadow_0100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Get the default value of ringStyle.shadow
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Shadow_0200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.shadow as true
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = true;
      try {
        var eventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Shadow_0300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.shadow as false
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = false;
      try {
        var eventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Shadow_0400
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.shadow as null
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = null;
      try {
        var eventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Shadow_0500
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.shadow as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = undefined;
      try {
        var eventData = {
          data: {
            "progress_ring_shadow_bool": progress_ring_shadow_bool
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.$attrs.ringStyle.shadow));
      expect(obj.$attrs.ringStyle.shadow).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Status_0100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Get the default value of ringStyle.status
     */
    it('ArkUI_Stage_Progress_Ring_Status_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Status_0200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.status as ProgressStatus.LOADING
     */
    it('ArkUI_Stage_Progress_Ring_Status_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.LOADING;
      try {
        var eventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.LOADING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Status_0300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.status as ProgressStatus.PROGRESSING
     */
    it('ArkUI_Stage_Progress_Ring_Status_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.PROGRESSING;
      try {
        var eventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Status_0400
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.status as null
     */
    it('ArkUI_Stage_Progress_Ring_Status_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = null;
      try {
        var eventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Status_0500
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.status as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Status_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = undefined;
      try {
        var eventData = {
          data: {
            "progress_ring_status_progressStatus": progress_ring_status_progressStatus
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Status_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.$attrs.ringStyle.status));
      expect(obj.$attrs.ringStyle.status).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0100
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefaultColorBegin = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(newJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0200
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0300
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] start");
      let newJson = getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_number',value:progress_ring_color_linear_number});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0400
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] start");
      let newJson = getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_string',value:progress_ring_color_linear_string});
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0500
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] start");
      let newJson = getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_color',value:progress_ring_color_linear_color});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0600
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_0600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] start");
      let newJson = getInspectorByKey('progress_ring_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_resource',value:progress_ring_color_linear_resource});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      let finalResult = "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0700
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_0700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] start");
      let newJson = getInspectorByKey('progress_ring_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_0800
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_0800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] start");
      let newJson = getInspectorByKey('progress_ring_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1100
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_1100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefaultColorBegin = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(newJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1200
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_1200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1300
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_1300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(newJson));
     


      let progress_ring_color_linear_number = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_number',value:progress_ring_color_linear_number })
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1400
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_1400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_string',value:progress_ring_color_linear_string})
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1500
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_1500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_color',value:progress_ring_color_linear_color})
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1600
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_1600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_resource',value:progress_ring_color_linear_resource})
      await Utils.sleep(2000);


      let strJson = getInspectorByKey('progress_linear_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      let finalResult = "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1700
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_1700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_1800
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_1800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] start");
      let newJson = getInspectorByKey('progress_linear_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2100
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_2100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] start");
      let newJson = getInspectorByKey('progress_eclipse_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefaultColorBegin = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(newJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2200
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_2200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2300
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_2300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_number',value:progress_ring_color_linear_number});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2400
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_2400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_string',value:progress_ring_color_linear_string});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2500
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_2500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_color',value:progress_ring_color_linear_color});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2600
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_2600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]);

      globalThis.value.message.notify({name:'progress_ring_color_linear_resource',value:progress_ring_color_linear_resource});

      await Utils.sleep(2000);



      let strJson = getInspectorByKey('progress_eclipse_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      let finalResult = "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2700
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_2700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_2800
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_2800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] start");
      let newJson = getInspectorByKey('progress_eclipse_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3100
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_3100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefaultColorBegin = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(newJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3200
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_3200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3300
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_3300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]);

      globalThis.value.message.notify({name:'progress_ring_color_linear_number',value:progress_ring_color_linear_number});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3400
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_3400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]);

      globalThis.value.message.notify({name:'progress_ring_color_linear_string',value:progress_ring_color_linear_string});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3500
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_3500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_color',value:progress_ring_color_linear_color});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3600
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_3600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]);

      globalThis.value.message.notify({name:'progress_ring_color_linear_resource',value:progress_ring_color_linear_resource});


      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      let finalResult = "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3700
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_3700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_3800
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_3800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4100
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Get the default value of color
     */
    it('ArkUI_Stage_Progress_Ring_Color_4100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] start");
      let newJson = getInspectorByKey('progress_capsule_color_default');
      let newJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      let objDefaultColorBegin = JSON.parse(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(newJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4200
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as 0xFFFF0000
     */
    it('ArkUI_Stage_Progress_Ring_Color_4200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] start");
      let newJson = getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000;
      try {
        var eventData = {
          data: {
            "progress_ring_color_purity": progress_ring_color_purity
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4300
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_4300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{color: 0xFFFF0000, offset: 0}, {color: 0xFFFFFFFF, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_number',value:progress_ring_color_linear_number});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4400
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_4400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{color: '#FFFF9A35', offset: 0}, {color: '#FFFFFFFF', offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_string',value:progress_ring_color_linear_string});
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4500
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_4500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{color: Color.Red, offset: 0}, {color: Color.White, offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_color',value:progress_ring_color_linear_color});

      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4600
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as [{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]
     */
    it('ArkUI_Stage_Progress_Ring_Color_4600', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{color: $r('sys.color.ohos_id_color_connected'), offset: 0}, {color: $r('sys.color.ohos_id_color_background'), offset: 1}]);
      globalThis.value.message.notify({name:'progress_ring_color_linear_resource',value:progress_ring_color_linear_resource});
      
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_resource');
      let strJsonJudge = getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objJudge = JSON.parse(strJsonJudge);
      let finalResult = "[{\"color\":\"" + objJudge.$attrs.backgroundColor + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objJudge.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4700
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as null
     */
    it('ArkUI_Stage_Progress_Ring_Color_4700', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = null
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_null": progress_ring_color_linear_null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_null');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_Color_4800
     * @tc.name      Tests the color property of the progress ring component
     * @tc.desc      Set the value of color as undefined
     */
    it('ArkUI_Stage_Progress_Ring_Color_4800', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] start");
      let newJson = getInspectorByKey('progress_capsule_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        var eventData = {
          data: {
            "progress_ring_color_linear_undefined": progress_ring_color_linear_undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_Color_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_color_linear_undefined');
      let strJsonDefaultColorBegin = getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      let objDefaultColorBegin = JSON.parse(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parse(strJsonDefaultColorEnd);
      let finalResult = "[{\"color\":\"" + objDefaultColorEnd.$attrs.color + "\",\"offset\":\"0.000000\"},{\"color\":\"" + objDefaultColorBegin.$attrs.color + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(obj.$attrs.progressGradientColor));
      expect(obj.$attrs.progressGradientColor).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableScanEffect_0100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Get the default value of ringStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableScanEffect_0200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableScanEffect_0300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableScanEffect_0400
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableScanEffect_0500
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of ringStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_ring_enableScanEffect_boolean": progress_ring_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.ringStyle));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.ringStyle.enableScanEffect));
      expect(obj.$attrs.ringStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableScanEffect_0100
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Get the default value of linearStyle.enableScanEffect
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableScanEffect_0200
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of linearStyle.enableScanEffect as true
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableScanEffect_0300
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of linearStyle.enableScanEffect as false
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableScanEffect_0400
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of linearStyle.enableScanEffect as null
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableScanEffect_0500
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of linearStyle.enableScanEffect as undefined
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_linear_enableScanEffect_boolean": progress_linear_enableScanEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.linearStyle));
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(obj.$attrs.linearStyle.enableScanEffect));
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500
     * @tc.name      Tests the ringStyle property of the progress ring component
     * @tc.desc      Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_ring_enableSmoothEffect_boolean": progress_ring_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500
     * @tc.name      Tests the linearStyle property of the progress linear component
     * @tc.desc      Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_linear_enableSmoothEffect_boolean": progress_linear_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500
     * @tc.name      Tests the capsuleStyle property of the progress capsule component
     * @tc.desc      Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_capsule_enableSmoothEffect_boolean": progress_capsule_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100
     * @tc.name      Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc      Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200
     * @tc.name      Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc      Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300
     * @tc.name      Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc      Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400
     * @tc.name      Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc      Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500
     * @tc.name      Tests the scaleRingStyle property of the progress scaleRing component
     * @tc.desc      Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_scaleRing_enableSmoothEffect_boolean": progress_scaleRing_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100
     * @tc.name      Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc      Get the default value of enableSmoothEffect
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] start");
      let newJson = getInspectorByKey('progress_eclipse_color_default');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200
     * @tc.name      Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc      Set the value of enableSmoothEffect as true
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = true;
      try {
        var eventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300
     * @tc.name      Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc      Set the value of enableSmoothEffect as false
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = false;
      try {
        var eventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400
     * @tc.name      Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc      Set the value of enableSmoothEffect as null
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = null;
      try {
        var eventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500
     * @tc.name      Tests the eclipseStyle property of the progress eclipse component
     * @tc.desc      Set the value of enableSmoothEffect as undefined
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500', 0, async function (done) {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] start");
      let newJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = undefined;
      try {
        var eventData = {
          data: {
            "progress_eclipse_enableSmoothEffect_boolean": progress_eclipse_enableSmoothEffect_boolean
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(obj.$attrs.enableSmoothEffect));
      expect(obj.$attrs.enableSmoothEffect).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] end");
      done();
    });
  })
}
