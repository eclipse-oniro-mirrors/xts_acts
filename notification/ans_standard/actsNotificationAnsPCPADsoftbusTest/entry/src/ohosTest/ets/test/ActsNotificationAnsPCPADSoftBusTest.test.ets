/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager } from '@kit.NotificationKit';

export default function ActsNotificationAnsPCPADSoftBusTest() {
  describe('ActsNotificationAnsPCPADSoftBusTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_PCPAD_softbus_0100
     * @tc.number SUB_Notification_Ans_PCPAD_softbus_0100
     * @tc.desc   The getDistributedDeviceList interface returns 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_PCPAD_softbus_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_PCPAD_softbus_0100';
      try {
        await notificationManager.getDistributedDeviceList().then((value) => {
          console.info(testNum + 'getDistributedDeviceList success:' + JSON.stringify(value));
          expect(false).assertTrue();
          done();
        }).catch((e:Error) => {
          let err:BusinessError = e as BusinessError
          console.error(`${testNum}getDistributedDeviceList fail: ${err.code}, ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202);
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}getDistributedDeviceList failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(err.code).assertEqual(202);
          done();
        }
      }
    })
  })
}