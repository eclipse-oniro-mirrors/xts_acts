/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridRepeatTrue() {
  describe('gridRepeatTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("gridRepeatTrue beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/emptyBranch/gridRepeatTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridRepeatTrue state pages:" + JSON.stringify(pages));
        if (!("gridRepeatTrue" == pages.name)) {
          console.info("get gridRepeatTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridRepeatTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridRepeatTrue page error:" + err);
      }
      console.info("gridRepeatTrue beforeEach end");
      done();
    });
    /**
     * @tc.name   gridRepeatTrue_0100
     * @tc.number gridRepeatTrue_0100
     * @tc.desc   set Grid Repeat supportEmptyBranchInLazyLoading to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridRepeatTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[gridRepeatTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let onText1 = await driver.findComponent(ON.id('grid_repeat_true_7'));
      console.info("[gridRepeatTrue_0100] onText1 is: " + onText1);
      expect(onText1).assertEqual(null);

      let gridItem0 = CommonFunc.getComponentRectOnScreen('grid_repeat_true_4');
      let left = gridItem0.left;
      let right = gridItem0.right;
      console.info("gridRepeatTrue_0100 value is" + left + " --" + right);
      let width = right - left;
      console.info("[gridRepeatTrue_0100] gridItem0 width is: " + width);
      let gridItem1 = CommonFunc.getComponentRectOnScreen('grid_repeat_true_6');
      console.info("[gridRepeatTrue_0100] gridItem1 right is: " + gridItem1.right);
      let gridItem2 = CommonFunc.getComponentRectOnScreen('grid_repeat_true_8');
      console.info("[gridRepeatTrue_0100] gridItem2 left is: " + gridItem2.left);
      expect(Math.floor(Math.abs(gridItem2.left - gridItem1.right - width)) <= 1).assertTrue();
      console.info('[gridRepeatTrue_0100] END');
      done();
    });
  })
}
