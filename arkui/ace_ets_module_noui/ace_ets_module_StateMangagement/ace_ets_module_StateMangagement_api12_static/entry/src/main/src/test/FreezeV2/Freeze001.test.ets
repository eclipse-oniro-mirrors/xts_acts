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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
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
import { UIElementInfo } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

async function sleep(time: int) : Promise<int>  {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, time)
  })
}

export default function FreezeV2Test() {
  describe('FreezeV2Test', () => {

    beforeAll(() => {
      console.info("FreezeV2Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("FreezeV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV2/Freeze001',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FreezeV2Test state pages:" + JSON.stringify(pages));
        if (!("FreezeV2Test" == pages.name)) {
          console.info("get FreezeV2Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push FreezeV2Test page error:" + err);
      }
      console.info("FreezeV2Test beforeEach end");
    });


    afterEach(async () => {
      await sleep(1)
      console.info("Freeze001 after each called");
    });

    
    
    /**
     * @tc.number   FreezeTest_static_001
     * @tc.name     FreezeTest_static_001
     * @tc.desc     FreezeTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_001', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_001 START');
      let driver =  Driver.create()
      let changeIndex = await driver.findComponent(ON.id('changeIndex'));
      await (changeIndex?.click() as Promise<void>);
      await sleep(1)

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>);
      await sleep(1)

      let observer1 = driver.createUIEventObserver()
      let callback1 = (uiElementInfo: UIElementInfo) => {
        try {
          expect(uiElementInfo.text == 'FreezeChild message callback func 1, index: 1').assertTrue()
          expect(uiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)
      console.info('FreezeTest_static_001 END');
    });
  })
}
  