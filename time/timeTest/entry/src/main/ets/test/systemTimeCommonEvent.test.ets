/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";
import commonEvent from '@ohos.commonEvent'

export default function systemTimeCommonEventTest() {
  describe('systemTimeCommonEventTest', function () {
    console.info('====>---------------systemTimeCommonEventTest start-----------------------');
    
    /**
     * @tc.number    SUB_systemTime_commonEnevt_timeChanged_0010
     * @tc.name      
     * @tc.desc      
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_systemTime_commonEvent_timeChanged_0010', 0, async function (done) {
      function unSubscriberCallback (err){
          console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback start");
          if (err){
              console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback failed:" +
              JSON.stringify(err));
          } else {
              console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback finish")
          }
      }

      function subscriberCallback (err, data){
          console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriberCallback data:"
          + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.event).assertEqual('usual.event.TIME_CHANGED');
          console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 end")
          done();
      }

      var commonEventSubscribeInfo = {
          events: ['usual.event.TIME_CHANGED']
      }
      var subscriber;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriber data:" + JSON.stringify(data))
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriber finish")
        let t = setTimeout(async ()=>{
          let currentTime= new Date().getTime() + 1500
          await systemTime.setTime(currentTime)
          clearTimeout(t)
        }, 500)
      })
    });

    /**
     * @tc.number    SUB_systemTime_commonEvent_timeTick_0010
     * @tc.name      
     * @tc.desc      
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_systemTime_commonEvent_timeTick_0010', 0, async function (done) {
      function unSubscriberCallback (err){
          console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback start");
          if (err){
              console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback failed:" +
              JSON.stringify(err));
          } else {
              console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback finish")
          }
      }

      function subscriberCallback (err, data){
          console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 subscriberCallback data:"
          + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.event).assertEqual('usual.event.TIME_TICK');
          console.debug("====>SUB_systemTime_commonEnevt_timeTick_0010 end")
          done();
      }

      var commonEventSubscribeInfo = {
          events: ['usual.event.TIME_TICK']
      }
      var subscriber;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 subscriber data:" + JSON.stringify(data))
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 subscriber finish")
        let t = setTimeout(async ()=>{
          let currentTime= new Date().getTime()
          currentTime = currentTime + (58000- (currentTime % 60000))
          await systemTime.setTime(currentTime)
          clearTimeout(t)
        }, 500)
      })
    });


    /**
     * @tc.number    SUB_systemTime_commonEvent_timezoneChanged_0010
     * @tc.name      
     * @tc.desc      
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_systemTime_commonEvent_timezoneChanged_0010', 0, async function (done) {
      function unSubscriberCallback (err){
          console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback start");
          if (err){
              console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback failed:" +
              JSON.stringify(err));
          } else {
              console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback finish")
          }
      }

      function subscriberCallback (err, data){
          console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriberCallback data:"
          + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.event).assertEqual('usual.event.TIMEZONE_CHANGED');
          console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 end")
          done();
      }

      var commonEventSubscribeInfo = {
          events: ['usual.event.TIMEZONE_CHANGED']
      }
      var subscriber;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriber data:" + JSON.stringify(data))
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriber finish")
        let t = setTimeout(async ()=>{
          await systemTime.setTimezone('Europe/Moscow')
          clearTimeout(t)
        }, 500)
      })
    });


  });
};
