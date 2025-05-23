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
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function RepeatCloseReuseTest0110() {
  describe('RepeatCloseReuseTest0110', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatCloseReuseTest0110 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/repeat/RepeatCloseReuse0110",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatCloseReuse0110" == pages.name)) {
          console.info("get RepeatCloseReuseTest0110 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatCloseReuseTest0110 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatCloseReuseTest0110 page error:" + err);
      }
      console.info("RepeatCloseReuseTest0110 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatCloseReuseTest0110 after each called");
    });

    /**
     * @tc.number    RepeatCloseReuseTest0110
     * @tc.name      RepeatCloseReuseTest0110_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('RepeatCloseReuseTest0110_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatCloseReuseTest0110_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnRepeatCloseReuse0110"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item_49'))
      expect(text != null).assertTrue()
      console.info('[RepeatCloseReuseTest0110_001] END');
      done();
    });
  })
}
