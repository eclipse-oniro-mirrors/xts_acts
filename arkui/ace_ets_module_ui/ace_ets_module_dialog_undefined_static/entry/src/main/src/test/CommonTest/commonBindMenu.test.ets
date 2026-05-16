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

export default function bindMenuUndefinedTest() {
  describe('commonBindMenu', () => {
    beforeAll(async ():Promise<void> => {
      console.info("commonBindMenu beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("commonBindMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonBindMenu',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get commonBindMenu state pages:" + JSON.stringify(pages));
        if (!("commonBindMenu" == pages.name)) {
          console.info("get commonBindMenu pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push commonBindMenu page error:" + err);
      }
      console.info("commonBindMenu beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    commonBindMenu_static_0001
     * @tc.name      commonBindMenu_static_0001
     * @tc.desc      test bindMenu
     * @tc.level     Level.LEVEL1
     */
    it('commonBindMenu_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[commonBindMenu_static_0001] START');
      let driver: Driver = Driver.create();
      let clickText = await driver.findComponent(ON.id('Text_bindMenu'));
      await (clickText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_MenuBuilder'));
      expect(text === null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Btn_bindMenu'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (clickText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('Text_MenuBuilder'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('MenuBuilder');

      await (text?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (clickText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('Text_MenuBuilder'));
      expect(text === null).assertTrue();
      console.info('[commonBindMenu_static_0001] END');
      done();
    });

    /**
     * @tc.number    commonBindMenu_static_0002
     * @tc.name      commonBindMenu_static_0002
     * @tc.desc      test bindMenu for isShow
     * @tc.level     Level.LEVEL1
     */
    it('commonBindMenu_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[commonBindMenu_static_0002] START');
      let driver: Driver = Driver.create();
      let clickBtn = await driver.findComponent(ON.id('Btn_show_Click'));
      await (clickBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItem'));
      expect(menuItem === null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Btn_bindMenu2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      menuItem = await driver.findComponent(ON.id('menuItem'));
      expect(menuItem !== null).assertTrue();

      await (menuItem?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (clickBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      menuItem = await driver.findComponent(ON.id('menuItem'));
      expect(menuItem === null).assertTrue();
      console.info('[commonBindMenu_static_0002] END');
      done();
    });
  })
}