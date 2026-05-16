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
import { UIElementInfo } from '@ohos.UiTest';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function Monitor0031Test() {
  describe('Monitor0031Test', () => {

    beforeAll(() => {
      console.info("Monitor0031Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Monitor0031Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/Monitor0031",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Monitor0031Test state pages:" + JSON.stringify(pages));
        if (!("Monitor0031Test" == pages.name)) {
          console.info("get Monitor0031Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Monitor0031Test page error:" + err);
      }
      console.info("Monitor0031Test beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor0031Test after each called");
    });

    
    
    /**
     * @tc.number   Monitor0031Test_static_001
     * @tc.name     Monitor0031Test_static_001
     * @tc.desc     Monitor0031Test_static_001
     * @tc.level    Level.LEVEL0
     */
it('Monitor0031Test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Monitor0031Test_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnMonitor0031"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo : UIElementInfo) => {
        try {
          console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
          console.info('UIElementInfo text:'+ UiElementInfo.text)
          console.info('UIElementInfo type:'+ UiElementInfo.type)
          expect(UiElementInfo.bundleName == 'com.arkui.ace.StateMangagement.api12').assertTrue()
          expect(UiElementInfo.text == 'name: Jack').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)
      console.info('[Monitor0031Test_static_001] END');
      done();
    });
  })
}
