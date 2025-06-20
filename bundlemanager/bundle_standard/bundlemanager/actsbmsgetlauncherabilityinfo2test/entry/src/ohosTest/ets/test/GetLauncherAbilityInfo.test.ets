/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { osAccount } from '@kit.BasicServicesKit';

const BUNDLE_NAME100 = 'ohos.acts.bms.getlauncherabilityinfo2.test';
const USER_ID100 = 100;
const ERROR_CODE201 = 201;
const DOMAIN: number = 0xFF00;
const ERROR_CODE801 = 801;

export default function actsGetLauncherAbilityInfo2Test() {
  describe('ActsGetLauncherAbilityInfo2Test', () => {
    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_1200
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_1200
     * @tc.desc: Test getLauncherAbilityInfoSync with permission denied return errcode 201.
     */
    it('Sub_Bms_Framework_GetLauncherAbilityInfoSync_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let osAccountManager = osAccount.getAccountManager();
      let userId = USER_ID100;
      osAccountManager.getOsAccountLocalId((err, localId) => {
        userId = localId;
      })
      try {
        let abilityInfos: Array<launcherBundleManager.LauncherAbilityInfo> =
          launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME100, userId);
        expect().assertFail();
        done();
      }
      catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_1200",
          `errData is errCode:${code} message:${errMsg}`);
        if (code === ERROR_CODE801) {
          expect(code).assertEqual(ERROR_CODE801);
          done();
        } else {
          expect(code).assertEqual(ERROR_CODE201);
          done();
        }
      }
    })
  })
}