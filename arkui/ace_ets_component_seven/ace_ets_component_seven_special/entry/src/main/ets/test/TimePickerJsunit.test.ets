/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Utils from './Utils';
import router from '@system.router';

export default function timepickerJsunit() {
  describe('ActsAceTimePickerTest', function () {
    beforeEach(async function (done) {
      console.info("timepicker beforeEach start");
      let options = {
        uri: 'MainAbility/pages/timePicker',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get timepicker state pages: " + JSON.stringify(pages));
        if (!("timepicker" == pages.name)) {
          console.info("get timepicker state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push timepicker page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push timepicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_1000
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Stage_timepicker_1000', 0, async function (done) {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_1000] obj is: " + JSON.stringify(obj.$attrs));

      let textStyle = obj.$attrs.textStyle;

      expect(textStyle.color).assertEqual('#FFFF0000');
      expect(textStyle.font.size).assertEqual('10.00px');
      expect(textStyle.font.weight).assertEqual('FontWeight.Normal');

      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_2000
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Stage_timepicker_2000', 0, async function (done) {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_2000] obj is: " + JSON.stringify(obj.$attrs));
      let selectedTextStyle = obj.$attrs.selectedTextStyle;

      expect(selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(selectedTextStyle.font.size).assertEqual('20.00px');
      expect(selectedTextStyle.font.weight).assertEqual('FontWeight.Bold');
      
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_3000
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Stage_timepicker_3000', 0, async function (done) {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_3000] obj is: " + JSON.stringify(obj.$attrs));

      let disappearTextStyle = obj.$attrs.disappearTextStyle;
     
      expect(disappearTextStyle.color).assertEqual('#FF000000');
      expect(disappearTextStyle.font.size).assertEqual('8.00fp');
      expect(disappearTextStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    
  })
}

