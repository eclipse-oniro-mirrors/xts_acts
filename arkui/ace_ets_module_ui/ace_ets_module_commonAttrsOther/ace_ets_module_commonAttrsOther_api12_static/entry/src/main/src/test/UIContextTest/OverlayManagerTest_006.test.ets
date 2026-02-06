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
import events_emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function OverlayManagerTest_006() {
  describe('OverlayManagerTest_006', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("OverlayManagerTest_006 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/OverlayManager_006",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OverlayManagerTest_006 state pages:" + JSON.stringify(pages));
        if (!("OverlayManager_006" == pages.name)) {
          console.info("get OverlayManagerTest_006 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OverlayManagerTest_006 page error:" + err);
      }
      console.info("OverlayManagerTest_006 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OverlayManagerTest_006 after each called");
    });


    
    
/**
     * @tc.number   hideAllComponentContents_static_006
     * @tc.name     hideAllComponentContents_static_006
     * @tc.desc     hideAllComponentContents_static_006
     * @tc.level    Level.LEVEL0
     */
it('hideAllComponentContents_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[hideAllComponentContents_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await (driver?.findComponent(ON.id('addComponentContent')) as Promise<Component | null>);
      await (add?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let hideAll = await (driver?.findComponent(ON.id('hideAllComponentContents')) as Promise<Component | null>);
      await (hideAll?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Column = inspector.getInspectorByKey('Column');
      console.info('Column: ' + JSON.parseJsonElement(Column).getElement('$attrs').getString('visibility'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(Column).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      await CommonFunc.sleep(1000);
      console.info('[hideAllComponentContents_006] END');
      let remove = await (driver?.findComponent(ON.id('removeComponentContent')) as Promise<Component | null>);
      await (remove?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      done();
    });


  })
}
