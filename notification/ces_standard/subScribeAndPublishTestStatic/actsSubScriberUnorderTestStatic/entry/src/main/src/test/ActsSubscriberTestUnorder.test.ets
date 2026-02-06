/*
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
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON} from '@ohos.UiTest'
const DOMAIN_NUMBER: number = 0xFF00;
let bundle_name:string = "com.example.actssubscribertestunorder.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsSubscriberTestUnorder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST', () : void => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST ===>';
    hilog.info(DOMAIN_NUMBER, TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST START`)
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');
    })

    let CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo = {
      events:new Array<string>('event'),
      publisherPermission: '',
      publisherDeviceId: '',
      userId: 100,
      priority: 1000
    }

    /*
     * @tc.number    : Sub_Notification_Ans_Subscriber_Subscribe_Static_2700
     * @tc.name      : Sub_Notification_Ans_Subscriber_Subscribe_Static_2700
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2700'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2700 START`)
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      CommonEventSubscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo|undefined) => {
        if (err) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
          expect(true).assertTrue()
          expect(CommonEventSubscriberInfo?.events[0]).assertEqual('event')
          expect(CommonEventSubscriberInfo?.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo?.publisherDeviceId == '').assertTrue()
          expect(CommonEventSubscriberInfo?.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo?.priority).assertEqual(1000)
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_2700 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Subscriber_Subscribe_Static_2800
     * @tc.name      : Sub_Notification_Ans_Subscriber_Subscribe_Static_2800
     * @tc.desc      : getSubscribeInfo(): Promise<CommonEventSubscribeInfo>
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2800'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2800 START`)
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        expect(true).assertTrue()
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('event')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
        done()
      }).catch((err:BusinessError):void => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2800 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Subscriber_Subscribe_Static_2900
     * @tc.name      : Sub_Notification_Ans_Subscriber_Subscribe_Static_2900
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2900'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2900 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      CommonEventSubscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo|undefined) => {
        if (err) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
          expect(true).assertTrue()
          expect(CommonEventSubscriberInfo?.events[0]).assertEqual('@#￥#3243adsafdf_')
          expect(CommonEventSubscriberInfo?.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo?.publisherDeviceId == '').assertTrue()
          expect(CommonEventSubscriberInfo?.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo?.priority).assertEqual(1000)
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2900 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Subscriber_Subscribe_Static_3000
     * @tc.name      : Sub_Notification_Ans_Subscriber_Subscribe_Static_3000
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_3000'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_3000 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo:commonEventManager.CommonEventSubscribeInfo) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        expect(true).assertTrue()
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('@#￥#3243adsafdf_')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
        done()
      }).catch((err:BusinessError):void => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_3000 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_Static_0900
     * @tc.name      : Sub_Notification_Ces_Subscriber_Subscribe_Static_0900
     * @tc.desc      : isOrderedCommonEvent(callback: AsyncCallback<boolean>): void
     */
    it('Sub_Notification_Ces_Subscriber_Subscribe_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_0900'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_0900 START`)
      await Utils.msSleep(2000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0500'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0500'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + CommonEventData)
          expect(true).assertTrue()
        }
      })

      CommonEventSubscriber.isOrderedCommonEvent((err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': isOrderedCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': isOrderedCommonEvent successed!')
          expect(true).assertTrue()
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
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_0900 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Publish_CommonEvent_Static_8350
     * @tc.name      : Sub_Notification_Ces_Publish_CommonEvent_Static_8350
     * @tc.desc      : isOrderedCommonEvent(): Promise<boolean>
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8350'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8350 START`)
      await Utils.msSleep(1000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0600'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0600'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        bundleName: bundle_name,
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + CommonEventData)
          expect(true).assertTrue()
        }
      })

      await CommonEventSubscriber.isOrderedCommonEvent().then(() => {
        console.info(TAG + ': isOrderedCommonEvent successed!')
        expect(true).assertTrue()
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
      }).catch((err:BusinessError):void => {
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
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8350 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Publish_CommonEvent_Static_8250
     * @tc.name      : Sub_Notification_Ces_Publish_CommonEvent_Static_8250
     * @tc.desc      : iisStickyCommonEvent(callback: AsyncCallback<boolean>): void
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8250'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8250 START`)
      await Utils.msSleep(1000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0700'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0700'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + CommonEventSubscriber)
        expect(true).assertTrue()
      }

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
          expect(true).assertTrue()
        }
      })

      CommonEventSubscriber.isStickyCommonEvent((err: BusinessError | null) => {
        if (err) {
          console.info(TAG + ': isStickyCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': isStickyCommonEvent successed!')
          expect(true).assertTrue()
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
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8250 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Publish_CommonEvent_Static_8300
     * @tc.name      : Sub_Notification_Ces_Publish_CommonEvent_Static_8300
     * @tc.desc      : isStickyCommonEvent(): Promise<boolean>
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_8300'
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8300 START`)
      await Utils.msSleep(1000);
      CommonEventSubscriberInfo.events[0] = 'publish_event_0800'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0800'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let CommonEventSubscriber:commonEventManager.CommonEventSubscriber = await commonEventManager.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + CommonEventSubscriber)
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      commonEventManager.subscribe(CommonEventSubscriber, (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData|undefined) => {
        if (err) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' +CommonEventData)
          expect(true).assertTrue()
        }
      })

      await CommonEventSubscriber.isStickyCommonEvent().then(() => {
        console.info(TAG + ': isStickyCommonEvent successed!')
        expect(true).assertTrue()
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('publish_event_0800')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId).assertEqual('PublishDeviceId_0800')
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(10)
        expect(CommonEventPublishData.code).assertEqual(0)
        expect(CommonEventPublishData.data).assertEqual('initial_data')
        expect(CommonEventPublishData.isSticky).assertTrue()
        done()
      }).catch((err:BusinessError):void => {
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
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_Static_8300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_Static_0800
     * @tc.name      : Sub_Notification_Ces_Subscriber_Subscribe_Static_0800
     * @tc.desc      : CommonEventPublishData
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
      }as Record<string, Object>
      }
      hilog.info(DOMAIN_NUMBER, TAG, ` CommonEventSubscriber ===> start`)
      await commonEventManager.createSubscriber(CommonEventSubscriberInfo).then((commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined): void => {
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 success`)
        if(commonEventSubscriber !== undefined){
          subscriber = commonEventSubscriber
          hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 commonEventSubscriber111111 success`)
          commonEventManager.subscribe(subscriber, (err:BusinessError | null,CommonEventData:commonEventManager.CommonEventData|undefined) => {
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
                expect(true).assertTrue()
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
          expect(true).assertTrue()
        }
      })
      await Utils.msSleep(2000)
      hilog.info(DOMAIN_NUMBER, TAG,` Sub_Notification_Ces_Subscriber_Subscribe_Static_0800 END`)
    })
    hilog.info(DOMAIN_NUMBER, TAG,` SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST END`)
  })
}
