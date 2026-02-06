/**
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import {BusinessError} from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x000
let bundle_name:string = "com.example.actsnotificationmanagerslot.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsNotificationManagerSlotTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST START')
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b" + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots()
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8200
     * @tc.desc   NotificationSlot of an unknown SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 START')
      let count: int = 0;
      try {
        notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8250
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8300
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 START')
      let count: int = 0;
      try {
        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8350
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8350
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8350', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 START')
      let count: int = 0;
      try {
        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8400
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8450
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8450
     * @tc.desc   NotificationSlot of an unknown type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8450', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_6 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8500
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_7 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8550
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8550
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8550', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_8 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8600
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_9 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8650
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8650
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8650', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_10 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1200
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1200
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_1 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1300
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1300
     * @tc.desc   Get the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_2 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1400
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1400
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_3 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1500
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1500
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1500 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1500 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_4 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1600
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1600
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_5 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 END')
    })



    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1700
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1700
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((data) => {
        console.info(`${TAG} getSlot_6 Promise `)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()

      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1800
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1800
     * @tc.desc   Get the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 START')
      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data) => {
        console.info(`${TAG} getSlot_7 Promise `)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_1900
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_1900
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1900',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 START')
      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((data) => {
        console.info(`${TAG} getSlot_8 Promise success`)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()

      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2000
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2000
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 START')
      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((data) => {
        console.info(`${TAG} getSlot_9 Promise `)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2100
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2100
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 START')
      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((data) => {
        console.info(`${TAG} getSlot_10 Promise ` )
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()

      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_0700
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_0700
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_0800
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_0800
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_0900
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_0900
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1000
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1000
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1100
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1100
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1200
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1200
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 START')
      let count: int = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_6 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot_6 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 END')
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1300
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1300
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 START')
      let count: int = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot_7 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot_7 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1400
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1400
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 START')
      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_8 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot_8 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1500
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1500
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 START')
      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_9 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot_9 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1600
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1600
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 START')
      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot_10 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot_10 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0200
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_11 success`)
        count++;
        expect(count).assertEqual(1);
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot UNKNOWN_TYPE `)
            count = 0;
            notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
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
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_11 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0350
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0350
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0350', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_12 success`)
        count++;
        expect(count).assertEqual(1);
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION ` )
            count = 0;
            notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
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
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_12 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })


      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0500
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_13 success`)
        count++;
        expect(count).assertEqual(1);
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SERVICE_INFORMATION ` )
            count = 0;
            notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
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
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_13 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0650
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0650
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0650', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 START')
      notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_14 success`)
        count++;
        expect(count).assertEqual(1);
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot CONTENT_INFORMATION ` )
            count = 0;
            notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
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
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_14 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0800
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_15 success`)
        count++;
        expect(count).assertEqual(1);
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot OTHER_TYPES ` )
            count = 0;
            notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot OTHER_TYPES success`)
                count++;
                expect(count).assertEqual(1);
                done()
              }
            })
            done()
          }
        })
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_15 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 END')
    })
    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0950
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0950
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0950', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_16 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_16 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((data) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE ` )
        expect(data !== null).assertTrue()
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      count = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1100
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_17 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_17 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION ` )
        expect(data !== null).assertTrue()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      count = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1250
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_18 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_18 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((data) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION ` )
        expect(data !== null).assertTrue()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      count = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 END')
    })
    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1400
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_19 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_19 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((data) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION ` )
        expect(data !== null).assertTrue()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      count = 0;
      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1550
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1550
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1550', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_20 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_20 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((data) => {
        console.info(`${TAG} getSlot OTHER_TYPES ` )
        expect(data !== null).assertTrue()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      count = 0;

      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot OTHER_TYPES success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1700
     * @tc.desc   Get the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_21 err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_21 ` )
            expect(data == null).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_1850
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_1850
     * @tc.desc   Remove the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1850', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_22 success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_22 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      count = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1700
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1700
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 START')
      try {
        notificationManager.removeAllSlots((err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_1800
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_1800
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 START')
      await notificationManager.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} removeAllSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2200
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2200
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 START')
      await Utils.msSleep(500);
      try {
        await notificationManager.removeAllSlots()
        notificationManager.getSlots((err: BusinessError | null, data: Array<notificationManager.NotificationSlot>|undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback ` )
            if(data == undefined){
              expect(false).assertTrue()
              done()
            }else{
              expect(data.length == 0).assertTrue()
              done()
            }
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_2300
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_2300
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 START')
      await Utils.msSleep(500);
      await notificationManager.removeAllSlots()
      notificationManager.getSlots().then((data: Array<notificationManager.NotificationSlot>) => {
        console.info(`${TAG} getSlots Promise ` )
        expect(data.length == 0).assertTrue()
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0100
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 START')

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })


      await Utils.msSleep(1000);

      try {
        notificationManager.getSlots((err: BusinessError | null, data: Array<notificationManager.NotificationSlot>|undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success:` )
            if(data !== undefined){
              expect(data.length > 0).assertTrue()
              for (let i = 0; i < data.length; i++) {
                console.info(`${TAG} NotificationSlot[${i}].type` + data[i].notificationType)
                let num = data[i].notificationType as notificationManager.SlotType
                if (num == 1) {
                  expect(num == 1 ).assertTrue()
                } else if (num  == 2) {
                  expect(num == 2 ).assertTrue()
                } else if (num == 3) {
                  expect(num == 3 ).assertTrue()
                } else {
                  expect(num == 65535 ).assertTrue()
                }
              }
              done()
            }else{
              expect(false).assertTrue()
              done()
            }

          }
        })
      } catch (err) {
        console.info(`${TAG} getSlots AsyncCallback errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_0250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_0250
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 START')
      let count: int = 0;

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);
      count = 0;

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        count++;
        expect(count).assertEqual(1);
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.getSlots().then((data: Array<notificationManager.NotificationSlot>) => {
        console.info(`${TAG} getSlots Promise success:` )
        expect(data.length > 0).assertTrue()
        for (let i = 0; i < data.length; i++) {
          console.info(`${TAG} NotificationSlot[${i}].type:` + data[i].notificationType)
          let num = data[i].notificationType as notificationManager.SlotType
          if (num == 1) {
            expect(num == 1 ).assertTrue()
          } else if (num == 2) {
            expect(num == 2 ).assertTrue()
          } else if (num == 3) {
            expect(num == 3 ).assertTrue()
          } else {
            expect(num == 65535 ).assertTrue()
          }
        }
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 END')
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.desc   SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8150', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8150 '
      console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_8150 START`)
      expect(notificationManager.SlotType.UNKNOWN_TYPE as number).assertEqual(0)
      expect(notificationManager.SlotType.SOCIAL_COMMUNICATION as number).assertEqual(1)
      expect(notificationManager.SlotType.SERVICE_INFORMATION as number).assertEqual(2)
      expect(notificationManager.SlotType.CONTENT_INFORMATION as number).assertEqual(3)
      expect(notificationManager.SlotType.OTHER_TYPES as number).assertEqual(0xFFFF)
      expect(notificationManager.SlotLevel.LEVEL_NONE as number).assertEqual(0)
      expect(notificationManager.SlotLevel.LEVEL_MIN as number).assertEqual(1)
      expect(notificationManager.SlotLevel.LEVEL_LOW as number).assertEqual(2)
      expect(notificationManager.SlotLevel.LEVEL_DEFAULT as number).assertEqual(3)
      expect(notificationManager.SlotLevel.LEVEL_HIGH as number).assertEqual(4)
      done()
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST END')
  })
}
