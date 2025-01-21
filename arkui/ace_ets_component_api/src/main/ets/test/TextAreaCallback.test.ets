/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import Utils from '../TestAbility/common/MyUtils';

export default function TextAreaCallbackTest() {

  const SUITE: string = 'TextAreaCallback'
  const waitUiReadyMs: number = 500;

  describe('TextAreaCallbackTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/TextAreaCallback",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("TextAreaCallback" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Callback_0100
     *tc.name   TextArea.onEditChange
     *tc.desc   TextArea.onEditChange
     */
    it('ArkUI_TextArea_Callback_0100', 0, async (done: Function) => {
      let CASE = 'ArkUI_TextArea_Callback_0100'
      console.info(`${SUITE} ${CASE} START`);


      let callback = (event: events_emitter.EventData) => {
        expect(event.data.isEditing).assertEqual(true);
        step2()
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60202,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaCallback_TextArea1', 10, "")
      done()
      console.info(`${SUITE} ${CASE} END`);
    });

  })
}

async function step2() {
  let callback = (event: events_emitter.EventData) => {
    expect(event.data.isEditing).assertEqual(false);
  }
  let event: events_emitter.InnerEvent = {
    eventId: 60201,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.on(event, callback);
  let driver = Driver.create()
  await driver.delayMs(500)
  sendEventByKey('TextAreaCallback_TextArea2', 10, "")
}