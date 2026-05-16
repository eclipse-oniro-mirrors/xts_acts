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
import Utils from '../../MainAbility/common/Utils'

export default function datePickerPropertiesModifierTest() {
  describe('datePickerPropertiesModifierTest', () => {
    beforeAll(async (done: Function) => {
      console.info("datePickerPropertiesModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/datePickerPropertiesModifier',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get datePickerPropertiesModifierTest state success " + JSON.stringify(pages));
        if (!("datePickerPropertiesModifier" == pages.name)) {
          console.info("get datePickerPropertiesModifierTest state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push datePickerPropertiesModifierTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push datePickerPropertiesModifierTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   datePickerPropertiesModifierTest_001
     * @tc.number datePickerPropertiesModifierTest_001
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerPropertiesModifierTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[datePickerPropertiesModifierTest_001] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datePickerPropertiesModifierTest_001] obj is : " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.lunar).assertEqual('true');
      console.info('[datePickerPropertiesModifierTest_001] END');
      done();
    });

    /**
     * @tc.name   datePickerPropertiesModifierTest_002
     * @tc.number datePickerPropertiesModifierTest_002
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerPropertiesModifierTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[datePickerPropertiesModifierTest_002] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datePickerPropertiesModifierTest_002] obj is : " + JSON.stringify(obj.$attrs));
      let selectedTextStyle: ESObject = obj.$attrs.selectedTextStyle;

      expect(selectedTextStyle['color']).assertEqual("#FF182431");
      expect(selectedTextStyle['font'].size).assertEqual("18.00fp");
      expect(selectedTextStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[datePickerPropertiesModifierTest_002] END');
      done();
    });

    /**
     * @tc.name   datePickerPropertiesModifierTest_003
     * @tc.number datePickerPropertiesModifierTest_003
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerPropertiesModifierTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[datePickerPropertiesModifierTest_003] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datePickerPropertiesModifierTest_003] obj is : " + JSON.stringify(obj.$attrs));
      let textStyle: ESObject = obj.$attrs.textStyle;

      expect(textStyle['color']).assertEqual("#FF0000FF");
      expect(textStyle['font'].size).assertEqual("26.00fp");
      expect(textStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[datePickerPropertiesModifierTest_003] END');
      done();
    });

    /**
     * @tc.name   datePickerPropertiesModifierTest_004
     * @tc.number datePickerPropertiesModifierTest_004
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerPropertiesModifierTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[datePickerPropertiesModifierTest_004] START');
      let strJson = getInspectorByKey('DatePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datePickerPropertiesModifierTest_004] obj is : " + JSON.stringify(obj.$attrs));
      let disappearTextStyle: ESObject = obj.$attrs.disappearTextStyle;

      expect(disappearTextStyle['color']).assertEqual('#FF000000');
      expect(disappearTextStyle['font'].size).assertEqual('8.00fp');
      expect(disappearTextStyle['font'].weight).assertEqual('FontWeight.Lighter');
      console.info('[datePickerPropertiesModifierTest_004] END');
      done();
    });
  })
}
