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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';

export default function KeyboardShortcutJsunit() {

  const SUITE = 'keyboardShortcut'
  const baseEvent1 = 35872
  const baseEvent2 = 35873

  describe('KeyboardShortcutJsunit', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/KeyboardShortcut",
      }
      try {
        let pages = router.getState();
        if (pages == null || !("KeyboardShortcut" == pages.name)) {
          await router.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUI_KeyboardShortcut_0158
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0158
     * @tc.desc   test prefetchResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_KeyboardShortcut_0158', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_KeyboardShortcut_0158'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('Ctrl_TAB');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data?.msg);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent1,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_TAB);
      done();
    });

    /**
     * @tc.name   ArkUI_KeyboardShortcut_0159
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0159
     * @tc.desc   test prefetchResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_KeyboardShortcut_0159', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_KeyboardShortcut_0159'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('Shift_left');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data?.msg);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent2,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_SHIFT_LEFT, input.KeyCode.KEYCODE_DPAD_LEFT);
      done();
    });
  })
}
