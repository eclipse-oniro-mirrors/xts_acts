/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let bundle_name:string = "com.example.actssubscribertestorder.static"
let domain: int = 0x0000;
let testAbilityContext:common.UIAbilityContext;
let count: int = 0;

let publishCallback=(err: BusinessError | null) =>{
  console.info('===============>publishCallback');
}

let unsubscribeCallback=(err: BusinessError | null) =>{
  console.info('===============>unsubscribeCallback');
}

export default function ActsSubscriberTestOrder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST',  () => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    let num2:number = 0;
    let order:boolean = false;
    let commonEventSubscriber0100:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0101:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0200:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0201:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0300:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0301:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0400:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0401:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0500:commonEventManager.CommonEventSubscriber;
    let commonEventSubscriber0501:commonEventManager.CommonEventSubscriber;


    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_0950
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_0950
     * @tc.desc   Check the subscriber can receive event "publish_event0100" type of the interface (by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_0950'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_0950 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0100'),
        priority: 10
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0100'),
        priority: 9
      };

      let commonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event1001_init',
        isOrdered: true,
      }

      let  subscriberCallBack0100=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined) =>{
        console.info(TAG+'===============>subscriberCallBack0100========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0100=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0100=========data: ' + data?.data);
        expect(data?.event).assertEqual('publish_event0100');
        expect(data?.code).assertEqual(1);
        expect(data?.data).assertEqual('publish_event1001_init');

        commonEventSubscriber0100.setCode(2).then(()=>{
          console.info(TAG+'===============>subscriberCallBack0100 setCode promise');
        })

        commonEventSubscriber0100.setData('publish_event1001_change').then(()=>{
          console.info(TAG+'===============>subscriberCallBack0100 setData promise');
        })

        commonEventSubscriber0100.setCodeAndData(2, 'publish_event1001_change').then(()=>{
          console.info(TAG+'===============>subscriberCallBack0100 setCodeAndData promise');
        })

        commonEventSubscriber0100.getAbortCommonEvent().then((data:boolean)=>{
          console.info(TAG+
            '===============>subscriberCallBack0100 getAbortCommonEvent promise abort: ' + data);
        })

        commonEventSubscriber0100.clearAbortCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0100 clearAbortCommonEvent promise');
        })

        commonEventSubscriber0100.getAbortCommonEvent().then((data:boolean)=>{
          console.info(TAG+
            '===============>subscriberCallBack0100 getAbortCommonEvent promise abort: ' + data);
        })

        commonEventSubscriber0100.finishCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0100 finishCommonEvent promise');
        })
      }

      let subscriberCallBack0101=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined) =>{
        console.info(TAG+'===============>subscriberCallBack0101========code: ' + err?.code);
        console.info(TAG+'===============>subscriberCallBack0101========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0101=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0101=========data: ' + data?.data);
        expect(data?.event).assertEqual('publish_event0100');
        console.info(TAG+'===============>subscriberCallBack0101=========1 code '+ data?.code);
        expect(data?.code).assertEqual(2);
        commonEventSubscriber0101.getCode().then((data:int)=>{
          console.info(TAG+'===============>subscriberCallBack0101 getCode promise code: '+ data);
        })
        expect(data?.data).assertEqual('publish_event1001_change');
        commonEventSubscriber0100.getData().then((data:string)=>{
          console.info(TAG+'===============>subscriberCallBack0101 getData promise data: '+ data);
        })
        commonEventSubscriber0101.finishCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0101 finishCommonEvent promise');
          done();
        })
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0100==========createSubscriber promise1');
        if (data !== null) {
          commonEventSubscriber0100 = data;
          commonEventSubscriber0100.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0100=========getSubscribeInfo promise1');
            commonEventManager.subscribe(commonEventSubscriber0100, subscriberCallBack0100);
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0100==========createSubscriber promise2');
        if (data !== null) {
          commonEventSubscriber0101 = data;
          commonEventSubscriber0101.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0100=========getSubscribeInfo promise2');
            commonEventManager.subscribe(commonEventSubscriber0101, subscriberCallBack0101);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0100 delay 100ms==================');
              commonEventManager.publish('publish_event0100', commonEventPublishData, publishCallback);
            }, 100);
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_0950 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100
     * @tc.number Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100
     * @tc.desc   Check the subscriber can receive event "publish_event0200" type of the interface (by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it ('Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0200', 'publish_event0201'),
        priority: 10
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0201'),
        priority: 9
      };

      let commonEventPublishData1:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0200_init',
        isOrdered: false,
      }

      let commonEventPublishData2:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0201_init',
        isOrdered: true,
      }

      let subscriberCallBack0200=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0200========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0200=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0200=========data: ' + data?.data);
        console.info(TAG+'===============>subscriberCallBack0200=========num2: ' + num2);
        if (num2 == 0) {
          num2++;
          expect(data?.event).assertEqual('publish_event0200');
          console.info(TAG+'===============>subscriberCallBack0200=====num2:0====code: ' + data?.code);
          expect(data?.code).assertEqual(1);
          expect(data?.data).assertEqual('publish_event0200_init');
        }else {
          num2 = 0;
          expect(data?.event).assertEqual('publish_event0201');
          console.info(TAG+'===============>subscriberCallBack0200=====num2:1====code: ' + data?.code);
          expect(data?.code).assertEqual(1);
          expect(data?.data).assertEqual('publish_event0201_init');
          commonEventSubscriber0200.finishCommonEvent().then(()=>{
            console.info(TAG+'===============>subscriberCallBack0200:num2:1:finishCommonEvent promise');
          })
        }
      }

      let subscriberCallBack0201=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0201========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0201=========code=: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0201=========data: ' + data?.data);

        expect(data?.event).assertEqual('publish_event0201');
        console.info(TAG+'===============>subscriberCallBack0201=========code: ' + data?.code);
        expect(data?.code).assertEqual(1);
        expect(data?.data).assertEqual('publish_event0201_init');
        commonEventSubscriber0201.finishCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0201:finishCommonEvent promise');
          done();
        })
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1,
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0200==========createSubscriber promise1');
        if (data !== null) {
          commonEventSubscriber0200 = data;
          commonEventSubscriber0200.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0200=========getSubscribeInfo promise1');
            commonEventManager.subscribe(commonEventSubscriber0200, subscriberCallBack0200);
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2,
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0200==========createSubscriber promise2');
        if (data !== null) {
          commonEventSubscriber0201 = data;
          commonEventSubscriber0201.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0200=========getSubscribeInfo promise2');
            commonEventManager.subscribe(commonEventSubscriber0201, subscriberCallBack0201);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0200 delay 100ms==================');
              commonEventManager.unsubscribe(commonEventSubscriber0200, unsubscribeCallback);
            }, 100);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0200 delay 100ms==================');
              commonEventManager.publish('publish_event0200', commonEventPublishData1, publishCallback);
            }, 100);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0200 delay 100ms==================');
              commonEventManager.publish('publish_event0201', commonEventPublishData2, publishCallback);
            }, 100);
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_1000
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_1000
     * @tc.desc   Check the subscriber can receive event "publish_event0301" type of the interface (by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1000'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1000 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0301'),
        priority: 9
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0301'),
        priority: 10
      };

      let commonEventPublishData2:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0301_init',
        isOrdered: true,
      }

      let callBackNum:number = 0;
      let subscriberCallBack0300=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0300========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0300=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0300=========dat: ' + data?.data);
        console.info(TAG+'===============>subscriberCallBack0300=========order: ' + order);

        expect(data?.event).assertEqual('publish_event0301');
        expect(data?.code).assertEqual(1);
        expect(data?.data).assertEqual('publish_event0301_init');
        expect(order).assertEqual(true);

        if (order == true) {
          order = false;
        }

        commonEventSubscriber0300.isOrderedCommonEvent().then((data:boolean)=>{
          console.info(TAG+'========>subscriberCallBack0300 isOrderedCommonEvent promise ' + data);
          expect(data).assertEqual(true);
        })
        commonEventSubscriber0300.finishCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0300 finishCommonEvent promise');
        })

        callBackNum++;
        if (callBackNum == 3) {
          done();
        }
      }

      let subscriberCallBack0301=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0301========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0301=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0301=========data: ' + data?.data);
        console.info(TAG+'===============>subscriberCallBack0301=========order: ' + order);

        expect(data?.event).assertEqual('publish_event0301');
        expect(data?.code).assertEqual(1);
        expect(data?.data).assertEqual('publish_event0301_init');

        if (order == false) {
          order = true;
        }

        commonEventSubscriber0301.isOrderedCommonEvent().then((data:boolean)=>{
          console.info(TAG+'===============>subscriberCallBack0301 isOrderedCommonEvent promise' + data);
          expect(data).assertEqual(true);
        })
        commonEventSubscriber0301.finishCommonEvent().then(()=>{
          console.info(TAG+'===============>subscriberCallBack0301 finishCommonEvent promise');
        })
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1,
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0300==========createSubscriber promise1');
        if (data !== null) {
          commonEventSubscriber0300 = data;
          commonEventSubscriber0300.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0300=========getSubscribeInfo promise1');
            commonEventManager.subscribe(commonEventSubscriber0300, subscriberCallBack0300);
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2,
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0300==========createSubscriber promise2');
        if (data !== null) {
          commonEventSubscriber0301 = data;
          commonEventSubscriber0301.getSubscribeInfo().then(() => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0300=========getSubscribeInfo promise2');
            commonEventManager.subscribe(commonEventSubscriber0301, subscriberCallBack0301);
            let numindex: number = 0;
            for (numindex; numindex < 3; ++numindex) {
              setTimeout(() => {
                console.debug(TAG + '===================ActsSubscriberTestOrder_0300 delay 100ms==================');
                commonEventManager.publish('publish_event0301', commonEventPublishData2, publishCallback);
              }, 100);
            }
          });
        } else {
          expect(false).assertTrue();
          done();
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1000 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_1100
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_1100
     * @tc.desc   Check the subscriber can receive event "publish_eventOrder0400" type of the interface by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1100'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1100 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_eventOrder0400'),
        priority: 10
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_eventOrder0400'),
        priority: 9
      };

      let commonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0400_init',
        isOrdered: true,
      }

      let subscriberCallBack0400=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0400========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0400========bundleName: ' + data?.bundleName);
        console.info(TAG+'===============>subscriberCallBack0400=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0400=========data: ' + data?.data);
        expect(data?.event).assertEqual('publish_eventOrder0400');
        expect(data?.code).assertEqual(1);
        expect(data?.data).assertEqual('publish_event0400_init');
        commonEventSubscriber0400.getAbortCommonEvent().then((data:boolean)=>{
          console.info(TAG+'===============>subscriberCallBack0400 getAbortCommonEvent promise abort2: ' + data);
        });
        commonEventSubscriber0400.abortCommonEvent().then(() => {
          console.info(TAG+'===============>subscriberCallBack0400 abortCommonEvent promise');
        });
        commonEventSubscriber0400.getAbortCommonEvent().then((data:boolean)=>{
          console.info(TAG+
            '===============>subscriberCallBack0400 getAbortCommonEvent promise abort2: ' + data);
        });
        commonEventSubscriber0400.finishCommonEvent().then(()=> {
          console.info(TAG+'===============>subscriberCallBack0400 finishCommonEvent promise');
          done();
        });
      }

      let subscriberCallBack0401=(err:BusinessError|null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0401========event: ' + data?.event);
        expect().assertFail();
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0400==========createSubscriber promise1');
        if (data !== null) {
          commonEventSubscriber0400 = data;
          commonEventSubscriber0400.getSubscribeInfo().then((data: commonEventManager.CommonEventSubscribeInfo|null) => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0400=========getSubscribeInfo promise1');
            expect(data?.events[0]).assertEqual('publish_eventOrder0400');
            commonEventManager.subscribe(commonEventSubscriber0400, subscriberCallBack0400);
          })
        } else {
          expect(false).assertTrue();
          done();
        }
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0400==========createSubscriber promise2');
        if (data !== null) {
          commonEventSubscriber0401 = data;
          commonEventSubscriber0401.getSubscribeInfo().then((data: commonEventManager.CommonEventSubscribeInfo|null) => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0400=========getSubscribeInfo promise2');
            expect(data?.events[0]).assertEqual('publish_eventOrder0400');
            commonEventManager.subscribe(commonEventSubscriber0401, subscriberCallBack0401);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0400 delay 100mss==================');
              commonEventManager.publish('publish_eventOrder0400', commonEventPublishData, publishCallback);
            }, 100);
          })
        } else {
          expect(false).assertTrue();
          done();
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1100 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_1200
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_1200
     * @tc.desc   Check the subscriber can receive event "publish_event0500" type of the interface (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1200'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1200 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0500'),
        priority: 1001
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0500'),
        priority: -101
      };

      let commonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 10,
        data: 'publish_event0500_init',
        isOrdered: true,
      }

      let subscriberCallBack0500=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0500========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0500=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0500=========data: ' + data?.data);
        expect(data?.event).assertEqual('publish_event0500');
        expect(data?.code).assertEqual(10);
        expect(data?.data).assertEqual('publish_event0500_init');
        commonEventSubscriber0500.finishCommonEvent((err: BusinessError | null) => {
          if (err) {
            console.info(TAG+"===============>finishCommonEvent AsyncCallback failed " + JSON.stringify(err));
          } else {
            console.info(TAG+"===============>FinishCommonEvent AsyncCallback success");
          }
          done()
        })
      }

      let subscriberCallBack0501=(err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        console.info(TAG+'===============>subscriberCallBack0501========event: ' + data?.event);
        console.info(TAG+'===============>subscriberCallBack0501=========code: ' + data?.code);
        console.info(TAG+'===============>subscriberCallBack0501========data: ' + data?.data);
        expect(data?.event).assertEqual('publish_event0500');
        expect(data?.code).assertEqual(10);
        expect(data?.data).assertEqual('publish_event0500_init');
        commonEventSubscriber0501.finishCommonEvent((err: BusinessError | null) => {
          if (err) {
            console.info(TAG+"===============>finishCommonEvent AsyncCallback failed " + JSON.stringify(err));
          } else {
            console.info(TAG+"===============>FinishCommonEvent AsyncCallback success");
          }
          done()
        })
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0500==========createSubscriber promise1');
        if (data !== null) {
          commonEventSubscriber0500 = data;
          commonEventSubscriber0500.getSubscribeInfo().then((data: commonEventManager.CommonEventSubscribeInfo|null) => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0500==========getSubscribeInfo promise1');
            expect(data?.events[0]).assertEqual('publish_event0500');
            commonEventManager.subscribe(commonEventSubscriber0500, subscriberCallBack0500);
          })
        } else {
          expect(false).assertTrue();
          done();
        }
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2
      ).then((data)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0500==========createSubscriber promise2');
        if (data !== null) {
          commonEventSubscriber0501 = data;
          commonEventSubscriber0501.getSubscribeInfo().then((data: commonEventManager.CommonEventSubscribeInfo|null) => {
            console.info(TAG + '===============ActsSubscriberTestOrder_0500==========getSubscribeInfo promise2');
            expect(data?.events[0]).assertEqual('publish_event0500');
            commonEventManager.subscribe(commonEventSubscriber0501, subscriberCallBack0501);
            setTimeout(() => {
              console.debug(TAG + '===================ActsSubscriberTestOrder_0500 delay 100ms==================');
              commonEventManager.publish('publish_event0500', commonEventPublishData, publishCallback);
            }, 100);
          })
        } else {
          expect(false).assertTrue();
          done();
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1200 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.desc   createSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600'
      count = 0;
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 START`)
      let subscribeInfo : commonEventManager.CommonEventSubscribeInfo= {
        events: new Array<string>('event06')
      }

      commonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber) => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err:Error):void => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 err `)
        expect(false).assertTrue()
        done()
      })
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST END`)
  })
}
