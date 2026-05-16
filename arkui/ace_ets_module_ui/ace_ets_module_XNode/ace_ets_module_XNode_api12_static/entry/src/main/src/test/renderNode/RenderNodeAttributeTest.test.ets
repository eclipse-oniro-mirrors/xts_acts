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
export default function RenderNodeAttributeTest() {
  describe('RenderNodeAttributeTest', () => {
    beforeAll(() => {
      console.info("RenderNodeAttributeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("RenderNodeAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode/RenderNodeAttribute",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeAttributeTest state pages: " + JSON.stringify(pages));
        if (!("RenderNodeAttribute" == pages.name)) {
          console.info("get RenderNodeAttributeTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push RenderNodeAttributeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeAttributeTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0100
     * @tc.name     RenderNodeAttributeTest_static_0100
     * @tc.desc     RenderNodeAttributeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderWidth_left');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0200
     * @tc.name     RenderNodeAttributeTest_static_0200
     * @tc.desc     RenderNodeAttributeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderWidth_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0300
     * @tc.name     RenderNodeAttributeTest_static_0300
     * @tc.desc     RenderNodeAttributeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderWidth_bottom');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0300] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0400
     * @tc.name     RenderNodeAttributeTest_static_0400
     * @tc.desc     RenderNodeAttributeTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0400 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderWidth_right');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('8');
      console.info('[RenderNodeAttributeTest_0400] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0500
     * @tc.name     RenderNodeAttributeTest_static_0500
     * @tc.desc     RenderNodeAttributeTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0500 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderColor_left');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0500] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0600
     * @tc.name     RenderNodeAttributeTest_static_0600
     * @tc.desc     RenderNodeAttributeTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0600 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderColor_right');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0600] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0700
     * @tc.name     RenderNodeAttributeTest_static_0700
     * @tc.desc     RenderNodeAttributeTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0700 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderColor_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0700] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0800
     * @tc.name     RenderNodeAttributeTest_static_0800
     * @tc.desc     RenderNodeAttributeTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0800 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderColor_bottom');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[RenderNodeAttributeTest_0800] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_0900
     * @tc.name     RenderNodeAttributeTest_static_0900
     * @tc.desc     RenderNodeAttributeTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_0900 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderStyle_left');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[RenderNodeAttributeTest_0900] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1000
     * @tc.name     RenderNodeAttributeTest_static_1000
     * @tc.desc     RenderNodeAttributeTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1000 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderStyle_right');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1000] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[RenderNodeAttributeTest_1000] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1100
     * @tc.name     RenderNodeAttributeTest_static_1100
     * @tc.desc     RenderNodeAttributeTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1100 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderStyle_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[RenderNodeAttributeTest_1100] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1200
     * @tc.name     RenderNodeAttributeTest_static_1200
     * @tc.desc     RenderNodeAttributeTest_static_1200
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1200 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderStyle_bottom');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[RenderNodeAttributeTest_1200] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1300
     * @tc.name     RenderNodeAttributeTest_static_1300
     * @tc.desc     RenderNodeAttributeTest_static_1300
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1300 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderRadius_topRight');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1300] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1400
     * @tc.name     RenderNodeAttributeTest_static_1400
     * @tc.desc     RenderNodeAttributeTest_static_1400
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1400 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderRadius_topLeft');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1400] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1500
     * @tc.name     RenderNodeAttributeTest_static_1500
     * @tc.desc     RenderNodeAttributeTest_static_1500
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1500 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderRadius_bottomLeft');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1500] END');
      done();
    });
    
    



    /**
     * @tc.number   RenderNodeAttributeTest_static_1600
     * @tc.name     RenderNodeAttributeTest_static_1600
     * @tc.desc     RenderNodeAttributeTest_static_1600
     * @tc.level    Level.LEVEL0
     */
it('RenderNodeAttributeTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('RenderNodeAttributeTest_1600 START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_borderRadius_bottomRight');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeAttributeTest_1600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('32');
      console.info('[RenderNodeAttributeTest_1600] END');
      done();
    });
  })
}