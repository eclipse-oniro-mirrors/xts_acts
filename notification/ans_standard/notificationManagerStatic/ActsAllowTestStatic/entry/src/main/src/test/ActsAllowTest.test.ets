/**
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
import hilog from '@ohos.hilog';
import notificationManager from '@ohos.notificationManager';
import { Driver, ON } from '@ohos.UiTest';
import { describe, it, expect, TestType, Size, Level,beforeAll } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import commonEventManager from '@ohos.commonEventManager';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle :string = 'com.example.actsnotificationmanagerrequestenablenotificationallowtest.static'
let testAbilityContext: common.UIAbilityContext | undefined;
// 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
let subscriber: commonEventManager.CommonEventSubscriber | undefined;
// 订阅者信息
let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: ["event"],
  publisherBundleName: 'com.example.myapplication'
};


export default function ActsAllowTest() {
  describe('SUB_ACTS_ALLOW_TEST', () => {

    const TAG = 'SUB_ACTS_ALLOW_TEST ===>';
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      let driver = Driver.create();
      await Utils.msSleep(500)
      let button = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await Utils.msSleep(1000)
        await button.click();
        await Utils.msSleep(500)
      } else {
        console.info('找不到button');
      }
    })


    /**
     * @tc.name   Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_Static_0100
     * @tc.number Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_Static_0100
     * @tc.desc   requestEnableNotification allow button is clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Allow_Test_Static_0100'
        notificationManager.requestEnableNotification(testAbilityContext!).then(() => {
          console.info(`${TAG} requestEnableNotification succeeded`);
        }).catch((err: Error): void => {
          console.info(`${TAG} requestEnableNotification err: JSON.stringify(err)`);
          expect(false).assertTrue()
        });
        await Utils.msSleep(1500);
        let driver = Driver.create();
        await Utils.msSleep(1500);
        let button = await driver.findComponent(ON.type('Button').text('允许'));
        console.info(`${TAG} button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await Utils.msSleep(1500);
          await button.click();
          await Utils.msSleep(1000);
          done()
        } else {
          console.info(`${TAG} null button`);
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Publish_updateOnly_Static_0003
     * @tc.number Sub_Notification_Ans_Publish_updateOnly_Static_0003
     * @tc.desc   updateOnly is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_updateOnly_Static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string ='Sub_Notification_Ans_Publish_updateOnly_Static_0003'
          // 通知Request对象
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 202561732,
          notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_titleUpdateOnlytrue",
              text: "test_text",
              additionalText: "test_additionalText"
            } as notificationManager.NotificationBasicContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "123",
          creatorUid: 123,
          creatorPid: 123,
          creatorUserId: 123,
          hashCode: "123",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          updateOnly: true
        };
        notificationManager.publish(notificationRequest).then(() => {
          console.info(TAG + "publish update success");
          expect(false).assertTrue()
          done();
        }).catch((err: Error): void => {
          console.info(notificationRequest.creatorBundleName + " publish success1")
          console.info(notificationRequest.creatorUid + " publish success1")
          console.info(notificationRequest.creatorPid + " publish success1")
          console.info(notificationRequest.creatorUserId + " publish success1")
          console.info(notificationRequest.hashCode + " publish success1")
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
     * @tc.name   Sub_Notification_Ces_Subscriber_Subscribe_Static_08086
     * @tc.number Sub_Notification_Ces_Subscriber_Subscribe_Static_08086
     * @tc.desc   调用 createSubscriber 接口，创建订阅者，调用 subscribe 接口，getSubscribeInfo获取订阅者信息，subscribeInfo.publisherBundleName为订阅者包名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Subscriber_Subscribe_Static_08086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string ='Sub_Notification_Ces_Subscriber_Subscribe_Static_08086'
        // 创建订阅者
        try {
          commonEventManager.createSubscriber(subscribeInfo,
            (err: BusinessError | null, commonEventSubscriber) => {
              if (!err) {
                console.info(`Succeeded in creating subscriber.`);

                if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
                  subscriber = commonEventSubscriber
                }else{
                  expect(false).assertTrue()
                  done()
                }
                // 订阅公共事件
                try {
                  commonEventManager.subscribe(subscriber!,
                    (err: BusinessError| null, data: commonEventManager.CommonEventData|undefined) => {
                      if (err) {
                        console.error(`${TAG} Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
                      } else {
                        console.info(`${TAG} Succeeded in subscribing, data is ` + data);
                      }
                    });
                } catch (error) {
                  let err: BusinessError = error as BusinessError;
                  console.error(`${TAG} Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
                }
              } else {
                console.error(`${TAG} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
              }
            });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(`${TAG} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
        await Utils.msSleep(1500)

        subscriber!.getSubscribeInfo().then((subscribeInfo: commonEventManager.CommonEventSubscribeInfo | null) => {
          console.info(`${TAG} Succeeded in getting subscribe info, subscribe info is ` + JSON.stringify(subscribeInfo));
          if (subscribeInfo !== null) {
            let info = subscribeInfo as commonEventManager.CommonEventSubscribeInfo;
            expect(info.publisherBundleName).assertEqual('com.example.myapplication')
            done();
          } else {
            expect(false).assertTrue()
            done();
          }
        }).catch((err: Error):void => {
          console.error(`${TAG} Failed to get subscribe info. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done();
        })
      })
  })
}
