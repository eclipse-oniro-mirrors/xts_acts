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

export default function OnKeyEventDispatchUndefinedTest() {
  describe('OnKeyEventDispatchUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("OnKeyEventDispatchUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OnKeyEventDispatchUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onKeyEventDispatchUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OnKeyEventDispatchUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onKeyEventDispatchUndefined" == pages.name)) {
          console.info("get OnKeyEventDispatchUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnKeyEventDispatchUndefinedTest page error:" + err);
      }
      console.info("OnKeyEventDispatchUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   OnKeyEventDispatchUndefinedTest_static_0100
     * @tc.name     OnKeyEventDispatchUndefinedTest_static_0100
     * @tc.desc     OnKeyEventDispatchUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('OnKeyEventDispatchUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OnKeyEventDispatchUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      let text = await driver.findComponent(ON.id('text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('parentTab');
      await CommonFunc.sleep(1000);
      let changeBtn = await driver.findComponent(ON.id('Common_OnKeyEventDispatch'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('childTab');
      await (changeBtn?.click() as Promise<void>);
      console.info('[OnKeyEventDispatchUndefinedTest_static_0100] END');
      done();
    });

  })
}
