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

import { describe, it, expect, Level } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";
import commonEvent from '@ohos.commonEvent';
import Base from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';


let subscriber:CommonEventManager.CommonEventSubscriber;
let globalDone: Function;
function unSubscriberCallback_timeChanged_0010 (err:Base.BusinessError){
  console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback start");
  if (err){
    console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback failed:" +
    JSON.stringify(err));
  } else {
    console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 unSubscriberCallback finish")
  }
}

function subscriberCallback_timeChanged_0010 (err:Base.BusinessError, data:CommonEventManager.CommonEventData){
  console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriberCallback data:"
    + JSON.stringify(data));
  commonEvent.unsubscribe(subscriber, unSubscriberCallback_timeChanged_0010);
  expect(data.event).assertEqual('usual.event.TIME_CHANGED');
  console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 end")
  globalDone();
}



function unSubscriberCallback_timeTick_0010 (err:Base.BusinessError){
  console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback start");
  if (err){
    console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback failed:" +
    JSON.stringify(err));
  } else {
    console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 unSubscriberCallback finish")
  }
}

function subscriberCallback_timeTick_0010 (err:Base.BusinessError, data:CommonEventManager.CommonEventData){
  console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 subscriberCallback data:"
    + JSON.stringify(data));
  commonEvent.unsubscribe(subscriber, unSubscriberCallback_timeTick_0010);
  expect(data.event).assertEqual('usual.event.TIME_TICK');
  console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 end")
  globalDone();
}


function unSubscriberCallback_timezoneChanged_0010 (err:Base.BusinessError){
  console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback start");
  if (err){
    console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback failed:" +
    JSON.stringify(err));
  } else {
    console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 unSubscriberCallback finish")
  }
}

function subscriberCallback_timezoneChanged_0010 (err:Base.BusinessError, data:CommonEventManager.CommonEventData){
  console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriberCallback data:"
    + JSON.stringify(data));
  commonEvent.unsubscribe(subscriber, unSubscriberCallback_timezoneChanged_0010);
  expect(data.event).assertEqual('usual.event.TIMEZONE_CHANGED');
  console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 end")
  globalDone();
}

export default function systemTimeCommonEventTest() {
  describe('systemTimeCommonEventTest', () => {
    console.info('====>---------------systemTimeCommonEventTest start-----------------------');

    /**
     * @tc.name   SUB_systemTime_commonEvent_timeChanged_0010
     * @tc.number SUB_systemTime_commonEvent_timeChanged_0010
     * @tc.desc   SUB_systemTime_commonEvent_timeChanged_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_commonEvent_timeChanged_0010', Level.LEVEL2, async (done: Function) => {
      let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
        events: ['usual.event.TIME_CHANGED']
      }
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data:CommonEventManager.CommonEventSubscriber)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriber data:" + JSON.stringify(data))
        globalDone = done;
        commonEvent.subscribe(subscriber, subscriberCallback_timeChanged_0010);
        console.debug("====>SUB_systemTime_commonEvent_timeChanged_0010 subscriber finish")
        let t = setTimeout(async ()=>{
          let currentTime= new Date().getTime() + 1500
          await systemTime.setTime(currentTime)
          clearTimeout(t)
        }, 500)
      })
    });

    /**
     * @tc.name   SUB_systemTime_commonEvent_timeTick_0010
     * @tc.number SUB_systemTime_commonEvent_timeTick_0010
     * @tc.desc   SUB_systemTime_commonEvent_timeTick_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_commonEvent_timeTick_0010', Level.LEVEL2, async (done: Function) => {
      let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
        events: ['usual.event.TIME_TICK']
      }
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data:CommonEventManager.CommonEventSubscriber)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timeTick_0010 subscriber data:" + JSON.stringify(data))
        globalDone = done;
        commonEvent.subscribe(subscriber, subscriberCallback_timeTick_0010);
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
     * @tc.name   SUB_systemTime_commonEvent_timezoneChanged_0010
     * @tc.number SUB_systemTime_commonEvent_timezoneChanged_0010
     * @tc.desc   SUB_systemTime_commonEvent_timezoneChanged_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemTime_commonEvent_timezoneChanged_0010', Level.LEVEL2, async (done: Function) => {
      let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
        events: ['usual.event.TIMEZONE_CHANGED']
      }
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriber data:" + JSON.stringify(data))
        globalDone = done;
        commonEvent.subscribe(subscriber, subscriberCallback_timezoneChanged_0010);
        console.debug("====>SUB_systemTime_commonEvent_timezoneChanged_0010 subscriber finish")
        let t = setTimeout(async ()=>{
          await systemTime.setTimezone('Europe/Moscow')
          clearTimeout(t)
        }, 500)
      })
    });

  });
};
