/*
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
import notification from '@ohos.notification'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsNotificationSlotTest() {
  describe('SUB_NOTIFICATION_ANS_SLOT_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST START')

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    }

    afterEach(async function (done) {
      console.info(`${TAG} afterEach START`)
      await notification.removeAllSlots((err) => {
        if (err.code) {
          console.info(`${TAG} removeAllSlots err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeAllSlots success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} afterEach END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2000
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot of an unknown SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 START')
      await notification.addSlot(notification.SlotType.UNKNOWN_TYPE, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot_1 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot_1 AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2150
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2150', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot_2 AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2300
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 START')
      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot_3 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot_3 AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2450
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2450', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 START')
      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot_4 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot_4 AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2600
     * @tc.name      : addSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 START')
      await notification.addSlot(notification.SlotType.OTHER_TYPES, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot_5 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot_5 AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2750
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot of an unknown type
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2750', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 START')
      await notification.addSlot(notification.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_6 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_6 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_2900
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_2900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_7 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_7 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3050
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3050', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 START')
      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_8 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_8 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3150
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3150', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 START')
      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_9 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_9 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3300
     * @tc.name      : addSlot(type: SlotType): Promise<void>
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 START')
      await notification.addSlot(notification.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_10 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_10 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3450
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3450', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 START')
      await notification.getSlot(notification.SlotType.UNKNOWN_TYPE, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_1 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_1 AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3600
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 START')
      await notification.getSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_2 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_2 AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3750
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3750', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 START')
      await notification.getSlot(notification.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_3 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_3 AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3800
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 START')
      await notification.getSlot(notification.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_4 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_4 AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_3900
     * @tc.name      : getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_3900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 START')
      await notification.getSlot(notification.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_5 AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_5 AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4000
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4000 START')
      await notification.getSlot(notification.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_6 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_6 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4100
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4100 START')
      await notification.getSlot(notification.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_7 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_7 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4200
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 START')
      await notification.getSlot(notification.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_8 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_8 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4300
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 START')
      await notification.getSlot(notification.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_9 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_9 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4400
     * @tc.name      : getSlot(SlotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 START')
      await notification.getSlot(notification.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_10 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_10 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_1900
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_1900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 START')
      await notification.removeSlot(notification.SlotType.UNKNOWN_TYPE, (err) => {
        if (err.code) {
          console.info(`${TAG} removeSlot_1 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeSlot_1 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2000
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 START')
      await notification.removeSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err.code) {
          console.info(`${TAG} removeSlot_2 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeSlot_2 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2100
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 START')
      await notification.removeSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} removeSlot_3 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeSlot_3 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2200
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 START')
      await notification.removeSlot(notification.SlotType.CONTENT_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} removeSlot_4 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeSlot_4 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2300
     * @tc.name      : removeSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 START')
      await notification.removeSlot(notification.SlotType.OTHER_TYPES, (err) => {
        if (err.code) {
          console.info(`${TAG} removeSlot_5 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeSlot_5 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2400
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2400 START')
      await notification.removeSlot(notification.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_6 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_6 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2500
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2500 START')
      await notification.removeSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot_7 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_7 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2600
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 START')
      await notification.removeSlot(notification.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_8 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_8 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2700
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 START')
      await notification.removeSlot(notification.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_9 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_9 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2800
     * @tc.name      : removeSlot(SlotType: SlotType): Promise<void>
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 START')
      await notification.removeSlot(notification.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot_10 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_10 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4500
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 START')
      await notification.addSlot(notification.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_11 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_11 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      notification.getSlot(notification.SlotType.UNKNOWN_TYPE, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
          expect(true).assertTrue()
          notification.removeSlot(notification.SlotType.UNKNOWN_TYPE, (err) => {
            if (err.code) {
              console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
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

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4600
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_12 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_12 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      notification.getSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
          expect(true).assertTrue()
          notification.removeSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err) => {
            if (err.code) {
              console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
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

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4700
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 START')
      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_13 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_13 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      notification.getSlot(notification.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
          expect(true).assertTrue()
          notification.removeSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
            if (err.code) {
              console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
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

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4800
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 START')
      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_14 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_14 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      notification.getSlot(notification.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
          expect(true).assertTrue()
          notification.removeSlot(notification.SlotType.CONTENT_INFORMATION, (err) => {
            if (err.code) {
              console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
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


      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_4900
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(SlotType: SlotType, AsyncCallback: AsyncCallback<NotificationSlot>): void
                       removeSlot(slotType: SlotType, AsyncCallback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_4900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 START')
      await notification.addSlot(notification.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_15 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_15 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      notification.getSlot(notification.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
          expect(true).assertTrue()
          notification.removeSlot(notification.SlotType.OTHER_TYPES, (err) => {
            if (err.code) {
              console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
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


      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5000
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType): Promise<void>
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 START')
      await notification.addSlot(notification.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_16 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_16 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.UNKNOWN_TYPE).then((NotificationSlot) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5100
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType): Promise<void>
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5100', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_17 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_17 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.SOCIAL_COMMUNICATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5200
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5200', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 START')
      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_18 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_18 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.SERVICE_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5300
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5300', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 START')
      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_19 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_19 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.CONTENT_INFORMATION).then((NotificationSlot) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5400
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 START')
      await notification.addSlot(notification.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_20 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_20 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.OTHER_TYPES).then((NotificationSlot) => {
        console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot OTHER_TYPES success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot OTHER_TYPES err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5500
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       getSlot(slotType: SlotType): Promise<NotificationSlot>
     * @tc.desc      : Get the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_21 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.getSlot(notification.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlot_21 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_21 success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5600
     * @tc.name      : addSlot(SlotType: SlotType): Promise<void>
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Remove the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5600', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 START')
      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_22 success`)
        expect(true).assertTrue()
      }).catch((err) => {
        console.info(`${TAG} addSlot_22 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })

      await notification.removeSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} getSlot_22 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlot_22 success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_2900
     * @tc.name      : removeAllSlots(callback: AsyncCallback<void>): void
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_2900', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 START')
      await notification.removeAllSlots((err) => {
        if (err.code) {
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_3000
     * @tc.name      : removeAllSlots(): Promise<void>
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_3000', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 START')
      await notification.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2400
     * @tc.name      : getSlots(callback: AsyncCallback<Array<NotificationSlot>>): void
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2400', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 START')
      await notification.getSlots((err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlots AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} getSlots AsyncCallback success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_2500
     * @tc.name      : getSlots(): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_2500', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 START')
      await notification.getSlots().then((NotificationSlot) => {
        console.info(`${TAG} getSlots Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5700
     * @tc.name      : getSlots(callback: AsyncCallback<Array<NotificationSlot>>): void
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5700', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 START')

      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.OTHER_TYPES, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot OTHER_TYPES success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.getSlots((err, NotificationSlot) => {
        if (err.code) {
          console.info(`${TAG} getSlots AsyncCallback err: + ${err.code}`)
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
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_5800
     * @tc.name      : getSlots(): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5800', 0, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 START')

      await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.SERVICE_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.CONTENT_INFORMATION, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.addSlot(notification.SlotType.OTHER_TYPES, (err) => {
        if (err.code) {
          console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} addSlot OTHER_TYPES success`)
          expect(true).assertTrue()
        }
      })

      await sleep(1000)

      await notification.getSlots().then((NotificationSlot) => {
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
        console.info(`${TAG} getSlots Promise err: + ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_4900
     * @tc.name      : getSlot(SlotType: SlotType, undefined): Promise<NotificationSlot>
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_4900', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 START')
      await notification.getSlot(notification.SlotType.OTHER_TYPES, undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlot_49 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlot_49 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_5000
     * @tc.name      : addSlot(type: SlotType, undefined): Promise<void>
     * @tc.desc      : NotificationSlot of an unknown type
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_5000', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 START')
      await notification.addSlot(notification.SlotType.UNKNOWN_TYPE, undefined).then(() => {
        console.info(`${TAG} addSlot_50 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} addSlot_50 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_5100
     * @tc.name      : getSlots(undefined): Promise<Array<NotificationSlot>>
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_5100', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 START')
      await notification.getSlots(undefined).then((NotificationSlot) => {
        console.info(`${TAG} getSlots_51 Promise success: ${NotificationSlot}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getSlots_51 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_5200
     * @tc.name      : removeSlot(SlotType: SlotType, undefined): Promise<void>
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_5200', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 START')
      await notification.removeSlot(notification.SlotType.UNKNOWN_TYPE, undefined).then(() => {
        console.info(`${TAG} removeSlot_52 success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeSlot_52 err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 END')
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_5300
     * @tc.name      : removeAllSlots(undefined): Promise<void>
     * @tc.desc      : Removes all NotificationSlot
     */
    it('SUB_NOTIFICATION_ANS_SLOT_TEST_5300', 0, async function (done) {
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 START')
      await notification.removeAllSlots(undefined).then(() => {
        console.info(`${TAG} removeAllSlots_53 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} removeAllSlots_53 Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_3500
     * @tc.name      : Describes NotificationSlot types
     * @tc.desc      : SlotType
     */
    it('SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_0100 START`)
      expect(notification.SlotType.UNKNOWN_TYPE).assertEqual(0)
      expect(notification.SlotType.SOCIAL_COMMUNICATION).assertEqual(1)
      expect(notification.SlotType.SERVICE_INFORMATION).assertEqual(2)
      expect(notification.SlotType.CONTENT_INFORMATION).assertEqual(3)
      expect(notification.SlotType.OTHER_TYPES).assertEqual(0xFFFF)
      expect(notification.SlotLevel.LEVEL_NONE).assertEqual(0)
      expect(notification.SlotLevel.LEVEL_MIN).assertEqual(1)
      expect(notification.SlotLevel.LEVEL_LOW).assertEqual(2)
      expect(notification.SlotLevel.LEVEL_DEFAULT).assertEqual(3)
      expect(notification.SlotLevel.LEVEL_HIGH).assertEqual(4)
      done()
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST END')
  })
}
