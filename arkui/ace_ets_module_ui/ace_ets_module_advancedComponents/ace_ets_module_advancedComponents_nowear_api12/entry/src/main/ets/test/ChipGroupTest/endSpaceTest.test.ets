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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function endSpaceTest() {
  describe('endSpaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("endSpaceTest beforeEach end");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/endSpace",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get endSpaceTest state pages: " + JSON.stringify(pages));
        if (!("endSpace" == pages.name)) {
          console.info("get endSpaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push endSpaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push endSpaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    endSpaceTest_0100
     * @tc.name      endSpaceTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('endSpaceTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('endSpaceTest_0100 end');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let change: Component = await driver.findComponent(ON.id('change'));
      await change.click();
      await CommonFunc.sleep(1000);
      let get: Component = await driver.findComponent(ON.id('get'));
      await get.click();
      await CommonFunc.sleep(1000);
      let endSpace = getInspectorByKey('endSpace');
      console.info("[endSpaceTest_0100] attrs is: " + JSON.stringify(JSON.parse(endSpace).$attrs));
      expect(JSON.parse(endSpace).$attrs.content).assertEqual('endSpace:30');
      console.info('[endSpaceTest_0100] END');
      done();
    });
  })
}
