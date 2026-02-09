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

import notificationManager from '@ohos.notificationManager';

import { Driver, ON } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { logGenerator, succeedGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';

import common from '@ohos.app.ability.common';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

let ctx = getContext(this) as common.UIAbilityContext;


// 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
let subscriber: commonEventManager.CommonEventSubscriber;
// 订阅者信息
let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: ["event"],
  publisherBundleName: 'com.example.myapplication'
};

// 订阅公共事件回调
function SubscribeCB(err: BusinessError, data: commonEventManager.CommonEventData) {
  if (err) {
    console.error(`Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
  } else {
    console.info(`Succeeded in subscribing, data is ` + JSON.stringify(data));
  }
}

// 创建订阅者回调
function createCB(err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) {
  if (!err) {
    console.info(`Succeeded in creating subscriber.`);
    subscriber = commonEventSubscriber;
    // 订阅公共事件
    try {
      commonEventManager.subscribe(subscriber, SubscribeCB);
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
    }
  } else {
    console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
  }
}

export default function ActsAllowTest() {
  describe('SUB_ACTS_ALLOW_TEST', () => {
    const TAG = 'SUB_ACTS_ALLOW_TEST ===>';
    let log = logGenerator(TAG);
    log('SUB_ACTS_ALLOW_TEST START');

    beforeAll(async (done: () => void) => {
      log('SUB_ACTS_ALLOW_TEST beforeAll START');
      await sleep(500);
      let driver = Driver.create();
      await sleep(500)
      let button = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      log(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(500);
        done()
      } else {
        log('null button');
        done()
      }
      log('SUB_ACTS_ALLOW_TEST beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_0100
     * @tc.number Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_0100
     * @tc.desc   requestEnableNotification allow button is clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_0100', Level.LEVEL2,
      async (done: () => void) => {
        let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
          let succeed = succeedGenerator(TAG, resolve, done);
          let exit = exitGenerator(TAG, reject);
          notificationManager.requestEnableNotification(ctx).then(() => {
            succeed(`requestEnableNotification succeeded`);
            done()
          }).catch((err: Error) => {
            exit(`requestEnableNotification err: JSON.stringify(err)`);
          });
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('允许'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await sleep(1500);
            await button.click();
            await sleep(500);
            done()
          } else {
            exit('null button');
          }
        };
        return new Promise<void>((resolve, reject) => {
          fn(resolve, reject);
        });
      }
    );

    /**
     * @tc.name   Sub_Notification_Ans_OpenNotification_Settings_0004
     * @tc.number Sub_Notification_Ans_OpenNotification_Settings_0004
     * @tc.desc   非系统应用调用openNotificationSettings接口拉起设置页面
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_OpenNotification_Settings_0004', Level.LEVEL2,
      async (done: () => void) => {
        let fn = async (resolve: () => void, reject: (arg1: Error) => void): Promise<void> => {
          let succeed = succeedGenerator(TAG, resolve, done);
          let exit = exitGenerator(TAG, reject);
          notificationManager.openNotificationSettings(ctx).then(() => {
            succeed(`openNotificationSettings succeeded`);
            done()
          }).catch((err: BusinessError) => {
            exit(`openNotificationSettings err: JSON.stringify(err)`);
            if (err.code == 801) {
              expect(true).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          })
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('通知管理'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            done()
          } else {
            exit('找不到通知管理');
          }
        };
        return new Promise<void>((resolve, reject) => {
          fn(resolve, reject);
        });
      }
    );


    /**
     * @tc.name   Sub_Notification_Ans_Publish_updateOnly_0003
     * @tc.number Sub_Notification_Ans_Publish_updateOnly_0003
     * @tc.desc   updateOnly is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_updateOnly_0003', Level.LEVEL2, async (done: Function) => {
      // 通知Request对象
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 2025012101,
        notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_titleUpdateOnlytrue",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        },
        updateOnly: true,
        creatorBundleName: '123',
        creatorUid: 123,
        creatorPid: 123,
        creatorUserId: 123,
        hashCode: '123'
      };
      await sleep(500);
      notificationManager.publish(notificationRequest).then(() => {
        console.info(TAG + "publish update success");
        expect(false).assertTrue()
        done();
      }).catch((err: BusinessError) => {
        console.log(notificationRequest.creatorBundleName + " publish success1")
        console.log(notificationRequest.creatorUid + " publish success1")
        console.log(notificationRequest.creatorPid + " publish success1")
        console.log(notificationRequest.creatorUserId + " publish success1")
        console.log(notificationRequest.hashCode + " publish success1")
        expect(notificationRequest.creatorBundleName).assertEqual('123')
        expect(notificationRequest.creatorUid).assertEqual(123)
        expect(notificationRequest.creatorPid).assertEqual(123)
        expect(notificationRequest.creatorUserId).assertEqual(123)
        expect(notificationRequest.hashCode).assertEqual('123')
        console.error(TAG + `publish update fail: ${JSON.stringify(err)}`);
        expect(err.code == 1600007).assertTrue()
        done();
      });
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_08086
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_08086
     * @tc.desc   publisherBundleName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Subscriber_Subscribe_08086', Level.LEVEL2, async (done: () => void) => {

      // 创建订阅者
      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }
      await sleep(1500)

      subscriber.getSubscribeInfo().then((subscribeInfo: commonEventManager.CommonEventSubscribeInfo) => {
        console.info(`Succeeded in getting subscribe info, subscribe info is ` + JSON.stringify(subscribeInfo));
        expect(subscribeInfo.publisherBundleName).assertEqual('com.example.myapplication')
        done();
      }).catch((err: BusinessError) => {
        console.error(`Failed to get subscribe info. Code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done();
      });
    })

  });
};
