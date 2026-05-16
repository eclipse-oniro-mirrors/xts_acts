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

import notification from '@ohos.notification'
import { UiDriver, BY,ON } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import image from '@ohos.multimedia.image'
import wantAgent from '@ohos.wantAgent'
import notificationManager from '@ohos.notificationManager'

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function ActsNotificationPublishTest() {
  describe('SUB_NOTIFICATION_ANS_Publish_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_Publish_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_Publish_TEST START')

    let wantAgentData = {}

    let picture_opts = {
      size: {
        height: 25,
        width: 2
      },
      pixelFormat: 4,
      editable: true,
      alphaType: 0,
      scaleMode: 1
    }

    let picture_buffer = new ArrayBuffer(picture_opts.size.height * picture_opts.size.width * 4)
    let notification_picture = undefined

    image.createPixelMap(picture_buffer, picture_opts, (err, pixelMap) => {
      if (err) {
        console.info(`${TAG} createPixelMap err: ${err}`)
        expect(false).assertTrue()
      } else {
        if (notification_picture == undefined) {
          console.info(`${TAG} createPixelMap err: ${err}`)
          return
        }
      }
    })

    // wantAgent
    let WantAgentInfo = {
      wants: [
        {
          deviceId: "deviceId",
          bundleName: "com.example.actsnotificationpublish",
          abilityName: "com.example.actsnotificationpublish.MainAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
          parameters:
          {
            mykey0: 2222,
            mykey1: [1, 2, 3],
            mykey2: "[1, 2, 3]",
            mykey3: "ssssssssssssssssssssssssss",
            mykey4: [false, true, false],
            mykey5: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
            mykey6: true,
          }
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITIES,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    }

    wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
      if (err.code) {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
      } else {
        console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
        wantAgentData = data
      }
    })

    afterEach(async function (done) {
      console.info(`${TAG} afterEach START`)
      await notification.cancelAll((err) => {
        if (err.code) {
          console.info(`${TAG} cancelAll notification err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancelAll notification success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_Query_2700
     * @tc.number Sub_Notification_Ans_Enable_Query_2700
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Enable_Query_2700', Level.LEVEL2, async function (done) {
      notificationManager.requestEnableNotification(async (err) => {
        if (err) {
          console.info(`Sub_Notification_Ans_Enable_Query_2700 ===>requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        } else {
          console.info("Sub_Notification_Ans_Enable_Query_2700 ===>requestEnableNotification success");
          expect(true).assertTrue()
          await sleep(1000);
          console.info("Sub_Notification_Ans_Enable_Query_2700 ===>requestEnableNotification success 1s");
          done()
        }
      });

      await sleep(1000);
      let driver = await UiDriver.create();
      console.info(`Sub_Notification_Ans_Enable_Query_2700 ===>====>come in driveFn`);
      await sleep(1000);
      console.info(`Sub_Notification_Ans_Enable_Query_2700 ===>====>driver is ${JSON.stringify(driver)}`);
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`Sub_Notification_Ans_Enable_Query_2700 ===>====>button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        console.info(`Sub_Notification_Ans_Enable_Query_2700 ===>====>button is click`);
        await sleep(1000);
      } else {
        console.info('Sub_Notification_Ans_Enable_Query_2700 ===>====>button is null button');
        await sleep(1000);
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_Query_2800
     * @tc.number Sub_Notification_Ans_Enable_Query_2800
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Enable_Query_2800', Level.LEVEL2, async function (done) {

      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2800 START`)
      await sleep(2000);
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2800 2s`)
      await notification.requestEnableNotification().then(() => {
        console.info(`${TAG} requestEnableNotification Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} requestEnableNotification Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2800 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300
     * @tc.number SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300 START`)
      await notificationManager.requestEnableNotification(undefined).then(() => {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300 requestEnableNotification Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300 requestEnableNotification Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0300 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8300
     * @tc.number Sub_Notification_Ans_Publish_Publish_8300
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8300 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
        },
        slotType: notification.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest, (err, data) => {
        if (err.code) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
          notification.getActiveNotifications((err, data) => {
            if (err.code) {
              console.info(`${TAG} getActiveNotifications AsyncCallback err: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getActiveNotifications AsyncCallback success ${JSON.stringify(data)}`)
              expect(data.length > 0).assertTrue()
              done()
            }
          })
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8300 END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8350
     * @tc.number Sub_Notification_Ans_Publish_Publish_8350
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8350', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8350 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
        },
        slotType: notification.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest).then(async (data) => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        await notification.getActiveNotifications().then((data) => {
          console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
          expect(data.length > 0).assertTrue()
          done()
        }).catch((err) => {
          console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8350 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8400
     * @tc.number Sub_Notification_Ans_Publish_Publish_8400
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8400 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
          longText: {
            title: 'testLongTextTitle',
            text: 'testLongTextText',
            additionalText: 'testLongTextAdditionalText',
            longText: 'testLongTextLongText',
            briefText: 'testLongTextBriefText',
            expandedTitle: 'testLongTextExpandedTitle'
          },
        },
        slotType: notification.SlotType.CONTENT_INFORMATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest, (err, data) => {
        if (err.code) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success: ${data}`)

          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8400 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8450
     * @tc.number Sub_Notification_Ans_Publish_Publish_8450
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8450', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8450 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
          longText: {
            title: 'testLongTextTitle',
            text: 'testLongTextText',
            additionalText: 'testLongTextAdditionalText',
            longText: 'testLongTextLongText',
            briefText: 'testLongTextBriefText',
            expandedTitle: 'testLongTextExpandedTitle'
          },
        },
        slotType: notification.SlotType.CONTENT_INFORMATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest).then(data => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8450 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8500
     * @tc.number Sub_Notification_Ans_Publish_Publish_8500
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8500 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
          multiLine: {
            title: 'testMultiLineTitle',
            text: 'testMultiLineText',
            additionalText: 'testMultiLineAdditionalText',
            longTitle: 'testMultiLineLongText',
            briefText: 'testMultiLineBriefText',
            lines: ['firstLine', 'secondLine', 'thirdLine']
          },
        },
        slotType: notification.SlotType.OTHER_TYPES,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest, (err, data) => {
        if (err.code) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8500 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8550
     * @tc.number Sub_Notification_Ans_Publish_Publish_8550
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8550', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8550 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
          multiLine: {
            title: 'testMultiLineTitle',
            text: 'testMultiLineText',
            additionalText: 'testMultiLineAdditionalText',
            longTitle: 'testMultiLineLongText',
            briefText: 'testMultiLineBriefText',
            lines: ['firstLine', 'secondLine', 'thirdLine']
          },
        },
        slotType: notification.SlotType.OTHER_TYPES,
        isOngoing: false,
        isUnremovable: false,
        deliveryTime: 0,
        tapDismissed: false,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest).then(data => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8550 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_8600
     * @tc.number Sub_Notification_Ans_Publish_Publish_8600
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_8600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8600 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
        },
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
            extras: {
              'testActionButtonKey': 'testActionButtonValue',
            },
            userInput: {
              inputKey: 'testInputKey'
            }
          }
        ],
      }

      notification.publish(notificationRequest, (err, data) => {
        if (err.code) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_8600 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_0150
     * @tc.number Sub_Notification_Ans_Publish_Publish_0150
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Publish_0150', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_0150 START`)
      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
        },
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
            extras: {
              'testActionButtonKey': 'testActionButtonValue',
            },
            userInput: {
              inputKey: 'testInputKey'
            }
          }
        ],
      }

      notification.publish(notificationRequest).then(data => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_0150 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_PUBLISH_TEST_01300
     * @tc.number SUB_NOTIFICATION_ANS_PUBLISH_TEST_01300
     * @tc.desc   Publishes a notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_01300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_01300 START`)

      let label = "label"

      let notificationRequest = {
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          id: 1,
          normal: {
            title: 'testTitle',
            text: 'testText',
            additionalText: 'testAdditionalText'
          },
        },
        slotType: notification.SlotType.SOCIAL_COMMUNICATION,
        isOngoing: true,
        isUnremovable: true,
        deliveryTime: 0,
        tapDismissed: true,
        autoDeletedTime: 500,
        wantAgent: wantAgentData,
        extraInfo: {
          'testKey': 'testValue'
        },
      }

      notification.publish(notificationRequest, label).then(data => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_01300 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_2850
     * @tc.number Sub_Notification_Ans_Publish_Cancel_2850
     * @tc.desc   Cancels a notification with the specified label and ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_2850', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2850 START`)
      let id = 1
      let label = "label"
      await notification.cancel(id, label, (err) => {
        if (err.code) {
          console.info(`${TAG} cancel AsyncCallback err: ${err.code}`)
          expect(true).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancel AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2850 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_2900
     * @tc.number Sub_Notification_Ans_Publish_Cancel_2900
     * @tc.desc   Cancels a notification with the specified label and ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_2900', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2850 START`)
      let id = 1
      let label = "label"
      await notification.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })

      await notification.cancel(id).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2850 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_2950
     * @tc.number Sub_Notification_Ans_Publish_Cancel_2950
     * @tc.desc   Cancels a notification with the specified ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_2950', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2950 START`)
      let id = 1
      await notification.cancel(id, (err) => {
        if (err.code) {
          console.info(`${TAG} cancel id err: ${err.code}`)
          expect(true).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancel id success`)
          expect(false).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2950 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_TEST_0400
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_TEST_0400
     * @tc.desc   Cancels a notification with the specified label and ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0400 START`)
      let id = 1
      let label = "label"
      let str = "str"
      await notification.cancel(id, label, str).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0400 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_TEST_0500
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_TEST_0500
     * @tc.desc   Cancels a notification with the specified label and ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0500 START`)
      let id = 1
      let label = 2
      await notification.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0500 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_TEST_0600
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_TEST_0600
     * @tc.desc   Cancels a notification with the specified label and ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0600 START`)
      let id = 1
      let label = 2
      await notification.cancel(id, label, (err) => {
        if (err.code) {
          console.info(`${TAG} cancel AsyncCallback err: ${err.code}`)
          expect(true).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancel AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0600 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_TEST_0700
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_TEST_0700
     * @tc.desc   Cancels a notification with the ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0700 START`)
      let id = 1
      await notification.cancel(id, undefined).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_3000
     * @tc.number Sub_Notification_Ans_Publish_Cancel_3000
     * @tc.desc   Cancels all notifications of the current application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_3000', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3000 START`)
      await notification.cancelAll((err) => {
        if (err.code) {
          console.info(`${TAG} cancelAll AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancelAll AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3000 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_3050
     * @tc.number Sub_Notification_Ans_Publish_Cancel_3050
     * @tc.desc   Cancels all notifications of the current application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_3050', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3050 START`)
      await notification.cancelAll().then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3050 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCELAll_TEST_0300
     * @tc.number SUB_NOTIFICATION_ANS_CANCELAll_TEST_0300
     * @tc.desc   Cancels all notifications of the current application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCELAll_TEST_0300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0300 START`)
      await notification.cancelAll(undefined).then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0300 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_2650
     * @tc.number Sub_Notification_Ans_Publish_Cancel_2650
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_2650', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2650 START`)
      let groupName = "groupName"
      await notification.cancelGroup(groupName, (err) => {
        if (err.code) {
          console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} cancelGroup AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2650 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_2750
     * @tc.number Sub_Notification_Ans_Publish_Cancel_2750
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_2750', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2750 START`)
      let groupName = "groupName"
      await notification.cancelGroup(groupName).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_2750 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0300
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0300
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0300 START`)
      await notification.cancelGroup(2).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0300 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0400
     * @tc.number SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0400
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0400 START`)
      let groupName = "groupName"
      await notification.cancelGroup(groupName, undefined).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0400 END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Search_0600
     * @tc.number Sub_Notification_Ans_Distributed_Search_0600
     * @tc.desc   Obtains the number of all active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Search_0600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_ACTIVE_COUNT_TEST_0100 START`)
      await notification.getActiveNotificationCount((err, data) => {
        if (err.code) {
          console.info(`${TAG} getActiveNotificationCount AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getActiveNotificationCount AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_0600 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Search_0700
     * @tc.number Sub_Notification_Ans_Distributed_Search_0700
     * @tc.desc   Obtains the number of all active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Search_0700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_ACTIVE_COUNT_TEST_0200 START`)
      await notification.getActiveNotificationCount().then((data) => {
        console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_0700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Search_0800
     * @tc.number Sub_Notification_Ans_Distributed_Search_0800
     * @tc.desc   Obtains an array of active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Search_0800', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_ACTIVE_COUNT_TEST_0300 START`)
      await notification.getActiveNotifications((err, data) => {
        if (err.code) {
          console.info(`${TAG} getActiveNotifications AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getActiveNotifications AsyncCallback success`)
          expect(data.length == 0).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_0800 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Search_0900
     * @tc.number Sub_Notification_Ans_Distributed_Search_0900
     * @tc.desc   Obtains an array of active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Search_0900', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_0900 START`)
      await notification.getActiveNotifications().then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(data.length == 0).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_0900 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_COUNT_TEST_0500
     * @tc.number SUB_NOTIFICATION_ANS_COUNT_TEST_0500
     * @tc.desc   Obtains the number of all active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0500 START`)
      await notification.getActiveNotificationCount(undefined).then((data) => {
        console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0500 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_COUNT_TEST_0600
     * @tc.number SUB_NOTIFICATION_ANS_COUNT_TEST_0600
     * @tc.desc   Obtains an array of active notifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0600 START`)
      await notification.getActiveNotifications(undefined).then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0600 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100
     * @tc.number SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100
     * @tc.desc   Obtains whether the template is supported by the system
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100 START`)
      let templateName = 'test_templateName'
      notification.isSupportTemplate(templateName, (err, data) => {
        if (err.code) {
          console.info(`${TAG} isSupportTemplate AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isSupportTemplate AsyncCallback success`)
          expect(data).assertFalse()
          done()
        }
      })

      await sleep(500);

      let templateName1 = 'downloadTemplate'
      notification.isSupportTemplate(templateName1, (err, data) => {
        if (err.code) {
          console.info(`${TAG} isSupportTemplate AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isSupportTemplate AsyncCallback success`)
          expect(data).assertTrue()
          done()
        }
      })

      await sleep(500);
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_template_0600
     * @tc.number Sub_Notification_Ans_Distributed_template_0600
     * @tc.desc   Obtains whether the template is supported by the system
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_template_0600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0600 START`)
      let templateName = 'test_templateName'
      await notification.isSupportTemplate(templateName).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(data).assertFalse()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      let templateName1 = 'downloadTemplate'
      await notification.isSupportTemplate(templateName1).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(data).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0600 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SUPPORT_TEST_0300
     * @tc.number SUB_NOTIFICATION_ANS_SUPPORT_TEST_0300
     * @tc.desc   Obtains whether the template is supported by the system
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SUPPORT_TEST_0300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0300 START`)
      let templateName = 2
      await notification.isSupportTemplate(templateName).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0300 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SUPPORT_TEST_0400
     * @tc.number SUB_NOTIFICATION_ANS_SUPPORT_TEST_0400
     * @tc.desc   Obtains whether the template is supported by the system
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SUPPORT_TEST_0400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0400 START`)
      let templateName = 'test_templateName'
      await notification.isSupportTemplate(templateName, undefined).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0400 END`)
    })



    console.info(TAG + 'SUB_NOTIFICATION_ANS_Publish_TEST END')
  })
}
