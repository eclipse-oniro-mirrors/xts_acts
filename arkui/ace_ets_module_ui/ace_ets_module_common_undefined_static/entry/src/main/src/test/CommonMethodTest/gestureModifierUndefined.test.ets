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
  PointerMatrix,
  Point
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


export default function gestureModifierUndefined() {
  describe('gestureModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("gestureModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("gestureModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/gestureModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gestureModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("gestureModifierUndefined" == pages.name)) {
          console.info("get gestureModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureModifierUndefined page error:" + err);
      }
      console.info("gestureModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   gestureModifierUndefined_static_0001
     * @tc.name     gestureModifierUndefined_static_0001
     * @tc.desc     gestureModifierUndefined_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('gestureModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let gestureColumn = await driver.findComponent(ON.id('GM_column'));
      await (gestureColumn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      
      let gestureText = await driver.findComponent(ON.id('GM_text'));
      expect(await (gestureText?.getText() as Promise<string>)).assertEqual('Click1');

      let changeBtn = await driver.findComponent(ON.id('GM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await (gestureColumn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (gestureText?.getText() as Promise<string>)).assertEqual('Click1');
      console.info('[gestureModifierUndefined_static_0001] END');
      done();
    });

  })
}