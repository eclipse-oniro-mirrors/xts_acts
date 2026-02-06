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
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
export default function borderStyles() {
  describe('borderStyles', () => { 
    beforeAll(() => {
      console.info("borderStyles beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("borderStyles beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/borderStyles",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get borderStyles state pages: " + JSON.stringify(pages));
        if (!("borderStyles" == pages.name)) {
          console.info("get borderStyles state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push borderStyles success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push borderStyles page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
     
    



    /**
     * @tc.number   borderStyles_static_0100
     * @tc.name     borderStyles_static_0100
     * @tc.desc     borderStyles_static_0100
     * @tc.level    Level.LEVEL0
     */
it('borderStyles_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('borderStyles_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button: Component|null = await driver.findComponent(ON.id('borderStylesClick'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('borderStylesValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[borderStyles_0100] component obj is: " + JSON.stringify(obj));
      console.info("[borderStyles_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('borderStyleValue:2');
      console.info('[borderStyles_0100] END');
      done();
    });
    
  })
}