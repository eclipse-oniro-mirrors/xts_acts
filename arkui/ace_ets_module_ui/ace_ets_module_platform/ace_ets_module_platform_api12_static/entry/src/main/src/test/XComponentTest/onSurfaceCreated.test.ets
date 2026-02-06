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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

export default function onSurfaceCreatedJsunit() {
  describe('onSurfaceCreatedJsunit', () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("onSurfaceCreated beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/onSurfaceCreated",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onSurfaceCreated state pages: " + JSON.stringify(pages));
        if (!("onSurfaceCreated" == pages.name)) {
          console.info("get onSurfaceCreated state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onSurfaceCreated page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   onSurfaceCreatedTest_static_0010
     * @tc.name     onSurfaceCreatedTest_static_0010
     * @tc.desc     onSurfaceCreatedTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('onSurfaceCreatedTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSurfaceCreatedTest_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.id('onSurfaceCreated_text')) as Promise<Component>);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onSurfaceCreated_text');
      console.info("[onSurfaceCreatedTest_static_0010] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onSurfaceCreated succ');
      console.info('[onSurfaceCreatedTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   onSurfaceChangedTest_static_0020
     * @tc.name     onSurfaceChangedTest_static_0020
     * @tc.desc     onSurfaceChangedTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('onSurfaceChangedTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSurfaceChangedTest_static_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await (driver.findComponent(ON.id('onSurfaceChanged_button')) as Promise<Component>);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await (driver.findComponent(ON.id('onSurfaceChanged_text')) as Promise<Component>);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onSurfaceChanged_text');
      console.info("[onSurfaceChangedTest_static_0020] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onSurfaceChanged succ');
      console.info('[onSurfaceChangedTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   onSurfaceDestroyedTest_static_0030
     * @tc.name     onSurfaceDestroyedTest_static_0030
     * @tc.desc     onSurfaceDestroyedTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('onSurfaceDestroyedTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSurfaceDestroyedTest_static_0030 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await (driver.findComponent(ON.id('onSurfaceDestroyed_button')) as Promise<Component>);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await (driver.findComponent(ON.id('onSurfaceDestroyed_text')) as Promise<Component>);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onSurfaceDestroyed_text');
      console.info("[onSurfaceDestroyedTest_static_0030] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onSurfaceDestroyed succ');
      console.info('[onSurfaceDestroyedTest_static_0030] END');
      done();
    });
  })
}

