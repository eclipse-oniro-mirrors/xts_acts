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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils.ets'
import events_emitter from '@ohos.events.emitter';

export default function sliderMovingJsunit() {
  describe('sliderMovingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/slider2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state success " + JSON.stringify(pages));
        if (!("slider2" == pages.name)) {
          console.info("get slider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push slider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push slider page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sliderMoving after each called");
    });

    it('testsliderMoving0011', 0, async (done: Function) => {
      console.info('sliderMoving testsliderMoving0011 START');
      await Utils.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60307,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          try {
            console.info("testsliderMoving0011 get event data is: " + JSON.stringify(eventData));
            expect(eventData.data.Mode).assertEqual(0);
          } catch (err) {
            console.info("testsliderMoving0011 get event err data is: " + JSON.stringify(err));
          }
        }
        events_emitter.on(event, callback);
        console.info("testsliderMoving0011 click result is: " + JSON.stringify(sendEventByKey('Slider', 10, "")));
        await Utils.sleep(3000);
      } catch (err) {
        console.info("testsliderMoving0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testsliderMoving0011 END');
      done();
    });
  })
}
