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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function geometryTransitionJsunit() {
  describe('common_geometryTransitionTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/geometryTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get geometryTransition state success " + JSON.stringify(pages));
        if (!("geometryTransition" == pages.name)) {
          console.info("get geometryTransition state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push geometryTransition page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("geometryTransition after each called");
    });

    /**
     * @tc.number geometryTransitionTest_0100
     * @tc.name Test the properties of components
     * @tc.desc Set geometryTransition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('geometryTransitionTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('geometryTransitionTest_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 104,
        priority: events_emitter.EventPriority.LOW
      }
      await Utils.sleep(1000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("geometryTransitionTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.btn1).assertEqual(false);
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("geometryTransitionTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("geometryTransitionTest_0100 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await Utils.sleep(1000);
      console.info('geometryTransitionTest_0100 END');
      done();
    });
  })
}