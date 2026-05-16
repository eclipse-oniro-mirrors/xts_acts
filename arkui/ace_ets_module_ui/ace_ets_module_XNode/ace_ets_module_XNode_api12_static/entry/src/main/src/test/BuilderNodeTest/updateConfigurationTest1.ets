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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
export default function updateConfigurationTest1() {
  describe('updateConfigurationTest1', () => {
    beforeAll(() => {
      console.info("updateConfigurationTest1 beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("updateConfigurationTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/BuilderNode/updateConfiguration1",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get updateConfigurationTest1 state pages: " + JSON.stringify(pages));
        if (!("updateConfiguration1" == pages.name)) {
          console.info("get updateConfigurationTest1 state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push updateConfigurationTest1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push updateConfigurationTest1 page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   updateConfigurationTest1_static_0100
     * @tc.name     updateConfigurationTest1_static_0100
     * @tc.desc     updateConfigurationTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('updateConfigurationTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('updateConfigurationTest1_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component|null = await driver.findComponent(ON.id('btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText1 = inspector.getInspectorByKey('updateConfiguration1');
      console.info("[updateConfigurationTest1_0100] attrs is: " + JSON.stringify(JSON.parseJsonElement(mText1).getElement('$attrs')));
      expect(JSON.parseJsonElement(mText1).getElement('$attrs').getString('content')).assertEqual('Update 1');
      console.info('[updateConfigurationTest1_0100] END');
      done();
    });
  })
}