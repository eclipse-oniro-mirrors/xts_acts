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

export default function RelativeChain5() {
  describe('RelativeChain5', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeChain5 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeChain5 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain5" == pages.name)) {
          console.info("get RelativeChain5 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain5"});
          await CommonFunc.sleep(2000);
          // console.info("push RelativeChain5 page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push RelativeChain5 page error:" + err);
      }
      console.info("RelativeChain5 foreEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain5 after each called");
    });

    

    
/**
     * @tc.number   RelativeChain5_static_001
     * @tc.name     RelativeChain5_static_001
     * @tc.desc     RelativeChain5_static_001
     * @tc.level    Level.LEVEL3
     */
it('RelativeChain5_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeChain5_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain5');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow5_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow5_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow5_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain5_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' +
      JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row2.left - row1.right) - Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row1.left - rel.left) - Math.round(rel.right - row3.right)) <= 1).assertTrue();

      console.info('[RelativeChain5_001] END');
      done();
    });

    

    
/**
     * @tc.number   RelativeChain5_static_002
     * @tc.name     RelativeChain5_static_002
     * @tc.desc     RelativeChain5_static_002
     * @tc.level    Level.LEVEL3
     */
it('RelativeChain5_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RelativeChain5_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain52');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow52_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow52_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow52_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain5_002] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' +
      JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row2.left - row1.right) - Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row1.left - rel.left) - Math.round(rel.right - row3.right)) <= 1).assertTrue();

      console.info('[RelativeChain5_002] END');
      done();
    });
  })
}
