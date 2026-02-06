'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default function appStorageV2() {
  describe('appStorageV2', () => {
    beforeAll(() => {
      console.info("appStorageV2 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("appStorageV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/appStorageV2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appStorageV2 state pages:" + JSON.stringify(pages));
        if (!("appStorageV2" == pages.name)) {
          console.info("get appStorageV2 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push appStorageV2 page error:" + err);
      }
      console.info("appStorageV2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appStorageV2 after each called");
    });

    
    
    /**
     * @tc.number   appStorageV2_static_001
     * @tc.name     appStorageV2_static_001
     * @tc.desc     appStorageV2_static_001
     * @tc.level    Level.LEVEL0
     */
it('appStorageV2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[appStorageV2_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('appStorageV2_static_keys');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appStorageV2_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('keys in AppStorage: SampleApp');
      console.info('[appStorageV2_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   appStorageV2_static_002
     * @tc.name     appStorageV2_static_002
     * @tc.desc     appStorageV2_static_002
     * @tc.level    Level.LEVEL0
     */
it('appStorageV2_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[appStorageV2_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component|null = await (driver.findComponent(ON.id("appStorageV2_static_num")) as Promise<Component>);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('appStorageV2_static_num');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[appStorageV2_static_002] component obj1 is: " + JSON.stringify(obj1));
      console.info("[appStorageV2_static_002] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('prop.p1: 2');

      let btn2: Component|null = await (driver.findComponent(ON.id("appStorageV2_static_remove")) as Promise<Component>);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3: Component|null = await (driver.findComponent(ON.id("appStorageV2_static_connect")) as Promise<Component>);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('appStorageV2_static_num');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[appStorageV2_static_002] component obj2 is: " + JSON.stringify(obj2));
      console.info("[appStorageV2_static_002] content2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('prop.p1: 0');
      console.info('[appStorageV2_static_002] END');
      let btn6: Component|null = await (driver.findComponent(ON.id("btnAppStorageV2ClearKeys")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await ( btn6?.click() as Promise<void>);
      done();
    });
  })
}
