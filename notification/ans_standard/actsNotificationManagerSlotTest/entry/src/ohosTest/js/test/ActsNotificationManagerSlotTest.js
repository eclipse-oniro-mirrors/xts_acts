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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsNotificationManagerSlotTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST START')

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    }

    afterEach(async function (done) {
      console.info(`${TAG} afterEach START`)
      try {
        await notificationManager.removeAllSlots((err) => {
          if (err) {
            console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots success`)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8200
     * @tc.desc   NotificationSlot of an unknown SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8200', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8200 START')
      let count = 0
      try {
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8250
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8250', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8250 START')
      let count = 0
      try {
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8250 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8300
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8300', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8300 START')
      let count = 0
      try {
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8350
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8350
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8350', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8350 START')
      let count = 0
      try {
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8350 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8400
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8400', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8400 START')
      let count = 0
      try {
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8450
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8450
     * @tc.desc   NotificationSlot of an unknown type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8450', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8450 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_6 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8450 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8500
     * @tc.desc   NotificationSlot for social communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8500', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8500 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_7 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8550
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8550
     * @tc.desc   NotificationSlot for service information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8550', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8550 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_8 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8550 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8600
     * @tc.desc   NotificationSlot for content information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8600', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8600 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_9 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8600 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8650
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8650
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8650', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8650 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_10 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8650 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1200
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1200
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1200', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1200 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_1 AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1300
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1300
     * @tc.desc   Get the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1300', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1300 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_2 AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1400
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1400
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1400', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1400 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_3 AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1500
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1500
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1500', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1500 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_4 AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1600
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1600
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1600', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1600 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_5 AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1600 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1700
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1700
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1700', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1700 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_6 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1800
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1800
     * @tc.desc   Get the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1800', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1800 START')
      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_7 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_1900
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_1900
     * @tc.desc   Get the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1900', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1900 START')
      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_8 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1900 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_2000
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_2000
     * @tc.desc   Get the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2000', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2000 START')
      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_9 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_2100
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_2100
     * @tc.desc   Get the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2100', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2100 START')
      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_10 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_0700
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_0700
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0700', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0700 START')
      let count = 0
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_0800
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_0800
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0800', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0800 START')
      let count = 0
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_0900
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_0900
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0900', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0900 START')
      let count = 0
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0900 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1000
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1000
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1000', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1000 START')
      let count = 0
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1100
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1100
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1100', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1100 START')
      let count = 0
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1200
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1200
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1200', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1200 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_6 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_6 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1300
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1300
     * @tc.desc   Remove the SOCIAL_COMMUNICATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1300', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1300 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot_7 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_7 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1400
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1400
     * @tc.desc   Remove the SERVICE_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1400', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1400 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_8 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_8 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1500
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1500
     * @tc.desc   Remove the CONTENT_INFORMATION type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1500', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1500 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_9 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_9 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1600
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1600
     * @tc.desc   Remove the OTHER_TYPES type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1600', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1600 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot_10 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_10 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1600 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0200
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0200', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0200 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_11 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_11 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
            expect(NotificationSlot != null).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
              count = 0
              if (err) {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0350
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0350
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0350', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0350 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_12 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_12 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
            expect(NotificationSlot != null).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
              count = 0
              if (err) {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0350 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0500
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0500', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0500 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_13 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_13 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
            expect(NotificationSlot != null).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
              count = 0
              if (err) {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0500 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0650
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0650
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0650', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0650 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_14 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_14 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
            expect(NotificationSlot != null).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
              count = 0
              if (err) {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0650 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0800
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0800', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0800 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_15 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_15 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
            expect(NotificationSlot != null).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
              count = 0
              if (err) {
                console.info(`${TAG} removeSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot OTHER_TYPES success`)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0950
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0950
     * @tc.desc   Get Remove the UNKNOWN_TYPE type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0950', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0950 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_16 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_16 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
        expect(NotificationSlot != null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
        count++
        expect(count).assertEqual(2)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0950 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1100
     * @tc.desc   Get Remove the SOCIAL_COMMUNICATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1100', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1100 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_17 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_17 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
        expect(NotificationSlot != null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
        count++
        expect(count).assertEqual(2)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1250
     * @tc.desc   Get Remove the SERVICE_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1250', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1250 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_18 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_18 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
        expect(NotificationSlot != null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
        count++
        expect(count).assertEqual(2)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1250 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1400
     * @tc.desc   Get Remove the CONTENT_INFORMATION type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1400', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1400 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_19 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_19 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
        expect(NotificationSlot != null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
        count++
        expect(count).assertEqual(2)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1400 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1550
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1550
     * @tc.desc   Get Remove the OTHER_TYPES type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1550', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1550 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_20 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_20 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
        expect(NotificationSlot != null).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot OTHER_TYPES success`)
        count++
        expect(count).assertEqual(2)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1550 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1700
     * @tc.desc   Get the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1700', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1700 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_21 err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_21 success: ${NotificationSlot}`)
            expect(NotificationSlot == null).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_1850
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_1850
     * @tc.desc   Remove the Different type slot after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1850', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1850 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_22 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot_22 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          count = 0
          if (err) {
            console.info(`${TAG} removeSlot err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot success`)
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeSlot errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1850 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1700
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1700
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1700', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1700 START')
      let count = 0
      try {
        await notificationManager.removeAllSlots((err) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            count++
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1700 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_1800
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_1800
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1800', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1800 START')
      let count = 0
      await notificationManager.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1800 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_2200
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_2200
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2200', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2200 START')
      await sleep(500)
      try {
        await notificationManager.removeAllSlots()
        notificationManager.getSlots((err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success: ${NotificationSlot}`)
            expect(NotificationSlot.length == 0).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_2300
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_2300
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2300', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2300 START')
      await sleep(500)
      await notificationManager.removeAllSlots()
      await notificationManager.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots Promise success: ${NotificationSlot}`)
        expect(NotificationSlot.length == 0).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0100
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0100', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0100 START')
      await sleep(500)
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        count++
        expect(count).assertEqual(2)
      }).catch((err) => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        count++
        expect(count).assertEqual(3)
      }).catch((err) => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        count++
        expect(count).assertEqual(4)
      }).catch((err) => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      try {
        await notificationManager.getSlots((err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success:` + JSON.stringify(NotificationSlot))
            expect(NotificationSlot.length > 0).assertTrue()
            for (let i = 0; i < NotificationSlot.length; i++) {
              console.info(`${TAG} NotificationSlot[${i}].type:` + JSON.stringify(NotificationSlot[i].type))
              if (NotificationSlot[i].type == 1) {
                expect(NotificationSlot[i].type).assertEqual(1)
              } else if (NotificationSlot[i].type == 2) {
                expect(NotificationSlot[i].type).assertEqual(2)
              } else if (NotificationSlot[i].type == 3) {
                expect(NotificationSlot[i].type).assertEqual(3)
              } else {
                expect(NotificationSlot[i].type).assertEqual(65535)
              }
            }
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlots AsyncCallback errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_0250
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_0250
     * @tc.desc   Get all slots after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0250', Level.LEVEL1, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0250 START')
      await sleep(500)
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err) => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        count++
        expect(count).assertEqual(2)
      }).catch((err) => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        count++
        expect(count).assertEqual(3)
      }).catch((err) => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(500)

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        count++
        expect(count).assertEqual(4)
      }).catch((err) => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots Promise success:` + JSON.stringify(NotificationSlot))
        expect(NotificationSlot.length > 0).assertTrue()
        for (let i = 0; i < NotificationSlot.length; i++) {
          console.info(`${TAG} NotificationSlot[${i}].type:` + JSON.stringify(NotificationSlot[i].type))
          if (NotificationSlot[i].type == 1) {
            expect(NotificationSlot[i].type).assertEqual(1)
          } else if (NotificationSlot[i].type == 2) {
            expect(NotificationSlot[i].type).assertEqual(2)
          } else if (NotificationSlot[i].type == 3) {
            expect(NotificationSlot[i].type).assertEqual(3)
          } else {
            expect(NotificationSlot[i].type).assertEqual(65535)
          }
        }
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0250 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900
     * @tc.number SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900
     * @tc.desc   NotificationSlot for other purposes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900', Level.LEVEL2, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900 START')
      let count = 0
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, undefined).then(() => {
        console.info(`${TAG} addSlot_49 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_49 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000
     * @tc.number SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000
     * @tc.desc   Get the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000', Level.LEVEL2, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_50 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot ).assertEqual(null)
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_50 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100
     * @tc.number SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100
     * @tc.desc   Get all NotificationSlot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100', Level.LEVEL2, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100 START')
      await notificationManager.getSlots(undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlots_51 Promise success: ${NotificationSlot}`)
        expect(NotificationSlot.length == 0).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots_51 Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200
     * @tc.number SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200
     * @tc.desc   Remove the UNKNOWN_TYPE type slot without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200', Level.LEVEL2, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200 START')
      let count = 0
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then(() => {
        console.info(`${TAG} removeSlot_52 success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_52 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200 END')
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300
     * @tc.number SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300
     * @tc.desc   Removes all NotificationSlot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300', Level.LEVEL2, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300 START')
      let count = 0
      await notificationManager.removeAllSlots(undefined).then(() => {
        console.info(`${TAG} removeAllSlots_53 Promise success`)
        count++
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots_53 Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_8150
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_8150
     * @tc.desc   SlotType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8150', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_8150 START`)
      expect(notificationManager.SlotType.UNKNOWN_TYPE).assertEqual(0)
      expect(notificationManager.SlotType.SOCIAL_COMMUNICATION).assertEqual(1)
      expect(notificationManager.SlotType.SERVICE_INFORMATION).assertEqual(2)
      expect(notificationManager.SlotType.CONTENT_INFORMATION).assertEqual(3)
      expect(notificationManager.SlotType.OTHER_TYPES).assertEqual(0xFFFF)
      expect(notificationManager.SlotLevel.LEVEL_NONE).assertEqual(0)
      expect(notificationManager.SlotLevel.LEVEL_MIN).assertEqual(1)
      expect(notificationManager.SlotLevel.LEVEL_LOW).assertEqual(2)
      expect(notificationManager.SlotLevel.LEVEL_DEFAULT).assertEqual(3)
      expect(notificationManager.SlotLevel.LEVEL_HIGH).assertEqual(4)
      done()
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST END')
  })
}
