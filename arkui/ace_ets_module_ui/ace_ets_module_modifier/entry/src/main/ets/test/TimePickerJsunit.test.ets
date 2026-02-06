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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function timepickerJsunit() {
  describe('timePickerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("timepicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get timepicker state pages: " + JSON.stringify(pages));
        if (!("timePicker" == pages.name)) {
          console.info("get timepicker state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push timepicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_1000
     * @tc.name Test the properties of components
     * @tc.desc Set textStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_timepicker_1000', Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_1000] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');

      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_2000
     * @tc.name Test the properties of components
     * @tc.desc Set selectedTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_timepicker_2000', Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_2000] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_3000
     * @tc.name Test the properties of components
     * @tc.desc Set disappearTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_timepicker_3000', Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_3000] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF000000');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_4000
     * @tc.name Test the properties of components
     * @tc.desc Set useMilitaryTime values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_timepicker_4000', Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('timePickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_4000] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.useMilitaryTime).assertEqual('true');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_timepicker_5000
     * @tc.name Test the properties of components
     * @tc.desc change useMilitaryTime values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_timepicker_5000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUI_Stage_timepicker_5000 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJson = getInspectorByKey('timePickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_5000] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.useMilitaryTime).assertEqual('false');
      done();
    });

  })
}

