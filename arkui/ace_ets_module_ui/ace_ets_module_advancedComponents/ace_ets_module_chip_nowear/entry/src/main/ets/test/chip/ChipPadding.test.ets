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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ChipPadding() {
  describe('ChipPadding', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipPadding beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chip/ChipPadding",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipPadding" == pages.name)) {
          console.info("get ChipPadding pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipPadding page error:" + err);
      }
      console.info("ChipPadding beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipPadding after each called");
    });

    /**
     * @tc.name   ChipPadding_001
     * @tc.number ChipPadding_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ChipPadding_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ChipPadding_001] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = getInspectorTree();
      let chip0Padding: ESObject = JSON.parse(result.$children[0].$children[0].$children[0].$attrs.padding);
      await CommonFunc.sleep(1000);
      let test1: string = chip0Padding.top;
      let test2: string = chip0Padding.bottom;
      let test3: string = chip0Padding.left;
      let test4: string = chip0Padding.right;
      console.log("ChipPadding_001 test1:", test1," test2: ", test2, " test3: ", test3, " test4: ", test4 )
      expect(test1).assertEqual('20.00px');
      expect(test2).assertEqual('30.00px');
      expect(test3).assertEqual('20.00px');
      expect(test4).assertEqual('30.00px');
      console.info('[ChipPadding_001] END');
      done();
    });

  })
}