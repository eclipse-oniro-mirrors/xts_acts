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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function openCustomDialogTest() {
  describe('openCustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("openCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CustomDialog/UIContext/OpenCustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get openCustomDialogTest state pages:" + JSON.stringify(pages));
        if (!("OpenCustomDialog" == pages.name)) {
          console.info("get openCustomDialogTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push openCustomDialogTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push openCustomDialogTest page error:" + err);
      }
      console.info("openCustomDialogTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("openCustomDialogTest after each called");
    });

    /**
     * @tc.number    openCustomDialogTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('openCustomDialogTest_001', 0, async (done: Function) => {
      console.info('[openCustomDialogTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(3000);
      let OpenCustomDialog = getInspectorByKey('OpenCustomDialog');
      await CommonFunc.sleep(1000);
      console.info('return log-----' + JSON.parse(OpenCustomDialog).$attrs.content);
      expect(JSON.parse(OpenCustomDialog).$attrs.content).assertEqual('OpenCustomDialog');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[openCustomDialogTest_001] END');
      done();
    });
  })
}
