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
export default function LazyForEachTest0470() {
  describe('LazyForEachTest0470', () => {
    beforeAll(() => {
      console.info("LazyForEachTest0470 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachTest0470 beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/LazyForEach0470",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachTest0470 state pages:" + JSON.stringify(pages));
        if (!("LazyForEachTest0470" == pages.name)) {
          console.info("get LazyForEachTest0470 pages.name:" + JSON.stringify(pages.name));
          let result =  routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachTest0470 page error:" + err);
      }
      console.info("LazyForEachTest0470 beforeEach end");
    });
    afterEach(async (): Promise<void>  => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachTest0470 after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachTest0470_static_001
     * @tc.name     LazyForEachTest0470_static_001
     * @tc.desc     LazyForEachTest0470_static_001
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachTest0470_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachTest0470_static_001] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("btnDelTwo49"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('TwoItem49'))
      expect(text == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id("btnDelOne0"));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('OneItem0'))
      expect(text1 == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id("btnDelOne9"));
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('OneItem10'))
      expect(text2 == null).assertTrue()
      console.info('[LazyForEachTest0470_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   LazyForEachTest0470_static_002
     * @tc.name     LazyForEachTest0470_static_002
     * @tc.desc     LazyForEachTest0470_static_002
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachTest0470_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachTest0470_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("btnInsertTwo49"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id("btnInsertOne0"));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id("btnInsertOne9"));
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloOne9'))
      expect(text2 != null).assertTrue()
      console.info('[LazyForEachTest0470_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   LazyForEachTest0470_static_003
     * @tc.name     LazyForEachTest0470_static_003
     * @tc.desc     LazyForEachTest0470_static_003
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachTest0470_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachTest0470_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("btnMakeTwo49"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloWorldTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id("btnMakeOne0"));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloWorldOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id("btnMakeOne9"));
      await CommonFunc.sleep(1000);
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloWorldOne9'))
      expect(text2 != null).assertTrue()
      console.info('[LazyForEachTest0470_static_001] END');
      done();
    });
  })
}
