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
import notification from '@ohos.notification'
import hilog from '@ohos.hilog';
import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Base from '@ohos.base';
import { BusinessError } from '@ohos.base'

const DOMAIN: number = 0x0000;

export default function ActsNotificationVibrationSoundTest() {
    describe('ActsNotificationVibrationSoundTest', () => {
        let TAG = 'SUB_NOTIFICATION_ANS_IS_VIBRATIONSOUND_ENABLED_TEST ===>'
        hilog.info(0x0000, TAG, 'SUB_NOTIFICATION_ANS_IS_VIBRATIONSOUND_ENABLED_TEST START')

        /**
         * @tc.name   Sub_Ans_GetNotificationSettings_0100
         * @tc.number Sub_Ans_GetNotificationSettings_0100
         * @tc.desc   Obtains whether the device supports VibrationSound notification
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Sub_Ans_GetNotificationSettings_0100', Level.LEVEL0, async (done:Function) => {
          hilog.info(DOMAIN, TAG, `${TAG} Sub_Ans_GetNotificationSettings_0100 START`)
            try{
              notificationManager.getNotificationSetting().then((data) => {
                hilog.info(DOMAIN, TAG, `[ANS] getNotificationSetting success, setting is ${JSON.stringify(data)}`);
                expect(data.vibrationEnabled).assertTrue();
                expect(data.soundEnabled).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                hilog.error(DOMAIN, TAG, `[ANS] getNotificationSetting failed, code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done();
              });
            } catch (errData) {
              let errMsg = (errData as BusinessError).message;
              let code = (errData as BusinessError).code;
              hilog.error(DOMAIN, TAG, `getNotificationSettings() error, errData is errCode:${code}  message:${errMsg}`);
              expect(false).assertTrue();
              done();
            }
          hilog.info(DOMAIN, TAG, `Sub_Ans_GetNotificationSettings_0100 END`)
        })
        hilog.info(DOMAIN, TAG, 'SUB_NOTIFICATION_IS_VIBRATIONSOUND_ENABLED_TEST END')
      })
    
}
