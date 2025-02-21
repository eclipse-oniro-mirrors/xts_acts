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

export default function Grid_ReachStartAndEnd3() {
  describe('Grid_ReachStartAndEnd3', function () {
    beforeEach(async function (done) {
      console.info("Grid_ReachStartAndEnd3 beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd3 state pages:" + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd3 page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd3 beforeEach end");
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

      console.info("Grid_ReachStartAndEnd2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd3_0400
     * @tc.name      testGrid
     * @tc.desc      When initializing the Grid, an initialIndex of 0 will trigger an onReachStart event
     */
    it('Grid_ReachStartAndEnd3_0400', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd3_0400] START');
      let strJson = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj = JSON.parse(strJson)
      console.info("[Grid_ReachStartAndEnd3_0400] component obj is: " + JSON.stringify(obj))
      expect(obj.$attrs.content).assertEqual('onReachStart1');

      console.info('[Grid_ReachStartAndEnd3_0400] END');
      done();
    });


  })
}
