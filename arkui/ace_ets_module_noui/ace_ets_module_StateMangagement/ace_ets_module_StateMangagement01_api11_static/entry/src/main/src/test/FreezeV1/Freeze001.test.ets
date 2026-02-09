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
import { UIElementInfo } from '@ohos.UiTest';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: int) : Promise<int>  {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, time)
    })
  }

export default function FreezeV1Test() {
  describe('FreezeV1Test', () => {

    beforeAll(() => {
      console.info("FreezeV1Test beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("FreezeV1Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV1/Freeze001',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FreezeV1Test state pages:" + JSON.stringify(pages));
        if (!("FreezeV1Test" == pages.name)) {
          console.info("get FreezeV1Test pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FreezeV1Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FreezeV1Test page error:" + err);
      }
      console.info("FreezeV1Test beforeEach end");
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
      await (changeIndex?.click() as Promise<void>) ;
       sleep(1)

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>) ;
       sleep(1)

      let observer1 =  driver.createUIEventObserver()
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


    
    
/**
     * @tc.number   FreezeTest_static_002
     * @tc.name     FreezeTest_static_002
     * @tc.desc     FreezeTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_002', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_002 START');
      let driver =  Driver.create()
      let changeIndex0 = await driver.findComponent(ON.id('changeIndex0'));
      await (changeIndex0?.click() as Promise<void>) ;
       sleep(1)

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (uiElementInfo: UIElementInfo) => {
        try {
          expect(uiElementInfo.text == 'TabContent message callback func 1').assertTrue()
          expect(uiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)
      console.info('FreezeTest_static_002 END');
    });
  })
}
