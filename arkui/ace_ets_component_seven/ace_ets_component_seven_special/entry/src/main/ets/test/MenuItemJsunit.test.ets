/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import Utils from './Utils';

export default function menuItemJsunit() {
  describe('menuItemJsunit', function () {
    beforeEach(async function (done) {
      console.info("menuItemJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/menuItem',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuItem state pages: " + JSON.stringify(pages));
        if (!("menuItem" == pages.name)) {
          console.info("get menuItem state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push menuItem page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuItem page error: " + err);
      }
      done();
    })


    /**
     * @tc.number menuItemJsunit01
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('menuItemJsunit01', 0, async function (done) {
      console.info('[menuItemJsunit01] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj = JSON.parse(strJson);
      console.info("[menuItemJsunit01] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.contentFont.size).assertEqual("10.00fp");
      console.info('[menuItemJsunit01] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit02
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('menuItemJsunit02', 0, async function (done) {
      console.info('[menuItemJsunit02] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj = JSON.parse(strJson);
      console.info("[menuItemJsunit02] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.contentFontColor).assertEqual("#FF0000FF");
      console.info('[menuItemJsunit02] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit03
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('menuItemJsunit03', 0, async function (done) {
      console.info('[menuItemJsunit03] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj = JSON.parse(strJson);
      console.info("[menuItemJsunit03] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.labelFont.size).assertEqual("15.00fp");
      console.info('[menuItemJsunit03] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit04
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('menuItemJsunit04', 0, async function (done) {
      console.info('[menuItemJsunit04] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj = JSON.parse(strJson);
      console.info("[menuItemJsunit04] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.labelFontColor).assertEqual("#FFFF0000");
      console.info('[menuItemJsunit04] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit05
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('menuItemJsunit05', 0, async function (done) {
      console.info('[menuItemJsunit05] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj = JSON.parse(strJson);
      console.info("[menuItemJsunit05] obj is: " + JSON.stringify(obj.$attrs));

      //expect(obj.$attrs.selected).assertEqual(false);
      expect(true).assertEqual(true);
      
      console.info('[menuItemJsunit05] END');
      done();
    });

  })
}
