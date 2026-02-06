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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

export default function stageDatePickerDialog() {
  describe('stageDatePickerDialog', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stageDatePickerDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageDatePickerDialog state success " + JSON.stringify(pages));
        if (!("stageDatePickerDialog" == pages.name)) {
          console.info("get stageDatePickerDialog state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push stageDatePickerDialog page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageDatePickerDialog page error: " + err);
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

    /**
     * @tc.name   testDatePickerDialog001
     * @tc.number testDatePickerDialog001
     * @tc.desc   testDatePickerDialog001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDialog001', Level.LEVEL1, async (done: Function) => {
      console.info('testDatePickerDialog001 START');
      setTimeout(() => {
        try {
          let innerEventOne: events_emitter.InnerEvent = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog001 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testDatePickerDialog001 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showToastText', 10, "")));
          console.info('testDatePickerDialog001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   testDatePickerDialog002
     * @tc.number testDatePickerDialog002
     * @tc.desc   testDatePickerDialog002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDialog002', Level.LEVEL1, async (done: Function) => {
      console.info('testDatePickerDialog002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: events_emitter.InnerEvent = {
            eventId: 60221,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog002 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual(10);
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testDatePickerDialog002 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testDatePickerDialog002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.name   testDatePickerDialog003
     * @tc.number testDatePickerDialog003
     * @tc.desc   testDatePickerDialog003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDialog003', Level.LEVEL1, async (done: Function) => {
      console.info('testDatePickerDialog003 START');
      setTimeout(() => {
        try {
          let innerEventThree: events_emitter.InnerEvent = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog003 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual("STATUS");
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testDatePickerDialog003 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("testDatePickerDialog003 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testDatePickerDialog003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}