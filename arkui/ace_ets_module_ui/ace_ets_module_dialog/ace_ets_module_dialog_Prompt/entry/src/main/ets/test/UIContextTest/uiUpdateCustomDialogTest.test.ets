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
export default function uiUpdateCustomDialogTest() {
  describe('uiUpdateCustomDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("uiUpdateCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/updateCustomDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uiUpdateCustomDialogTest state pages: " + JSON.stringify(pages));
        if (!("updateCustomDialog" == pages.name)) {
          console.info("get uiUpdateCustomDialogTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uiUpdateCustomDialogTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiUpdateCustomDialogTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    updateCustomDialog
     * @tc.name      uiUpdateCustomDialogTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('uiUpdateCustomDialogTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uiUpdateCustomDialogTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(4500);
      let updateCustomDialog = getInspectorByKey('updateCustomDialog');
      console.info("[uiUpdateCustomDialogTest_0100] attrs is: " + JSON.stringify(JSON.parse(updateCustomDialog).$attrs));
      expect(JSON.parse(updateCustomDialog).$attrs.content).assertEqual('updateCustomDialog');
      console.info('[uiUpdateCustomDialogTest_0100] END');
      done();
    });
  })
}