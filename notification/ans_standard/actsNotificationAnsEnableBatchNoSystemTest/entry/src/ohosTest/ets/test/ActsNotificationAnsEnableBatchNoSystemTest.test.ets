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

export default function ActsNotificationAnsEnableBatchNoSystemTest() {
  describe('ActsNotificationAnsEnableBatchNoSystemTest', () => {
    beforeAll(() => {
      notificationManager.setNotificationEnable({
        bundle: "com.example.actsnotificationansenablebatchnosystemtest"
      }, true)
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_Enable_Batch_0100
     * @tc.number SUB_Notification_Ans_Enable_Batch_0100
     * @tc.desc   When calling the interfaces setReminderInfoByBundles, getReminderInfoByBundles, getBadgeDisplayStatusByBundles, and setBadgeDisplayStatusByBundles, the HAP is a third-party application, and an error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Enable_Batch_0100', Level.LEVEL1, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Enable_Batch_0100';
      let nullStr: string = ''
      let reminderInfosOne: Array<notificationManager.NotificationReminderInfo> = [
        {
          bundle: {
            bundle: "com.example.actsnotificationansenablebatchnosystemtest"
          },
          reminderFlags: 58,
          silentReminderEnabled: false
        },
        {
          bundle: {
            bundle: nullStr
          },
          reminderFlags: 59,
          silentReminderEnabled: false
        }
      ];
      let bundles: Array<notificationManager.BundleOption> = [
        {
          bundle: "com.example.actsnotificationansenablebatchnosystemtest",
        }
      ];
      let badges = new Map<notificationManager.BundleOption, boolean>();
      let bundle: notificationManager.BundleOption = {
        bundle: 'bundleName',
      };
      badges.set(bundle, true);
      try {
        await notificationManager.setReminderInfoByBundles(reminderInfosOne).then(() => {
          console.info(testNum + 'SetReminderInfoByBundles success.');
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          let err:BusinessError=error as BusinessError
          console.error(testNum + `SetReminderInfoByBundles failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
          }
        });
        await notificationManager.getReminderInfoByBundles(bundles)
          .then((data: Array<notificationManager.NotificationReminderInfo>) => {
            console.info(testNum + `Reminder data is ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done();
          })
          .catch((error: Error) => {
            let err:BusinessError=error as BusinessError
            console.error(testNum + `GetReminderInfoByBundles failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(202)
            }
          });
        await notificationManager.getBadgeDisplayStatusByBundles(bundles)
          .then((data: Map<notificationManager.BundleOption, boolean>) => {
            data.forEach((value, key) => {
              console.info(testNum + `Bundle is ${key.bundle}, uid is ${key.uid}, badge status is ${value}.`);
            });
            expect(false).assertTrue();
            done();
          })
          .catch((error: Error) => {
            let err:BusinessError=error as BusinessError
            console.error(testNum +
              `GetBadgeDisplayStatusByBundles failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(202)
            }
          });
        await notificationManager.setBadgeDisplayStatusByBundles(badges).then(() => {
          console.info(testNum + 'SetBadgeDisplayStatusByBundles success.');
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          let err:BusinessError=error as BusinessError
          console.error(testNum +
            `SetBadgeDisplayStatusByBundles failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}