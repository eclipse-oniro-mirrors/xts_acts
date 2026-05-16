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
export default function RepeatLazyTest0150() {
  describe('RepeatLazyTest0150', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatLazyTest0150 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/repeat/RepeatLazy0150",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatLazy0150" == pages.name)) {
          console.info("get RepeatLazyTest0150 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatLazyTest0150 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatLazyTest0150 page error:" + err);
      }
      console.info("RepeatLazyTest0150 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatLazyTest0150 after each called");
    });

    /**
     * @tc.name   RepeatLazyTest0150_001
     * @tc.number RepeatLazyTest0150
     * @tc.desc   Persistently store UI related data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatLazyTest0150_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatLazyTest0150_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnRepeatLazy0150"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item_0'))
      expect(text != null).assertTrue()
      console.info('[RepeatLazyTest0150_001] END');
      done();
    });
  })
}
