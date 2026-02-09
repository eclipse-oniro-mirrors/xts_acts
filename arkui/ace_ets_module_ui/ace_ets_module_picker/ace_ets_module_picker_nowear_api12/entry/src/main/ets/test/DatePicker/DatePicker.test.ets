/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../Utils/Utils';

export default function datePickerJsunit() {
  describe('ActsAceDatePickerTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePicker',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePicker" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push datePicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testDatePicker0021
     * @tc.number testDatePicker0021
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePicker0021', Level.LEVEL1, async (done: Function) => {
      console.info('[testDatePicker0021] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.lunar).assertEqual('true');
      console.info('[testDatePicker0021] END');
      done();
    });

    /**
     * @tc.name   testDatePicker0022
     * @tc.number testDatePicker0022
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePicker0022', Level.LEVEL1, async (done: Function) => {
      console.info('[testDatePicker0022] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.$attrs));
      let selectedTextStyle: ESObject = obj.$attrs.selectedTextStyle;

      expect(selectedTextStyle['color']).assertEqual("#FF182431");
      expect(selectedTextStyle['font'].size).assertEqual("18.00fp");
      expect(selectedTextStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker0022] END');
      done();
    });

    /**
     * @tc.name   testDatePicker0023
     * @tc.number testDatePicker0023
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePicker0023', Level.LEVEL1, async (done: Function) => {
      console.info('[testDatePicker0023] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.$attrs));
      let textStyle: ESObject = obj.$attrs.textStyle;

      expect(textStyle['color']).assertEqual("#FF0000FF");
      expect(textStyle['font'].size).assertEqual("26.00fp");
      expect(textStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker0023] END');
      done();
    });

    /**
     * @tc.name   testDatePicker0024
     * @tc.number testDatePicker0024
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePicker0024', Level.LEVEL1, async (done: Function) => {
      console.info('[testDatePicker0024] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.$attrs));
      let disappearTextStyle: ESObject = obj.$attrs.disappearTextStyle;

      expect(disappearTextStyle['color']).assertEqual('#FF000000');
      expect(disappearTextStyle['font'].size).assertEqual('8.00fp');
      expect(disappearTextStyle['font'].weight).assertEqual('FontWeight.Lighter');
      console.info('[testDatePicker0024] END');
      done();
    });
  })
}
