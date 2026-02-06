/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect,beforeAll, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';


export default function ShortcutKeyTest() {

  const SUITE = 'ShortcutKey'


  const functionKey: FunctionKey[] = [
    FunctionKey.ESC,
    FunctionKey.F1,
    FunctionKey.F2,
    FunctionKey.F3,
    FunctionKey.F4,
    FunctionKey.F5,
    FunctionKey.F6,
    FunctionKey.F7,
    FunctionKey.F8,
    FunctionKey.F9,
    FunctionKey.F10,
    FunctionKey.F11,
    FunctionKey.F12,
  ]
  const arr_keyCode = [
    input.KeyCode.KEYCODE_ESCAPE
    , input.KeyCode.KEYCODE_F1
    , input.KeyCode.KEYCODE_F2
    , input.KeyCode.KEYCODE_F3
    , input.KeyCode.KEYCODE_F4
    , input.KeyCode.KEYCODE_F5
    , input.KeyCode.KEYCODE_F6
    , input.KeyCode.KEYCODE_F7
    , input.KeyCode.KEYCODE_F8
    , input.KeyCode.KEYCODE_F9
    , input.KeyCode.KEYCODE_F10
    , input.KeyCode.KEYCODE_F11
    , input.KeyCode.KEYCODE_F12
  ]

  const baseEvent = 62000
  const baseEvent2 = 73000

  describe('ShortcutKeyTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyboardShortcut/ShortcutKey",
      }
      try {
        let pages = router.getState();
        if (pages == null || !("ShortcutKey" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
    });

    /**
     * @tc.name   ArkUI_Shortcut_Key_0100
     * @tc.number ArkUI_Shortcut_Key_0100
     * @tc.desc   Custom keyboard shortcuts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Shortcut_Key_0100', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0100'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('Ctrl_B');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + event.data?.msg);
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_B)

      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ArkUI_Shortcut_Key_0200
     * @tc.number ArkUI_Shortcut_Key_0200
     * @tc.desc   Custom keyboard shortcuts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Shortcut_Key_0200', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0200'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('Shift_1');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + event.data?.msg);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 72002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_SHIFT_LEFT, input.KeyCode.KEYCODE_1);

      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ArkUI_Shortcut_Key_0300
     * @tc.number ArkUI_Shortcut_Key_0300
     * @tc.desc   Custom keyboard shortcuts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Shortcut_Key_0300', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0300'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('Alt_Q');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + event.data?.msg);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 72003,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_ALT_LEFT, input.KeyCode.KEYCODE_Q);

      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ArkUI_Shortcut_Key_0400
     * @tc.number ArkUI_Shortcut_Key_0400
     * @tc.desc   Custom keyboard shortcuts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Shortcut_Key_0400', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0400'
      console.info(`${SUITE} ${CASE} START`);

      let start = 0
      let end = functionKey.length
      let driver = Driver.create()
      for (let i = start; i < end; i++) {
        let item = functionKey[i]

        let callback = (event: events_emitter.EventData) => {
          expect(event.data?.msg).assertEqual('Ctrl_' + FunctionKey[item]);
          console.info(`${SUITE} ${CASE} event.data?.msg:` + i + ',' + event.data?.msg);
          if (i == end - 1) {
          }
        }
        let event: events_emitter.InnerEvent = {
          eventId: baseEvent2 + i,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);
        await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, arr_keyCode[i])
      }

      console.info(`${SUITE} ${CASE} END`);
    });

  })
}
