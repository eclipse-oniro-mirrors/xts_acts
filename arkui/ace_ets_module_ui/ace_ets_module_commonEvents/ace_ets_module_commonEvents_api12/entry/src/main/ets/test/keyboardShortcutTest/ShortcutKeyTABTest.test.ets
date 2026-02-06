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
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';
export default function ShortcutKeyTABTest() {
  describe('ShortcutKeyTABTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyboardShortcut/ShortcutKeyTAB",
      }
      try {
        let pages = router.getState();
        if (pages == null || !("ShortcutKeyTAB" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`ShortcutKeyTABTest router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`ShortcutKeyTABTest router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`ShortcutKeyTABTest beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
    });

    /**
     * @tc.name   ShortcutKeyTABTest_0100
     * @tc.number api
     * @tc.desc   Custom keyboard shortcuts TAB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShortcutKeyTABTest_0100', Level.LEVEL0, async () => {
      let CASE = 'ShortcutKeyTABTest_0100'
      console.info(`ShortcutKeyTABTest_0100 START`);
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.msg).assertEqual('CTRL+TAB');
        console.info(`ShortcutKeyTABTest_0100 event.data?.msg:` + event.data?.msg);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 75000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_TAB)
      console.info(`ShortcutKeyTABTest_0100 END`);
    });
  })
}
