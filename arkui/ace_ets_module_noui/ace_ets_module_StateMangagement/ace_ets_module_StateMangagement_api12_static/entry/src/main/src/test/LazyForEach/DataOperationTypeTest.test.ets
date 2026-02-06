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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType,Size,Level} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';


import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function DataOperationTypeTest() {
  describe('DataOperationTypeTest', () => {
    beforeAll(() => {
      console.info("DataOperationTypeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("DataOperationTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/LazyForEachDataOperationType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DataOperationTypeTest state pages:" + JSON.stringify(pages));
        if (!("LazyForEachDataOperationType" == pages.name)) {
          console.info("get DataOperationTypeTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push DataOperationTypeTest page error:" + err);
      }
      console.info("DataOperationTypeTest beforeEach end");
    });
    
    
    /**
     * @tc.number   DataOperationTypeTest_static_0100
     * @tc.name     DataOperationTypeTest_static_0100
     * @tc.desc     DataOperationTypeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('DataOperationTypeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataOperationTypeTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DataOperationType_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DataOperationTypeTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Length:4');
      console.info('[DataOperationTypeTest_static_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   DataOperationTypeTest_static_0200
     * @tc.name     DataOperationTypeTest_static_0200
     * @tc.desc     DataOperationTypeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('DataOperationTypeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataOperationTypeTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DataOperationType_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DataOperationTypeTest_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Length:3');
      console.info('[DataOperationTypeTest_static_0200] END');
      done();
    });
    
    
    /**
     * @tc.number   DataOperationTypeTest_static_0300
     * @tc.name     DataOperationTypeTest_static_0300
     * @tc.desc     DataOperationTypeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('DataOperationTypeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataOperationTypeTest_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DataOperationType_0');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[DataOperationTypeTest_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Text:Hello 2');
      console.info('[DataOperationTypeTest_static_0300] END');
      done();
    });
  })
}

