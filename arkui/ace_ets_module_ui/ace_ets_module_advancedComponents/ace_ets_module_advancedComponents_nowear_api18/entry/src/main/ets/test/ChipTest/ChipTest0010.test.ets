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

export default function ChipTest0010() {
  describe('ChipTest0010', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/ChipPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Chip0010" == pages.name)) {
          console.info("get ChipTest0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipTest0010 page error:" + err);
      }
      console.info("ChipTest0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipTest0010 after each called");
    });

    /**
     * @tc.number    ChipTest0010_001
     * @tc.name      ChipTest0010_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ChipTest0010_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ChipTest0010_001] START');
      await CommonFunc.sleep(1000);

      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]

      console.info("[ChipTest0010_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.$attrs.accessibilityLevel));
      expect(btn0.$attrs.accessibilityLevel).assertEqual('yes');

      console.info('[ChipTest0010_001] END');
      done();
    });

  })
}