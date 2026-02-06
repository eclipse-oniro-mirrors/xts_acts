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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function GridIndexTest() {
  describe('GridIndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridIndexTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridIndexTest  state pages:" + JSON.stringify(pages));
        if (!("GridIndex" == pages.name)) {
          console.info("get GridIndexTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/GridIndex"})
          await CommonFunc.sleep(2000);
          console.info("push GridIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridIndexTest page error:" + err);
      }
      console.info("GridIndexTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridIndexTest after each called");
    });

    /**
     * @tc.name   GridIndexTest_0100
     * @tc.number SUB_ACE_GridIndexTest_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridIndexTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[GridIndexTest_0100] START');
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
      console.info('[GridIndexTest_0100] END');
      done();
    });

  })
}
