/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function gestureSetDirectionJsunit() {
  describe('gestureSetDirectionTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gesture state success " + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gesture state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gesture page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gesture page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gestureSetDirection after each called");
    });

    /**
     * @tc.name   testgestureSetDirection0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testgestureSetDirection0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgestureSetDirection0001', Level.LEVEL0, async () => {
      console.info('gestureSetDirection testgestureSetDirection0001 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0001 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.STATUS).assertEqual(PanDirection.Vertical);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60204,
          priority: events_emitter.EventPriority.LOW
        }
        sendEventByKey('setDirectionPanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDirection testgestureSetDirection0002 END')

    });

    /**
     * @tc.name   testgestureSetDistance0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testgestureSetDistance0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgestureSetDistance0002', Level.LEVEL0, async () => {
      console.info('gestureSetDistance testgestureSetDistance0002 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0002 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.STATUS).assertEqual(4.0);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60205,
          priority: events_emitter.EventPriority.LOW
        }
        sendEventByKey('setDistancePanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0002 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDistance testgestureSetDistance0002 END');

    });

    /**
     * @tc.name   testgestureSetFingers0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testgestureSetFingers0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgestureSetFingers0003', Level.LEVEL0, async () => {
      console.info('gestureSetFingers testgestureSetFingers0003 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0003 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data?.STATUS).assertEqual(true);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60206,
          priority: events_emitter.EventPriority.LOW
        }
        sendEventByKey('setFingersPanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0003 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetFingers testgestureSetFingers0003 END');

    });

  })
}
