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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function srcIndexTest() {
  describe('srcIndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info("srcIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Matrix/srcIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get srcIndexTest state pages:" + JSON.stringify(pages));
        if (!("srcIndex" == pages.name)) {
          console.info("get srcIndexTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push srcIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push srcIndexTest page error:" + err);
      }
      console.info("srcIndexTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("srcIndexTest after each called");
    });

    /**
     * @tc.number    srcIndexTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('srcIndexTest_001', 0, async (done: Function) => {
      console.info('[srcIndexTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let img = await driver.findComponent(ON.id('img'));
      await CommonFunc.sleep(1000);
      let rect = await img.getBounds();
      await CommonFunc.sleep(1000);
      let width1 = rect.right - rect.left
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(3000);
      let width2 = rect.right - rect.left
      console.info('width1: ' + width1);
      console.info('width2: ' + width2);
      expect(Math.abs(width1 - width2) <= 1).assertTrue();
      console.info('[srcIndexTest_001] END');
      done();
    });
  })
}
