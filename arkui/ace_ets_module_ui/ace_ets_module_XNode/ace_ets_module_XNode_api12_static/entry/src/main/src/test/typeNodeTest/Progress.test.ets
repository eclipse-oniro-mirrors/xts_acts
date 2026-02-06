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
export default function typeNodeProgressTest() {
  describe('typeNodeProgressTest', () => {
    beforeAll(() => {
      console.info("typeNodeProgressTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("typeNodeProgressTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/typeNode/Progress",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get typeNodeProgressTest state pages: " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get typeNodeProgressTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push typeNodeProgressTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push typeNodeProgressTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   ProgressTest_static_0100
     * @tc.name     ProgressTest_static_0100
     * @tc.desc     ProgressTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ProgressTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ProgressTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button: Component|null = await driver.findComponent(ON.id('TypeNode_Progress'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TypeNode_Progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Progress');
      console.info('[ProgressTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   initializeTest_static_0200
     * @tc.name     initializeTest_static_0200
     * @tc.desc     initializeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('initializeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('initializeTest_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_initialize'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TypeNode_initialize');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[initializeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertContain('"top":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"right":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"bottom":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"left":{"unit":1,"value":10}');
      //取值是{"top":{"unit":{},"value":0},"left":{"unit":{},"value":0}，期望是{"top":{"unit":1,"value":10},
      console.info('[initializeTest_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   attributeTest_static_0300
     * @tc.name     attributeTest_static_0300
     * @tc.desc     attributeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('attributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('attributeTest_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_attribute'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TypeNode_attribute');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[attributeTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertContain('"top":{"unit":1,"value":5}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"right":{"unit":1,"value":5}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"bottom":{"unit":1,"value":5}');
      expect(obj.getElement('$attrs').getString('label')).assertContain('"left":{"unit":1,"value":5}');
      console.info('[attributeTest_0300] END');
      done();
    });
  })
}