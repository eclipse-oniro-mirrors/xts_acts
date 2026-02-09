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
import { huks } from '@kit.UniversalKeystoreKit';
import { CheckSoftware } from './utils/huks/HuksOptionsUtils.ets';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils.ets';
import { GetWrapKeyOptions } from './utils/huks/WrapKeyUtils.ets';
import { Logger } from './utils/common/Logger.ets';


export default function SecurityHuksWrapKeyTest() {
  let useSoftware: boolean = true;

  describe('SecurityHuksWrapKeyTest', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100
     * @tc.desc   test wrapKeyItem, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100";
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      try {
        await huks.wrapKeyItem(testNumber, wrapKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware || err.code == 801) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100
     * @tc.desc   test unwrapKeyItem, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100";
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      try {
        await huks.unwrapKeyItem(testNumber, wrapKeyOptions, StringToUint8Array(GetDataBySize(64)));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware || err.code == 801) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
        }
      }
    })
  })
}