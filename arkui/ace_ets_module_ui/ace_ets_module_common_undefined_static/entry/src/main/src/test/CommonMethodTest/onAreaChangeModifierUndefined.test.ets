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
import { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function onAreaChangeModifierUndefined() {
  describe('onAreaChangeModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("onAreaChangeModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onAreaChangeModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onAreaChangeModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onAreaChangeModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("onAreaChangeModifierUndefined" == pages.name)) {
          console.info("get onAreaChangeModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onAreaChangeModifierUndefined page error:" + err);
      }
      console.info("onAreaChangeModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   onAreaChangeModifierUndefined_static_0001
     * @tc.name     onAreaChangeModifierUndefined_static_0001
     * @tc.desc     test onAreaChange
     * @tc.level    Level.LEVEL1
     */
    it('onAreaChangeModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onAreaChangeModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let text2 = await driver.findComponent(ON.id('OACM_text2'));
      await (text2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let text1 = await driver.findComponent(ON.id('OACM_text1'));
      expect(await (text1?.getText() as Promise<string>)).assertEqual(`change0`);

      let changeBtn = await driver.findComponent(ON.id('OACM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (text2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let str = await (text2?.getText() as Promise<string>);
      expect(await (text1?.getText() as Promise<string>)).assertEqual(`change${str.length}`);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (text2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text1?.getText() as Promise<string>)).assertEqual(`change${str.length}`);
      console.info('[onAreaChangeModifierUndefined_static_0001] END');
      done();
    });
  })
}