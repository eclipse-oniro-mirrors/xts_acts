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
import { UIElementInfo } from '@ohos.UiTest';
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

export default function FreezeV2Test03() {
  describe('FreezeV2Test03', () => {

    beforeAll(() => {
      console.info("FreezeV2Test03 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("FreezeV2Test03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV2/Freeze002',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FreezeV2Test03 state pages:" + JSON.stringify(pages));
        if (!("FreezeV2/Freeze002" == pages.name)) {
          console.info("get FreezeV2Test03 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push FreezeV2Test03 page error:" + err);
      }
      console.info("FreezeV2Test03 beforeEach end");
    });


    
    /**
     * @tc.number   FreezeTest2_static_001
     * @tc.name     FreezeTest2_static_001
     * @tc.desc     FreezeTest2_static_001
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest2_static_001', Level.LEVEL0, async () => {
      console.info('FreezeTest2_static_001 START');
      let driver =  Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      console.log('changeMessage==========' + changeMessage)
      await (changeMessage?.click() as Promise<void>);
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:2 index:1').assertTrue();
          expect(UiElementInfo.type == 'Toast').assertTrue();
        } catch (err) {
          console.info(err);
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest2_static_001 END');
    });

    
    
    /**
     * @tc.number   FreezeTest_static_002
     * @tc.name     FreezeTest_static_002
     * @tc.desc     FreezeTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_002', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_002 START');
      let driver =  Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      console.log('changeMessage==========' + changeMessage)
      await (changeMessage?.click() as Promise<void>);
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await (nextPage1?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:3 index:2').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_002 END');
    });

    
    
    /**
     * @tc.number   FreezeTest_static_003
     * @tc.name     FreezeTest_static_003
     * @tc.desc     FreezeTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_003', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_003 START');
      let driver =  Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>);
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await (nextPage1?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage2 = await driver.findComponent(ON.id('NextPage2'));
      await (nextPage2?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:3').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_003 END');
    });

    
    
    /**
     * @tc.number   FreezeTest_static_004
     * @tc.name     FreezeTest_static_004
     * @tc.desc     FreezeTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_004', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_004 START');
      let driver =  Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>);
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await (nextPage1?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage2 = await driver.findComponent(ON.id('NextPage2'));
      await (nextPage2?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let backPage3 = await driver.findComponent(ON.id('BackPage3'));
      await (backPage3?.click() as Promise<void>);
      await sleep(1);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:2').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeTest_static_004 END');
    });

    
    
    /**
     * @tc.number   FreezeTest_static_005
     * @tc.name     FreezeTest_static_005
     * @tc.desc     FreezeTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('FreezeTest_static_005', Level.LEVEL0, async () => {
      console.info('FreezeTest_static_005 START');
      let driver =  Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await (changeMessage?.click() as Promise<void>);
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await (nextPage0?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await (nextPage1?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let nextPage2 = await driver.findComponent(ON.id('NextPage2'));
      await (nextPage2?.click() as Promise<void>);
      await sleep(1);
      await (changeMessage?.click() as Promise<void>);
      let backPage3 = await driver.findComponent(ON.id('BackPage3'));
      await (backPage3?.click() as Promise<void>);
      await sleep(1);
      let backPage2 = await driver.findComponent(ON.id('BackPage2'));
      await (backPage2?.click() as Promise<void>);
      await sleep(1);

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:1').assertTrue()
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
