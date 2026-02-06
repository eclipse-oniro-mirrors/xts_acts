'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import {KeyCode} from '@ohos.multimodalInput.keyCode';
interface Msg {
  msg: string
}
export default function shortcutKeyJsunit() {

  const SUITE = 'ShortcutKey'
  const baseEvent = 62000

  describe('common_shortcutKeyTest', () => {

     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options:router.RouterOptions = {
        url: "MainAbility/pages/shortcutKey",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages == null || !("shortcutKey" == pages.name)) {
          routerInstance.pushUrl(options)
          // await router.pushUrl(options).then(() => {
          //   console.info(`${SUITE} router.pushUrl success`);
          // }).catch((err: BusinessError) => {
          //   console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          // })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUI_Shortcut_Key_static_0100
     * @tc.name     ArkUI_Shortcut_Key_static_0100
     * @tc.desc     ArkUI_Shortcut_Key_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Shortcut_Key_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Shortcut_Key_static_0100'
      console.info(`${SUITE} ${CASE} START`);
      let callback = (event: events_emitter.EventData) => {
        expect((event.data as Msg)?.msg).assertEqual('Ctrl_B');
        console.info(`${SUITE} ${CASE} event.data.msg:` + (event.data as Msg)?.msg);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_B);
      done();
    });
  })
}
