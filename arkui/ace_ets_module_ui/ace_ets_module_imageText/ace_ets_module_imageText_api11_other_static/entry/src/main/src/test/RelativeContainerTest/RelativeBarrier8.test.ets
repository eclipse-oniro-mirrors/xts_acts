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

export default function RelativeBarrier8() {
  describe('RelativeBarrier8', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeBarrier8 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeBarrier8 state pages:" + JSON.stringify(pages));
        if (!("RelativeBarrier8" == pages.name)) {
          console.info("get RelativeBarrier8 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeBarrier8"});
          await CommonFunc.sleep(2000);
          // console.info("push RelativeBarrier8 page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push RelativeBarrier8 page error:" + err);
      }
      console.info("RelativeBarrier8 foreEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeBarrier8 after each called");
    });

    
    
/**
     * @tc.number   RelativeBarrier8_static_001
     * @tc.name     RelativeBarrier8_static_001
     * @tc.desc     RelativeBarrier8_static_001
     * @tc.level    Level.LEVEL3
     */
it('RelativeBarrier8_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeBarrier8_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeBarrier8');
      let row1 = CommonFunc.getComponentRect('RelativeBarrier8Bt1');
      let row2 = CommonFunc.getComponentRect('RelativeBarrier8Bt2');
      let row3 = CommonFunc.getComponentRect('RelativeBarrier8Bt3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeBarrier8_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' +
      JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row3.left - rel.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      console.info('[RelativeBarrier8_001] END');
      done();
    });
  })
}
