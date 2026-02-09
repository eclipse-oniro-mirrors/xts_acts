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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function tapGestureAddInterfaceTest() {
  describe('tapGestureAddInterfaceTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("tapGestureAddInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tapGestureAddInterface/tapgestures',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get tapGestureAddInterfaceTest state pages:" + JSON.stringify(pages));
        if (!("tapgestures" == pages.name)) {
          console.info("get PapGestureAddInterfaceTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PapGestureAddInterfaceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push  PapGestureAddInterfaceTest page error:" + err);
      }
      console.info("PapGestureAddInterfaceTest beforeEach end");
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PapGestureAddInterfaceTest  after each called");
    });

    
    
    
/**
     * @tc.number   tapGestureAddInterfaceTest_static_0010
     * @tc.name     tapGestureAddInterfaceTest_static_0010
     * @tc.desc     tapGestureAddInterfaceTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('tapGestureAddInterfaceTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tapGestureAddInterfaceTest_0010 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.doubleClick(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt1 = inspector.getInspectorByKey('valueKey');
      let obj = JSON.parseJsonElement(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.getElement('$attrs').getString('content'));
      // check the click event  whether response
      let dataE = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE.getInteger('localX') - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.getInteger('localY') - 10) <= 1).assertTrue();

      // click the distanceThreshold range
      await driver.doubleClick(Math.round(column1.left + width/2 - uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(4000)
      let tt2 = inspector.getInspectorByKey('valueKey');
      let obj2 = JSON.parseJsonElement(tt2);
      console.info('tapGestureAddInterfaceTest_0010 obj2 $attrs content '+ obj2.getElement('$attrs').getString('content'))
       // check the click event  whether response
      let dataE2 = JSON.parseJsonElement(obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE2.getInteger('localX') - 90) <= 1).assertTrue();
      expect(Math.abs(dataE2.getInteger('localY') - 10) <= 1).assertTrue();
      console.info('tapGestureAddInterfaceTest_0010 end');
      done();
    });

    
    
    
/**
     * @tc.number   tapGestureAddInterfaceTest_static_0020
     * @tc.name     tapGestureAddInterfaceTest_static_0020
     * @tc.desc     tapGestureAddInterfaceTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('tapGestureAddInterfaceTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tapGestureAddInterfaceTest_0020 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.doubleClick(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt1 = inspector.getInspectorByKey('valueKey');
      let obj = JSON.parseJsonElement(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.getElement('$attrs').getString('content'));
      // check the click event  whether response
      let dataE = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE.getInteger('localX') - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.getInteger('localY') - 10) <= 1).assertTrue();

      // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int,Math.round(column1.left + uiContext.vp2px(80)) as Int, Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt2 = inspector.getInspectorByKey('valueKey');
      let obj2 = JSON.parseJsonElement(tt2);
      console.info('tapGestureAddInterfaceTest_0020 obj2 $attrs content '+ obj2.getElement('$attrs').getString('content'))
      // check the click event  whether response
      let dataE2 = JSON.parseJsonElement(obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE2.getInteger('localX') - 80) <= 1).assertTrue();
      expect(Math.abs(dataE2.getInteger('localY') - 10) <= 1).assertTrue();

       // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int,Math.round(column1.left + uiContext.vp2px(130)) as Int, Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt3 = inspector.getInspectorByKey('valueKey');
      let obj3 = JSON.parseJsonElement(tt3);
      console.info('tapGestureAddInterfaceTest_0020 obj3 $attrs content '+ obj3.getElement('$attrs').getString('content'))
      // check the click event  whether response
      let dataE3 = JSON.parseJsonElement(obj3.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE3.getInteger('localX') - 80) <= 1).assertTrue();
      expect(Math.abs(dataE3.getInteger('localY') - 10) <= 1).assertTrue();


      console.info('tapGestureAddInterfaceTest_0020 end');
      done();
    });

    
    
    
/**
     * @tc.number   tapGestureAddInterfaceTest_static_0030
     * @tc.name     tapGestureAddInterfaceTest_static_0030
     * @tc.desc     tapGestureAddInterfaceTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('tapGestureAddInterfaceTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tapGestureAddInterfaceTest_0010 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.click(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt1 = inspector.getInspectorByKey('valueKey');
      let obj = JSON.parseJsonElement(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.getElement('$attrs').getString('content'));
      // check the click event  whether response
      let dataE = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE.getInteger('localX') - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.getInteger('localY') - 10) <= 1).assertTrue();

      // click the distanceThreshold range
      await driver.click(Math.round(column1.left + width/2 - uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(4000)
      let tt2 = inspector.getInspectorByKey('valueKey');
      let obj2 = JSON.parseJsonElement(tt2);
      console.info('tapGestureAddInterfaceTest_0010 obj2 $attrs content '+ obj2.getElement('$attrs').getString('content'))
       // check the click event  whether response
      let dataE2 = JSON.parseJsonElement(obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE2.getInteger('localX') - 90) <= 1).assertTrue();
      expect(Math.abs(dataE2.getInteger('localY') - 10) <= 1).assertTrue();
      console.info('tapGestureAddInterfaceTest_0010 end');
      done();
    });

    
    
    
/**
     * @tc.number   tapGestureAddInterfaceTest_static_0040
     * @tc.name     tapGestureAddInterfaceTest_static_0040
     * @tc.desc     tapGestureAddInterfaceTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('tapGestureAddInterfaceTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tapGestureAddInterfaceTest_0020 START');
      await CommonFunc.sleep(150);
      let column1 = CommonFunc.getComponentRectOnScreen('interfaceTestKey');
      console.info('tapGestureAddInterfaceTest_0010 column1', column1.left, column1.top, column1.right, column1.bottom);
      let width = column1.right - column1.left;
      let height = column1.bottom - column1.top;
      console.info('tapGestureAddInterfaceTest_0010 column1 width = ' + width + ",height = " + height);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('interfaceTestKey'));
      await driver.click(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt1 = inspector.getInspectorByKey('valueKey');
      let obj = JSON.parseJsonElement(tt1);
      console.info('SwipeGestureExample02Test_0010 obj $attrs content '+ obj.getElement('$attrs').getString('content'));
      // check the click event  whether response
      let dataE = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE.getInteger('localX') - 10) <= 1).assertTrue();
      expect(Math.abs(dataE.getInteger('localY') - 10) <= 1).assertTrue();

      // swipe the distanceThreshold range
      await driver.swipe(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int,Math.round(column1.left + uiContext.vp2px(80)) as Int, Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt2 = inspector.getInspectorByKey('valueKey');
      let obj2 = JSON.parseJsonElement(tt2);
      console.info('tapGestureAddInterfaceTest_0020 obj2 $attrs content '+ obj2.getElement('$attrs').getString('content'))
      // check the click event  whether response
      let dataE2 = JSON.parseJsonElement(obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE2.getInteger('localX') - 80) <= 1).assertTrue();
      expect(Math.abs(dataE2.getInteger('localY') - 10) <= 1).assertTrue();

       // swipe out of the distanceThreshold range
      await driver.swipe(Math.round(column1.left + uiContext.vp2px(10)) as Int,Math.round(column1.top + uiContext.vp2px(10)) as Int,Math.round(column1.left + uiContext.vp2px(130)) as Int, Math.round(column1.top + uiContext.vp2px(10)) as Int);
      await CommonFunc.sleep(3000)
      let tt3 = inspector.getInspectorByKey('valueKey');
      let obj3 = JSON.parseJsonElement(tt3);
      console.info('tapGestureAddInterfaceTest_0020 obj3 $attrs content '+ obj3.getElement('$attrs').getString('content'))
      // check the click event  whether response
      let dataE3 = JSON.parseJsonElement(obj3.getElement('$attrs').getString('content'));
      expect(Math.abs(dataE3.getInteger('localX') - 80) <= 1 ).assertTrue();
      expect(Math.abs(dataE3.getInteger('localY') - 10) <= 1).assertTrue();
      
      console.info('tapGestureAddInterfaceTest_0020 end');
      done();
    });


  })
}
