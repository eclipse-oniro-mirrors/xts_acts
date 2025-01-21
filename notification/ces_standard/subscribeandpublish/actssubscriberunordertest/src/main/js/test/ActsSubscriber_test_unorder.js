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
import commonEvent from '@ohos.commonEvent';
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect,} from "@ohos/hypium";

export default function ActsSubscriberTestUnorder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST ===>';
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST START`)

    let CommonEventSubscriberInfo = {
      events: ['event'],
      publisherPermission: '',
      publisherDeviceId: '',
      userId: 100,
      priority: 1000
    }

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0100
     * @tc.name      : check
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0100 START`)
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo((err, CommonEventSubscriberInfo) => {
        if (err.code) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
          expect(true).assertTrue()
          expect(CommonEventSubscriberInfo.events[0]).assertEqual('event')
          expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
          expect(CommonEventSubscriberInfo.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0200
     * @tc.name      : check
     * @tc.desc      : getSubscribeInfo(): Promise<CommonEventSubscribeInfo>
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0200 START`)
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        expect(true).assertTrue()
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('event')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
        done()
      }).catch((err) => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0300
     * @tc.name      : Check the subscriber can receive event "@#￥#3243adsafdf_" type of the interface
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0300 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo((err, CommonEventSubscriberInfo) => {
        if (err.code) {
          console.info(TAG + ': getSubscribeInfo failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': getSubscribeInfo successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
          expect(true).assertTrue()
          expect(CommonEventSubscriberInfo.events[0]).assertEqual('@#￥#3243adsafdf_')
          expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
          expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
          expect(CommonEventSubscriberInfo.userId).assertEqual(100)
          expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0400
     * @tc.name      : Check the subscriber can receive event "@#￥#3243adsafdf_" type of the interface (by Promise)
     * @tc.desc      : getSubscribeInfo(callback: AsyncCallback<CommonEventSubscribeInfo>): void
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0400 START`)
      CommonEventSubscriberInfo.events[0] = '@#￥#3243adsafdf_'
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await CommonEventSubscriber.getSubscribeInfo().then((CommonEventSubscriberInfo) => {
        console.info(TAG + ': getSubscribeInfo promise successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo))
        expect(true).assertTrue()
        expect(CommonEventSubscriberInfo.events[0]).assertEqual('@#￥#3243adsafdf_')
        expect(CommonEventSubscriberInfo.publisherPermission == '').assertTrue()
        expect(CommonEventSubscriberInfo.publisherDeviceId == '').assertTrue()
        expect(CommonEventSubscriberInfo.userId).assertEqual(100)
        expect(CommonEventSubscriberInfo.priority).assertEqual(1000)
        done()
      }).catch((err) => {
        console.info(TAG + ': getSubscribeInfo promise failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
      })
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0500
     * @tc.name      : check
     * @tc.desc      : isOrderedCommonEvent(callback: AsyncCallback<boolean>): void
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0500 START`)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0500'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0500'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
          expect(true).assertTrue()
        }
      })

      await CommonEventSubscriber.isOrderedCommonEvent((err) => {
        if (err.code) {
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

      await commonEvent.publish('publish_event_0500', CommonEventPublishData, (err) => {
        if (err.code) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
          expect(true).assertTrue()
          done()
        }
      })

      await sleep(5000)
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0600
     * @tc.name      : check
     * @tc.desc      : isOrderedCommonEvent(): Promise<boolean>
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0600 START`)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0600'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0600'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData = {
        bundleName: 'com.example.actssubscribertestunorder',
        code: 0,
        data: "initial_data",
        isOrdered: true,
      }
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
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
        expect(CommonEventPublishData.bundleName).assertEqual('com.example.actssubscribertestunorder')
        expect(CommonEventPublishData.code).assertEqual(0)
        expect(CommonEventPublishData.data).assertEqual('initial_data')
        expect(CommonEventPublishData.isOrdered).assertTrue()
        done()
      }).catch((err) => {
        console.info(TAG + ': isOrderedCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
        done()
      })

      await commonEvent.publish('publish_event_0600', CommonEventPublishData, (err) => {
        if (err.code) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
          expect(true).assertTrue()
          done()
        }
      })

      await sleep(5000)
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0700
     * @tc.name      : check
     * @tc.desc      : iisStickyCommonEvent(callback: AsyncCallback<boolean>): void
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0700 START`)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0700'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0700'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
          expect(true).assertTrue()
        }
      })

      await CommonEventSubscriber.isStickyCommonEvent((err) => {
        if (err.code) {
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

      await commonEvent.publish('publish_event_0700', CommonEventPublishData, (err) => {
        if (err.code) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
          expect(true).assertTrue()
          done()
        }
      })

      await sleep(5000)
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0800
     * @tc.name      : check
     * @tc.desc      : isStickyCommonEvent(): Promise<boolean>
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0800 START`)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0800'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0800'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        isSticky: true,
      }
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
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
      }).catch((err) => {
        console.info(TAG + ': isStickyCommonEvent failed! event.Info ===> ' + JSON.stringify(err.code))
        expect(false).assertTrue()
        done()
      })

      await commonEvent.publish('publish_event_0800', CommonEventPublishData, (err) => {
        if (err.code) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
          expect(true).assertTrue()
          done()
        }
      })
      await sleep(5000)
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0900
     * @tc.name      : check properties
     * @tc.desc      : CommonEventPublishData
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0900', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0900 START`)
      CommonEventSubscriberInfo.events[0] = 'publish_event_0900'
      CommonEventSubscriberInfo.publisherDeviceId = 'PublishDeviceId_0900'
      CommonEventSubscriberInfo.priority = 10

      let CommonEventPublishData = {
        code: 0,
        data: "initial_data",
        subscriberPermissions:['publish_event_0900_subscriberPermissions'],
        isOrdered:false,
        isSticky:false,
        parameters:{
          key1:'parameters_0100'
        }
      }
      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
          expect(true).assertTrue()
        }
      })

      await commonEvent.publish('publish_event_0900', CommonEventPublishData, (err) => {
        if (err.code) {
          console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventPublishData))
          expect(true).assertTrue()
          done()
        }
      })

      await sleep(5000)
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST_0900 END`)
    })     
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST END`)
  })
}
