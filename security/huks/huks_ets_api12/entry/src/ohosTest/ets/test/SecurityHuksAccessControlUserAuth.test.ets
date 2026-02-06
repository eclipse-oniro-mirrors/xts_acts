/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { CheckSoftware, MergeOptions } from './utils/huks/HuksOptionsUtils';
import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { GetAlwaysValidOptions, GetChallengeNormalOptions, GetTuiPinOptions } from './utils/huks/AccessControlUtils';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';

export default function SecurityHuksAccessControlUserAuthTest() {
  let useSoftware: boolean = true;

  describe('SecurityHuksAccessControlUserAuthTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      useSoftware = await CheckSoftware();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100
     * @tc.name   : SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100
     * @tc.desc   : generate key with tui pin, error code 12000001
     * @tc.size   : Small
     * @tc.type   : Func
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetAesGenerateOptions(256);
      MergeOptions(genKeyOptions, GetAlwaysValidOptions(), GetChallengeNormalOptions(), GetTuiPinOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        expect(useSoftware).assertEqual(false);
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200
     * @tc.name   : SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200
     * @tc.desc   : import key with tui pin, error code 12000001
     * @tc.size   : Small
     * @tc.type   : Func
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200";
      let importKeyOptions: huks.HuksOptions = GetAesGenerateOptions(256);
      MergeOptions(importKeyOptions, GetAlwaysValidOptions(), GetChallengeNormalOptions(), GetTuiPinOptions());
      importKeyOptions.inData = GetAesImportData(256);
      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        expect(useSoftware).assertEqual(false);
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED);
      }
    })
  })
}