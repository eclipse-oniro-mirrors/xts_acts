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
export default function uiCloseCustomDialogTest() {
  describe('uiCloseCustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("uiCloseCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/closeCustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uiCloseCustomDialogTest state pages: " + JSON.stringify(pages));
        if (!("closeCustomDialog" == pages.name)) {
          console.info("get uiCloseCustomDialogTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uiCloseCustomDialogTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiCloseCustomDialogTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    closeCustomDialog
     * @tc.name      uiCloseCustomDialogTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('uiCloseCustomDialogTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uiCloseCustomDialogTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(3500);
      let closeCustomDialog = getInspectorByKey('closeCustomDialog');
      console.info("[uiCloseCustomDialogTest_0100] attrs is: " + JSON.stringify(JSON.parse(closeCustomDialog).$attrs));
      expect(JSON.parse(closeCustomDialog).$attrs.content).assertEqual('closeCustomDialog');
      console.info('[uiCloseCustomDialogTest_0100] END');
      done();
    });
  })
}