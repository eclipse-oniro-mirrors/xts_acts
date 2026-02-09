'use static';
/**
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
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color,  PatternLockController } from '@ohos.arkui.component';


export default function PatternLockJsunit() {
  describe('PatternLockJsunit', () => {

    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("PatternLockPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/PatternLockPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PatternLockPage state pages:" + JSON.stringify(pages));
        if (!("PatternLockPage" == pages.name)) {
          console.info("get PatternLockPage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PatternLockPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLock page error: " + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   PatternLockJsunit_0100
     * @tc.name     PatternLockJsunit_0100
     * @tc.desc     PatternLockJsunit_0100
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the PatternLock component
      console.info('[PatternLockJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('sideLength')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('circleRadius')).assertEqual('9.00vp');
      expect(obj.getElement('$attrs').getString('regularColor')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual('#FF228B22');
      expect(obj.getElement('$attrs').getString('activeColor')).assertEqual('#FFB0C4DE');
      expect(obj.getElement('$attrs').getString('pathColor')).assertEqual('#FF90EE90');
      expect(obj.getElement('$attrs').getString('pathStrokeWidth')).assertEqual('18.00vp');
      expect(obj.getElement('$attrs').getString('autoReset')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[PatternLockJsunit_0100] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0200
     * @tc.name     PatternLockJsunit_0200
     * @tc.desc     PatternLockJsunit_0200
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify the content of the message
      let driver1 = Driver.create()
      let textComponent1 = await driver1.findComponent(ON.id('text'));
      let text1 = await (textComponent1?.getText() as Promise<string>);
      expect(text1).assertEqual('please input password!');
      console.info('[PatternLockJsunit_0200] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0300
     * @tc.name     PatternLockJsunit_0300
     * @tc.desc     PatternLockJsunit_0300
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify that clicking the 'Reset PatternLock' button resets
      console.info('[PatternLockJsunit_0300] START');
      // Get the component of the 'Reset PatternLock' button
      let driver = Driver.create()
      let reSet = await driver.findComponent(ON.id('reSet'));
      await (reSet?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      // Verify the content of the message
      let driver1 = Driver.create()
      let curtextrentBp = await driver1.findComponent(ON.id('text'));
      let text = await (curtextrentBp?.getText() as Promise<string>);
      expect(text).assertEqual('Please input password');
      console.info('[PatternLockJsunit_0300] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0400
     * @tc.name     PatternLockJsunit_0400
     * @tc.desc     PatternLockJsunit_0400
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the content of the message
      console.info('[PatternLockJsunit_0400] START');
      await CommonFunc.sleep(1000);
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'message',value:'hello world'})
      await CommonFunc.sleep(1000);
      // Verify the content of the message
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('text'));
      let text = await (textComponent?.getText() as Promise<string>);
      expect(text).assertEqual('hello world');
      console.info('[PatternLockJsunit_0400] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0500
     * @tc.name     PatternLockJsunit_0500
     * @tc.desc     PatternLockJsunit_0500
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the sideLength value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'sideLength',value:'400'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringify(obj));
      // Verify the sideLength value of the PatternLock component
      expect(obj.getElement('$attrs').getString('sideLength')).assertEqual('400.00vp');
      console.info('[PatternLockJsunit_0500] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0600
     * @tc.name     PatternLockJsunit_0600
     * @tc.desc     PatternLockJsunit_0600
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the circleRadius value of the PatternLock component
      console.info('[PatternLockJsunit_0600] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'circleRadius',value:'18'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0600'] component obj is: " + JSON.stringify(obj));
      // Verify the circleRadius value of the PatternLock component
      expect(obj.getElement('$attrs').getString('circleRadius')).assertEqual('18.00vp');
      console.info('[PatternLockJsunit_0600] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0700
     * @tc.name     PatternLockJsunit_0700
     * @tc.desc     PatternLockJsunit_0700
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the regularColor value of the PatternLock component
      console.info('[PatternLockJsunit_0700] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'regularColor',value:'#FF0000FF'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0700'] component obj is: " + JSON.stringify(obj));
      // Verify the regularColor value of the PatternLock component
      expect(obj.getElement('$attrs').getString('regularColor')).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_0700] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0800
     * @tc.name     PatternLockJsunit_0800
     * @tc.desc     PatternLockJsunit_0800
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the selectedColor value of the PatternLock component
      console.info('[PatternLockJsunit_0800] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'selectedColor',value:'#FFFF0000'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0800'] component obj is: " + JSON.stringify(obj));
      // Verify the selectedColor value of the PatternLock component
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0800] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_0900
     * @tc.name     PatternLockJsunit_0900
     * @tc.desc     PatternLockJsunit_0900
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the activeColor value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'activeColor',value:'#FFFF0000'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringify(obj));
      // Verify the activeColor value of the PatternLock component
      expect(obj.getElement('$attrs').getString('activeColor')).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0500] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_1000
     * @tc.name     PatternLockJsunit_1000
     * @tc.desc     PatternLockJsunit_1000
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the pathColor value of the PatternLock component
      console.info('[PatternLockJsunit_1000] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'pathColor',value:'#FF0000FF'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1000'] component obj is: " + JSON.stringify(obj));
      // Verify the pathColor value of the PatternLock component
      expect(obj.getElement('$attrs').getString('pathColor')).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_1000] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_1100
     * @tc.name     PatternLockJsunit_1100
     * @tc.desc     PatternLockJsunit_1100
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the pathStrokeWidth value of the PatternLock component
      console.info('[PatternLockJsunit_1100] START');
      await CommonFunc.sleep(1000);
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'pathStrokeWidth',value:'20'})
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1100'] component obj is: " + JSON.stringify(obj));
      // Verify the pathStrokeWidth value of the PatternLock component
      expect(obj.getElement('$attrs').getString('pathStrokeWidth')).assertEqual('20.00vp');
      console.info('[PatternLockJsunit_1100] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_1200
     * @tc.name     PatternLockJsunit_1200
     * @tc.desc     PatternLockJsunit_1200
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_1200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the autoReset value of the PatternLock component
      console.info('[PatternLockJsunit_1200] START');
      const messageManager = AppStorage.get<MessageManager<number | int[] | String | PatternLockController | boolean>>('messageManager') as MessageManager<number | int[] | String | PatternLockController | boolean>
      messageManager.notify({name:'autoReset',value:false})
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1200'] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      // Verify the autoReset value of the PatternLock component
      expect(obj.getElement('$attrs').getString('autoReset')).assertEqual('false');
      console.info('[PatternLockJsunit_1200] END');
      done();
    });

    
/**
     * @tc.number   PatternLockJsunit_1300
     * @tc.name     PatternLockJsunit_1300
     * @tc.desc     PatternLockJsunit_1300
     * @tc.level    Level.LEVEL2
     */
