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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
const waitUiReadyMs = 1000;


export default function RouterWithParamJsunit() {
  describe('RouterWithParamJsunit', () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RouterWithParamJsunit beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/State/RouterPushThree',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RouterWithParamJsunit state pages: " + JSON.stringify(pages));
        if (!("RouterPushThree" == pages.name)) {
          console.info("get RouterWithParamJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          routerInstance.clear()
        }
      } catch (err) {
        console.error("push RouterWithParamJsunit page error:" + err);
      }
    });

    afterEach(async () =>{
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.clear()
    });

    
    
// /**
//      * @tc.number   RouterWithParamJsunit_static_001
//      * @tc.name     RouterWithParamJsunit_static_001
//      * @tc.desc     RouterWithParamJsunit_static_001
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_001] START');
//       let driver = Driver.create();
//       await driver.delayMs(waitUiReadyMs);
//       let btn = await driver.findComponent(ON.id('turn_RouterPushUrlOne_null'));
//       await driver.delayMs(waitUiReadyMs);
//       await (btn?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_001] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual("RouterPushThree undefined");
//       console.info('[RouterWithParamJsunit_static_001] END');
//       done();
//     });
//
//
//
// /**
//      * @tc.number   RouterWithParamJsunit_static_002
//      * @tc.name     RouterWithParamJsunit_static_002
//      * @tc.desc     RouterWithParamJsunit_static_002
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_002] START');
//       let driver = Driver.create();
//       await driver.delayMs(waitUiReadyMs);
//       let btn = await driver.findComponent(ON.id('turn_RouterPushUrlOne_string_number'));
//       await driver.delayMs(waitUiReadyMs);
//       await (btn?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_002] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree {"data1":{"data2":"message","data3":12345}}')
//       console.info('[RouterWithParamJsunit_static_002] END');
//       done();
//     });
//
//
//
// /**
//      * @tc.number   RouterWithParamJsunit_static_003
//      * @tc.name     RouterWithParamJsunit_static_003
//      * @tc.desc     RouterWithParamJsunit_static_003
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_003] START');
//       let driver = Driver.create();
//       await driver.delayMs(waitUiReadyMs);
//       let btn1 = await driver.findComponent(ON.id('turn_RouterPushThree_stringArray'));
//       await driver.delayMs(waitUiReadyMs);
//       await (btn1?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_003] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree {"data1":{"data2":["message","message1"]}}')
//       console.info('[RouterWithParamJsunit_static_003] END');
//       done()
//     });
//
//
//
// /**
//      * @tc.number   RouterWithParamJsunit_static_004
//      * @tc.name     RouterWithParamJsunit_static_004
//      * @tc.desc     RouterWithParamJsunit_static_004
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_004] START');
//       let driver = Driver.create();
//       await driver.delayMs(waitUiReadyMs);
//       let btn = await driver.findComponent(ON.id('turn_RouterPushUrlOne_string_number1'));
//       await driver.delayMs(waitUiReadyMs);
//       await (btn?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_004] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree {"data1":"message","data2":12345}')
//       console.info('[RouterWithParamJsunit_static_004] END');
//       done()
//     });
//
//
//
// /**
//      * @tc.number   RouterWithParamJsunit_static_005
//      * @tc.name     RouterWithParamJsunit_static_005
//      * @tc.desc     RouterWithParamJsunit_static_005
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_005] START');
//       let driver = Driver.create();
//       let scrollBar = await driver.findComponent(ON.type('Scroll'));
//       let btn = await (scrollBar?.scrollSearch(ON.id('turn_RouterPushUrlOne_string_numArray')) as Promise<Component | null>);;
//       await driver.delayMs(waitUiReadyMs);
//       await (btn?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_005] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree {"data1":"message","data2":[1,2,3,4,5]}')
//       console.info('[RouterWithParamJsunit_static_005] END');
//       done();
//     });



/**
     * @tc.number   RouterWithParamJsunit_static_006
     * @tc.name     RouterWithParamJsunit_static_006
     * @tc.desc     RouterWithParamJsunit_static_006
     * @tc.level    Level.LEVEL2
     */
it('RouterWithParamJsunit_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterWithParamJsunit_static_006] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_RouterPushUrlOne_string_number_push')) as Promise<Component | null>);;
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');

      console.info("[RouterWithParamJsunit_static_006] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree {"data1":{"data2":"message","data3":12345}}')
      console.info('[RouterWithParamJsunit_static_006] END');
      done();
    });
//
//
//
// /**
//      * @tc.number   RouterWithParamJsunit_static_007
//      * @tc.name     RouterWithParamJsunit_static_007
//      * @tc.desc     RouterWithParamJsunit_static_007
//      * @tc.level    Level.LEVEL2
//      */
// it('RouterWithParamJsunit_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[RouterWithParamJsunit_static_007] START');
//       let driver = Driver.create();
//       await driver.delayMs(waitUiReadyMs);
//       let scrollBar = await driver.findComponent(ON.type('Scroll'));
//       let btn = await (scrollBar?.scrollSearch(ON.id('turn_RouterPushUrlOne_null_push')) as Promise<Component | null>);;
//       await driver.delayMs(waitUiReadyMs);
//       await (btn?.click() as Promise<void>);
//       await driver.delayMs(waitUiReadyMs);
//       let strJson = inspector.getInspectorByKey('Text_RouterPushThree_Params');
//
//       console.info("[RouterWithParamJsunit_static_007] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
//       expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual('RouterPushThree undefined')
//       console.info('[RouterWithParamJsunit_static_007] END');
//       done();
//     });
  })
}
