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

import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
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

let testAbilityContext: common.UIAbilityContext
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle: string = 'com.example.systemAPI.static'

export default function ActsNotificationSystemAPITest() {
  describe('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST', () => {

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    let TAG = 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST START')

    let subscriber: notificationSubscribe.NotificationSubscriber = {
      onConsume: (data: notificationSubscribe.SubscribeCallbackData) => {
        let req = data.request;
        console.info(`${TAG} onConsume request id: ${req.id}`)
      }
    };

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4100
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4100
     * @tc.desc   test function publish takes userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4100'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_4100 START`);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_title",
              text: "test_text",
              additionalText: "test_Publish"
            } as notificationManager.NotificationBasicContent,
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
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4100 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, 0, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(err?.code).assertEqual(202);
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          });
        } catch (err: BusinessError) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_4100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4200
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4200
     * @tc.desc   test function publishAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4200'
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4200 START`);

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_title",
              text: "test_text",
              additionalText: "test_Publish"
            } as notificationManager.NotificationBasicContent,
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

        notificationManager.publishAsBundle(notificationRequest, "example.bundleName", 0, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} publishAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} publishAsBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4300
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4300
     * @tc.desc   test function publishAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4300'
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4300 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_title",
              text: "test_text",
              additionalText: "test_Publish"
            } as notificationManager.NotificationBasicContent,
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

        notificationManager.publishAsBundle(bundleOpt, notificationRequest).then(() => {
          console.info(`${TAG} publishAsBundle AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} publishAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err?.code).assertEqual(202);
          done()
        });

        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4300 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_Static_0150
     * @tc.number Sub_Notification_Ans_Publish_Cancel_Static_0150
     * @tc.desc   test function cancelAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Cancel_Static_0150'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_0150 START`);

        notificationManager.cancelAsBundle(1, "com.example.actsnotificationsystemapitest", 0,
          (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} cancelAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(err?.code).assertEqual(202);
              done()
            } else {
              console.info(`${TAG} cancelAsBundle AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_0150 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_Static_0160
     * @tc.number Sub_Notification_Ans_Publish_Cancel_Static_0160
     * @tc.desc   test function cancelAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Cancel_Static_0160'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_0160 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.cancelAsBundle(bundleOpt, 1).then(() => {
          console.info(`${TAG} cancelAsBundle AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} cancelAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err}`)
          expect(err?.code).assertEqual(202);
          done()
        });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_0160 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3550
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3550
     * @tc.desc   test function addSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3550'
        console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_3550 START`);

        let slot: notificationManager.NotificationSlot = {
          notificationType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          notificationLevel: notificationManager.SlotLevel.LEVEL_HIGH,
          desc: 'xts test',
          enabled: undefined,
          reminderMode: undefined,
          authorizedStatus: undefined
        }
        notificationManager.addSlot(slot, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202)
            done()
          } else {
            console.info(`${TAG} addSlot AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_3550 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_0700
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_0700
     * @tc.desc   test function setNotificationEnable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Static_0700'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_0700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.setNotificationEnable(bundleOpt, true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setNotificationEnable AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} setNotificationEnable AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_0700 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_Query_Static_0100
     * @tc.number Sub_Notification_Ans_Enable_Query_Static_0100
     * @tc.desc   test function isNotificationEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0100'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_0100 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "com.example.helloworld",
          uid: 0
        }
        notificationManager.isNotificationEnabled(bundleOpt, (err: BusinessError | null, data: boolean|undefined) => {
          if (err) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_Query_Static_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.number Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.desc   test function isNotificationEnabled no parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 START`);

        notificationManager.isNotificationEnabled((err: BusinessError | null, data: boolean|undefined): void => {
          if (err) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_Query_Static_0300
     * @tc.number Sub_Notification_Ans_Enable_Query_Static_0300
     * @tc.desc   test function isNotificationEnabled take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0300'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_0300 START`);
        let userId: int = 0;
        notificationManager.isNotificationEnabled(userId, (err: BusinessError | null, data: boolean|undefined) => {
          if (err) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_Query_Static_0300 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_Query_Static_0100
     * @tc.number Sub_Notification_Ans_Corner_Query_Static_0100
     * @tc.desc   test function displayBadge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Corner_Query_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Corner_Query_Static_0100'
        console.info(`Sub_Notification_Ans_Corner_Query_Static_0100 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.displayBadge(bundleOpt, true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} displayBadge AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} displayBadge AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Corner_Query_Static_0100 END`);
      })
    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3700
     * @tc.desc   test function isBadgeDisplayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Slot_CreateSlot_3700'
        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Static_3700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.isBadgeDisplayed(bundleOpt, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} isBadgeDisplayed AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} isBadgeDisplayed AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Static_3700 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3850
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3850
     * @tc.desc   test function setSlotByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3850'
        console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_3850 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let slot: notificationManager.NotificationSlot = {
          notificationType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          notificationLevel: notificationManager.SlotLevel.LEVEL_HIGH,
          desc: 'xts test',
          enabled: undefined,
          reminderMode: undefined,
          authorizedStatus: undefined
        }

        notificationManager.setSlotByBundle(bundleOpt, slot, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setSlotByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setSlotByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_3850 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_0900
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_0900
     * @tc.desc   test function getSlotsByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Slot_GetSlot_Static_0900'
        console.info(`Sub_Notification_Ans_Slot_GetSlot_Static_0900 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }

        notificationManager.getSlotsByBundle(bundleOpt, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlotsByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} getSlotsByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Slot_GetSlot_Static_0900 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1000
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1000
     * @tc.desc   test function getSlotNumByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1000'
        console.info(`${TAG} Sub_Notification_Ans_Slot_GetSlot_1000 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }

        notificationManager.getSlotNumByBundle(bundleOpt, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlotNumByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} getSlotNumByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Slot_GetSlot_Static_1000 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Search_Static_2000
     * @tc.number Sub_Notification_Ans_Distributed_Search_Static_2000
     * @tc.desc   test function getAllActiveNotifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Distributed_Search_Static_2000'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_2000 START`);
        notificationManager.getAllActiveNotifications((err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getAllActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} getAllActiveNotifications AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Distributed_Search_Static_2000 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100
     * @tc.desc   test function removeGroupByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.removeGroupByBundle(bundleOpt, "groupName", (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeGroupByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} removeGroupByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_SetTime_Static_0100
     * @tc.number Sub_Notification_Ans_NoDistrub_SetTime_Static_0100
     * @tc.desc   test function setDoNotDisturbDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_SetTime_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_SetTime_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Static_0100 START`);

        let date: notificationManager.DoNotDisturbDate = {
          type: notificationManager.DoNotDisturbType.TYPE_ONCE,
          begin: new Date(2023, 2, 24, 15, 53),
          end: new Date(2024, 2, 24, 15, 53)
        }
        notificationManager.setDoNotDisturbDate(date, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setDoNotDisturbDate AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Static_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_SetTime_Static_0200
     * @tc.number Sub_Notification_Ans_NoDistrub_SetTime_Static_0200
     * @tc.desc   test function setDoNotDisturbDate take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_SetTime_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_SetTime_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Static_0200 START`);

        let date: notificationManager.DoNotDisturbDate = {
          type: notificationManager.DoNotDisturbType.TYPE_ONCE,
          begin: new Date(2023, 2, 24, 15, 53),
          end: new Date(2024, 2, 24, 15, 53)
        }
        notificationManager.setDoNotDisturbDate(date, 0, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setDoNotDisturbDate AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Static_0200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_GetTime_Static_0100
     * @tc.number Sub_Notification_Ans_NoDistrub_GetTime_Static_0100
     * @tc.desc   test function getDoNotDisturbDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_GetTime_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_GetTime_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Static_0100 START`);

        notificationManager.getDoNotDisturbDate((err: BusinessError | null,
          data: notificationManager.DoNotDisturbDate|undefined) => {
          if (err) {
            console.info(`${TAG} getDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} getDoNotDisturbDate AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Static_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_GetTime_Static_0200
     * @tc.number Sub_Notification_Ans_NoDistrub_GetTime_Static_0200
     * @tc.desc   test function getDoNotDisturbDate take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_GetTime_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_GetTime_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Static_0200 START`);

        notificationManager.getDoNotDisturbDate(0,
          (err: BusinessError | null, data: notificationManager.DoNotDisturbDate|undefined) => {
            if (err) {
              console.info(`${TAG} getDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              if (err.code == 801) {
                expect(err?.code).assertEqual(801)
                done();
              } else {
                expect(err?.code).assertEqual(202);
                done()
              }
            } else {
              console.info(`${TAG} getDoNotDisturbDate AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Static_0200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_Query_Static_0100
     * @tc.number Sub_Notification_Ans_NoDistrub_Query_Static_0100
     * @tc.desc   test function isSupportDoNotDisturbMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_Query_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_Query_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_Query_0100 START`);

        notificationManager.isSupportDoNotDisturbMode((err: BusinessError | null, data: boolean|undefined) => {
          if (err) {
            console.info(`${TAG} isSupportDoNotDisturbMode AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} isSupportDoNotDisturbMode AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_Query_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Static_4300
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Static_4300
     * @tc.desc   test function setDistributedEnable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Distributed_Enable_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Distributed_Enable_Static_4300'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4300 START`);

        notificationManager.setDistributedEnable(true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setDistributedEnable AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setDistributedEnable AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4300 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Static_4400
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Static_4400
     * @tc.desc   test function setDistributedEnableByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Distributed_Enable_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Distributed_Enable_Static_4400'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4400 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.setDistributedEnableByBundle(bundleOpt, true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setDistributedEnableByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setDistributedEnableByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4400 END`);
      })
    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Static_4500
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Static_4500
     * @tc.desc   test function isDistributedEnabledByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Distributed_Enable_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Distributed_Enable_Static_4500'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4500 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.isDistributedEnabledByBundle(bundleOpt, (err: BusinessError | null, data: boolean|undefined) => {
          if (err) {
            console.info(`${TAG} isDistributedEnabledByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} isDistributedEnabledByBundle AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4500 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_9500
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_9500
     * @tc.desc   test function getDeviceRemindType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Enable_SetEnable_Static_9500'
        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_9500 START`);

        notificationManager.getDeviceRemindType((err: BusinessError | null,
          data: notificationManager.DeviceRemindType|undefined) => {
          if (err) {
            console.info(`${TAG} getDeviceRemindType AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} getDeviceRemindType AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_9500 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_9600
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_9600
     * @tc.desc   test function setNotificationEnableSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Static_9600'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9600 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.setNotificationEnableSlot(bundleOpt, type, true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setNotificationEnableSlot AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setNotificationEnableSlot AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9600 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_9700
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_9700
     * @tc.desc   test function isNotificationSlotEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Static_9700'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.isNotificationSlotEnabled(bundleOpt, type, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_Static_9700 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_0800
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_0800
     * @tc.desc   test function setSyncNotificationEnabledWithoutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Enable_SetEnable_Static_0800'
        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_0800 START`);

        notificationManager.setSyncNotificationEnabledWithoutApp(0, true, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} setSyncNotificationEnabledWithoutApp AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err?.code).assertEqual(801)
              done();
            } else {
              expect(err?.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setSyncNotificationEnabledWithoutApp AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_0800 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_9800
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_9800
     * @tc.desc   test function getSyncNotificationEnabledWithoutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Enable_SetEnable_Static_9800'
        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_9800 START`);

        notificationManager.getSyncNotificationEnabledWithoutApp(0, (err: BusinessError | null, data: boolean|undefined) => {
          if (err) {
            console.info(`${TAG} getSyncNotificationEnabledWithoutApp AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} getSyncNotificationEnabledWithoutApp AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_9800 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_0100
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_0100
     * @tc.desc   test function subscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0100'
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_Static_0100 START`);

        notificationSubscribe.subscribe(subscriber, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} subscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_Static_0100 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_0200
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_0200
     * @tc.desc   test function subscribe take NotificationSubscribeInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0200 START`);

        let subscribeInfo: notificationSubscribe.NotificationSubscribeInfo = {
          bundleNames: ["com.example.helloworld"],
          userId: 0
        }
        notificationSubscribe.subscribe(subscriber, subscribeInfo, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} subscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0200 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_0300
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_0300
     * @tc.desc   test function subscribe take NotificationSubscribeInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0300'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0300 START`);

        let subscribeInfo: notificationSubscribe.NotificationSubscribeInfo = {
          bundleNames: ["com.example.helloworld"],
          userId: 0
        }

        await notificationSubscribe.subscribe(subscriber, subscribeInfo).then(() => {
          console.info(`${TAG} subscribe AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err?.code).assertEqual(202);
          done()
        });

        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0300 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100
     * @tc.number Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100
     * @tc.desc   test function unsubscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100 START`);

        notificationSubscribe.unsubscribe(subscriber, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} unsubscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} unsubscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_0100 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200
     * @tc.desc   test function remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200'
        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200 START`);

        let bundleOpt: notificationSubscribe.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let key: notificationSubscribe.NotificationKey = {
          id: 0,
          label: 'test'
        }
        notificationSubscribe.remove(bundleOpt, key, notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} remove AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200 END`);
      })
    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300
     * @tc.desc   test function remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300'
        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300 START`);

        notificationSubscribe.remove("device_0_1", notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} remove AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0400
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0400
     * @tc.desc   test function removeAll take bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0400'
        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0400 START`);

        let bundleOpt: notificationSubscribe.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationSubscribe.removeAll(bundleOpt, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} removeAll AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0400 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0500
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0500
     * @tc.desc   test function removeAll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0500'
        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0500 START`);

        notificationSubscribe.removeAll((err: BusinessError | null) :void=> {
          if (err) {
            console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} removeAll AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0500 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0600
     * @tc.number Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0600
     * @tc.desc   test function removeAll take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0600'
        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0600 START`);

        notificationSubscribe.removeAll(0, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} removeAll AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Delete_SpecifiedGroup_0600 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0100
     * @tc.number Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0100
     * @tc.desc   test function getDoNotDisturbDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Promise_0100 START`);

        await notificationManager.getDoNotDisturbDate().then((data: notificationManager.DoNotDisturbDate) => {
          console.info("getDoNotDisturbDate success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Promise_0100 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0200
     * @tc.number Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0200
     * @tc.desc   test function getDoNotDisturbDate take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_GetTime_Promise_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Promise_0200 START`);

        // 用户ID，使用时需替换为真实的userId。
        let userId: int = 1;

        await notificationManager.getDoNotDisturbDate(userId).then((data: notificationManager.DoNotDisturbDate) => {
          console.info("getDoNotDisturbDate success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`getDoNotDisturbDate failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_GetTime_Promise_0200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Promise_Static_1000
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Promise_Static_1000
     * @tc.desc   test function getSlotNumByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Promise_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Promise_Static_1000'
        console.info(`${TAG} Sub_Notification_Ans_Slot_GetSlot_Promise_1000 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "com.example.actsemitterandcomeventtest",
          uid: 0
        }

        await notificationManager.getSlotNumByBundle(bundleOpt).then((data: long) => {
          console.info("getSlotNumByBundle success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`getSlotNumByBundle failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Slot_GetSlot_Promise_1000 END`);
      })
    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700
     * @tc.desc   test function isBadgeDisplayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700'
        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }

        await notificationManager.isBadgeDisplayed(bundleOpt).then((data: boolean) => {
          console.info(`${TAG} isBadgeDisplayed success, data: ` + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`${TAG} isBadgeDisplayed failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done()
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700
     * @tc.desc   test function isNotificationSlotEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        // isNotificationSlotEnabled
        notificationManager.isNotificationSlotEnabled(bundleOpt,
          notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data: boolean) => {
          console.info("isNotificationSlotEnabled success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`isNotificationSlotEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            console.info(`${TAG} isNotificationSlotEnabled_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            done();
          }
        });

        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Promise_Static_4300
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Promise_Static_4300
     * @tc.desc   test function setDistributedEnable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Distributed_Enable_Promise_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Distributed_Enable_Promise_Static_4300'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_Promise_4300 START`);
        let enable: boolean = true;
        notificationManager.setDistributedEnable(enable).then(() => {
          console.info(`${TAG}  setDistributedEnable success`);
          expect(false).assertTrue()
          done()
        }).catch((err: Error):void => {
          console.error(`${TAG} setDistributedEnable failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_Promise_4300 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Promise_Static_4400
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Promise_Static_4400
     * @tc.desc   test function setDistributedEnableByBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Distributed_Enable_Promise_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Distributed_Enable_Promise_Static_4400'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_Promise_4400 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }

        let enable: boolean = true;
        notificationManager.setDistributedEnableByBundle(bundleOpt, enable).then(() => {
          console.info(`${TAG}  setDistributedEnableByBundle success`);
          expect(false).assertTrue()
          done()
        }).catch((err: Error):void => {
          console.error(`${TAG} setDistributedEnableByBundle failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_Promise_4400 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_SetTime_Promise_Static_0200
     * @tc.number Sub_Notification_Ans_NoDistrub_SetTime_Promise_Static_0200
     * @tc.desc   test function setDoNotDisturbDate take userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_SetTime_Promise_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_SetTime_Promise_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Promise_0200 START`);

        let date: notificationManager.DoNotDisturbDate = {
          type: notificationManager.DoNotDisturbType.TYPE_ONCE,
          begin: new Date(2023, 2, 24, 15, 53),
          end: new Date(2024, 2, 24, 15, 53)
        }
        let userId: int = 1;
        notificationManager.setDoNotDisturbDate(date, userId).then(() => {
          console.info("setDoNotDisturbDate success");
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`setDoNotDisturbDate failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_SetTime_Promise_0200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600
     * @tc.desc   test function setNotificationEnableSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.setNotificationEnableSlot(
          bundleOpt,
          notificationManager.SlotType.SOCIAL_COMMUNICATION,
          true, true).then(() => {
          console.info(`${TAG} setNotificationEnableSlot success`);
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`${TAG} setNotificationEnableSlot failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        })
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_NoDistrub_Query_Promise_Static_0100
     * @tc.number Sub_Notification_Ans_NoDistrub_Query_Promise_Static_0100
     * @tc.desc   test function isSupportDoNotDisturbMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_NoDistrub_Query_Promise_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_NoDistrub_Query_Promise_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_Query_Promise_0100 START`);

        notificationManager.isSupportDoNotDisturbMode().then((data: boolean) => {
          console.info("isSupportDoNotDisturbMode success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.error(`isSupportDoNotDisturbMode failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err?.code).assertEqual(801)
            done();
          } else {
            expect(err?.code).assertEqual(202);
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_NoDistrub_Query_Promise_0100 END`);
      })
  })
}

