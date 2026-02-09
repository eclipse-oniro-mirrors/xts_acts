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
  WindowMode,UIElementInfo,
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

export default function FreezeV1Test03() {
  describe('FreezeV1Test03', () => {

    beforeAll(() => {
      console.info("FreezeV1Test03 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("FreezeV1Test03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV1/Freeze003',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FreezeV1Test03 state pages:" + JSON.stringify(pages));
        if (!("FreezeV1Test03" == pages.name)) {
          console.info("get FreezeV1Test03 pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FreezeV1Test03 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FreezeV1Test03 page error:" + err);
      }
      console.info("FreezeV1Test03 beforeEach end");
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Freeze003 after each called");
    });

    
    
/**
     * @tc.number   FreezeTest_static_0013
     * @tc.name     FreezeTest_static_0013
     * @tc.desc     FreezeTest_static_0013
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_0013', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_001 START');
      let driver =  Driver.create();

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>) ;

      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>) ;
      await sleep(1);
      await (changeMessage?.click() as Promise<void>) ;

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:2 index:1 logNumber:1').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_001 END');
    });

    
    
/**
     * @tc.number   FreezeTest_static_0023
     * @tc.name     FreezeTest_static_0023
     * @tc.desc     FreezeTest_static_0023
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_0023', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_002 START');
      let driver =  Driver.create();
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await (nextPage1?.click() as Promise<void>) ;
      await sleep(1);

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>) ;

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:3 index:2 logNumber:2').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_002 END');
    });

    
    
/**
     * @tc.number   FreezeTest_static_0033
     * @tc.name     FreezeTest_static_0033
     * @tc.desc     FreezeTest_static_0033
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_0033', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_003 START');
      let driver =  Driver.create();
      let nextPage2 = await driver.findComponent(ON.id('NextPage2'));
      await (nextPage2?.click() as Promise<void>) ;
      await sleep(1);

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>) ;

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:3 logNumber:3').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_003 END');
    });

    
    
/**
     * @tc.number   FreezeTest_static_0043
     * @tc.name     FreezeTest_static_0043
     * @tc.desc     FreezeTest_static_0043
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_0043', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_004 START');
      let driver =  Driver.create();
      let backPage3 = await driver.findComponent(ON.id('BackPage3'));
      await (backPage3?.click() as Promise<void>) ;
      await sleep(1);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:2 logNumber:4').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_004 END');
    });

    
    
/**
     * @tc.number   FreezeTest_static_0053
     * @tc.name     FreezeTest_static_0053
     * @tc.desc     FreezeTest_static_0053
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_0053', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_005 START');
      let driver =  Driver.create();
      let backPage2 = await driver.findComponent(ON.id('BackPage2'));
      await (backPage2?.click() as Promise<void>) ;
      await sleep(1);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:1 logNumber:5').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1);
      console.info('FreezeTest_static_005 END');
    });
  })
}