it('PatternLockJsunit_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[PatternLockJsunit_1300] START');
      let strJson = inspector.getInspectorByKey('default');
      let obj = JSON.parseJsonElement(strJson);
      let newStrJson = inspector.getInspectorByKey('PatternLock');
      let newObj = JSON.parseJsonElement(newStrJson);
      expect(obj.getElement('$attrs').getString('sideLength')).assertEqual(newObj.getElement('$attrs').getString('sideLength'));
      expect(obj.getElement('$attrs').getString('circleRadius')).assertEqual(newObj.getElement('$attrs').getString('circleRadius'));
      expect(obj.getElement('$attrs').getString('regularColor')).assertEqual(newObj.getElement('$attrs').getString('regularColor'));
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual(newObj.getElement('$attrs').getString('selectedColor'));
      expect(obj.getElement('$attrs').getString('activeColor')).assertEqual(newObj.getElement('$attrs').getString('activeColor'));
      expect(obj.getElement('$attrs').getString('pathColor')).assertEqual(newObj.getElement('$attrs').getString('pathColor'));
      expect(obj.getElement('$attrs').getString('pathStrokeWidth')).assertEqual(newObj.getElement('$attrs').getString('pathStrokeWidth'));
      expect(obj.getElement('$attrs').getString('autoReset')).assertEqual(newObj.getElement('$attrs').getString('autoReset'));
      console.info('[PatternLockJsunit_1300] END');
      done();
    });
  })
}

