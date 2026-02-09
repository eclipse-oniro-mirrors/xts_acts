'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function UIContextOnIdle() {
    describe('UIContextOnIdle', () => {
    beforeAll(() => {
      console.info("UIContextOnIdle beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("UIContextOnIdle beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/OnIdle/onIdleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get UIContextOnIdle state pages:" + JSON.stringify(pages));
        if (!("onIdleTest" == pages.name)) {
          console.info("get UIContextOnIdle pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIContextOnIdle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextOnIdle page error:" + err);
      }
      console.info("UIContextOnIdle beforeEach end");
    }); 

    
    
/**
     * @tc.number   onIdleTest_static_0100
     * @tc.name     onIdleTest_static_0100
     * @tc.desc     onIdleTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onIdleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('UIContextApi1_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id("OnIdle"))
      await CommonFunc.sleep(1000);
      await (btn!.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      await (btn!.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("OnIdleText"))
      console.info("UIContextApi1_static_0100 component obj is: " + JSON.stringify(obj))
      expect(obj.getElement('$attrs').getString('content')).assertEqual("OnIdle")
      done()
    });
  })
}