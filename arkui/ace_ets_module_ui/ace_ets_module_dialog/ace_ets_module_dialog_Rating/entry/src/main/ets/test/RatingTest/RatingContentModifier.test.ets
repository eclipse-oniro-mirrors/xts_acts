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


export default function RatingContentModifier() {
  describe('RatingContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("RatingContentModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/RatingContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RatingContentModifier state success " + JSON.stringify(pages));
        if (!("RatingContentModifier" == pages.name)) {
          console.info("get RatingContentModifier state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RatingContentModifier page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RatingContentModifier page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RatingContentModifier after each called");
    });


    /*
    * @tc.number      RatingContentModifier_001
    * @tc.name        RatingContentModifier_001
    * @tc.desc        Test triggerChange for triggering rating changes
    * @tc.level       Level 2
    */
    it('RatingContentModifier_001', Level.LEVEL1, async (done: Function) => {
      console.info('[RatingContentModifier_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RatingContentModifier_btn'));
      await btn1.click()
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RatingContentModifier_text');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[RatingContentModifier_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Rating2');

      console.info('[RatingContentModifier_001] END');
      done();
    });
  })
}


