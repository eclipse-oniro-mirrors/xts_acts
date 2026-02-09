/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { logGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';
import notificationManager from '@ohos.notificationManager';

export default function notificationSlotTest() {
  describe('ActsNotificationSlotTest', () => {

    const TAG = 'ActsNotificationSlotTest ===>';
    let log = logGenerator(TAG);
    log('ActsNotificationSlotTest START');

    afterEach(async (done: Function) => {
      console.info(`${TAG} afterEach START`);
      try {
        notificationManager.removeAllSlots((err) => {
          if (err) {
            console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG} removeAllSlots success`);
            done();
          }
        })
      } catch (err) {
        console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(`${TAG} afterEach END`);
    })

    /**
     * @tc.name   Acts_NotificationSlot_0100
     * @tc.number Acts_NotificationSlot_0100
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.SOCIAL_COMMUNICATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_0100', Level.LEVEL2, async (done: Function) => {

      console.info('Acts_NotificationSlot_0100 START');

      notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err) {
          console.info(`addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`addSlot SOCIAL_COMMUNICATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
        if (err) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0100 END');
          done();
        }
      })
    })

    /**
     * @tc.name   Acts_NotificationSlot_0200
     * @tc.number Acts_NotificationSlot_0200
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.SERVICE_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_0200', Level.LEVEL2, async (done: Function) => {

      console.info('Acts_NotificationSlot_0200 START');

      notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
        if (err) {
          console.info(`addSlot SERVICE_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`addSlot SERVICE_INFORMATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
        if (err) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0200 END');
          done();
        }
      })
    })

    /**
     * @tc.name   Acts_NotificationSlot_0300
     * @tc.number Acts_NotificationSlot_0300
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.CONTENT_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_0300', Level.LEVEL2, async (done: Function) => {

      console.info('Acts_NotificationSlot_0300 START');

      notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
        if (err) {
          console.info(`addSlot CONTENT_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`addSlot CONTENT_INFORMATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
        if (err) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0300 END');
          done();
        }
      })
    })

    /**
     * @tc.name   Acts_NotificationSlot_0400
     * @tc.number Acts_NotificationSlot_0400
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.OTHER_TYPES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_0400', Level.LEVEL2, async (done: Function) => {

      console.info('Acts_NotificationSlot_0400 START');

      notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
        if (err) {
          console.info(`addSlot OTHER_TYPES err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`addSlot OTHER_TYPES success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
        if (err) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0400 END');
          done();
        }
      })
    })
  })
}