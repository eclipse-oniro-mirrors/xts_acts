/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function TextPickerDialogCallback() {
  describe('TextPickerDialogCallback', () => {
    beforeEach(async (done: Function) => {
      console.info("TextPickerDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPickerDialog/TextPickerDialogCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPickerDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("TextPickerDialogCallback" == pages.name)) {
          console.info("get TextPickerDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextPickerDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerDialogAJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   TextPickerDialogCallback_0100
     * @tc.number SUB_ACE_ARKUI_TEXT_PICKER_DIALOG_CALLBACK_0100
     * @tc.desc   onWillAppear,onDidAppear,onWillDisappear,onDidDisappear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogCallback_0100', Level.LEVEL0, async (done: Function) => {
      let driver1 = Driver.create();
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onWillAppear');
        console.info('TextPickerDialogCallback_0100 event01: ' + event.data?.action);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50001,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      console.info('TextPickerDialogCallback_0100 START');
      let button = await driver1.findComponent(ON.id('TextPicker_dialog_B'));
      await button.click();
      await CommonFunc.sleep(3000)


      let callback1 = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onDidAppear');
        console.info('TextPickerDialogCallback_0100 event02: ' + event.data?.action);
      }
      let event1: events_emitter.InnerEvent = {
        eventId: 50002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event1, callback1);

      console.info('TextPickerDialogCallback_0100 START');

      let callback2 = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onWillDisappear');
        console.info('TextPickerDialogCallback_0100 event03: ' + event.data?.action);
      }
      let event2: events_emitter.InnerEvent = {
        eventId: 50003,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event2, callback2);
      console.info('TextPickerDialogCallback_0100 START');

      let callback3 = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onDidDisappear');
        console.info('TextPickerDialogCallback_0100 event04: ' + event.data?.action);
        done();
      }
      let event3: events_emitter.InnerEvent = {
        eventId: 50004,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event3, callback3);
      console.info('TextPickerDialogCallback_0100 START');
      await CommonFunc.sleep(3000)
      await driver1.pressBack();

    });
  })
}
