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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import notificationManager from '@ohos.notificationManager';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

export default function ActsNotificationSlotTest() {
  describe('ActsNotificationSlotTest', () => {

    const TAG:string = 'ActsNotificationSlotTest ===>';
    afterEach(()=>{
      await Utils.msSleep(1000)
    })

    /**
     * @tc.name   Acts_NotificationSlot_Static_0100
     * @tc.number Acts_NotificationSlot_Static_0100
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.SOCIAL_COMMUNICATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0100'
      console.info(`${TAG} Acts_NotificationSlot_Static_0100 START`);
      let count: int = 0;
      notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`);
          count++;
          expect(count).assertEqual(1);
          notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
              expect(NotificationSlot !== null).assertTrue();
              console.info(TAG + 'Acts_NotificationSlot_0100 END');
              done();
            }
          })
        }
      })      
    })

    /**
     * @tc.name   Acts_NotificationSlot_Static_0200
     * @tc.number Acts_NotificationSlot_Static_0200
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.SERVICE_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0200'
      console.info('Acts_NotificationSlot_Static_0200 START');
      let count: int = 0;
      notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot SERVICE_INFORMATION success`);
          count++;
          expect(count).assertEqual(1);
          notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
              expect(NotificationSlot !== null).assertTrue();
              console.info(TAG + 'Acts_NotificationSlot_0200 END');
              done();
            }
          })
        }
      })     
    })

    /**
     * @tc.name   Acts_NotificationSlot_Static_0300
     * @tc.number Acts_NotificationSlot_Static_0300
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.CONTENT_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0300'
      console.info('Acts_NotificationSlot_Static_0300 START');
      let count: int = 0;
      notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot CONTENT_INFORMATION success`);
          count++;
          expect(count).assertEqual(1);
          notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
              expect(NotificationSlot !== null).assertTrue();
              console.info(TAG + 'Acts_NotificationSlot_0300 END');
              done();
            }
          })
        }
      })      
    })

    /**
     * @tc.name   Acts_NotificationSlot_Static_0400
     * @tc.number Acts_NotificationSlot_Static_0400
     * @tc.desc   Set NotificationSlot attribute parameters notificationManager.SlotType.OTHER_TYPES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationSlot_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0400'
      console.info('Acts_NotificationSlot_Static_0400 START');
      let count: int = 0;
      notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
        if (err) {
          console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot OTHER_TYPES success`);
          count++;
          expect(count).assertEqual(1);
          notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
              expect(NotificationSlot !== null).assertTrue();
              console.info(TAG + 'Acts_NotificationSlot_0400 END');
              done();
            }
          })
        }
      })
    })
  })
}