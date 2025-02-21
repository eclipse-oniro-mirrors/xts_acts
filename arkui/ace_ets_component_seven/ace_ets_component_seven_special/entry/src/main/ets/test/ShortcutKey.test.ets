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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import input from '@ohos.multimodalInput.keyCode';

export default function shortcutKeyJsunit() {

  const SUITE = 'ShortcutKey'
  const baseEvent = 62000

  describe('shortcutKeyJsunit', function () {

    beforeEach(async function (done) {
      let options = {
        url: "MainAbility/pages/shortcutKey",
      }
      try {
        let pages = router.getState();
        if (pages == null || !("shortcutKey" == pages.name)) {
          await router.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch(err => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number ArkUI_Shortcut_Key_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Shortcut_Key_0100', 0, async function (done) {
      let CASE = 'ArkUI_Shortcut_Key_0100'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event) => {
        expect(event.data.msg).assertEqual('Ctrl_B');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data.msg);
        done();
      }
      let event = {
        eventId: baseEvent,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_B);
      done();
    });
  })
}
