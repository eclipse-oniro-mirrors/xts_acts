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
import commonEventManager from '@ohos.commonEventManager';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { BusinessError, RecordData } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

const DOMAIN_NUMBER: int = 0xFF00;
let bundle_name:string = "com.example.actssubscribertestunorder.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsSubscriberTestUnorder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST', () : void => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST ===>';
    hilog.info(DOMAIN_NUMBER, TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST START`)
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');
    })

    let CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo = {
      events:new Array<string>('event'),
      publisherPermission: '',
      publisherDeviceId: '',
      userId: 100,
      priority: 1000
    }

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_2700
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_2700
     * @tc.desc   getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2700'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2700 START`)
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

        CommonEventSubscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscriberInfo) => {
        if (err) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' +
          JSON.stringify(CommonEventSubscriberInfo))
          if (CommonEventSubscriberInfo !== null) {
            expect(CommonEventSubscriberInfo?.events[0]).assertEqual('event')
            expect(CommonEventSubscriberInfo?.publisherPermission == '').assertTrue()
            expect(CommonEventSubscriberInfo?.publisherDeviceId == '').assertTrue()
            expect(CommonEventSubscriberInfo?.userId).assertEqual(100)
            expect(CommonEventSubscriberInfo?.priority).assertEqual(1000)
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_2700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_2800
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_2800
     * @tc.desc   getSubscribeInfo(): Promise<CommonEventSubscribeInfo>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2800'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2800 START`)
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo: commonEventManager.CommonEventSubscribeInfo | null) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        if (CommonEventSubscriberInfo !== null) {
          let subscriberInfo: commonEventManager.CommonEventSubscribeInfo = CommonEventSubscriberInfo as commonEventManager.CommonEventSubscribeInfo;
          expect(subscriberInfo.events[0]).assertEqual('event')
          expect(subscriberInfo.publisherPermission == '').assertTrue()
          expect(subscriberInfo.publisherDeviceId == '').assertTrue()
          expect(subscriberInfo.userId).assertEqual(100)
          expect(subscriberInfo.priority).assertEqual(1000)
          done()
        } else {
          expect(false).assertTrue()
          done()
        }
      }).catch((err:Error):void => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2800 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_2900
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_2900
     * @tc.desc   getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2900'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2900 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      CommonEventSubscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscriberInfo) => {
        if (err) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
          if (CommonEventSubscriberInfo !== null) {
            expect(CommonEventSubscriberInfo?.events[0]).assertEqual('@#￥#3243adsafdf_')
            expect(CommonEventSubscriberInfo?.publisherPermission == '').assertTrue()
            expect(CommonEventSubscriberInfo?.publisherDeviceId == '').assertTrue()
            expect(CommonEventSubscriberInfo?.userId).assertEqual(100)
            expect(CommonEventSubscriberInfo?.priority).assertEqual(1000)
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2900 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_3000
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_3000
     * @tc.desc   getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_3000'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_3000 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo: commonEventManager.CommonEventSubscribeInfo | null) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        if (CommonEventSubscriberInfo !== null) {
          let subscriberInfo: commonEventManager.CommonEventSubscribeInfo = CommonEventSubscriberInfo as commonEventManager.CommonEventSubscribeInfo;
          expect(subscriberInfo.events[0]).assertEqual('@#￥#3243adsafdf_')
          expect(subscriberInfo.publisherPermission == '').assertTrue()
          expect(subscriberInfo.publisherDeviceId == '').assertTrue()
          expect(subscriberInfo.userId).assertEqual(100)
          expect(subscriberInfo.priority).assertEqual(1000)
          done()
        } else {
          expect(false).assertTrue()
          done()
        }
      }).catch((err:Error):void => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_3000 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_0900
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_0900
     * @tc.desc   isOrderedCommonEvent(callback: AsyncCallback<boolean>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Subscriber_Subscribe_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_0900'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_0900 START`)
      await Utils.msSleep(5000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0500'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0500'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + CommonEventData)
        }
      })

      CommonEventSubscriber.isOrderedCommonEvent((err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': isOrderedCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': isOrderedCommonEvent successed!')
          expect(CommonEventSubscriberInfo.events[0]).assertEqual('publish_event_0500')
          expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo.publisherDeviceId).assertEqual('PublishDeviceId_0500')
          expect(CommonEventSubscriberInfo.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo.priority).assertEqual(10)
          expect(CommonEventPublishData.code).assertEqual(0)
          expect(CommonEventPublishData.data).assertEqual('initial_data')
          expect(CommonEventPublishData.isOrdered).assertTrue()
          done()
        }
      })

      commonEventManager.publish('publish_event_0500', CommonEventPublishData, (err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + CommonEventPublishData)          
        }
      })
      await Utils.msSleep(2000)
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_0900 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_8350
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_8350
     * @tc.desc   isOrderedCommonEvent(): Promise<boolean>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8350'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8350 START`)
      await Utils.msSleep(5000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0600'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0600'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        bundleName: bundle_name,
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + CommonEventData)
        }
      })

      await CommonEventSubscriber.isOrderedCommonEvent().then(() => {
        console.info(TAG + ': isOrderedCommonEvent successed!')
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('publish_event_0600')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId).assertEqual('PublishDeviceId_0600')
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(10)
        expect(CommonEventPublishData.bundleName).assertEqual('com.example.actssubscribertestunorder.static')
        expect(CommonEventPublishData.code).assertEqual(0)
        expect(CommonEventPublishData.data).assertEqual('initial_data')
        expect(CommonEventPublishData.isOrdered).assertTrue()
        done()
      }).catch((err:Error):void => {
        console.info(TAG + ': isOrderedCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
        done()
      })

      commonEventManager.publish('publish_event_0600', CommonEventPublishData, (err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8350 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_8250
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_8250
     * @tc.desc   iisStickyCommonEvent(callback: AsyncCallback<boolean>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8250'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8250 START`)
      await Utils.msSleep(5000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0700'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0700'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
        }
      })

      CommonEventSubscriber.isStickyCommonEvent((err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': isStickyCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': isStickyCommonEvent successed!')
          expect(CommonEventSubscriberInfo.events[0]).assertEqual('publish_event_0700')
          expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo.publisherDeviceId).assertEqual('PublishDeviceId_0700')
          expect(CommonEventSubscriberInfo.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo.priority).assertEqual(10)
          expect(CommonEventPublishData.code).assertEqual(0)
          expect(CommonEventPublishData.data).assertEqual('initial_data')
          expect(CommonEventPublishData.isSticky).assertTrue()
          done()
        }
      })

      commonEventManager.publish('publish_event_0700', CommonEventPublishData, (err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
        }
      })

      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8250 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_8300
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_8300
     * @tc.desc   isStickyCommonEvent(): Promise<boolean>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8300'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8300 START`)
      await Utils.msSleep(5000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0800'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0800'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let tempSubscriber:commonEventManager.CommonEventSubscriber|null = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (tempSubscriber == undefined || tempSubscriber == null) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + tempSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + tempSubscriber)
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = tempSubscriber as commonEventManager.CommonEventSubscriber;

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' +CommonEventData)
        }
      })

      await CommonEventSubscriber.isStickyCommonEvent().then(() => {
        console.info(TAG + ': isStickyCommonEvent successed!')
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('publish_event_0800')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId).assertEqual('PublishDeviceId_0800')
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(10)
        expect(CommonEventPublishData.code).assertEqual(0)
        expect(CommonEventPublishData.data).assertEqual('initial_data')
        expect(CommonEventPublishData.isSticky).assertTrue()
        done()
      }).catch((err:Error):void => {
        console.info(TAG + ': isStickyCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
        done()
      })

      commonEventManager.publish('publish_event_0800', CommonEventPublishData, (err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + CommonEventPublishData)
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8300 END`)
    })


    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_0800
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_0800
     * @tc.desc   CommonEventPublishData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Subscriber_Subscribe_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_0800'
      hilog.info(DOMAIN_NUMBER, TAG,`Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 START`)
      let subscriber: commonEventManager.CommonEventSubscriber
      let CommonEventSubscriberInfo : commonEventManager.CommonEventSubscribeInfo = {
        events: new Array<string>('event'),
        publisherPermission: '',
        publisherDeviceId: '',
        priority: 1000
      }

      await Utils.msSleep(500)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0900'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0900'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData : commonEventManager.CommonEventPublishData= {
        code: 0,
        data: "initial_data",
        subscriberPermissions:new Array<string>(''),
        bundleName:bundle_name,
        isOrdered:false,
        isSticky:false,
        parameters:{
          'key1':'parameters_0100'
        }as Record<string, RecordData>
      }
      hilog.info(DOMAIN_NUMBER, TAG, ` CommonEventSubscriber ===> start`)
      await commonEventManager.createSubscriber(CommonEventSubscriberInfo).then((commonEventSubscriber): void => {
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 success`)
        if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
          subscriber = commonEventSubscriber
          hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 commonEventSubscriber111111 success`)
          commonEventManager.subscribe(subscriber, (err:BusinessError | null, CommonEventData:commonEventManager.CommonEventData|undefined) => {
            hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 subscribe222222 success`)
            if (err) {
              hilog.info(DOMAIN_NUMBER, TAG, ` subscribe failed! Err.Info ===>  + ${err?.code}`)
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(DOMAIN_NUMBER, TAG,` subscribe successed! CommonEventData.Info ===> `+ CommonEventData)
              if (CommonEventData == undefined) {
                hilog.info(DOMAIN_NUMBER, TAG,`subscribe failed! Err.Info ===> ${CommonEventData}`)
                expect(false).assertTrue()
                done()
              } else {
                hilog.info(DOMAIN_NUMBER, TAG,`subscribe successed! CommonEventData.Info ===>${CommonEventData}`)
                expect(CommonEventData?.code).assertEqual(0)
                expect(CommonEventData?.data).assertEqual("initial_data")
                expect(CommonEventData?.parameters?.['key1']).assertEqual('parameters_0100')
                done()
              }
            }
          })

        }else{
          expect(false).assertTrue()
          done()
        }
      }).catch((err) => {
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1600 err, `)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000)
      commonEventManager.publish('publish_event_0900', CommonEventPublishData, (err:BusinessError | null) => {
        if (err) {
          hilog.info(DOMAIN_NUMBER, TAG, `publish failed! event.Info ===> + ${err?.code}`)
          expect(false).assertTrue()
          done()
        } else {
          hilog.info(DOMAIN_NUMBER, TAG, `publish successed! event.Info ===>  +${CommonEventPublishData}`)
        }
      })
      await Utils.msSleep(2000)
      hilog.info(DOMAIN_NUMBER, TAG,` Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 END`)
    })
    hilog.info(DOMAIN_NUMBER, TAG,` SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST END`)
  })
}
