/**
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
import hilog from '@ohos.hilog';
import notificationManager from '@ohos.notificationManager'
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'

const DOMAIN: int = 0x0000;
let TAG: string  = 'SUB_NOTIFICATION_ANS_IS_VIBRATIONSOUND_ENABLED_TEST ===>'

export default function ActsNotificationVibrationSoundTest() {
  describe('ActsNotificationVibrationSoundTest', () => {

    hilog.info(0x0000, TAG, 'SUB_NOTIFICATION_ANS_IS_VIBRATIONSOUND_ENABLED_TEST START')

    /**
     * @tc.name   Sub_Ans_GetNotificationSettings_Static_0100
     * @tc.number Sub_Ans_GetNotificationSettings_Static_0100
     * @tc.desc   Obtains whether the device supports VibrationSound notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ans_GetNotificationSettings_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, `${TAG} Sub_Ans_GetNotificationSettings_Static_0100 START`)
        try{
          notificationManager.getNotificationSetting().then((data) => {
            hilog.info(DOMAIN, TAG, `[ANS] Sub_Ans_GetNotificationSettings_Static_0100 getNotificationSetting success, setting is ${data}`);
            expect(data.vibrationEnabled).assertTrue();
            expect(data.soundEnabled).assertTrue();
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(DOMAIN, TAG, `[ANS] Sub_Ans_GetNotificationSettings_Static_0100 getNotificationSetting failed, code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.error(DOMAIN, TAG, `Sub_Ans_GetNotificationSettings_Static_0100 getNotificationSettings() error, errData is errCode:${code}  message:${errMsg}`);
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, `Sub_Ans_GetNotificationSettings_Static_0100 END`)
      })
    hilog.info(DOMAIN, TAG, 'SUB_NOTIFICATION_IS_VIBRATIONSOUND_ENABLED_TEST END')
  })

}