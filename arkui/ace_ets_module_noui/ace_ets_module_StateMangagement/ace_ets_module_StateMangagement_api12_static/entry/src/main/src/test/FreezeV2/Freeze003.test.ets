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
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
import { UIElementInfo } from '@ohos.UiTest';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function FreezeV2Child() {
  describe('FreezeV2Child', () => {

    beforeAll(() => {
      console.info("FreezeV2Child beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("FreezeV2Child beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV2/Freeze003',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages = routerInstance.getState();
        console.info("get FreezeV2Child state pages:" + JSON.stringify(pages));
        if (!("FreezeV2Child" == pages.name)) {
          routerInstance.clear();
          console.info("get FreezeV2Child pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push FreezeV2Child page error:" + err);
      }
      console.info("FreezeV2Child beforeEach end");
    });



    
    
    /**
     * @tc.number   FreezeV2Child_static_01
     * @tc.name     FreezeV2Child_static_01
     * @tc.desc     FreezeV2Child_static_01
     * @tc.level    Level.LEVEL0
     */
it('FreezeV2Child_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      console.info('FreezeV2Child_static_01 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000)
      
      let nextPage = await driver.findComponent(ON.id('FreezeV2ChildNextPage'));
      await CommonFunc.sleep(1000)
      await (nextPage?.click() as Promise<void>);
      let backPage = await driver.findComponent(ON.id('FreezeV2ChildBackPage'));
      await CommonFunc.sleep(1000)
      await (backPage?.click() as Promise<void>);
      await CommonFunc.sleep(500)

      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'The book name change from A Midsummer Night’s Dream to Jane Austen oPride and Prejudice').assertTrue();
          expect(UiElementInfo.type == 'Toast').assertTrue();
        } catch (err) {
          console.info(err);
        }
      }
      observer1.onceToastShow(callback1)

      console.info('FreezeV2Child_static_01 END');
      done()
    })
  })
}

