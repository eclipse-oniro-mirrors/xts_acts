/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
export default function renderNodeGetInterfaceTest() {
  describe('renderNodeGetInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("renderNodeGetInterfaceTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/renderNode/renderNodeSetGetInterface",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get renderNodeGetInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("renderNodeSetGetInterface" == pages.name)) {
          console.info("get renderNodeSetGetInterfaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push renderNodeSetGetInterfaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push renderNodeSetGetInterfaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    renderNodeGetInterface
     * @tc.name      renderNodeGetInterfaceTest_0100
     * @tc.desc      set and get borderRadius
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('renderNodeGetInterfaceTest_0100', 0, async (done: Function) => {
      console.info('enderNodeGetInterfaceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke setBorderRadius
      let button = await driver.findComponent(ON.id('changeRadiusClick'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the getBorderRadius data
      let strJson: string = getInspectorByKey('bRadiusValue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[renderNodeGetInterfaceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('bRadiusValue:20');
      console.info('[renderNodeGetInterfaceTest_0100] END');
      done();
    });
    /**
     * @tc.number    renderNodeGetInterface
     * @tc.name      renderNodeGetInterfaceTest_0200
     * @tc.desc      set and get borderColor
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('renderNodeGetInterfaceTest_0200', 0, async (done: Function) => {
      console.info('enderNodeGetInterfaceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke setBorderRadius
      let button = await driver.findComponent(ON.id('bColorChange'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the getBorderRadius data
      let strJson: string = getInspectorByKey('bColor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[renderNodeGetInterfaceTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('bColor:4278255598');//10进制
      console.info('[renderNodeGetInterfaceTest_0200] END');
      done();
    });

    /**
     * @tc.number    renderNodeGetInterface
     * @tc.name      renderNodeGetInterfaceTest_0300
     * @tc.desc      set and get width
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('renderNodeGetInterfaceTest_0300', 0, async (done: Function) => {
      console.info('renderNodeGetInterfaceTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke setBorderWidth
      let button = await driver.findComponent(ON.id('bWidthChange'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the getBorderWidth data
      let strJson: string = getInspectorByKey('bWidth');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[renderNodeGetInterfaceTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('bWidth:40');
      console.info('[renderNodeGetInterfaceTest_0300] END');
      done();
    });

    /**
     * @tc.number    renderNodeGetInterface
     * @tc.name      renderNodeGetInterfaceTest_0400
     * @tc.desc      set and get borderStyle
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('renderNodeGetInterfaceTest_0400', 0, async (done: Function) => {
      console.info('renderNodeGetInterfaceTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke setBorderStyle
      let button = await driver.findComponent(ON.id('bChangeStyle'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the getBorderWidth data
      let strJson: string = getInspectorByKey('bStyle');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[renderNodeGetInterfaceTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('bStyle:1');
      console.info('[renderNodeGetInterfaceTest_0400] END');
      done();
    });



  })
}

