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

export default function RepeatTest0040() {
  describe('RepeatTest0040', () => {
    beforeAll(() => {
      console.info("RepeatTest0040 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatTest0040 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/Repeat0040",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatTest0040 state pages:" + JSON.stringify(pages));
        if (!("Repeat0040" == pages.name)) {
          console.info("get RepeatTest0040 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push RepeatTest0040 page error:" + err);
      }
      console.info("RepeatTest0040 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatTest0040 after each called");
    });

    
    
    /**
     * @tc.number   RepeatTest0040_static_001
     * @tc.name     RepeatTest0040_static_001
     * @tc.desc     RepeatTest0040_static_001
     * @tc.level    Level.LEVEL0
     */
it('RepeatTest0040_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0040_static_001] START');
      await CommonFunc.sleep(2000);
      console.info("[RepeatTest0040_static_001] sleep ");
      let driver: Driver = Driver.create();
      console.info("[RepeatTest0040_static_001] Driver ");
      let btn: Component|null = await (driver.findComponent(ON.id("btnRepeat00401")) as Promise<Component>);
      console.info("[RepeatTest0040_static_001] findComponent ");
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      console.info("[RepeatTest0040_static_001] click ");
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[5]
        .getArray('$children')[1];
      console.info("[RepeatTest0040_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('three');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await (driver.findComponent(ON.id("btnRefreshRepeat0040")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      console.info('[RepeatTest0040_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   RepeatTest0040_static_002
     * @tc.name     RepeatTest0040_static_002
     * @tc.desc     RepeatTest0040_static_002
     * @tc.level    Level.LEVEL0
     */
it('RepeatTest0040_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0040_static_002] START');
      await CommonFunc.sleep(2000);
      let treeStr: string = JSON.stringify(inspector.getInspectorTree())
      let obj = JSON.parseJsonElement(treeStr).getArray('$children')[0].getArray('$children')[5].getArray('$children')[0];
      console.info("[RepeatTest0040_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('one');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(treeStr).getArray('$children')[0].getArray('$children')[5].getArray('$children')[1];
      console.info("[RepeatTest0040_static_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('two');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(treeStr).getArray('$children')[0].getArray('$children')[5].getArray('$children')[2];
      console.info("[RepeatTest0040_static_002] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('three');
      console.info('[RepeatTest0040_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   RepeatTest0040_static_003
     * @tc.name     RepeatTest0040_static_003
     * @tc.desc     RepeatTest0040_static_003
     * @tc.level    Level.LEVEL0
     */
it('RepeatTest0040_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0040_static_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await (driver.findComponent(ON.id("btnRepeat00402")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children')[0].getArray('$children')[5].getArray('$children')[2];
      console.info("[RepeatTest0040_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('我');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await (driver.findComponent(ON.id("btnRefreshRepeat0040")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      console.info('[RepeatTest0040_static_003] END');
      done();
    });

    
    
    /**
     * @tc.number   RepeatTest0040_static_004
     * @tc.name     RepeatTest0040_static_004
     * @tc.desc     RepeatTest0040_static_004
     * @tc.level    Level.LEVEL0
     */
it('RepeatTest0040_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0040_static_004] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await (driver.findComponent(ON.id("btnRepeat00403")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children')[0].getArray('$children')[5].getArray('$children')[2];
      console.info("[RepeatTest0040_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('six');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await (driver.findComponent(ON.id("btnRefreshRepeat0040")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      console.info('[RepeatTest0040_static_004] END');
      done();
    });

    
    
    /**
     * @tc.number   RepeatTest0040_static_005
     * @tc.name     RepeatTest0040_static_005
     * @tc.desc     RepeatTest0040_static_005
     * @tc.level    Level.LEVEL0
     */
it('RepeatTest0040_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0040_static_005] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await (driver.findComponent(ON.id("btnRepeat00404")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children')[0].getArray('$children')[5].getArray('$children')[3];
      console.info("[RepeatTest0040_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('five');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await (driver.findComponent(ON.id("btnRefreshRepeat0040")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      console.info('[RepeatTest0040_static_005] END');
      done();
    });
  })
}
