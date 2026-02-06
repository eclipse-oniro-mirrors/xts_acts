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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function Rawfile0140() {
  describe('Rawfile0140', () => {
    beforeEach(async (done: Function) => {
      console.info("Rawfile0140 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/useRes/Rawfile0140",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ReuseV20030" == pages.name)) {
          console.info("get Rawfile0140 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Rawfile0140 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Rawfile0140 page error:" + err);
      }
      console.info("Rawfile0140 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Rawfile0140 after each called");
    });

    /**
     * @tc.number    Rawfile0140
     * @tc.name      Rawfile0140_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('Rawfile0140_001', Level.LEVEL3, async (done: Function) => {
      console.info('[Rawfile0140_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('id1'))).getText();
      let text_2 = await (await driver.findComponent(ON.id('id2'))).getText();
      let text_3 = await (await driver.findComponent(ON.id('id3'))).getText();
      let text_4 = await (await driver.findComponent(ON.id('id4'))).getText();
      console.info("[Rawfile0140_001] component text_1 is: " + text_1);
      console.info("[Rawfile0140_001] component text_2 is: " + text_2);
      console.info("[Rawfile0140_001] component text_3 is: " + text_3);
      console.info("[Rawfile0140_001] component text_4 is: " + text_4);
      expect(text_1).not().assertEqual('-1');
      expect(text_1).assertEqual(text_2);
      expect(text_3).not().assertEqual('-1');
      expect(text_3).assertEqual(text_4);
      await CommonFunc.sleep(1000);
      console.info('[Rawfile0140_001] END');
      done();
    });
  })
}
