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

export default function OnTitleModeChangeUndefinedTest() {
  describe('OnTitleModeChangeUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("OnTitleModeChangeUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OnTitleModeChangeUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/onTitleModeChangeUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OnTitleModeChangeUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("hideToolBarUndefined" == pages.name)) {
          console.info("get OnTitleModeChangeUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push OnTitleModeChangeUndefinedTest page error:" + err);
      }
      console.info("OnTitleModeChangeUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   OnTitleModeChangeUndefinedTest_static_0001
     * @tc.name     OnTitleModeChangeUndefinedTest_static_0001
     * @tc.desc     OnTitleModeChangeUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('OnTitleModeChangeUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OnTitleModeChangeUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let changeBtn1 = await driver.findComponent(ON.id('flingBottom'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      console.info("[OnTitleModeChangeUndefinedTest_static_0001] label : " + res);
      expect(res).assertEqual('titleModeChange:1');
      let changeBtn = await driver.findComponent(ON.id('Navigation_onTitleModeChange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[OnTitleModeChangeUndefinedTest_static_0001] click Navigation_onTitleModeChange");
      let changeBtn2 = await driver.findComponent(ON.id('flingTop'));
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('text');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      await CommonFunc.sleep(1000);
      console.info("[OnTitleModeChangeUndefinedTest_static_0001] label : " + res);
      expect(res).assertEqual('titleModeChange:1');
      await CommonFunc.sleep(1000);
      console.info('[OnTitleModeChangeUndefinedTest_static_0001] END');
      done();
    });

  })
}