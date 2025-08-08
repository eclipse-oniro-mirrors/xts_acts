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
import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager'
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index"
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import image from '@ohos.multimedia.image';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Component, Driver, ON } from '@ohos.UiTest'
const TEST_SUITE_NAME:string = 'testPublishInloveFail'
const DOMAIN_NUMBER: number = 0xFF00;
let bundle_name:string = "com.example.actsnotificationpublish.static"


export default function ActsNotificationManagerPublishTest() {
  describe('ActsNotificationManagerPublishTest', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST ===>'
    hilog.info(DOMAIN_NUMBER, TAG, 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST START')
    let testAbilityContext:common.UIAbilityContext;


  /*
   * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3200
   * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3200
   * @tc.desc      : Cancels a notification with the specified label and ID
   */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3200'
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3200 START`)
        let id: number = 1
        let label: string = "label"
        try {
          notificationManager.cancel(id, label, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(DOMAIN_NUMBER, TAG,
                `Sub_Notification_Ans_Publish_Cancel_Static_3200 cancel AsyncCallback err: ${err.code}, errMes: ${err.message}`)
              expect(true).assertTrue()
              done()
            } else {
              hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3200 cancel AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          })
        } catch (err: BusinessError) {
          hilog.info(DOMAIN_NUMBER, TAG,
            `Sub_Notification_Ans_Publish_Cancel_Static_3200 cancel AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3200 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3250
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3250
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3250'
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3250 START`)
        let id: number = 1
        let label: string = "label"
        await notificationManager.cancel(id, label).then(() => {
          hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3250 cancel Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          hilog.info(DOMAIN_NUMBER, TAG,
            `Sub_Notification_Ans_Publish_Cancel_Static_3250 cancel Promise err: ${err.code}, errMes: ${err.message}`)
          expect(true).assertTrue()
          done()
        })
        hilog.info(DOMAIN_NUMBER, TAG, `Sub_Notification_Ans_Publish_Cancel_Static_3250 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3300
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3300
     * @tc.desc      : Cancels a notification with the specified ID
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3300'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3300 START`)
        let id: number = 1
        try {
          notificationManager.cancel(id, (err: BusinessError | null): void => {
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
        } catch (err: BusinessError) {
          console.info(`${TAG} cancel id errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3300 END`)
      })

    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400
    //      * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400
    //      * @tc.desc      : Cancels a notification with the specified label and ID
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400 START`)
    //   let id = 1
    //   notificationManager.cancel(id, undefined).then(() => {
    //     console.info(`${TAG} cancel Promise success`)
    //     expect(false).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(true).assertTrue()
    //     done()
    //   })
    //
    //   await Utils.msSleep(2000)
    //
    //   id = 400
    //   notificationManager.cancel(id).then(() => {
    //     console.info(`${TAG} cancel Promise success`)
    //     expect(false).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(true).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0400 END`)
    // })

    /*
    * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500
    * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500
    * @tc.desc      : Cancels a notification with the specified label and ID
    */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500'
        console.info(`SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500 START`)
        let id: number = 1
        let num: string = "2"
        await notificationManager.cancel(id, num).then(() => {
          console.info(`${TAG} cancel Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
          expect(true).assertTrue()
          done()
        })
        console.info(`SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_Static_0500 END`)
      })

     /*
         * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3350
         * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3350
         * @tc.desc      : Cancels all notifications of the current application
         */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3350'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3350 START`)
        try {
          notificationManager.cancelAll((err: BusinessError | null) => {
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
        } catch (err: BusinessError) {
          console.info(`${TAG} cancelAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3350 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Cancel_Static_3400
     * @tc.name      : Sub_Notification_Ans_Publish_Cancel_Static_3400
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Cancel_Static_3400'
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3400 START`)
        await notificationManager.cancelAll().then(() => {
          console.info(`${TAG} cancelAll Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} cancelAll Promise err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`Sub_Notification_Ans_Publish_Cancel_Static_3400 END`)
      })

    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300
    //      * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300
    //      * @tc.desc      : Cancels all notifications of the current application
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300 START`)
    //   notificationManager.cancelAll(undefined).then(() => {
    //     console.info(`${TAG} cancelAll Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} cancelAll Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_Static_0300 END`)
    // })

    
   
    /*
    * @tc.number    : Sub_Notification_Ans_Enable_Query_Static_2500
    * @tc.name      : Sub_Notification_Ans_Enable_Query_Static_2500
    * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
    */
    it('Sub_Notification_Ans_Enable_Query_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Enable_Query_Static_2500'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2500 START`)
        try {
          console.info(`Sub_Notification_Ans_Enable_Query_Static_2500 AA11`)
          notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
            console.info(`Sub_Notification_Ans_Enable_Query_Static_2500 AA`)
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
        } catch (err: BusinessError) {
          console.info(`${TAG} requestEnableNotification AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        await Utils.msSleep(2000)
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2500 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Enable_Query_Static_2600
     * @tc.name      : Sub_Notification_Ans_Enable_Query_Static_2600
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_Enable_Query_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Enable_Query_Static_2600'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2600 START`)
        await notificationManager.requestEnableNotification(testAbilityContext).then(() => {
          console.info(`${TAG} requestEnableNotification Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`Sub_Notification_Ans_Enable_Query_Static_2600 END`)
      })

   // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300
    //      * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300
    //      * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300 START`)
    //   notificationManager.requestEnableNotification(undefined).then(() => {
    //     console.info(`${TAG} requestEnableNotification Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_Static_0300 END`)
    // })


    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_1400
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_1400
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_1400'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_1400 START`)
        await notificationManager.getActiveNotificationCount().then((data: number) => {
          console.info(`${TAG} getActiveNotificationCount Promise success :${data}`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_1400 END`)
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_1500
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_1500
     * @tc.desc      : Obtains an array of active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_1500'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_1500 START`)
        try {
          notificationManager.getActiveNotifications((err: BusinessError | null,
            data: Array<notificationManager.NotificationRequest>|undefined): void => {
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
        } catch (err: BusinessError) {
          console.info(`${TAG} getActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_1500 END`)
      })


   /*
     * @tc.number    : Sub_Notification_Ans_Distributed_Search_Static_1600
     * @tc.name      : Sub_Notification_Ans_Distributed_Search_Static_1600
     * @tc.desc      : Obtains an array of active notifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Distributed_Search_Static_1600'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Search_Static_1600 START`)
        await notificationManager.getActiveNotifications()
          .then((data: Array<notificationManager.NotificationRequest>) => {
            console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          })
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_1600 END`)
      })

  
    // /*
    //      * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500
    //      * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500
    //      * @tc.desc      : Obtains the number of all active notifications
    //      */
    //     //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500 START`)
    //   notificationManager.getActiveNotificationCount(undefined).then((data:number) => {
    //     console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0500 END`)
    // })
    //
    // /*
    //  * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600
    //  * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600
    //  * @tc.desc      : Obtains an array of active notifications
    //  */
    //  //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600'
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600 START`)
    //   notificationManager.getActiveNotifications(undefined).then((data:number) => {
    //     console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError): void => {
    //     console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_Static_0600 END`)
    // })

   /*
      * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0110
      * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0110
      * @tc.desc: test publish fail
   */
    it('Sub_Notification_Ans_Publish_Publish_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0110'
        const TEST_CASE_NAME:string = 'testPublishTitleNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: "1",
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText'
            } as notificationManager.NotificationBasicContent
          } as notificationManager.NotificationContent,
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :%{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
        let notificationRequest1: notificationManager.NotificationRequest = {
          id: 401,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
            normal: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText'
            } as notificationManager.NotificationBasicContent
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: "1",
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest1, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :%{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_2 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


   /*
      * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0210
      * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0210
      * @tc.desc: test publish fail
   */
    it('Sub_Notification_Ans_Publish_Publish_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0210'
        const TEST_CASE_NAME:string = 'testPublishTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text',
              text: '',
              additionalText: 'text_additionalText'
            } as notificationManager.NotificationBasicContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

 /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0310
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0310
     * @tc.desc: test publish success
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Publish_Publish_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0310'
        const TEST_CASE_NAME:string = 'testPublishadditionalTextForNull';
        let requestEnableNotificationCallback = (err: BusinessError | null): void => {
          if (err) {
            console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("requestEnableNotification success");
          }
        };

        notificationManager.requestEnableNotification(testAbilityContext, requestEnableNotificationCallback);

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
              additionalText: ''
            } as notificationManager.NotificationBasicContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
                JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish success,result is : %{public}s');
              expect(true).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            }
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

     /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0410
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0410
     * @tc.desc: test publish fail
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0410'
        const TEST_CASE_NAME:string = 'testPublishLongtextTitleForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 111,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: 'text_exoandTitle'
            } as notificationManager.NotificationLongTextContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

     /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0510
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0510
     * @tc.desc: test publish fail
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0510'
        const TEST_CASE_NAME:string = 'testPublishLongtextTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: 'text_title',
              text: '',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: 'text_exoandTitle'
            } as notificationManager.NotificationLongTextContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


    /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0610
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0610
    * @tc.desc: test publish success
    */
    //问题单号：DTS2025060627133
    it("Sub_Notification_Ans_Publish_Publish_Static_0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0610'
        const TEST_CASE_NAME:string = 'testPublishLongtextadditionalTextForNull';

        let requestEnableNotificationCallback = (err: BusinessError | null) => {
          if (err) {
            console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("requestEnableNotification success");
          }
        };

        notificationManager.requestEnableNotification(testAbilityContext, requestEnableNotificationCallback);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: 'text_exoandTitle'
            } as notificationManager.NotificationLongTextContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
                JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish success,result is : %{public}s');
              expect(true).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            }
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

   /*
   * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0710
   * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0710
   * @tc.desc: test publish fail
   */
    it(" Sub_Notification_Ans_Publish_Publish_Static_0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0710'
        const TEST_CASE_NAME:string = 'testPublishLongtextLongTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: 'title',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: '',
              briefText: 'text_briefText',
              expandedTitle: 'text_expandedTitle'
            } as notificationManager.NotificationLongTextContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err : BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


     /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0810
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0810
     * @tc.desc: test publish fail
  */
    it("Sub_Notification_Ans_Publish_Publish_Static_0810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0810'
        const TEST_CASE_NAME:string = 'testPublishLongtextBriefTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: 'title',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: '',
              expandedTitle: 'text_expandTitle'
            } as notificationManager.NotificationLongTextContent
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
          appInstanceKey: undefined
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_0910
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_0910
     * @tc.desc: test publish fail
  */
    it("Sub_Notification_Ans_Publish_Publish_Static_0910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_0910'
        const TEST_CASE_NAME:string = 'testPublishLongtextExpandedTitleForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: 'title',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: ''
            } as notificationManager.NotificationLongTextContent
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
          appInstanceKey: undefined
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })
     /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1010
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1010
    * @tc.desc: test publish fail
    */
    it('Sub_Notification_Ans_Publish_Publish_Static_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1010'
        const TEST_CASE_NAME:string = 'testPublishmultiLineTitleForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              longTitle: 'text_longtitle',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is :',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })
    /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1110
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1110
    * @tc.desc: test publish fail
 */
    it(" Sub_Notification_Ans_Publish_Publish_Static_1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1110'
        const TEST_CASE_NAME:string = 'testPublishmultiLineTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: 'text_title',
              text: '',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              longTitle: 'text_longtitle',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

      /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1210
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1210
    * @tc.desc: test publish success
 */
    //问题单号：DTS2025060627133
    it(" Sub_Notification_Ans_Publish_Publish_Static_1210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1210'
        const TEST_CASE_NAME:string = 'testPublishLongtextTitleForNull';
        let requestEnableNotificationCallback = (err: BusinessError | null) => {
          if (err) {
            console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("requestEnableNotification success");
          }
        };

        notificationManager.requestEnableNotification(testAbilityContext, requestEnableNotificationCallback);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              briefText: 'text_briefText',
              longTitle: 'text_longtitle',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
                JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish success,result is : %{public}s');
              expect(true).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            }
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

     /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1310
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1310
    * @tc.desc: test publish fail
 */
    it('Sub_Notification_Ans_Publish_Publish_Static_1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1310'
        const TEST_CASE_NAME:string = 'testPublishmultiLinebriefTextForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: 'text_title',
              text: 'text_text',
              additionalText: 'text_additionalText',
              briefText: '',
              longTitle: 'text_longTitle',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


      /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1410
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1410
    * @tc.desc: test publish fail
 */
    it(" Sub_Notification_Ans_Publish_Publish_Static_1410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1410'
        const TEST_CASE_NAME:string = 'testPublishmultiLinelongTitleForNull';
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: 'text_title',
              text: 'text_text',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              longTitle: '',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{publish}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{publish}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

    //    /*
    //    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1510
    //    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1510
    //    * @tc.desc: test publish fail
    // */
    //    //问题单号：DTS2025060627133
    //    it('Sub_Notification_Ans_Publish_Publish_Static_1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //      async (done: () => void): Promise<void> => {
    //        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1510'
    //        const TEST_CASE_NAME:string = 'testPublishmultiLineLinesForNull';
    //        let notificationRequest: notificationManager.NotificationRequest = {
    //          id: 1,
    //          content: {
    //            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    //            multiLine: {
    //              title: 'text_title',
    //              text: 'text_text',
    //              additionalText: 'text_additionalText',
    //              briefText: 'text_briefText',
    //              longTitle: 'text_longTitle',
    //              lines: null,
    //            } as notificationManager.NotificationMultiLineContent
    //          } as notificationManager.NotificationContent,
    //          creatorBundleName: "creatorBundleName",
    //          creatorUid: 100,
    //          creatorPid: 101,
    //          creatorUserId: 100,
    //          hashCode: "hashCode",
    //          source: 0,
    //          deviceId: undefined,
    //          notificationFlags: undefined,
    //          agentBundle: undefined,
    //          appInstanceKey: undefined,
    //        }
    //        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
    //        try {
    //          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
    //            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
    //              JSON.stringify(err));
    //            expect().assertFail();
    //            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    //            done();
    //          })
    //        } catch (err: BusinessError) {
    //          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
    //            JSON.stringify(err));
    //          expect(err.code).assertEqual(401);
    //          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    //          done();
    //        }
    //      })

  /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1610
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1610
     * @tc.desc: test publish fail
  */
    it('Sub_Notification_Ans_Publish_Publish_Static_1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1610'
        const TEST_CASE_NAME:string = 'testPublishPictureTitleForNull';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} =====size: ====  ${imageInfo.size}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: '',
              text: 'text_text',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              expandedTitle: 'text_expand',
              picture: pixelMap
            } as notificationManager.NotificationPictureContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result_1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


   /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1710
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1710
     * @tc.desc: test publish fail
  */
    it('Sub_Notification_Ans_Publish_Publish_Static_1710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1710'
        const TEST_CASE_NAME:string = 'testPublishPictureTextForNull';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'text_title',
              text: '',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              expandedTitle: 'text_expand',
              picture: pixelMap
            } as notificationManager.NotificationPictureContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })
 /*
       * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1810
       * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1810
       * @tc.desc: test publish success
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Publish_Publish_Static_1810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1810'
        const TEST_CASE_NAME:string = 'testPublishPictureadditionalTextForNull';
        let requestEnableNotificationCallback = (err: BusinessError | null): void => {
          if (err) {
            console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("requestEnableNotification success");
          }
        };
        notificationManager.requestEnableNotification(testAbilityContext, requestEnableNotificationCallback);

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              briefText: 'text_briefText',
              expandedTitle: 'text_expand',
              picture: pixelMap
            } as notificationManager.NotificationPictureContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
                JSON.stringify(err));
              expect().assertFail();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish success,result is : %{public}s');
              expect(true).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            }
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

     /*
    * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_1910
    * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_1910
    * @tc.desc: test publish fail
 */
    it('Sub_Notification_Ans_Publish_Publish_Static_1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_1910'
        const TEST_CASE_NAME:string = 'testPublishPicturebriefTextForNull';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'text_title',
              text: 'text_text',
              additionalText: 'text_additionalText',
              briefText: '',
              expandedTitle: 'text_expandedTitle',
              picture: pixelMap
            } as notificationManager.NotificationPictureContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })


   /*
  * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_2010
  * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_2010
  * @tc.desc: test publish fail
*/
    it('Sub_Notification_Ans_Publish_Publish_Static_2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_2010'
        const TEST_CASE_NAME:string = 'testPublishPictureExpandedTitleForNull';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'text_title',
              text: 'text_text',
              additionalText: 'text_additionalText',
              briefText: 'text_briefText',
              expandedTitle: '',
              picture: pixelMap
            } as notificationManager.NotificationPictureContent
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

   // /*
    //      * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_2110
    //      * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_2110
    //      * @tc.desc: test publish fail
    //  */
    // //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Publish_Publish_Static_2110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //     const TEST_SUITE_NAME:string = 'Sub_Notification_Ans_Publish_Publish_Static_2110'
    //     const TEST_CASE_NAME:string = 'testPublishPicturepictureForNull';
    //
    //     const color = new ArrayBuffer(60000);
    //     let bufferArr = new Uint8Array(color);
    //     for (let i = 0; i < bufferArr.byteLength; i++) {
    //       bufferArr[i++] = 60;
    //       bufferArr[i++] = 20;
    //       bufferArr[i++] = 220;
    //       bufferArr[i] = 100;
    //     }
    //     let opts: image.InitializationOptions = {
    //       editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
    //         height: 100, width: 150
    //       }
    //     };
    //     let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    //     await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
    //       console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
    //     }).catch((err: BusinessError): void => {
    //       console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
    //       return;
    //     })
    //     let notificationRequest: notificationManager.NotificationRequest = {
    //       id: 1,
    //       content: {
    //         notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
    //         picture: {
    //           title: 'text_title',
    //           text: 'text_text',
    //           additionalText: 'text_additionalText',
    //           briefText: 'text_briefText',
    //           expandedTitle: 'text_expandTitle',
    //           picture: null
    //         } as notificationManager.NotificationPictureContent
    //       } as notificationManager.NotificationContent,
    //       creatorBundleName: "creatorBundleName",
    //       creatorUid: 100,
    //       creatorPid: 101,
    //       creatorUserId: 100,
    //       hashCode: "hashCode",
    //       source: 0,
    //       deviceId: undefined,
    //       notificationFlags: undefined,
    //       agentBundle: undefined,
    //       appInstanceKey: undefined,
    //     }
    //     hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
    //     try {
    //       notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
    //         hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
    //           JSON.stringify(err));
    //         expect().assertFail();
    //         hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    //         done();
    //       })
    //     } catch (err: BusinessError) {
    //       hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
    //         JSON.stringify(err));
    //       expect(err.code).assertEqual(401);
    //       hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    //       done();
    //     }
    // })

    hilog.info(DOMAIN_NUMBER, TAG, 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST END')
  })

}