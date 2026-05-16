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


export default function eventInterceptionUndefined() {
  describe('eventInterceptionUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("eventInterceptionUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("eventInterceptionUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/eventInterceptionUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get eventInterceptionUndefined state pages:" + JSON.stringify(pages));
        if (!("eventInterceptionUndefined" == pages.name)) {
          console.info("get eventInterceptionUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push eventInterceptionUndefined page error:" + err);
      }
      console.info("eventInterceptionUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   eventInterceptionUndefined_static_0001
     * @tc.name     eventInterceptionUndefined_static_0001
     * @tc.desc     test onTouchIntercept
     * @tc.level    Level.LEVEL1
     */
    it('eventInterceptionUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[eventInterceptionUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let column = await driver.findComponent(ON.id('EI_column'));
      await (column?.click() as Promise<void>);

      let text = await driver.findComponent(ON.id('EI_text'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('touch:0');

      let changeBtn = await driver.findComponent(ON.id('EI_btn'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (column?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('touch:1');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (column?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('touch:1');
      console.info('[eventInterceptionUndefined_static_0001] END');
      done();
    });
  })
}