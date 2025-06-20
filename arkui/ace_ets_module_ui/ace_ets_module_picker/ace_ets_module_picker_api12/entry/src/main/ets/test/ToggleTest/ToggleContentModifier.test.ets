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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function ToggleContentModifier() {
  describe('ToggleContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleContentModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleContentModifier state success " + JSON.stringify(pages));
        if (!("ToggleContentModifier" == pages.name)) {
          console.info("get ToggleContentModifier state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleContentModifier page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleContentModifier page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleContentModifier after each called");
    });


    /*
    * @tc.number      ToggleContentModifier_001
    * @tc.name        ToggleContentModifier_001
    * @tc.desc        Test triggerChange to trigger a switch selection status change
    * @tc.level       Level 2
    */
    it('ToggleContentModifier_001', Level.LEVEL2, async (done: Function) => {
      console.info('[ToggleContentModifier_001] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('ToggleContentModifier_text');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[ToggleContentModifier_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('false');

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ToggleContentModifier_true'));
      await btn1.click()
      await Utils.sleep(1000);

      let strJson2 = getInspectorByKey('ToggleContentModifier_text');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[ToggleContentModifier_001] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('true');

      console.info('[ToggleContentModifier_001] END');
      done();
    });
  })
}


