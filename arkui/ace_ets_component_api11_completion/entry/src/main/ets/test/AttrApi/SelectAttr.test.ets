/**
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from "../../MainAbility/common/Common";
import { Driver, ON, MouseButton } from '@ohos.UiTest';


export default function SelectAttr() {
  describe('SelectAttr', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttrApi/SelectAttr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectAttr state success " + JSON.stringify(pages));
        if (!("SelectAttr" == pages.name)) {
          console.info("get SelectAttr state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push SelectAttr page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectAttr page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SelectAttr after each called");
    });


    /*
    * @tc.number      SelectAttr_001
    * @tc.name        SelectAttr_001
    * @tc.desc        SelectAttr OptionWidthMode.FIT_TRIGGER test
    * @tc.level       Level 2
    */
    it('SelectAttr_001', 0, async (done: Function) => {
      console.info('[SelectAttr_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('SelectAttr_Select'));
      await btn1.click()
      await Utils.sleep(3000);

      let strJson1 = getInspectorByKey('SelectAttr_Select');
      let obj1 = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SelectAttr_001] obj1 is: " + JSON.stringify(obj1));

      let obj2 = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(1000);
      console.info("[SelectAttr_001] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$children[1].$children[0].$attrs.width).assertEqual(obj1.$attrs.width);
      console.info('[SelectAttr_001] END');
      done();
    });
  })
}


