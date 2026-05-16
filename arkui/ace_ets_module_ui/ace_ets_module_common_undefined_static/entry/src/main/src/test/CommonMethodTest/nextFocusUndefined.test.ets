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

export default function NextFocusUndefinedTest() {
  describe('NextFocusUndefinedTestAdapt001', () => {
    beforeAll(async (): Promise<void> => {
      console.info("NextFocusUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("NextFocusUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/nextFocusUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get NextFocusUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("nextFocusUndefined" == pages.name)) {
          console.info("get NextFocusUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NextFocusUndefinedTest page error:" + err);
      }
      console.info("NextFocusUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   NextFocusUndefinedTest_static_0100
     * @tc.name     NextFocusUndefinedTest_static_0100
     * @tc.desc     NextFocusUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('NextFocusUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NextFocusUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('C');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('suc');

      let changeBtn = await driver.findComponent(ON.id('Common_nextFocus'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let req = await driver.findComponent(ON.id('FE_req'));
      await CommonFunc.sleep(1000);
      await (req?.click() as Promise<void>);
      let resetValue = await driver.findComponent(ON.id('resetValue'));
      await CommonFunc.sleep(1000);
      await (resetValue?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      strJson = inspector.getInspectorByKey('C');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('C');

      await (changeBtn?.click() as Promise<void>);
      console.info('[NextFocusUndefinedTest_static_0100] END');
      done();
    });

  })
}
