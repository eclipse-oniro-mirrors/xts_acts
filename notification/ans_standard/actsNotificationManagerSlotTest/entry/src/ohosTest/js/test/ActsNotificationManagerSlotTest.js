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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

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
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8200
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot of an unknown SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8200 START')
      try {
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8250
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8250', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8250 START')
      try {
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8300
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8300 START')
      try {
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8350
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8350', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8350 START')
      try {
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8400
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8400 START')
      try {
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
          if (err) {
            console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8450
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot of an unknown type
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8450', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8450 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_6 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8450 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8500
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_7 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8550
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8550', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8550 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_8 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8550 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8600
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8600 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_9 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8650
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8650', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8650 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_10 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_8650 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1200
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1200 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_1 AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1300
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1300 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_2 AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1400
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1400 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_3 AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1500
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1500 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_4 AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1600
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1600 START')
      try {
        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_5 AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1700
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1700 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_6 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1800
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1800 START')
      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_7 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_1900
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_1900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1900 START')
      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_8 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2000
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2000 START')
      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_9 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2100
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2100 START')
      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_10 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_0700
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0700 START')
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_0800
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0800 START')
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_0900
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_0900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_0900 START')
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1000
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1000 START')
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1100
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1100 START')
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1200
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1200 START')
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_6 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_6 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1300
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1300 START')
      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot_7 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_7 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1400
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1400 START')
      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_8 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_8 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1500
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1500 START')
      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_9 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_9 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1600
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1600 START')
      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot_10 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_10 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0200
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0200 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_11 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
              if (err) {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
                expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0350
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0350', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0350 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_12 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
              if (err) {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
                expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0500
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_13 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
              if (err) {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
                expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0650
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0650', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0650 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_14 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
              if (err) {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0800
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0800 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_15 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
              if (err) {
                console.info(`${TAG} removeSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot OTHER_TYPES success`)
                expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0950
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType): Promise<void>
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0950', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0950 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_16 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_16 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0950 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1100
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType): Promise<void>
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1100 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_17 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_17 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1250
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1250', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1250 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_18 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_18 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1250 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1400
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1400 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_19 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_19 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1550
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1550', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1550 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_20 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_20 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot OTHER_TYPES success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1550 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1700
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1700 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        expect(true).assertTrue()
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
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_1850
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Remove the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_1850', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_1850 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_22 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_22 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
          if (err) {
            console.info(`${TAG} removeSlot err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1700
     * @tc.name      : removeAllSlots(callback: AsyncCallback<void>): void
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1700 START')
      try {
        await notificationManager.removeAllSlots((err) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1800
     * @tc.name      : removeAllSlots(): Promise<void>
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1800 START')
      await notificationManager.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2200
     * @tc.name      : getSlots(callback: AsyncCallback<Array<NotificationSlot>>): void
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2200 START')
      try {
        await notificationManager.getSlots((err, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2300
     * @tc.name      : getSlots(): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2300 START')
      await notificationManager.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0100
     * @tc.name      : getSlots(callback: AsyncCallback<Array<NotificationSlot>>): void
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0100 START')

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        expect(true).assertTrue()
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

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_0250
     * @tc.name      : getSlots(): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_0250', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_0250 START')

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await sleep(1000)

      await notificationManager.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots Promise success:` + JSON.stringify(NotificationSlot))
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

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900
     * @tc.name      : addSlot(type: SlotType, undefined): Promise<void>
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, undefined).then(() => {
        console.info(`${TAG} addSlot_49 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_49 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_4900 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000
     * @tc.name      : getSlot(SlotType: SlotType, undefined): Promise<NotificationSlot>
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_50 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_50 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5000 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100
     * @tc.name      : getSlots(undefined): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100 START')
      await notificationManager.getSlots(undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlots_51 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots_51 Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5100 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200
     * @tc.name      : removeSlot(SlotType: SlotType, undefined): Promise<void>
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200 START')
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then(() => {
        console.info(`${TAG} removeSlot_52 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_52 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5200 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300
     * @tc.name      : removeAllSlots(undefined): Promise<void>
     * @tc.desc      : Removes all NotificationSlot
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300 START')
      await notificationManager.removeAllSlots(undefined).then(() => {
        console.info(`${TAG} removeAllSlots_53 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots_53 Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_5300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_8150
     * @tc.name      : Describes NotificationSlot types
     * @tc.desc      : SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_8150', 0, async function (done) {
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
