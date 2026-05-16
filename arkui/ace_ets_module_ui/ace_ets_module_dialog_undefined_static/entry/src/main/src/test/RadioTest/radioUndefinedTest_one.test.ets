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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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

export default function radioUndefinedTest() {
  describe('radioUndefinedTestAdapt001', () => {
    beforeAll(async ():Promise<void> => {
      console.info("radioUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("radioUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/radioUndefined_one',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get radioUndefined state pages:" + JSON.stringify(pages));
        if (!("radioUndefined_one" == pages.name)) {
          console.info("get radioUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push radioUndefined page error:" + err);
      }
      console.info("radioUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   radioUndefined_one_static_0001
     * @tc.name     radioUndefined_one_static_0001
     * @tc.desc     test contentModifier
     * @tc.level    Level.LEVEL1
     */
    it('radioUndefined_one_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[radioUndefined_one_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('radio_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[radioUndefined_one_static_0001] is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      let text = await driver.findComponent(ON.id('text_1'));
      expect(text !== null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Radio_btn'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('text_1'));
      expect(text === null).assertTrue();
      console.info('[radioUndefined_one_static_0001] END');
      done();
    });
  })
}