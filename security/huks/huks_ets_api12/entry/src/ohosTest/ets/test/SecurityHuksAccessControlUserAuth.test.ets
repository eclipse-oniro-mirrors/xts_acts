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
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { CheckSoftware, MergeOptions } from './utils/huks/HuksOptionsUtils.ets';
import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import { GetAlwaysValidOptions, GetChallengeNormalOptions, GetTuiPinOptions } from './utils/huks/AccessControlUtils.ets';
import { GetAesImportData } from './utils/huks/ImportKeyUtils.ets';
import { Logger } from './utils/common/Logger.ets';

export default function SecurityHuksAccessControlUserAuthTest() {
  let useSoftware: boolean = true;

  describe('SecurityHuksAccessControlUserAuthTest', () => {

    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100
     * @tc.number SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100
     * @tc.desc   generate key with tui pin, error code 12000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_UserAuth_API20_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetAesGenerateOptions(256);
      MergeOptions(genKeyOptions, GetAlwaysValidOptions(), GetChallengeNormalOptions(), GetTuiPinOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        expect(useSoftware).assertEqual(false);
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200
     * @tc.number SUB_Security_HUKS_AccessControl_UserAuth_Api20_Func_0200
     * @tc.desc   import key with tui pin, error code 12000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED);
      }
    })
  })
}