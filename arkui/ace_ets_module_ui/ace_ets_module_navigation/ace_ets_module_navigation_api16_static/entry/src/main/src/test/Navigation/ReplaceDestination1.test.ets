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
// import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';


export default function ReplaceDestination1Test() {
  describe('ReplaceDestination1Test', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation16.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ReplaceDestination1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ReplaceDestination1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ReplaceDestination1 state pages:" + JSON.stringify(pages));
        if (!("ReplaceDestination1" == pages.name)) {
          console.info("get ReplaceDestination1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ReplaceDestination1 page error:" + err);
      }
      console.info("ReplaceDestination1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReplaceDestination1 after each called");
    });


    
    

/**
     * @tc.number   ReplaceDestination1_static_0100
     * @tc.name     ReplaceDestination1_static_0100
     * @tc.desc     ReplaceDestination1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ReplaceDestination1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReplaceDestination1_static_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pageOneId')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination1_static_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('id06');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ReplaceDestination1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination1_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100006');

      console.info('ReplaceDestination1_static_0100 END');
      done();
    });

    
    
// /**
//      * @tc.number   ReplaceDestination1_static_static_0200
//      * @tc.name     ReplaceDestination1_static_static_0200
//      * @tc.desc     ReplaceDestination1_static_static_0200
//      * @tc.level    Level.LEVEL0
//      */
// it('ReplaceDestination1_static_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {  // undefined
//       console.info('ReplaceDestination1_static_static_0200 START');
//       await CommonFunc.sleep(500);
//
//       let driver = Driver.create();
//       await CommonFunc.sleep(200);
//
//       let btn1 = await (driver.findComponent(ON.id('undefinedId')) as Promise<Component>);
//       await btn1.click()
//       console.info('[ReplaceDestination1_static_static_0200] btn1 click');
//       await CommonFunc.sleep(500);
//
//       let strJson = inspector.getInspectorByKey('id06');
//       let obj = JSON.parseJsonElement(strJson);
//       console.info('[ReplaceDestination1_static_static_0200] component obj is: ' + JSON.stringify(obj));
//       console.info('[ReplaceDestination1_static_static_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
//       expect(obj.getElement('$attrs').getString('content')).assertEqual('401');
//
//       console.info('ReplaceDestination1_static_static_0200 END');
//       done();
//     });

    
    
// /**
//      * @tc.number   ReplaceDestination1_static_0300
//      * @tc.name     ReplaceDestination1_static_0300
//      * @tc.desc     ReplaceDestination1_static_0300
//      * @tc.level    Level.LEVEL0
//      */
// it('ReplaceDestination1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => { // null
//       console.info('ReplaceDestination1_static_0300 START');
//       await CommonFunc.sleep(500);
//
//       let driver = Driver.create();
//       await CommonFunc.sleep(200);
//
//       let btn1 = await (driver.findComponent(ON.id('nullId')) as Promise<Component>);
//       await btn1.click()
//       console.info('[ReplaceDestination1_static_0300] btn1 click');
//       await CommonFunc.sleep(500);
//
//       let strJson = inspector.getInspectorByKey('id06');
//       let obj = JSON.parseJsonElement(strJson);
//       console.info('[ReplaceDestination1_static_0300] component obj is: ' + JSON.stringify(obj));
//       console.info('[ReplaceDestination1_static_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
//       expect(obj.getElement('$attrs').getString('content')).assertEqual('401');
//
//       console.info('ReplaceDestination1_static_0300 END');
//       done();
//     });

    
    

/**
     * @tc.number   ReplaceDestination1_static_0400
     * @tc.name     ReplaceDestination1_static_0400
     * @tc.desc     ReplaceDestination1_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ReplaceDestination1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReplaceDestination1_static_0400 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('replaceId')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination1_static_0400] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('stackId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ReplaceDestination1_static_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination1_static_0400] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pageOne');

      console.info('ReplaceDestination1_static_0400 END');
      done();
    });

    
    

/**
     * @tc.number   ReplaceDestination1_static_0500
     * @tc.name     ReplaceDestination1_static_0500
     * @tc.desc     ReplaceDestination1_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ReplaceDestination1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReplaceDestination1_static_0500 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let clearBtn = await (driver.findComponent(ON.id('clearId')) as Promise<Component>);
      await clearBtn.click()
      console.info('[ReplaceDestination1_static_0500] clearBtn click');
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination1_static_0500] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushThreeId')) as Promise<Component>);
      await btn2.click()
      console.info('[ReplaceDestination1_static_0500] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('pushFourId')) as Promise<Component>);
      await btn3.click()
      console.info('[ReplaceDestination1_static_0500] btn3 click');
      await CommonFunc.sleep(200);

      let btn4 = await (driver.findComponent(ON.id('moveId')) as Promise<Component>);
      await btn4.click()
      console.info('[ReplaceDestination1_static_0500] btn3 click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('stackId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ReplaceDestination1_static_0500] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination1_static_0500] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pageThree,pageOne');

      console.info('ReplaceDestination1_static_0500 END');
      done();
    });


    
    

/**
     * @tc.number   ReplaceDestination1_static_0600
     * @tc.name     ReplaceDestination1_static_0600
     * @tc.desc     ReplaceDestination1_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ReplaceDestination1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReplaceDestination1_static_0600 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let clearBtn = await (driver.findComponent(ON.id('clearId')) as Promise<Component>);
      await clearBtn.click()
      console.info('[ReplaceDestination1_static_0600] clearBtn click');
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination1_static_0600] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushThreeId')) as Promise<Component>);
      await btn2.click()
      console.info('[ReplaceDestination1_static_0600] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('pushFourId')) as Promise<Component>);
      await btn3.click()
      console.info('[ReplaceDestination1_static_0600] btn3 click');
      await CommonFunc.sleep(200);

      let btn4 = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btn4.click()
      console.info('[ReplaceDestination1_static_0600] btn3 click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('stackId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ReplaceDestination1_static_0600] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination1_static_0600] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pageOne');

      console.info('ReplaceDestination1_static_0600 END');
      done();
    });

  })
}