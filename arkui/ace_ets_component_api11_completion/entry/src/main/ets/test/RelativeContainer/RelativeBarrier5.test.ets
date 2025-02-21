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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeBarrier5() {
  describe('RelativeBarrier5', function () {
    beforeEach(async function (done) {
      console.info("RelativeBarrier5 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeBarrier5 state pages:" + JSON.stringify(pages));
        if (!("RelativeBarrier5" == pages.name)) {
          console.info("get  RelativeBarrier5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeBarrier5"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeBarrier5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeBarrier5 page error:" + err);
      }
      console.info("RelativeBarrier5 foreEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("RelativeBarrier5 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0320
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeBarrier5_001', 0, async function (done) {
      console.info('[RelativeBarrier5_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('addChild'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeBarrier5');
      let row1 = CommonFunc.getComponentRect('RelativeBarrier5Bt1');
      let row2 = CommonFunc.getComponentRect('RelativeBarrier5Bt2');
      let row3 = CommonFunc.getComponentRect('RelativeBarrier5Bt3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeBarrier5_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row3.left - rel.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      console.info('[RelativeBarrier5_001] END');
      done();
    });







  })
}
