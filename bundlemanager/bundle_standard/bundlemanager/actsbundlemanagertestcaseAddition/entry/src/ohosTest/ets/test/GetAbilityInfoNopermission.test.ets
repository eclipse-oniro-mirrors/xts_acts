/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import { Want } from '@kit.AbilityKit';
import bundleManager from '@ohos.bundle.bundleManager';


const ERROR201: number = 201;
const DOMAIN: number = 0xFF00;

const URI_0100 = "abcde://GetAbilityInfoNopermissionTest";

export default function GetAbilityInfoNopermissionTest() {
  describe('GetAbilityInfoNopermissionTest', () => {
    /**
     * @tc.name   Sub_Bms_Framework_GetAbilityInfoNopermission_0100
     * @tc.number Sub_Bms_Framework_GetAbilityInfoNopermission_0100
     * @tc.desc   Test 201 with valid value GET_ABILITY_INFO_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_GetAbilityInfoNopermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try{
        let uri = URI_0100;
        let abilityFlags: bundleManager.AbilityFlag = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
        bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfoNopermission_0100', `getAbilityInfo() success,
            abilityInfos is ${JSON.stringify(abilityInfos)}`);
          expect().assertFail()
          done();
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'Sub_Bms_Framework_GetAbilityInfoNopermission_0100', `getAbilityInfo() error,
            errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(ERROR201);
          done();
        });
      } catch (errData) {
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetAbilityInfoNopermission_0100", `errData is errCode:${code} message:${errMsg}`);
        expect().assertFail();
        done();
      }
    })

  })
}