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
import CommonFunc from '../../MainAbility/common/Common';

export default function stageActionSheet() {
  describe('stageActionSheet', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/stageActionSheet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageActionSheet state success " + JSON.stringify(pages));
        if (!("stageActionSheet" == pages.name)) {
          console.info("get stageActionSheet state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stageActionSheet page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageActionSheet page error: " + err);
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
     * @tc.number    testShowActionShee001
     * @tc.name      testShowActionShee001
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testShowActionShee001', Level.LEVEL2, async (done: Function) => {
      console.info('testShowActionShee001 START');
      setTimeout(() => {
        try {
          let innerEventOne: events_emitter.InnerEvent = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testShowActionShee001 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testShowActionShee001 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showToastText', 10, "")));
          console.info('testShowActionShee001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.number    testShowActionShee002
     * @tc.name      testShowActionShee002
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testShowActionShee002', Level.LEVEL2, async (done: Function) => {
      console.info('testShowActionShee002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: events_emitter.InnerEvent = {
            eventId: 60221,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testShowActionShee002 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual(10);
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testShowActionShee002 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testShowActionShee002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.number    testShowActionShee003
     * @tc.name      testShowActionShee003
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testShowActionShee003', Level.LEVEL2, async (done: Function) => {
      console.info('testShowActionShee003 START');
      setTimeout(() => {
        try {
          let innerEventThree: events_emitter.InnerEvent = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testShowActionShee003 get event state result is: " + JSON.stringify(eventData));
            expect(eventData.data?.STATUS).assertEqual("STATUS");
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testShowActionShee003 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
          console.info('testShowActionShee003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}