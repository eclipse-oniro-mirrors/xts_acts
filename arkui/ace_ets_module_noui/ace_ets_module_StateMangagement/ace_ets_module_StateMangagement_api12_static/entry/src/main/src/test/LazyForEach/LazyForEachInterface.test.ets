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

export default function LazyForEachInterface() {
  describe('LazyForEachInterface', () => {
    beforeAll(() => {
      console.info("LazyForEachInterface beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachInterface beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachInterface',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachInterface state pages:" + JSON.stringify(pages));
        if (!("LazyForEachInterface" == pages.name)) {
          console.info("get LazyForEachInterface pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachInterface page error:" + err);
      }
      console.info("LazyForEachInterface beforeEach end");
    });



    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
      console.info("LazyForEachInterface after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachInterface_static_001
     * @tc.name     LazyForEachInterface_static_001
     * @tc.desc     LazyForEachInterface_static_001
     * @tc.level    Level.LEVEL1
     */
it('LazyForEachInterface_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachInterface_static_001] START');
      await CommonFunc.sleep(100);
      let driver: Driver = Driver.create();
      let switch_btn = await (driver.findComponent(ON.id('switch'))as Promise<Component>)
      await ( switch_btn?.click() as Promise<void> );
      let info = await (driver.findComponent(ON.id('interfaceInfo'))as Promise<Component>);
      expect(await info.getText()).assertEqual('aboutToRecycle');
      console.info('[LazyForEachInterface_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   LazyForEachInterface_static_002
     * @tc.name     LazyForEachInterface_static_002
     * @tc.desc     LazyForEachInterface_static_002
     * @tc.level    Level.LEVEL1
     */
it('LazyForEachInterface_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachInterface_static_002] START');      
      await CommonFunc.sleep(100);
      let driver: Driver = Driver.create();
      let switch_btn = await (driver.findComponent(ON.id('switch'))as Promise<Component>)
      await ( switch_btn?.click() as Promise<void> );
      let info = await (driver.findComponent(ON.id('interfaceInfo'))as Promise<Component>);
      expect(await info.getText()).assertEqual('aboutToReuse');
      console.info('[LazyForEachInterface_static_002] END');
      done();
    });
  })
}