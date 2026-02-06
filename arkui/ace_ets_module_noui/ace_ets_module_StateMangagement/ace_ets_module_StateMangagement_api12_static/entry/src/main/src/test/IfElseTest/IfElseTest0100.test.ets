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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index"
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
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
import inspector from '@ohos.arkui.inspector';


import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function IfElseTest0100() {
  describe('IfElseTest0100', () => {
    beforeAll(() => {
      console.info("IfElseTest0100 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElseTest0100 beforeEach start");
      let options: router.RouterOptions = {
        url:"MainAbility/pages/IfElse/IfElse0100",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElseTest0100 state pages:" + JSON.stringify(pages));
        if (!("IfElseTest0100" == pages.name)) {
          console.info("get IfElseTest0100 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElseTest0100 page error:" + err);
      }
      console.info("IfElseTest0100 beforeEach end");
    });

    
    
    /**
     * @tc.number   IfElseTest0100_static_001
     * @tc.name     IfElseTest0100_static_001
     * @tc.desc     IfElseTest0100_static_001
     * @tc.level    Level.LEVEL0
     */
it('IfElseTest0100_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElseTest0100_static_001] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await (driver.findComponent(ON.id("btnDelTwo49")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id("btnSwipeBottom")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('TwoItem49'))
      expect(text == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await (driver.findComponent(ON.id("btnDelOne0")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await (driver.findComponent(ON.id("btnSwipeTop")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('OneItem0'))
      expect(text1 == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await (driver.findComponent(ON.id("btnDelOne9")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('OneItem10'))
      expect(text2 == null).assertTrue()
      console.info('[IfElseTest0100_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   IfElseTest0100_static_002
     * @tc.name     IfElseTest0100_static_002
     * @tc.desc     IfElseTest0100_static_002
     * @tc.level    Level.LEVEL0
     */
it('IfElseTest0100_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElseTest0100_static_001] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await (driver.findComponent(ON.id("btnInsertTwo49")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id("btnSwipeBottom")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await (driver.findComponent(ON.id("btnInsertOne0")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await (driver.findComponent(ON.id("btnSwipeTop")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await (driver.findComponent(ON.id("btnInsertOne9")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloOne9'))
      expect(text2 != null).assertTrue()
      console.info('[IfElseTest0100_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   IfElseTest0100_static_003
     * @tc.name     IfElseTest0100_static_003
     * @tc.desc     IfElseTest0100_static_003
     * @tc.level    Level.LEVEL0
     */
it('IfElseTest0100_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElseTest0100_static_001] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await (driver.findComponent(ON.id("btnMakeTwo49")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id("btnSwipeBottom")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloWorldTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await (driver.findComponent(ON.id("btnMakeOne0")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await (driver.findComponent(ON.id("btnSwipeTop")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloWorldOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await (driver.findComponent(ON.id("btnMakeOne9")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloWorldOne9'))
      expect(text2 != null).assertTrue()
      console.info('[IfElseTest0100_static_001] END');
      done();
    });
  })
}
