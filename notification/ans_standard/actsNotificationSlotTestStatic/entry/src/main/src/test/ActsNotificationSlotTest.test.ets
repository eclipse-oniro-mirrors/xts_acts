/**
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
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
let bundle: string = 'com.example.actsnotificationslot.static'
let count: int = 0;


export default function ActsNotificationSlotTest() {
  describe('SUB_NOTIFICATION_ANS_SLOT_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST START')

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots()
      await Utils.msSleep(500)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2000
     * @tc.desc   NotificationSlot of an unknown SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2000'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 START')

        notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_1 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2150
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2150
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2150'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 START')
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2300
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2300'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 START')
        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_3 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2450
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2450
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2450'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 START')
        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_4 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2600
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2600'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 START')
        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_5 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2750
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2750
     * @tc.desc   NotificationSlot of an unknown type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2750'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_6 Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_6 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_2900
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_2900
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2900'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 START')
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_7 Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_7 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3050
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3050
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3050'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_8 Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_8 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3150
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3150
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3150'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_9 Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_9 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3300
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3300'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_10 Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_10 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 END')
      })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3450
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3450
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3450'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 START')
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_1 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_1 AsyncCallback success: ${NotificationSlot}`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3600
     * @tc.desc   Get the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 START')
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION,
          (err: BusinessError | null, NotificationSlot): void => {
            if (err) {
              console.info(`${TAG} getSlot_2 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_2 AsyncCallback success: ${NotificationSlot}`)
              expect(NotificationSlot == null).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3750
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3750
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3750'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 START')
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_3 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_3 AsyncCallback success: ${NotificationSlot}`)
              expect(NotificationSlot == null).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3800
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 START')
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_4 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_4 AsyncCallback success: ${NotificationSlot}`)
              expect(NotificationSlot == null).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_3900
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_3900
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 START')
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_5 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_5 AsyncCallback success: ${NotificationSlot}`)
              expect(NotificationSlot == null).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4200
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4200'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 START')
        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot_8 Promise success: ${NotificationSlot}`)
            expect(NotificationSlot == null).assertTrue()
            done()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot_8 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4300
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 START')
        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot_9 Promise success: ${NotificationSlot}`)
            expect(NotificationSlot == null).assertTrue()
            done()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot_9 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4400
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4400'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 START')
        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot_10 Promise success: ${NotificationSlot}`)
            expect(NotificationSlot == null).assertTrue()
            done()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot_10 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1900
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1900
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1900'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 START')
        notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2000
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2000
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2000'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 START')
        notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2100
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2100
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2100'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 START')
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2200
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2200
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2200'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 START')
        notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2300
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2300
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2300'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 START')
        notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2400
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2400
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2400'
        count = 0;
        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} removeSlot_6 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot_6 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2400 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2500
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2500
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2500'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2500 START')
        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} removeSlot_7 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot_7 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2500 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2600
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2600
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2600'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 START')
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot_8 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot_8 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2700
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2700
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2700'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 START')
        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot_9 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot_9 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2800
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2800
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2800'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 START')
        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} removeSlot_10 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot_10 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4500
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4500'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_11 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_11 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
              count = 0;
              notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4600
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4600'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_12 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_12 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
              count = 0;
              notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4700
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4700'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_13 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_13 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
              count = 0;
              notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4800
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4800'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_14 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_14 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
              count = 0;
              notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
              done()
            }
          })


        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_4900
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_4900
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4900'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_15 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_15 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
              count = 0;
              notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
              done()
            }
          })


        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5000
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5000'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_16 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_16 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
            expect(NotificationSlot !== null).assertTrue()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        count = 0;

        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5100
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5100'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_17 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_17 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
            expect(NotificationSlot !== null).assertTrue()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        count = 0;
        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5200
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5200'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_18 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_18 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
            expect(NotificationSlot !== null).assertTrue()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        
        count = 0;

        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5300
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5300'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_19 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_19 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
            expect(NotificationSlot !== null).assertTrue()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        count = 0;
        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5400
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5400'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_20 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_20 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES)
          .then((NotificationSlot) => {
            console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
            expect(NotificationSlot !== null).assertTrue()
          })
          .catch((err: Error): void => {
            console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        count = 0;
        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} removeSlot OTHER_TYPES success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeSlot OTHER_TYPES err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5500
     * @tc.desc   Get the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5500'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_21 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err:Error):void => {
          console.info(`${TAG} addSlot_21 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_21 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_21 success: ${NotificationSlot}`)
            expect(NotificationSlot == null).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5600
     * @tc.desc   Remove the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5600'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_22 success`)
          count++;
          expect(count).assertEqual(1);
        }).catch((err: Error): void => {
          console.info(`${TAG} addSlot_22 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        count = 0;
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} getSlot_22 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_22 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_2900
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_2900
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 START')
        notificationManager.removeAllSlots((err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_3000
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_3000
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_3000'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 START')
        await notificationManager.removeAllSlots().then(() => {
          console.info(`${TAG} removeAllSlots Promise success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} removeAllSlots Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2400
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2400
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2400'
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 START')
        notificationManager.getSlots((err: BusinessError | null,
          NotificationSlot: Array<notificationManager.NotificationSlot>| undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success: ${NotificationSlot}`)
            if(NotificationSlot == undefined){
              expect(false).assertTrue()
              done()
            }else{
              expect(NotificationSlot.length == 0 ).assertTrue()
              done()
            }
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2500
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2500
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2500'
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 START')
        await notificationManager.getSlots().then((NotificationSlot: Array<notificationManager.NotificationSlot>) => {
          console.info(`${TAG} getSlots Promise success: ${NotificationSlot}`)
          expect(NotificationSlot !== null).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} getSlots Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5700
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5700'
        count = 0;
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 START')

        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot OTHER_TYPES success`)
            count++;
            expect(count).assertEqual(1);
          }
        })
        await Utils.msSleep(1000)

        notificationManager.getSlots((err: BusinessError | null,
          NotificationSlot: Array<notificationManager.NotificationSlot>|undefined): void => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success:`)
            if(NotificationSlot !== undefined){
              expect(NotificationSlot.length > 0).assertTrue()
              for (let i = 0; i < NotificationSlot.length; i++) {
                console.info(`${TAG} NotificationSlot[${i}].type:` + NotificationSlot[i].notificationType)
                let num = NotificationSlot[i].notificationType as notificationManager.SlotType
                if (num == 1) {
                  expect(num == 1).assertTrue()
                } else if (num == 2) {
                  expect(num == 2).assertTrue()
                } else if (num == 3) {
                  expect(num == 3).assertTrue()
                } else {
                  expect(num == 65535).assertTrue()
                }
              }
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_5800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_5800
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 START')
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)
        count = 0;

        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot OTHER_TYPES success`)
            count++;
            expect(count).assertEqual(1);
          }
        })

        await Utils.msSleep(1000)

        await notificationManager.getSlots().then((NotificationSlot: Array<notificationManager.NotificationSlot>) => {
          console.info(`${TAG} getSlots Promise success:`)
          expect(NotificationSlot.length > 0).assertTrue()
          for (let i = 0; i < NotificationSlot.length; i++) {
            console.info(`${TAG} NotificationSlot[${i}].type:` + NotificationSlot[i].notificationType)
            let num = NotificationSlot[i].notificationType as notificationManager.SlotType
            if (num == 1) {
              expect(num == 1).assertTrue()
            } else if (num == 2) {
              expect(num == 2).assertTrue()
            } else if (num == 3) {
              expect(num == 3).assertTrue()
            } else {
              expect(num == 65535).assertTrue()
            }
          }
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} getSlots Promise err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 END')
      })


    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900'
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 START')
      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_49 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot == null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_49 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 END')
    })



    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000
     * @tc.desc   NotificationSlot of an unknown type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      count = 0;
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_50 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_50 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 END')
    })



    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 START')
      await notificationManager.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots_51 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot !== null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots_51 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 END')
    })



    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      count = 0;
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 START')
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_52 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_52 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 END')
    })



    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      count = 0;
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 START')
      await notificationManager.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots_53 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots_53 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.number SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.desc   SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100'
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_0100 START`)
        expect(notificationManager.SlotType.UNKNOWN_TYPE as int).assertEqual(0)
        expect(notificationManager.SlotType.SOCIAL_COMMUNICATION as int).assertEqual(1)
        expect(notificationManager.SlotType.SERVICE_INFORMATION as int).assertEqual(2)
        expect(notificationManager.SlotType.CONTENT_INFORMATION as int).assertEqual(3)
        expect(notificationManager.SlotType.OTHER_TYPES as int).assertEqual(0xFFFF)
        expect(notificationManager.SlotLevel.LEVEL_NONE as int).assertEqual(0)
        expect(notificationManager.SlotLevel.LEVEL_MIN as int).assertEqual(1)
        expect(notificationManager.SlotLevel.LEVEL_LOW as int).assertEqual(2)
        expect(notificationManager.SlotLevel.LEVEL_DEFAULT as int).assertEqual(3)
        expect(notificationManager.SlotLevel.LEVEL_HIGH as int).assertEqual(4)
        done()
      })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST END')
  })
}
