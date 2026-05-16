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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function NavigationUndefinedTest() {
  describe('HideToolBarUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("HideToolBarUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("HideToolBarUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/hideToolBarUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get HideToolBarUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("hideToolBarUndefined" == pages.name)) {
          console.info("get HideToolBarUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push HideToolBarUndefinedTest page error:" + err);
      }
      console.info("HideToolBarUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   HideToolBarUndefinedTest_static_0001
     * @tc.name     HideToolBarUndefinedTest_static_0001
     * @tc.desc     HideToolBarUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('HideToolBarUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[HideToolBarUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation1');
      await CommonFunc.sleep(1000);

      console.info("[HideToolBarUndefinedTest_static_0001] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[HideToolBarUndefinedTest_static_0001] hideToolBar: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('hideToolBar')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideToolBar')))
        .assertEqual('true');
      let changeBtn = await driver.findComponent(ON.id('hideToolBar'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[HideToolBarUndefinedTest_static_0001] click hideToolBar");
      strJson = inspector.getInspectorByKey('MyNavigation1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideToolBar')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[HideToolBarUndefinedTest_static_0001] END');
      done();
    });

  })
}