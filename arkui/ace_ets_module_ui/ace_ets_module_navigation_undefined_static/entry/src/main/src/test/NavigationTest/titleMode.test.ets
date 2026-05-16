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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function titleMode() {
  describe('titleMode', () => {
    beforeAll(async (): Promise<void> => {
      console.info("titleMode beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("titleMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/titleMode',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get titleMode state pages:" + JSON.stringify(pages));
        if (!("titleMode" == pages.name)) {
          console.info("get titleMode pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push titleMode page error:" + err);
      }
      console.info("titleMode beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   titleMode_static_0001
     * @tc.name     titleMode_static_0001
     * @tc.desc     test titleMode
     * @tc.level    Level.LEVEL1
     */
    it('titleMode_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[titleMode_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Navigation_1');
      console.info("[titleMode_static_0001] titleMode: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Free');

      let changeBtn = await driver.findComponent(ON.id('Navigation_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Navigation_1');
      console.info("[titleMode_static_0001] titleMode: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Full');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Navigation_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Free');
      console.info('[titleMode_static_0001] END');
      done();
    });


    /**
     * @tc.number   toolbar_static_0002
     * @tc.name     toolbar_static_0002
     * @tc.desc     test toolbarConfiguration
     * @tc.level    Level.LEVEL1
     */
    it('toolbar_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[toolbar_static_0002] START');
      let driver: Driver = Driver.create();

      let textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();

      let changeBtn = await driver.findComponent(ON.id('Navigation_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(await (textNode?.getText() as Promise<string>)).assertEqual('toolbar');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();
      console.info('[toolbar_static_0002] END');
      done();
    });
  })
}