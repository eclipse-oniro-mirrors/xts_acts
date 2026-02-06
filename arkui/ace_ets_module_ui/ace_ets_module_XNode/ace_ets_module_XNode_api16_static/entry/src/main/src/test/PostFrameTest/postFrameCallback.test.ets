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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test';

export default function postFrameCallbackTest() {
  describe('postFrameCallbackTest', () => {
      beforeAll(() => {
        console.info("postFrameCallbackTest beforeEach start");
        await UtilsTest.msSleep(4000)
        await startAbility("com.arkui.ace.XNode.api16.static", "EntryAbility")
        await UtilsTest.msSleep(4000)
      });
      beforeEach(async () => {
        console.info("postFrameCallbackTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/PostFrame/postFrameCallbackTest',
        }
        try {
          const router = AppStorage.get<Router>("router") as Router
          router.clear();
          let pages = router.getState();
          console.info("get postFrameCallbackTest state pages:" + JSON.stringify(pages));
          if (!("postFrameCallbackTest" == pages.name)) {
            console.info("get postFrameCallbackTest pages.name:" + JSON.stringify(pages.name));
            //let result = await router.pushUrl(options);
            router.pushUrl(options);
            await CommonFunc.sleep(2000);
            //console.info("push postFrameCallbackTest page result:" + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push postFrameCallbackTest page error:" + err);
        }
        console.info("postFrameCallbackTest beforeEach end");
      });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('postFrameCallbackTest after each called');
    });

    
    



    /**
     * @tc.number   postFrameCallbackTest_static_0100
     * @tc.name     postFrameCallbackTest_static_0100
     * @tc.desc     postFrameCallbackTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('postFrameCallbackTest_static_0100', Level.LEVEL0, async (done: () => void) => {

      console.info('postFrameCallbackTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('postFrameCallback_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('postDelayedFrameCallback_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_id'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('postFrameCallback_value_id'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button5 = await driver.findComponent(ON.id('postDelayedFrameCallback_value_id'));
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button6 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_value_id'));
      await (button6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('result1_id');
      let strJson2: string = inspector.getInspectorByKey('result2_id');
      let strJson3: string = inspector.getInspectorByKey('result3_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[postFrameCallbackTest_static_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[postFrameCallbackTest_static_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[postFrameCallbackTest_static_0100] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('normTask');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('delayTask');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('delayTask');
      console.info('[postFrameCallbackTest_static_0100] END');
      done();
    });

  })
}