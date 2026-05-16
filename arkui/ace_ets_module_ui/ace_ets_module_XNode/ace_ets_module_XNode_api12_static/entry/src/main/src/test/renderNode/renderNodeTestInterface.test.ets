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
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
export default function renderNodeGetInterfaceTest() {
  describe('renderNodeGetInterfaceTest', () => {
    beforeAll(() => {
      console.info("renderNodeGetInterfaceTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("renderNodeGetInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode/renderNodeSetGetInterface",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get renderNodeGetInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("renderNodeSetGetInterface" == pages.name)) {
          console.info("get renderNodeGetInterfaceTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push renderNodeGetInterfaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push renderNodeGetInterfaceTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   renderNodeGetInterfaceTest_static_0100
     * @tc.name     renderNodeGetInterfaceTest_static_0100
     * @tc.desc     renderNodeGetInterfaceTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('renderNodeGetInterfaceTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('enderNodeGetInterfaceTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeRadiusClick'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('bRadiusValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[renderNodeGetInterfaceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bRadiusValue:20');
      console.info('[renderNodeGetInterfaceTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   renderNodeGetInterfaceTest_static_0200
     * @tc.name     renderNodeGetInterfaceTest_static_0200
     * @tc.desc     renderNodeGetInterfaceTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('renderNodeGetInterfaceTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('enderNodeGetInterfaceTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bColorChange'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('bColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[renderNodeGetInterfaceTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bColor:4278255598');//master22 bColor:-16711698 equals bColor:4278255598
      console.info('[renderNodeGetInterfaceTest_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   renderNodeGetInterfaceTest_static_0300
     * @tc.name     renderNodeGetInterfaceTest_static_0300
     * @tc.desc     renderNodeGetInterfaceTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('renderNodeGetInterfaceTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('renderNodeGetInterfaceTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bWidthChange'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('bWidth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[renderNodeGetInterfaceTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bWidth:40');
      console.info('[renderNodeGetInterfaceTest_0300] END');
      done();
    });
    
    



    /**
     * @tc.number   renderNodeGetInterfaceTest_static_0400
     * @tc.name     renderNodeGetInterfaceTest_static_0400
     * @tc.desc     renderNodeGetInterfaceTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('renderNodeGetInterfaceTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('renderNodeGetInterfaceTest_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bChangeStyle'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('bStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[renderNodeGetInterfaceTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bStyle:1');
      console.info('[renderNodeGetInterfaceTest_0400] END');
      done();
    });
  })
}