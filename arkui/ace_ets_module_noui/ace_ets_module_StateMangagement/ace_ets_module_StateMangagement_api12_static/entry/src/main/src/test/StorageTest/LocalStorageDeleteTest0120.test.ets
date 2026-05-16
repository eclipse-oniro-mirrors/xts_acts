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

export default function LocalStorageDeleteTest0120() {
  describe('LocalStorageDeleteTest0120', () => {
    beforeAll(() => {
      console.info("LocalStorageDeleteTest0120 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStorageDeleteTest0120 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Storage/LocalStorageDelete0120',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalStorageDeleteTest0120 state pages:" + JSON.stringify(pages));
        if (!("LocalStorageDeleteTest0120" == pages.name)) {
          console.info("get LocalStorageDeleteTest0120 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LocalStorageDeleteTest0120 page error:" + err);
      }
      console.info("LocalStorageDeleteTest0120 beforeEach end");
    });


    
    
    /**
     * @tc.number   LocalStorageDeleteTest0120_static_0100
     * @tc.name     LocalStorageDeleteTest0120_static_0100
     * @tc.desc     LocalStorageDeleteTest0120_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('LocalStorageDeleteTest0120_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('LocalStorageDeleteTest0120001 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component|null = await (driver.findComponent(ON.id("btnDel")) as Promise<Component>);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvIsDel'));
      console.info("[LocalStorageDeleteTest0120001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("true");
      console.info('LocalStorageDeleteTest0120_static_0100 END');
    });
  })
}