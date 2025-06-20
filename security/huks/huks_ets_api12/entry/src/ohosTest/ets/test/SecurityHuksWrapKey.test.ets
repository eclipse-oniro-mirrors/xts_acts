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
import { CheckSoftware } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array } from './utils/CommonUtils';
import { GetWrapKeyOptions } from './utils/huks/WrapKeyUtils';


export default function SecurityHuksWrapKeyTest() {
  let useSoftware: boolean = true;

  describe('SecurityHuksWrapKeyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      useSoftware = await CheckSoftware();
    })
    beforeEach(() => {
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
     * @tc.number : SUB_Security_HUKS_KeyGenerate_WrapKey_Api20_Func_0100
     * @tc.name   : SUB_Security_HUKS_KeyGenerate_WrapKey_Api20_Func_0100
     * @tc.desc   : test wrapKeyItem, process success
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_WrapKey_Api20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_WrapKey_Api20_Func_0100";
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      try {
        await huks.wrapKeyItem(testNumber, wrapKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_UnwrapKey_Api20_Func_0100
     * @tc.name   : SUB_Security_HUKS_KeyGenerate_UnwrapKey_Api20_Func_0100
     * @tc.desc   : test unwrapKeyItem, process success
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_UnwrapKey_Api20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_UnwrapKey_Api20_Func_0100";
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      try {
        await huks.unwrapKeyItem(testNumber, wrapKeyOptions, StringToUint8Array(GetDataBySize(64)));
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (useSoftware) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        } else {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
        }
      }
    })
  })
}