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

export default function bindPopupOffsetTest() {
  describe('bindPopupOffsetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/bindPopupOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindPopupOffset state success " + JSON.stringify(pages));
        if (!("bindPopupOffset" == pages.name)) {
          console.info("get bindPopupOffset state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push bindPopupOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindPopupOffset page error: " + err);
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

    it('bindPopupOffsetTest_0100', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0100 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12065,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0100 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 10, y: 10
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0100 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptions', 10, "")
        console.info("bindPopupOffsetTest_0100 click result is: " + JSON.stringify(sendEventByKey('PopupOptions', 10, "")));
        console.info('bindPopupOffsetTest_0100 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0200', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0200 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12066,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0200 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 10, y: 10
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0200 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('customPopup', 10, "")
        console.info("bindPopupOffsetTest_0200 click result is: " + JSON.stringify(sendEventByKey('customPopup', 10, "")));
        console.info('bindPopupOffsetTest_0200 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0200 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0300', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0300 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12067,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0300 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 0, y: 0
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0300 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptions00', 10, "")
        console.info("bindPopupOffsetTest_0300 click result is: " + JSON.stringify(sendEventByKey('PopupOptions00', 10, "")));
        console.info('bindPopupOffsetTest_0300 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0300 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0400', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0400 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12068,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0400 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 0, y: 50
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0400 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptions050', 10, "")
        console.info("bindPopupOffsetTest_0400 click result is: " + JSON.stringify(sendEventByKey('PopupOptions050', 10, "")));
        console.info('bindPopupOffsetTest_0400 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0400 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0500', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0500 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12069,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0500 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual(null);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0500 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptionsnull', 10, "")
        console.info("bindPopupOffsetTest_0500 click result is: " + JSON.stringify(sendEventByKey('PopupOptionsnull', 10, "")));
        console.info('bindPopupOffsetTest_0500 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0500 ERR  ' + JSON.stringify(err));
      }
      done();
    });
    it('bindPopupOffsetTest_0600', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0600 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12070,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0600 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: -10, y: -10
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0600 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptions10', 10, "")
        console.info("bindPopupOffsetTest_0600 click result is: " + JSON.stringify(sendEventByKey('PopupOptions10', 10, "")));
        console.info('bindPopupOffsetTest_0600 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0600 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0700', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0700 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12071,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0700 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: -10, y: -10
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0700 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('customPopup10', 10, "")
        console.info("bindPopupOffsetTest_0700 click result is: " + JSON.stringify(sendEventByKey('customPopup10', 10, "")));
        console.info('bindPopupOffsetTest_0700 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0700 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_0800', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0800 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12072,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0800 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 0, y: 0
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0800 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('customPopup00', 10, "")
        console.info("bindPopupOffsetTest_0800 click result is: " + JSON.stringify(sendEventByKey('customPopup00', 10, "")));
        console.info('bindPopupOffsetTest_0800 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0800 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bbindPopupOffsetTest_0900', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_0900 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12073,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_0900 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual({
            x: 0, y: 50
          });
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_0900 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('customPopup050', 10, "")
        console.info("bindPopupOffsetTest_0900 click result is: " + JSON.stringify(sendEventByKey('customPopup050', 10, "")));
        console.info('bindPopupOffsetTest_0900 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_0900 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    it('bindPopupOffsetTest_1000', 0, async (done: Function) => {
      console.info('bindPopupOffsetTest_1000 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12074,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_1000 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.offset).assertEqual(null);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_1000 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('PopupOptionsnull', 10, "")
        console.info("bindPopupOffsetTest_1000 click result is: " + JSON.stringify(sendEventByKey('PopupOptionsnull', 10, "")));
        console.info('bindPopupOffsetTest_1000 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_1000 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}