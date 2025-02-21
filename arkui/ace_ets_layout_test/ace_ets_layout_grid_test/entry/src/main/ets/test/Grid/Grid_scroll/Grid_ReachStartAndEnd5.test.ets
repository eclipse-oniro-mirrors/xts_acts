/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function Grid_ReachStartAndEnd5() {
  describe('Grid_ReachStartAndEnd5', function () {
    beforeEach(async function (done) {
      console.info("Grid_ReachStartAndEnd5 beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd5 state pages:" + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd5 page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd5 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      //router.back()
      // init the state
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('grid_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);

      console.info("Grid_ReachStartAndEnd5 after each called");
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd5_0300
     * @tc.name      testGrid
     * @tc.desc      Scroll to the end position to trigger the onReachEnd event, and slide to the start position to trigger the onReachStart event
     */
    it('Grid_ReachStartAndEnd5_0300', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd5_0300] START');
      let driver = Driver.create()
      let button1= await driver.findComponent(ON.id('Grid_ReachStartAndEnd_toBottom'))
      await button1.click()
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ReachStartAndEnd5_0300] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');

      let button2= await driver.findComponent(ON.id('Grid_ReachStartAndEnd_toTop'))
      await button2.click()
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ReachStartAndEnd5_0300] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd5_0300] END');
      done();
    });

  })
}
