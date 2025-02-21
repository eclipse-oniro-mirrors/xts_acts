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

import notification from '@ohos.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import image from '@ohos.multimedia.image'
import wantAgent from '@ohos.wantAgent'

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

    
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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
          expect(true).assertTrue()
          done()
        }
      })

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 END`)
    })

    
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0200
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      notification.publish(notificationRequest).then(data => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch(err => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0500
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0600
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0700
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_0800
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_0800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_1100
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_1100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_1100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_PUBLISH_TEST_1200
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : Publishes a notification
     */
    it('SUB_NOTIFICATION_ANS_PUBLISH_TEST_1200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_0100 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_PUBLISH_TEST_1200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_0100
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0100 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_0200
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0100 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_TEST_0300
     * @tc.name      : function cancel(id: number, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified ID
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0300 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCELAll_TEST_0100
     * @tc.name      : function cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('SUB_NOTIFICATION_ANS_CANCELAll_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0100 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCELAll_TEST_0200
     * @tc.name      : function cancelAll(): Promise<void>
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('SUB_NOTIFICATION_ANS_CANCELAll_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0200 START`)
      await notification.cancelAll().then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCELAll_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0100
     * @tc.name      : function cancelGroup(groupName: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0100 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0200
     * @tc.name      : function cancelGroup(groupName: string): Promise<void>
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0200 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_CANCEL_GROUP_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0100
     * @tc.name      : function requestEnableNotification(callback: AsyncCallback<void>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0100 START`)
      await notification.requestEnableNotification((err) => {
        if (err.code) {
          console.info(`${TAG} requestEnableNotification AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} requestEnableNotification AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0200
     * @tc.name      : function requestEnableNotification(): Promise<void>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0200 START`)
      await notification.requestEnableNotification().then(() => {
        console.info(`${TAG} requestEnableNotification Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} requestEnableNotification Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_ENABLE_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_0100
     * @tc.name      : function getActiveNotificationCount(callback: AsyncCallback<number>): void
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0100', 0, async function (done) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_0200
     * @tc.name      : function getActiveNotificationCount(): Promise<number>
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0200', 0, async function (done) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_0300
     * @tc.name      : function getActiveNotifications(callback: AsyncCallback<Array<NotificationRequest>>): void
     * @tc.desc      : Obtains an array of active notifications
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_ACTIVE_COUNT_TEST_0300 START`)
      await notification.getActiveNotifications((err, data) => {
        if (err.code) {
          console.info(`${TAG} getActiveNotifications AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getActiveNotifications AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_COUNT_TEST_0400
     * @tc.name      : function getActiveNotifications(): Promise<Array<NotificationRequest>>
     * @tc.desc      : Obtains an array of active notifications
     */
    it('SUB_NOTIFICATION_ANS_COUNT_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0400 START`)
      await notification.getActiveNotifications().then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_COUNT_TEST_0400 END`)
    })


    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100
     * @tc.name      : function isSupportTemplate(templateName: string, callback: AsyncCallback<boolean>): void
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100 START`)
      let templateName = 'test_templateName'
      await notification.isSupportTemplate(templateName, (err, data) => {
        if (err.code) {
          console.info(`${TAG} isSupportTemplate AsyncCallback err :${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isSupportTemplate AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SUPPORT_TEST_0200
     * @tc.name      : function isSupportTemplate(templateName: string): Promise<boolean>
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_SUPPORT_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0200 START`)
      let templateName = 'test_templateName'
      await notification.isSupportTemplate(templateName).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SUPPORT_TEST_0200 END`)
    })

    console.info(TAG + 'SUB_NOTIFICATION_ANS_Publish_TEST END')
  })   
    
}
