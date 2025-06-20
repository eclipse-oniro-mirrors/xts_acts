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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function repeatReusableFalse() {
  describe('repeatReusableFalse', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatreusablefalse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Reusable/repeatReusableFalse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("repeatReusableFalse" == pages.name)) {
          console.info("get repeatReusableFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatReusableFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatReusableFalse page error:" + err);
      }
      console.info("repeatReusableFalse beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatReusableFalse after each called");
    });

    /**
     * @tc.number    repeatreusablefalse
     * @tc.name      repeatreusablefalse_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('repeatreusablefalse_001', Level.LEVEL0, async (done: Function) => {
      console.info('[repeatreusablefalse_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("reusablefalse"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('[a] index99: item_99'))
      expect(text != null).assertTrue()
      console.info('[repeatreusablefalse_001] END');
      done();
    });
  })
}

