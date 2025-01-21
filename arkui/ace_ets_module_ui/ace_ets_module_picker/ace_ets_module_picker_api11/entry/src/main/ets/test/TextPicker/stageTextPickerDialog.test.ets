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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

export default function stageTextPickerDialog() {
  describe('stageTextPickerDialog', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/stageTextPickerDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageTextPickerDialog state success " + JSON.stringify(pages));
        if (!("stageTextPickerDialog" == pages.name)) {
          console.info("get stageTextPickerDialog state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push stageTextPickerDialog page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageTextPickerDialog page error: " + err);
      }
      done()
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('testTextPickerDialog001', 0, async (done: Function) => {
      console.info('testTextPickerDialog001 START');
      setTimeout(() => {
        try {
          let innerEventOne: events_emitter.InnerEvent = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testTextPickerDialog001 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testTextPickerDialog001 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showToastText', 10, "")));
          console.info('testTextPickerDialog001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('testTextPickerDialog002', 0, async (done: Function) => {
      console.info('testTextPickerDialog002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: events_emitter.InnerEvent = {
            eventId: 60221,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testTextPickerDialog002 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual(10);
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testTextPickerDialog002 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testTextPickerDialog002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('testTextPickerDialog003', 0, async (done: Function) => {
      console.info('testTextPickerDialog003 START');
      setTimeout(() => {
        try {
          let innerEventThree: events_emitter.InnerEvent = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testTextPickerDialog003 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data.STATUS).assertEqual("STATUS");
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testTextPickerDialog003 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("testTextPickerDialog003 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testTextPickerDialog003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}