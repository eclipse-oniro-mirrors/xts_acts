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

export default function getContextMenuController() {
  describe('getContextMenuController', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("getContextMenuController beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/getContextMenuController",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getContextMenuController state pages:" + JSON.stringify(pages));
        if (!("getContextMenuController" == pages.name)) {
          console.info("get getContextMenuController pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getContextMenuController page error:" + err);
      }
      console.info("getContextMenuController beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getContextMenuController after each called");
    });


    
    
/**
     * @tc.number   getContextMenuController_static_001
     * @tc.name     getContextMenuController_static_001
     * @tc.desc     getContextMenuController_static_001
     * @tc.level    Level.LEVEL0
     */
it('getContextMenuController_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getContextMenuController_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let add = await (driver?.findComponent(ON.id('getContextClick')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);
      await (add?.longClick() as Promise<void>);

      let remove = await (driver?.findComponent(ON.id('getContextClose')) as Promise<Component | null>);
      await CommonFunc.sleep(2000);
      await (remove?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      let Column = inspector.getInspectorByKey('getContext');
      await CommonFunc.sleep(2000);
      console.info('getContextMenuController_001 content: ' +
      JSON.parseJsonElement(Column).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(Column).getElement('$attrs').getString('content'))
        .assertEqual('getContextMenuController close success');
      console.info('[getContextMenuController_001] END');

      await CommonFunc.sleep(1000);
      done();
    });

  })
}
