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
import { huks } from '@kit.UniversalKeystoreKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { GetDataBySize, StringToUint8Array } from './utils/CommonUtils';
import { CheckSoftware, CheckWearable, GenParam, SetParam } from './utils/huks/HuksOptionsUtils';

export default function SecurityHuksCmacTest() {
  let useSoftware: boolean = true;
  let isWearable: boolean = false;
  let genKeyOption: huks.HuksOptions;
  let macOption: huks.HuksOptions;

  describe('SecurityHuksCmacTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      useSoftware = await CheckSoftware();
      isWearable = await CheckWearable();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC)
        ]
      };
      macOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_CMAC),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9797_1),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"))
        ],
        inData: StringToUint8Array("123")
      }
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
     * @tc.number SUB_Security_HUKS_CMAC_API12_Func_0010
     * @tc.name use CMAC key generation, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_CMAC_API12_Func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_HUKS_CMAC_API12_Func_0010';
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_CMAC)
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000003 : 12000001;
        expect(err.code).assertEqual(expectErrCode);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_CMAC_API12_Func_0020
     * @tc.name use CMAC, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_CMAC_API12_Func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_HUKS_CMAC_API12_Func_0020';
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        let handle = (await huks.initSession(testNumber, macOption)).handle;
        macOption.inData = StringToUint8Array(GetDataBySize(8))
        await huks.updateSession(handle, macOption);
        let res = (await huks.finishSession(handle, macOption)).outData as Uint8Array;
        expect(isWearable).assertEqual(true);
        expect(res.length).assertEqual(8);
      } catch (err) {
        console.log(testNumber + `: catch error ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000003 : 12000012;
        expect(err.code).assertEqual(expectErrCode);
      }
    })
  }
  )
}