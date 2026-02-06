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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function abilityTest() {
  const SUITE = 'CounterComponent'
  describe('ActsAceCounterComponentTest', () => {
    beforeAll(() => {
      console.info("ActsBadgeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      let options: router.RouterOptions = {
        url: "MainAbility/pages/advancedCounter/advancedCounterIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsAceCounterComponentTest state success " + JSON.stringify(pages));
        if (!("advancedCounterIndex" == pages.name)) {
          console.info("get ActsAceCounterComponentTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push ActsAceCounterComponentTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    })

    
    /**
     * @tc.number   Advanced_ui_counterComponent_static_0100
     * @tc.name     Advanced_ui_counterComponent_static_0100
     * @tc.desc     Advanced_ui_counterComponent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Advanced_ui_counterComponent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create()
      let listCounterComponent = await (driver.findComponent(ON.text('Number')) as Promise<Component>)
      await CommonFunc.sleep(500);
      let type = await listCounterComponent.getType();
      await CommonFunc.sleep(500);
      expect(type).assertEqual('Text');
      done();
    });

    
    /**
     * @tc.number   Advanced_ui_counterComponent_static_0200
     * @tc.name     Advanced_ui_counterComponent_static_0200
     * @tc.desc     Advanced_ui_counterComponent_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Advanced_ui_counterComponent_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create()
      let compactCounter = await (driver.findComponent(ON.text('Total')) as Promise<Component>)
      await CommonFunc.sleep(500);
      let type = await compactCounter.getType();
      await CommonFunc.sleep(500);
      expect(type).assertEqual('Text');
      done();
    });
  })
}

