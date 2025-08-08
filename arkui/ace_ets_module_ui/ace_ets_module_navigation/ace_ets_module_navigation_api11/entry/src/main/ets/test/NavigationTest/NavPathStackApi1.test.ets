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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';



export default function NavPathStackApi1() {
  describe('NavPathStackApi1',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavPathStackApi1 state success " + JSON.stringify(pages));
        if (!("NavPathStackApi1" == pages.name)) {
          console.info("get NavPathStackApi1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavPathStackApi1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavPathStackApi1 page error: " + err);
      }
      done()
    });

    afterEach(async  () =>{
      await Utils.sleep(1000);
      console.info("NavPathStackApi1 after each called");
    });

    /*
     * @tc.number      NavPathStackApi1_001
     * @tc.name        NavPathStackApi1_001
     * @tc.desc        Navigation pushDestination test
     * @tc.level       Level 2
     */
    it('NavPathStackApi1_001',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[NavPathStackApi1_001] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavPathStackApi1_pushDestination'));
      await btn1.click()
      await Utils.sleep(2000);
      console.info("[NavPathStackApi1_001] btn1")

      let strJson: string = getInspectorByKey('NavPathStackApi1_text_pageOne');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[NavPathStackApi1_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('pageOne');

      console.info('[NavPathStackApi1_001] END');
      done();

    });
  })
}


