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
import router from '@ohos.router';
import { UIContext, AtomicServiceBar, Router, KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

interface optionsObj {
  uri: string
}

export default function getDragController() {
  describe('getDragController', () => {
    beforeAll(() => {
      console.info("getDragController beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.UIContext.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("getDragController beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/UIContext/getDragController',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router" ) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get getDragController state pages:" + JSON.stringify(pages.name));
        if (!("getDragController" == pages.name)) {  //getDragController" == pages.name
          console.info("get getDragController pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push getDragController page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getDragController page error:" + err);
      }
      console.info("getDragController beforeEach end");
    });


    


    /**
     * @tc.number   getDragController_static_0100
     * @tc.name     getDragController_static_0100
     * @tc.desc     getDragController_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getDragController_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('getDragController_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('dragFlag'));
      console.log('++++++++++++findComponent',button)
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('Do_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getDragController_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getDragController_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[getDragController_0100] END');
      done();
    });
  })
}

