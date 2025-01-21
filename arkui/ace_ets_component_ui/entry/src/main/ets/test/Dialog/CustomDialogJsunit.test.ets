/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';


export default function CustomDialogAJsunit() {
  describe('CustomDialogAJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Dialog/CustomDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("CustomDialog" == pages.name)) {
          console.info("get CustomDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogAJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    // it('CustomDialogAJsunit_0100', 0, async (done: Function) => {
    //
    //   console.info('CustomDialogAJsunit_0100 START');
    //   let driver = await UiDriver.create()
    //   let button = await driver.findComponent(BY.key('Custom_Dialog_A'));
    //   await button.click();
    //   await CommonFunc.sleep(1000);
    //   let strJson = getInspectorByKey('Custom_Dialog_A');
    //   let obj: ESObject = JSON.parse(strJson);
    //   console.info("[CustomDialogAJsunit_0100] component obj is: " + JSON.stringify(obj));
    //   expect(obj.$attrs.label).assertEqual("confirm");
    //   console.info('[CustomDialogAJsunit_0100] END');
    //   await driver.pressBack();
    //   done();
    // });
    it('CustomDialogAJsunit_0100', 0, async (done: Function) => {

      console.info('CustomDialogAJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Custom_Dialog_B'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Custom_Dialog_B');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CustomDialogAJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("CustomDialog按esc弹窗逐层退出");
      console.info('[CustomDialogAJsunit_0200] END');
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
