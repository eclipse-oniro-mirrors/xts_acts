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

import notificationManager from '@ohos.notificationManager'
import notification from '@ohos.notification'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import image from '@ohos.multimedia.image'
import wantAgent from '@ohos.app.ability.wantAgent'
import hilog from '@ohos.hilog';
const TEST_SUITE_NAME = 'testPublishInloveFail'

export default function ActsNotificationManagerPublishTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST START')

    class Utils {
      static info(str){
        hilog.info(0,'bms test',str)
      }
      static sleep(time){
        return new Promise((resolve,reject) => {
          setTimeout((data) => {
            resolve(data)
          },time)
        }).then(() => {
          console.info(`sleep ${time} over...`)
        })
      }
    }

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3200
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_3200', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3200 START`)
      let id = 1
      let label = "label"
      try {
        await notificationManager.cancel(id, label, (err) => {
          if (err) {
            console.info(`${TAG} cancel AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancel AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3200 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3250
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_3250', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3200 START`)
      let id = 1
      let label = "label"
      await notificationManager.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3200 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3300
     * @tc.name      : function cancel(id: number, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_3300', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3300 START`)
      let id = 1
      try {
        await notificationManager.cancel(id, (err) => {
          if (err) {
            console.info(`${TAG} cancel id err: ${err.code}, errMes: ${err.message}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel id success`)
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancel id errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0400
     * @tc.name      : function cancel(id: number, undefined): Promise<void>
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0400 START`)
      let id = 1
      await notificationManager.cancel(id, undefined).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0500
     * @tc.name      : function cancel(id: number, num: number): Promise<void>
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0500 START`)
      let id = 1
      let num = 2
      await notificationManager.cancel(id, num).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0600
     * @tc.name      : function cancel(id: number, label: string, undefined): Promise<void>
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0600 START`)
      let id = 1
      let label = "label"
      await notificationManager.cancel(id, label, undefined).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0600 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3350
     * @tc.name      : function cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('Sub_Notification_Ans_Publish_Cancel_3350', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3350 START`)
      try {
        await notificationManager.cancelAll((err) => {
          if (err) {
            console.info(`${TAG} cancelAll AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancelAll AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancelAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3350 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3400
     * @tc.name      : function cancelAll(): Promise<void>
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('Sub_Notification_Ans_Publish_Cancel_3400', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3400 START`)
      await notificationManager.cancelAll().then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0300
     * @tc.name      : function cancelAll(undefined): Promise<void>
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0300 START`)
      await notificationManager.cancelAll(undefined).then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3100
     * @tc.name      : function cancelGroup(groupName: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('Sub_Notification_Ans_Publish_Cancel_3100', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3100 START`)
      let groupName = "groupName"
      try {
        await notificationManager.cancelGroup(groupName, (err) => {
          if (err) {
            console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancelGroup AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_3150
     * @tc.name      : function cancelGroup(groupName: string): Promise<void>
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('Sub_Notification_Ans_Publish_Cancel_3150', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3150 START`)
      let groupName = "groupName"
      await notificationManager.cancelGroup(groupName).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_3150 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0300
     * @tc.name      : function cancelGroup(num: number): Promise<void>
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0300 START`)
      let num = 1
      await notificationManager.cancelGroup(num).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0400
     * @tc.name      : function cancelGroup(groupName: string, undefined): Promise<void>
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0400 START`)
      let groupName = "groupName"
      await notificationManager.cancelGroup(groupName, undefined).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0400 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Enable_Query_2500
     * @tc.name      : function requestEnableNotification(callback: AsyncCallback<void>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_Enable_Query_2500', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2500 START`)
      try {
        await notificationManager.requestEnableNotification((err) => {
          if (err) {
            console.info(`${TAG} requestEnableNotification AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} requestEnableNotification AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} requestEnableNotification AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2500 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Enable_Query_2600
     * @tc.name      : function requestEnableNotification(): Promise<void>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_Enable_Query_2600', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2600 START`)
      await notificationManager.requestEnableNotification().then(() => {
        console.info(`${TAG} requestEnableNotification Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Enable_Query_2600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0300
     * @tc.name      : function requestEnableNotification(undefined): Promise<void>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0300 START`)
      await notificationManager.requestEnableNotification(undefined).then(() => {
        console.info(`${TAG} requestEnableNotification Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_1300
     * @tc.name      : function getActiveNotificationCount(callback: AsyncCallback<number>): void
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_1300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0100 START`)
      try {
        await notificationManager.getActiveNotificationCount((err, data) => {
          if (err) {
            console.info(`${TAG} getActiveNotificationCount AsyncCallback err:${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getActiveNotificationCount AsyncCallback success ${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getActiveNotificationCount AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_1300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_1400
     * @tc.name      : function getActiveNotificationCount(): Promise<number>
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_1400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0200 START`)
      await notificationManager.getActiveNotificationCount().then((data) => {
        console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_1400 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_1500
     * @tc.name      : function getActiveNotifications(callback: AsyncCallback<Array<NotificationRequest>>): void
     * @tc.desc      : Obtains an array of active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_1500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0300 START`)
      try {
        await notificationManager.getActiveNotifications((err, data) => {
          if (err) {
            console.info(`${TAG} getActiveNotifications AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getActiveNotifications AsyncCallback success ${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_1500 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_1600
     * @tc.name      : function getActiveNotifications(): Promise<Array<NotificationRequest>>
     * @tc.desc      : Obtains an array of active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_1600', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_1600 START`)
      await notificationManager.getActiveNotifications().then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_1600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0500
     * @tc.name      : function getActiveNotificationCount(undefined): Promise<number>
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0500 START`)
      await notificationManager.getActiveNotificationCount(undefined).then((data) => {
        console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0600
     * @tc.name      : function getActiveNotifications(undefined): Promise<Array<NotificationRequest>>
     * @tc.desc      : Obtains an array of active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0600 START`)
      await notificationManager.getActiveNotifications(undefined).then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0600 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_template_0300
     * @tc.name      : function isSupportTemplate(templateName: string, callback: AsyncCallback<boolean>): void
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('Sub_Notification_Ans_Distributed_template_0300', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0300 START`)
      let templateName = 'test_templateName'
      try {
        await notificationManager.isSupportTemplate(templateName, (err, data) => {
          if (err) {
            console.info(`${TAG} isSupportTemplate AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isSupportTemplate AsyncCallback success:${JSON.stringify(data)} `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} isSupportTemplate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_template_0400
     * @tc.name      : function isSupportTemplate(templateName: string): Promise<boolean>
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('Sub_Notification_Ans_Distributed_template_0400', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0400 START`)
      let templateName = 'test_templateName'
      await notificationManager.isSupportTemplate(templateName).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_template_0400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0300
     * @tc.name      : function isSupportTemplate(num: number): Promise<boolean>
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0300 START`)
      let num = 1
      await notificationManager.isSupportTemplate(num).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0400
     * @tc.name      : function isSupportTemplate(templateName: string, undefined): Promise<boolean>
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0400 START`)
      let templateName = 'test_templateName'
      await notificationManager.isSupportTemplate(templateName, undefined).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0400 END`)
    })

    /*
      * @tc.number: Sub_Notification_Ans_Publish_Publish_0110
      * @tc.name: testPublishTitleForNull
      * @tc.desc: test publish fail
   */
    it('testPublishTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishTitleNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: '',
            text: 'test_text',
            additionalText: 'text_additionalText'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :%{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
      * @tc.number: Sub_Notification_Ans_Publish_Publish_0210
      * @tc.name: testPublishTextForNull
      * @tc.desc: test publish fail
   */
    it('testPublishTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'text',
            text: '',
            additionalText: 'text_additionalText'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
      * @tc.number: Sub_Notification_Ans_Publish_Publish_0310
      * @tc.name: testPublishadditionalTextForNull
      * @tc.desc: test publish success
   */
    it('testPublishadditionalTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishadditionalTextForNull';
      function requestEnableNotificationCallback(err) {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      };

      notificationManager.requestEnableNotification(requestEnableNotificationCallback);

      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'text_title',
            text: 'text_text',
            additionalText: ''
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
          expect(data).assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect().assertFail();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_0410
     * @tc.name: testPublishLongtextTitleForNull
     * @tc.desc: test publish fail
  */
    it('testPublishLongtextTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextTitleForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: '',
            text: 'test_text',
            additionalText: 'text_additionalText',
            longText: 'text_longText',
            briefText: 'text_briefText',
            expandedTitle: 'text_exoandTitle'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        await Utils.sleep(2500);
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_0510
     * @tc.name: testPublishLongtextTextForNull
     * @tc.desc: test publish fail
  */
    it('testPublishLongtextTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: 'text_title',
            text: '',
            additionalText: 'text_additionalText',
            longText: 'text_longText',
            briefText: 'text_briefText',
            expandedTitle: 'text_exoandTitle'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_0610
    * @tc.name: testPublishLongtextadditionalTextForNull
    * @tc.desc: test publish success
 */
    it("testPublishLongtextadditionalTextForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextadditionalTextForNull';

      function requestEnableNotificationCallback(err) {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      };

      notificationManager.requestEnableNotification(requestEnableNotificationCallback);
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: 'text_title',
            text: 'text_text',
            additionalText: '',
            longText: 'text_longText',
            briefText: 'text_briefText',
            expandedTitle: 'text_exoandTitle'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        await Utils.sleep(2500);
        notificationManager.publish(notificationRequest, (data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
          expect(data).assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_0710
     * @tc.name: testPublishLongtextLongTextForNull
     * @tc.desc: test publish fail
  */
    it(" testPublishLongtextLongTextForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextLongTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: 'title',
            text: 'test_text',
            additionalText: 'text_additionalText',
            longText: '',
            briefText: 'text_briefText',
            expandedTitle: 'text_expandedTitle'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_0810
     * @tc.name: testPublishLongtextBriefTextForNull
     * @tc.desc: test publish fail
  */
    it("testPublishLongtextBriefTextForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextBriefTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: 'title',
            text: 'test_text',
            additionalText: 'text_additionalText',
            longText: 'text_longText',
            briefText: '',
            expandedTitle: 'text_expandTitle'
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_0910
     * @tc.name: testPublishLongtextExpandedTitleForNull
     * @tc.desc: test publish fail
  */
    it("testPublishLongtextExpandedTitleForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextExpandedTitleForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: 'title',
            text: 'test_text',
            additionalText: 'text_additionalText',
            longText: 'text_longText',
            briefText: 'text_briefText',
            expandedTitle: ''
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1010
     * @tc.name: testPublishmultiLineTitleForNull
     * @tc.desc: test publish fail
  */
    it('testPublishmultiLineTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishmultiLineTitleForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: '',
            text: 'test_text',
            additionalText: 'text_additionalText',
            briefText: 'text_briefText',
            longTitle: 'text_longtitle',
            lines: ['text_lines'],
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1110
     * @tc.name: testPublishmultiLineTextForNull
     * @tc.desc: test publish fail
  */
    it(" testPublishmultiLineTextForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishmultiLineTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: 'text_title',
            text: '',
            additionalText: 'text_additionalText',
            briefText: 'text_briefText',
            longTitle: 'text_longtitle',
            lines: ['text_lines'],
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1210
     * @tc.name: testPublishmultiLineadditionalTextForNull
     * @tc.desc: test publish success
  */
    it(" testPublishmultiLineadditionalTextForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishLongtextTitleForNull';
      function requestEnableNotificationCallback(err) {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      };

      notificationManager.requestEnableNotification(requestEnableNotificationCallback);
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: 'text_title',
            text: 'text_text',
            additionalText: '',
            briefText: 'text_briefText',
            longTitle: 'text_longtitle',
            lines: ['text_lines'],
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        await Utils.sleep(2500);
        notificationManager.publish(notificationRequest, (data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
          expect(data).assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1310
     * @tc.name: testPublishmultiLinebriefTextForNull
     * @tc.desc: test publish fail
  */
    it('testPublishmultiLinebriefTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishmultiLinebriefTextForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: 'text_title',
            text: 'text_text',
            additionalText: 'text_additionalText',
            briefText: '',
            longTitle: 'text_longTitle',
            lines: ['text_lines'],
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1410
     * @tc.name: testPublishmultiLinelongTitleForNull
     * @tc.desc: test publish fail
  */
    it(" testPublishmultiLinelongTitleForNull", 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishmultiLinelongTitleForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: 'text_title',
            text: 'text_text',
            additionalText: 'text_additionalText',
            briefText: 'text_briefText',
            longTitle: '',
            lines: ['text_lines'],
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{publish}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{publish}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1510
     * @tc.name: testPublishmultiLineLinesForNull
     * @tc.desc: test publish fail
  */
    it('testPublishmultiLineLinesForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishmultiLineLinesForNull';
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: {
            title: 'text_title',
            text: 'text_text',
            additionalText: 'text_additionalText',
            briefText: 'text_briefText',
            longTitle: 'text_longTitle',
            lines: null,
          }
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1610
     * @tc.name: testPublishPictureTitleForNull
     * @tc.desc: test publish fail
  */
    it('testPublishPictureTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPictureTitleForNull';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: '',
                text: 'text_text',
                additionalText: 'text_additionalText',
                briefText: 'text_briefText',
                expandedTitle: 'text_expand',
                picture: pixelmap
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            notificationManager.publish(notificationRequest, (err) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_1710
     * @tc.name: testPublishPictureTextForNull
     * @tc.desc: test publish fail
  */
    it('testPublishPictureTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPictureTextForNull';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: 'text_title',
                text: '',
                additionalText: 'text_additionalText',
                briefText: 'text_briefText',
                expandedTitle: 'text_expand',
                picture: pixelmap
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            notificationManager.publish(notificationRequest, (err) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    });

    /*
       * @tc.number: Sub_Notification_Ans_Publish_Publish_1810
       * @tc.name: testPublishPictureadditionalTextForNull
       * @tc.desc: test publish success
    */
    it('testPublishPictureadditionalTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPictureadditionalTextForNull';
      function requestEnableNotificationCallback(err) {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      };
      notificationManager.requestEnableNotification(requestEnableNotificationCallback);

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: 'text_title',
                text: 'text_text',
                additionalText: '',
                briefText: 'text_briefText',
                expandedTitle: 'text_expand',
                picture: pixelmap
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            await Utils.sleep(2500);
            notificationManager.publish(notificationRequest, (data) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
              expect(data).assertEqual(null);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })

    /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_1910
    * @tc.name: testPublishPicturebriefTextForNull
    * @tc.desc: test publish fail
 */
    it('testPublishPicturebriefTextForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPicturebriefTextForNull';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: 'text_title',
                text: 'text_text',
                additionalText: 'text_additionalText',
                briefText: '',
                expandedTitle: 'text_expandedTitle',
                picture: pixelmap
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            notificationManager.publish(notificationRequest, (err) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })
    /*
  * @tc.number: Sub_Notification_Ans_Publish_Publish_2010
  * @tc.name: testPublishPictureExpandedTitleForNull
  * @tc.desc: test publish fail
*/
    it('testPublishPictureExpandedTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPictureExpandedTitleForNull';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: 'text_title',
                text: 'text_text',
                additionalText: 'text_additionalText',
                briefText: 'text_briefText',
                expandedTitle: '',
                picture: pixelmap
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            notificationManager.publish(notificationRequest, (err) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })


    /*
         * @tc.number: Sub_Notification_Ans_Publish_Publish_2110
         * @tc.name: testPublishPicturepictureForNull
         * @tc.desc: test publish fail
     */
    it('testPublishPictureExpandedTitleForNull', 0, async function (done) {
      const TEST_CASE_NAME = 'testPublishPicturepictureForNull';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
            id: 1,
            content: {
              contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: 'text_title',
                text: 'text_text',
                additionalText: 'text_additionalText',
                briefText: 'text_briefText',
                expandedTitle: 'text_expandTitle',
                picture: null
              }
            }
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          try {
            notificationManager.publish(notificationRequest, (err) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })



    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST END')
  })

}
