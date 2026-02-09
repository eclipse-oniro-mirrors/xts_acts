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

export default function componentSnapshotTest() {
  describe('componentSnapshotTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("componentSnapshotTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/componentSnapshot/componentSnapshot",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get componentSnapshotTest state pages:" + JSON.stringify(pages));
        if (!("componentSnapshot" == pages.name)) {
          console.info("get componentSnapshotTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push componentSnapshotTest page error:" + err);
      }
      console.info("componentSnapshotTest beforeEach end");
    });


    
    
/**
     * @tc.number   componentSnapshotTest_static_0010
     * @tc.name     componentSnapshotTest_static_0010
     * @tc.desc     componentSnapshotTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotTest_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await (driver?.findComponent(ON.id('ComponentSnapshot_id')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ComponentSnapshot_id');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[componentSnapshotTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('true');
      console.info('[componentSnapshotTest_0010] END');
      done();
    });
  })
}

