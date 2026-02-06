/*
* Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import notificationManager from '@ohos.notificationManager'
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import wantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import emitter from '@ohos.events.emitter'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
let bundle_name:string = "com.example.actsnotificationpublish.static"
let domain: number = 0x0000;
let wantAgentData : Object = {}

let parameters1 : Record<String,Object> = {
  "mykey0": 2222,
  "mykey1": [1, 2, 3],
  "mykey2": "[1, 2, 3]",
  "mykey3": "ssssssssssssssssssssssssss",
  "mykey4": [false, true, false],
  "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
  "mykey6": true,
}
// wantAgent
let wantAgentInfo: wantAgent.WantAgentInfo = {
  wants: [
    {
      deviceId: "deviceId",
      bundleName: bundle_name,
      abilityName: "com.example.actsnotificationpublish.static.MainAbility",
      action: "action1",
      entities: ["entity1"],
      type: "MIMETYPE",
      uri: "key={true,true,false}",
      parameters:parameters1,
    }
  ],
  actionType: wantAgent.OperationType.START_ABILITIES,
  actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
}as wantAgent.WantAgentInfo

export default function ActsNotificationPublishTest() {
  describe('ActsNotificationPublishTest', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_Publish_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_Publish_TEST START')
    let testAbilityContext:common.UIAbilityContext;


    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(1000)
      wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        wantAgentData = data;
      }).catch((err: BusinessError) :void => {
        console.error('getWantAgent failed! ${err.code} ${err.message}');
      });
      await Utils.msSleep(1000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })


    beforeEach(() => {
      console.info(`${TAG} beforeEach START`)
      notificationManager.cancelAll((err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} cancelAll notification err: ${err.code}`)
          expect(false).assertTrue()
        } else {
          console.info(`${TAG} cancelAll notification success`)
          expect(true).assertTrue()
        }
      })
      await Utils.msSleep(500)
      console.info(`${TAG} beforeEach END`)
    })

    /*
       * @tc.number    : Sub_Notification_Ans_Enable_Query_Static_2700
       * @tc.name      : Sub_Notification_Ans_Enable_Query_Static_2700
       * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
       */
    it('Sub_Notification_Ans_Enable_Query_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Enable_Query_Static_2700'
        notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Enable_Query_Static_2700 ===>requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue()
            done()
          } else {
            console.info("Sub_Notification_Ans_Enable_Query_Static_2700 ===>requestEnableNotification success");
            expect(true).assertTrue()
            await Utils.msSleep(1000)
            console.info("Sub_Notification_Ans_Enable_Query_Static_2700 ===>requestEnableNotification success 1s");
            done()
          }
        })

        await Utils.msSleep(1000)
        let driver = Driver.create();
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2700 ===>====>come in driveFn`);
        await Utils.msSleep(1000)
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2700 ===>====>driver is ${JSON.stringify(driver)}`);
        let button = await driver.findComponent(ON.text('允许'));
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2700 ===>====>button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await button.click()
          console.info(`Sub_Notification_Ans_Enable_Query_Static_2700 ===>====>button is click`);
          await Utils.msSleep(1000)
        } else {
          console.info('Sub_Notification_Ans_Enable_Query_Static_2700 ===>====>button is null button');
          await Utils.msSleep(1000)
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_2700 END`)
      })


    /*
     * @tc.number    : Sub_Notification_Ans_Enable_Query_Static_2800
     * @tc.name      : Sub_Notification_Ans_Enable_Query_Static_2800
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_Enable_Query_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Enable_Query_Static_2800'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2800 START`)
        await Utils.msSleep(2000);
        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2800 2s`)
        await notificationManager.requestEnableNotification(testAbilityContext).then(() => {
          console.info(`${TAG} requestEnableNotification Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} requestEnableNotification Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2800 END`)
      })

    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300
    //      * @tc.name      : SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300
    //      * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
    //      */
    //      //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300 START`)
    //   notificationManager.requestEnableNotification(undefined).then(() => {
    //     console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300 requestEnableNotification Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300 requestEnableNotification Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_Static_0300 END`)
    // })


    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8300
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8300
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8300'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8300 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent
        } as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey:undefined,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1,
      }

      notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} notification publish AsyncCallback success `)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8350
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8350
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8350'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8350 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent
        } as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1,
      }

      notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} notification publish AsyncCallback success: `)
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8350 END`)
    })

   /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8400
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8400
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8400'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8400 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
          longText: {
            title: 'testLongTextTitle',
            text: 'testLongTextText',
            additionalText: 'testLongTextAdditionalText',
            longText: 'testLongTextLongText',
            briefText: 'testLongTextBriefText',
            expandedTitle: 'testLongTextExpandedTitle'
          }as notificationManager.NotificationLongTextContent,
        } as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1,
      }

      notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success `)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8400 END`)
    })

     /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8450
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8450
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8450'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8450 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
          longText: {
            title: 'testLongTextTitle',
            text: 'testLongTextText',
            additionalText: 'testLongTextAdditionalText',
            longText: 'testLongTextLongText',
            briefText: 'testLongTextBriefText',
            expandedTitle: 'testLongTextExpandedTitle'
          }as notificationManager.NotificationLongTextContent,
        } as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1
      }

      notificationManager.publish(notificationRequest).then(() => {
        console.log(`${TAG} notification publish AsyncCallback success`)
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8450 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8500
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8500
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8500'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8500 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
          multiLine: {
            title: 'testMultiLineTitle',
            text: 'testMultiLineText',
            additionalText: 'testMultiLineAdditionalText',
            longTitle: 'testMultiLineLongText',
            briefText: 'testMultiLineBriefText',
            lines: ['firstLine', 'secondLine', 'thirdLine']
          }as notificationManager.NotificationMultiLineContent
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1
      }

      notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} notification publish AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8500 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8550
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8550
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8550'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8550 START`)
      let extraInfo1:Record<String,Object>= {
        'testKey': 'testValue'
      }
      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
          multiLine: {
            title: 'testMultiLineTitle',
            text: 'testMultiLineText',
            additionalText: 'testMultiLineAdditionalText',
            longTitle: 'testMultiLineLongText',
            briefText: 'testMultiLineBriefText',
            lines: ['firstLine', 'secondLine', 'thirdLine']
          }as notificationManager.NotificationMultiLineContent
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
        isOngoing: false,
        isUnremovable: false,
        deliveryTime: 0,
        tapDismissed: false,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1
      }

      notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} notification publish AsyncCallback success`)
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void  => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8550 END`)
    })

  /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_8600
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_8600
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_8600'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8600 START`)
      let extraInfo1:Record<String,Object>= {
        'testActionButtonKey': 'testActionButtonValue',
      }
      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        color: 255,
        colorEnabled: true,
        isAlertOnce: true,
        isStopwatch: true,
        isCountDown: true,
        isFloatingIcon: true,
        label: 'notificationPublishTestLabel',
        badgeIconStyle: 6,
        showDeliveryTime: true,
        actionButtons: [
          {
            title: 'actionButtonsTitle',
            wantAgent: wantAgentData,
            extras: extraInfo1,
            userInput: {
              inputKey: 'testInputKey'
            }as notificationManager.NotificationUserInput,
          }
        ],
      }

      notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} notification publish AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_8600 END`)
    })
  /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_0150
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_0150
     * @tc.desc      : Publishes a notification
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_0150'
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_0150 START`)
      let extraInfo1:Record<String,Object>= {
        'testActionButtonKey': 'testActionButtonValue',
      }
      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        color: 255,
        colorEnabled: true,
        isAlertOnce: true,
        isStopwatch: true,
        isCountDown: true,
        isFloatingIcon: true,
        label: 'notificationPublishTestLabel',
        badgeIconStyle: 6,
        showDeliveryTime: true,
        actionButtons: [
          {
            title: 'actionButtonsTitle',
            wantAgent: wantAgentData,
            extras: extraInfo1,
            userInput: {
              inputKey: 'testInputKey'
            }as notificationManager.NotificationUserInput,
          }
        ],
      }

      notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} notification publish AsyncCallback success`)
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void  => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_0150 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300
     * @tc.name      : SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300'
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300 START`)
      let extraInfo1:Record<String,Object>= {
        'testActionButtonKey': 'testActionButtonValue',
      }

      let notificationRequest:notificationManager.NotificationRequest  = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          }as notificationManager.NotificationBasicContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: extraInfo1,
        label: "label"
      }

      notificationManager.publish(notificationRequest).then(() => {
        console.log(`${TAG} notification publish AsyncCallback success`)
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void  => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_Static_01300 END`)
    })

     /*
         * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_2850
         * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_2850
         * @tc.desc      : Cancels a notification with the specified label and ID
         */
    it('Sub_Notification_Ans_Publish_Cancel_Static_2850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_2850'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_2850 START`)
        let id: number = 1
        let label: string = "label"
        notificationManager.cancel(id, label, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} cancel AsyncCallback err: ${err.code}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_2850 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_2900
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_2900
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_2900'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_2900 START`)
        let id: number = 1
        let label: string = "label"
        await notificationManager.cancel(id, label).then(() => {
          console.info(`${TAG} cancel Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancel Promise err: ${err.code}`)
          expect(true).assertTrue()
          done()
        })

        await notificationManager.cancel(id).then(() => {
          console.info(`${TAG} cancel Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancel Promise_2 err: ${err.code}`)
          expect(true).assertTrue()
          done()
        })
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_2900 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_2950
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_2950
     * @tc.desc      : Cancels a notification with the specified ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_2950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_2950'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_2950 START`)
        let id: number = 1
        notificationManager.cancel(id, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} cancel id err: ${err.code}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel id success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_2950 END`)
      })

    /*
         * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500
         * @tc.name      : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500
         * @tc.desc      : Cancels a notification with the specified label and ID
         */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500'
        console.info(`SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500 START`)
        let id: number = 1
        let label: string = "2"
        await notificationManager.cancel(id, label).then(() => {
          console.info(`${TAG} cancel Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancel Promise err: ${err.code}`)
          expect(true).assertTrue()
          done()
        })
        console.info(`SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0500 END`)
      })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600
     * @tc.name      : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600'
        console.info(`SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600 START`)
        let id: number = 1
        let label: string = "2"
        notificationManager.cancel(id, label, (err: BusinessError | null): void => {
          if (err) {
            console.info(`${TAG} cancel AsyncCallback err: ${err.code}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0600 END`)
      })

    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700
    //      * @tc.name      : SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700
    //      * @tc.desc      : Cancels a notification with the ID
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700 START`)
    //   let id = 1
    //   notificationManager.cancel(id, undefined).then(() => {
    //   console.info(`${TAG} cancel Promise success`)
    //   expect(false).assertTrue()
    //   done()
    // }).catch((err: BusinessError): void => {
    //   console.info(`${TAG} cancel Promise err: ${err.code}`)
    //   expect(true).assertTrue()
    //   done()
    // })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_Static_0700 END`)
    // })

        /*
    * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3000
    * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3000
    * @tc.desc      : Cancels all notifications of the current application
    */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3000'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3000 START`)
        notificationManager.cancelAll((err: BusinessError | null): void => {
          if (err) {
            console.info(`${TAG} cancelAll AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancelAll AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3000 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3050
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3050
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3050'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3050 START`)
        await notificationManager.cancelAll().then(() => {
          console.info(`${TAG} cancelAll Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancelAll Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3050 END`)
      })

    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300
    //      * @tc.name      : SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300
    //      * @tc.desc      : Cancels all notifications of the current application
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300 START`)
    //   notificationManager.cancelAll(undefined).then(() => {
    //     console.info(`${TAG} cancelAll Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} cancelAll Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_Static_0300 END`)
    // })

       /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_0700
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_0700
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_0700'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_0700 START`)
        await notificationManager.getActiveNotificationCount().then((data: number) => {
          console.info(`${TAG} getActiveNotificationCount Promise success :${data}`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_Static_0700 END`)
      })

  /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_0800
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_0800
     * @tc.desc      : Obtains an array of active notifications
     * 未合入
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_0800'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_0800 START`)
        notificationManager.getActiveNotifications((err: BusinessError | null,
          data: Array<notificationManager.NotificationRequest>|undefined) => {
          if (err) {
            console.info(`${TAG} getActiveNotifications AsyncCallback err :${err.code},data:${data}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getActiveNotifications AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_0800 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_0900
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_0900
     * @tc.desc      : Obtains an array of active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_0900'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_0900 START`)
        await notificationManager.getActiveNotifications()
          .then((data: Array<notificationManager.NotificationRequest>) => {
            console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_0900 END`)
      })

      // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500
    //      * @tc.name      : SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500
    //      * @tc.desc      : Obtains the number of all active notifications
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //     let TAG:string = 'SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500 START`)
    //   notificationManager.getActiveNotificationCount(undefined).then((data) => {
    //     console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0500 END`)
    // })
    //
    // /*
    //  * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600
    //  * @tc.name      : SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600
    //  * @tc.desc      : Obtains an array of active notifications
    //  */
    //  //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //     let TAG:string = 'SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600 START`)
    //   notificationManager.getActiveNotifications(undefined).then((data) => {
    //     console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_Static_0600 END`)
    // })

    console.info(TAG + 'SUB_NOTIFICATION_ANS_Publish_TEST END')
  })
}