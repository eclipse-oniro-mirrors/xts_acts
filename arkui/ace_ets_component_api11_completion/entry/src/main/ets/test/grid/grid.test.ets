/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function gridIndexTest() {
  describe('gridIndexTest', function () {
    beforeEach(async function (done) {
      console.info("gridIndexTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridIndexTest  state pages:" + JSON.stringify(pages));
        if (!("gridte" == pages.name)) {
          console.info("get gridIndexTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/grid/gridte"})
          await CommonFunc.sleep(2000);
          console.info("push gridIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridIndexTest page error:" + err);
      }
      console.info("gridIndexTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("gridIndexTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_gridIndexTest_0100
     * @tc.desc      test
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('gridIndexTest_0100', 0, async function (done) {
      console.info('[gridIndexTest_0100] START');
      await CommonFunc.sleep(2000);
      let btRight = CommonFunc.getComponentRect('index2');
      let right = btRight.right
      let btLeft = CommonFunc.getComponentRect('index2');
      let left = btLeft.left
      let width2 = Math.round(right -left)

      let btRight1 = CommonFunc.getComponentRect('index3');
      let right1 = btRight1.right
      let btLeft1 = CommonFunc.getComponentRect('index3');
      let left1 = btLeft1.left
      let width3 = Math.round(right1 -left1)
      expect(width2 + "").assertEqual(width3 + "")
      console.info('[gridIndexTest_0100] END');
      done();
    });

  })
}
