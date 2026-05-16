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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UpdateCustomDialogTest() {
  describe('UpdateCustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UpdateCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/customDialog/UIContext/UpdateCustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UpdateCustomDialogTest state pages:" + JSON.stringify(pages));
        if (!("UpdateCustomDialog" == pages.name)) {
          console.info("get UpdateCustomDialogTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UpdateCustomDialogTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UpdateCustomDialogTest page error:" + err);
      }
      console.info("UpdateCustomDialogTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UpdateCustomDialogTest after each called");
    });

    /**
     * @tc.number    UpdateCustomDialogTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('UpdateCustomDialogTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[UpdateCustomDialogTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(3000);
      let UpdateCustomDialog = getInspectorByKey('UpdateCustomDialog');
      console.info('return log-----' + JSON.parse(UpdateCustomDialog).$attrs.content);
      expect(JSON.parse(UpdateCustomDialog).$attrs.content).assertEqual('7');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[UpdateCustomDialogTest_001] END');
      done();
    });
  })
}
