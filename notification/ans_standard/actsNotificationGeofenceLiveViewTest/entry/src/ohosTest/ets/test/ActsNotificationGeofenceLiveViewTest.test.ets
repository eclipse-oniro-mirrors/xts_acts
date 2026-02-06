/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'


export default function ActsNotificationGeofenceLiveViewTest() {
  describe('ActsNotificationGeofenceLiveViewTest', () => {

    /**
     * @tc.name   Sub_Notification_Ans_GeofenceLiveView_0006
     * @tc.number Sub_Notification_Ans_GeofenceLiveView_0006
     * @tc.desc   Third-party app calls setGeofenceEnabled, error 202 returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_GeofenceLiveView_0006', Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Notification_Ans_GeofenceLiveView_0006'
      console.log(`${caseName}: create`)
      try {
        notificationManager.setGeofenceEnabled(true)
          .then(() => {
            console.info(`${caseName}  setGeoFenceEnabled success`);
            expect(false).assertTrue();
            done()
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} call setGeoFenceEnabled failed(.catch), errCode: ` + err.code + `, errMsg: ` +
            `err.message`);
            expect(err.code).assertEqual(202);
          })
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_GeofenceLiveView_0010
     * @tc.number Sub_Notification_Ans_GeofenceLiveView_0010
     * @tc.desc   isGeofenceEnabled returns default true after device flash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_GeofenceLiveView_0010', Level.LEVEL0, async (done: Function) => {
      let caseName = 'Sub_Notification_Ans_GeofenceLiveView_0010'
      console.log(`${caseName}: create`)
      try {
        await notificationManager.isGeofenceEnabled()
          .then((enabled: boolean) => {
            console.info(`${caseName} call isGeoFenceEnabled success`);
            expect(enabled).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              console.error(`${caseName} call isGeoFenceEnabled failed(.catch), errCode: ` + err.code + `, errMsg: ` +
              err.message);
              expect().assertFail();
              done();
            }
          })
      } catch (err) {
        let e = err as BusinessError;
        if (e.code == 801) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          console.error(`[${caseName}]: ` + e.code + e.message);
          expect().assertFail();
          done();
        }
      }
      console.log(`[${caseName}]: end`);
    })
  })
}