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
  PointerMatrix,
  MouseButton
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


export default function RelativeChain4() {
  describe('RelativeChain4', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeChain4 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeChain4 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain4" == pages.name)) {
          console.info("get RelativeChain4 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain4"});
          await CommonFunc.sleep(2000);
          // console.info("push RelativeChain4 page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push RelativeChain4 page error:" + err);
      }
      console.info("RelativeChain4 foreEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain4 after each called");
    });

    

    
/**
     * @tc.number   RelativeChain4_static_001
     * @tc.name     RelativeChain4_static_001
     * @tc.desc     RelativeChain4_static_001
     * @tc.level    Level.LEVEL3
     */
it('RelativeChain4_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeChain4_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain4');
      let driver: Driver = Driver.create();
      await driver.mouseClick({ x: Math.round(rel.left + UIContext.resolveUIContext()!.vp2px(50)).toInt(), y: Math.round(rel.top + UIContext.resolveUIContext()!.vp2px(80)).toInt() },
        MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RelativeChainText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RelativeChain4_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[RelativeChain4_001] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeChain4_static_002
     * @tc.name     RelativeChain4_static_002
     * @tc.desc     RelativeChain4_static_002
     * @tc.level    Level.LEVEL3
     */
it('RelativeChain4_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeChain4_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain42');
      let driver: Driver = Driver.create();
      await driver.mouseClick({ x: Math.round(rel.left + UIContext.resolveUIContext()!.vp2px(50)).toInt(), y: Math.round(rel.top + UIContext.resolveUIContext()!.vp2px(80)).toInt() },
        MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RelativeChainText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RelativeChain4_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[RelativeChain4_002] END');
      done();
    });
  })
}
