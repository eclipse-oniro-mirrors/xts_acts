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

export default function CloseCustomDialogTest() {
  describe('CloseCustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CloseCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/customDialog/UIContext/CloseCustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CloseCustomDialogTest state pages:" + JSON.stringify(pages));
        if (!("CloseCustomDialog" == pages.name)) {
          console.info("get CloseCustomDialogTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CloseCustomDialogTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CloseCustomDialogTest page error:" + err);
      }
      console.info("CloseCustomDialogTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CloseCustomDialogTest after each called");
    });

    /**
     * @tc.number    CloseCustomDialogTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('CloseCustomDialogTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[CloseCustomDialogTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(3000);
      let CloseCustomDialog = getInspectorByKey('CloseCustomDialog');
      console.info('return log-----' + JSON.parse(CloseCustomDialog).$attrs.content);
      expect(JSON.parse(CloseCustomDialog).$attrs.content).assertEqual('CloseCustomDialog');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[CloseCustomDialogTest_001] END');
      done();
    });
  })
}
