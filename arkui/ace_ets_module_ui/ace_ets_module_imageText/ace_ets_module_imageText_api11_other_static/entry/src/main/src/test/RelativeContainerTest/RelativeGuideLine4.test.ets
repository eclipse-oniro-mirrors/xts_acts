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

export default function RelativeGuideLine4() {
  describe('RelativeGuideLine4', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeGuideLine4 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeGuideLine4 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine4" == pages.name)) {
          console.info("get RelativeGuideLine4 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine4"});
          await CommonFunc.sleep(2000);
          // console.info("push RelativeGuideLine4 page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push RelativeGuideLine4 page error:" + err);
      }
      console.info("RelativeGuideLine4 foreEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine4 after each called");
    });

    

    
/**
     * @tc.number   RelativeGuideLine4_static_001
     * @tc.name     RelativeGuideLine4_static_001
     * @tc.desc     RelativeGuideLine4_static_001
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine4_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine4_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine4_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      console.info("[RelativeGuideLine4_001] RelativeContainer left is: " + rel.left + 'button left:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_001] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine4_static_002
     * @tc.name     RelativeGuideLine4_static_002
     * @tc.desc     RelativeGuideLine4_static_002
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine4_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine4_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('noSet'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine4_002] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine4_002] RelativeContainer top is: " + rel.top + 'button top:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_002] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeGuideLine4_static_003
     * @tc.name     RelativeGuideLine4_static_003
     * @tc.desc     RelativeGuideLine4_static_003
     * @tc.level    Level.LEVEL3
     */
it('RelativeGuideLine4_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeGuideLine4_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStart'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine4_003] RelativeContainer top is: " + rel.top + 'button top:' + bt.top);
      expect(Math.abs(Math.round(rel.top - bt.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_003] END');
      done();
    });


  })
}
