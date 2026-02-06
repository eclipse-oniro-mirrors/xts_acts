'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  PointerMatrix
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

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RelativeGuideLine() {
  describe('RelativeGuideLine', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeGuideLine beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeGuideLine state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine" == pages.name)) {
          console.info("get RelativeGuideLine pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine"});
          await CommonFunc.sleep(2000);
          // console.info("push RelativeGuideLine page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push RelativeGuideLine page error:" + err);
      }
      console.info("RelativeGuideLine foreEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine after each called");
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_001
     * @tc.name     RelativeGuideLine_static_001
     * @tc.desc     RelativeGuideLine_static_001
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_001] END');
      done();
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_002
     * @tc.name     RelativeGuideLine_static_002
     * @tc.desc     RelativeGuideLine_static_002
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeDir'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_002] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_002] END');
      done();
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_003
     * @tc.name     RelativeGuideLine_static_003
     * @tc.desc     RelativeGuideLine_static_003
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeId'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_003] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine_003] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_003] END');
      done();
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_004
     * @tc.name     RelativeGuideLine_static_004
     * @tc.desc     RelativeGuideLine_static_004
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartVp'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_004] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_004] END');
      done();
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_005
     * @tc.name     RelativeGuideLine_static_005
     * @tc.desc     RelativeGuideLine_static_005
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartPx'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_005] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(50)) <= 1).assertTrue();

      console.info('[RelativeGuideLine_005] END');
      done();
    });

    
    
/**
     * @tc.number   RelativeGuideLine_static_006
     * @tc.name     RelativeGuideLine_static_006
     * @tc.desc     RelativeGuideLine_static_006
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_006', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartLpx'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_006] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.lpx2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_006] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_007
     * @tc.name     RelativeGuideLine_static_007
     * @tc.desc     RelativeGuideLine_static_007
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_007', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartPer'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_007] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      console.info("[RelativeGuideLine_007] RelativeContainerBottom is: " + rel.bottom);
      expect(Math.floor(Math.abs(bt.top - rel.top - (rel.bottom - rel.top) * 0.5)) <= 1).assertTrue();

      console.info('[RelativeGuideLine_007] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_008
     * @tc.name     RelativeGuideLine_static_008
     * @tc.desc     RelativeGuideLine_static_008
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_008', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartRes'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_008] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_008] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_009
     * @tc.name     RelativeGuideLine_static_009
     * @tc.desc     RelativeGuideLine_static_009
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_009', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_009] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_009] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_003] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();
      console.info('[RelativeGuideLine_009] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_010
     * @tc.name     RelativeGuideLine_static_010
     * @tc.desc     RelativeGuideLine_static_010
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth2'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_010] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_010] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      console.info('[RelativeGuideLine_010] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_011
     * @tc.name     RelativeGuideLine_static_011
     * @tc.desc     RelativeGuideLine_static_011
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_011', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_011] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth3'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_011] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_011] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      console.info('[RelativeGuideLine_011] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine_static_012
     * @tc.name     RelativeGuideLine_static_012
     * @tc.desc     RelativeGuideLine_static_012
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine_static_012', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine_012] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeStart4'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_012] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine_012] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(80))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_012] END');
      done();
    });


  })
}
