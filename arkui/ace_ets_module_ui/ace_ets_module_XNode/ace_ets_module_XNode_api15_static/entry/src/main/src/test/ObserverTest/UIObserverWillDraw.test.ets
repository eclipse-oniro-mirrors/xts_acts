'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'

export default function UIObserverWillDrawTest() {
  describe('UIObserverWillDrawTest', () => {
    beforeAll(() => {
      console.info("UIObserverWillDrawTest beforeEach start");
      await startAbility("com.arkui.ace.XNode.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("UIObserverWillDrawTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/UIObserverWillDrawTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        router.pushUrl(options);
        console.info("get UIObserverWillDrawTest state pages:" + JSON.stringify(pages));
        if (!("UIObserverWillDrawTest" == pages.name)) {
          console.info("get UIObserverWillDrawTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push UIObserverWillDrawTest page error:" + err);
      }
      console.info("UIObserverWillDrawTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIObserverWillDrawTest after each called");
    });

    
    



    /**
     * @tc.number   UIObserverWillDrawTest_static_0100
     * @tc.name     UIObserverWillDrawTest_static_0100
     * @tc.desc     UIObserverWillDrawTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('UIObserverWillDrawTest_static_0100', Level.LEVEL2, async (done: ()=>void) => {

      console.info('UIObserverWillDrawTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('willDraw_on_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('willDraw_off_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('willDraw_value_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIObserverWillDrawTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[UIObserverWillDrawTest_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('WillDraw succ');
      console.info('[UIObserverWillDrawTest_0100] END');
      done();
    });

  })
}