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

export default function onAreaChangeUndefined() {
  describe('onAreaChangeUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("onAreaChangeUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onAreaChangeUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onAreaChangeUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onAreaChangeUndefined state pages:" + JSON.stringify(pages));
        if (!("onAreaChangeUndefined" == pages.name)) {
          console.info("get onAreaChangeUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onAreaChangeUndefined page error:" + err);
      }
      console.info("onAreaChangeUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   onAreaChangeUndefined_static_0001
     * @tc.name     onAreaChangeUndefined_static_0001
     * @tc.desc     test onAreaChange
     * @tc.level    Level.LEVEL1
     */
    it('onAreaChangeUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onAreaChangeUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let text2 = await driver.findComponent(ON.id('OAC_text2'));
      await (text2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let text1 = await driver.findComponent(ON.id('OAC_text1'));
      expect(await (text1?.getText() as Promise<string>)).assertEqual(`change0`);

      let changeBtn = await driver.findComponent(ON.id('OAC_btn1'));
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
      console.info('[onAreaChangeUndefined_static_0001] END');
      done();
    });
  })
}