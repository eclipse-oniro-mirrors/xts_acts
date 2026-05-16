'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  PointerMatrix
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

export default function selectUndefinedTwoTest() {
  describe('selectUndefinedTwoTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("selectUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/selectUndefinedTwo',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("selectUndefinedTwo" == pages.name)) {
          console.info("get selectUndefined2 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectUndefined page error:" + err);
      }
      console.info("selectUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   selectUndefinedTest_static_0100
     * @tc.name     selectUndefinedTest_static_0100
     * @tc.desc     test select menuItemContentModifier
     * @tc.level    Level.LEVEL1
     */
    it('selectUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      let select = await driver.findComponent(ON.id('Select'));
      await (select?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('Select XTS')

      await (select?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeBtn = await driver.findComponent(ON.id('Select_menuItemContentModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[selectUndefinedTest_static_0100] click Select_menuItemContentModifier");

      await (select?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('Text'));
      expect(text === null).assertTrue();
      console.info('[selectUndefinedTest_static_0100] END');
      done();
    });

  })
}