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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ChainWeight() {
  describe('ChainWeight', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ChainWeight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChainWeight/ChainWeight',
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChainWeight state pages:" + JSON.stringify(pages));
        if (!("ChainWeight" == pages.name)) {
          console.info("get ChainWeight pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ChainWeight page error:" + err);
      }
      console.info("ChainWeight beforeEach end");

    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   ChainWeight_static_0100
     * @tc.name     ChainWeight_static_0100
     * @tc.desc     ChainWeight_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ChainWeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ChainWeight_static_0100 START');
      await CommonFunc.sleep(1000);

      let rect1 = Utils.getComponentRect('row1');
      let rect2 = Utils.getComponentRect('row2');
      console.info('ChainWeight_static_0100 row1 left: ' + rect1.left + ',top: ' + rect1.top + ',right: ' +
      rect1.right + ',bottom: ' + rect1.bottom);
      console.info('ChainWeight_static_0100 row2 left: ' + rect2.left + ',top: ' + rect2.top + ',right: ' +
      rect2.right + ',bottom: ' + rect2.bottom);
      expect(Math.abs(Math.round((rect1.right - rect1.left) / 2 - (rect2.right - rect2.left))) <= 1).assertTrue();

      console.info('ChainWeight_static_0100 END');
      done();
    });

  })
}