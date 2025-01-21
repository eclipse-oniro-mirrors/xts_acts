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
import { hilog } from '@kit.PerformanceAnalysisKit';
import huks from '@ohos.security.huks';
import { setParam, genParam } from './utils/HuksOptionUtil';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function SecurityHuksnewtest() {
  describe('SecurityHuksnewtest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number SUB_Security_HUKS_3DES_0010
     * @tc.name 3DES key generation, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_3DES_0010', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_3DES
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
      ];
      let properties1: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_3DES
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
      ];
      let options: huks.HuksOptions = {
        properties: properties
      };
      let options1: huks.HuksOptions = {
        properties: properties1
      };
      try {
        await huks.generateKeyItem(keyAlias, options)
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_3DES_0010 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_3DES_0010 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
      try {
        await huks.generateKeyItem(keyAlias, options1)
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_3DES_0010 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_3DES_0010 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_CMAC_0020
     * @tc.name use CMAC, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_CMAC_0020', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_AES
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
      ];

      let properties1: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_CMAC
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PADDING,
          value: huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9797_1
        },
      ];

      let options: huks.HuksOptions = {
        properties: properties
      };

      let options1: huks.HuksOptions = {
        properties: properties1
      };

      try {
        await huks.generateKeyItem(keyAlias, options);
        await huks.initSession(keyAlias, options1);
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_CMAC_0020 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_CMAC_0020 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_CMAC_0010
     * @tc.name use CMAC key generation, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_CMAC_0010', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_CMAC
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PADDING,
          value: huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9797_1
        },
      ];

      let options: huks.HuksOptions = {
        properties: properties
      };

      try {
        await huks.generateKeyItem(keyAlias, options);
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_CMAC_0010 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_CMAC_0010 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_DES_0010
     * @tc.name use DES key generation error, return specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_DES_0010', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_DES
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_DES_KEY_SIZE_64
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
      ];

      let options: huks.HuksOptions = {
        properties: properties
      };

      try {
        await huks.generateKeyItem(keyAlias, options);
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_DES_0010 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_DES_0010 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_Sign_RSA_0020
     * @tc.name use RSA abnormal key length, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_Sign_RSA_0020', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_RSA
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: 1500
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
        },
      ];

      let options: huks.HuksOptions = {
        properties: properties
      };

      try {
        await huks.generateKeyItem(keyAlias, options);
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_Sign_RSA_0020 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_Sign_RSA_0020 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_Sign_RSA_0010
     * @tc.name use RSA-ISpadding signature verification, returns specified error code
     * @tc.desc abnormal test
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_Sign_RSA_0010', 0, async () => {
      let keyAlias: string = 'keyAlias';
      let properties: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_RSA
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN |
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
        },
      ];

      let properties1: Array<huks.HuksParam> =[
        {
          tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
          value: huks.HuksKeyAlg.HUKS_ALG_RSA
        },
        {
          tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
          value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PURPOSE,
          value:
          huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN
        },
        {
          tag: huks.HuksTag.HUKS_TAG_PADDING,
          value: huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2
        },
        {
          tag: huks.HuksTag.HUKS_TAG_DIGEST,
          value: huks.HuksKeyDigest.HUKS_DIGEST_SHA1
        }
      ];

      let options: huks.HuksOptions = {
        properties: properties
      };

      let options1: huks.HuksOptions = {
        properties: properties1
      };

      try {
        await huks.generateKeyItem(keyAlias, options);
        await huks.initSession(keyAlias, options1)
        expect(null).assertFail();
      } catch (error) {
        console.log( `SUB_Security_HUKS_Sign_RSA_0010 catch error: ${JSON.stringify(error)}`);
        console.log( `SUB_Security_HUKS_Sign_RSA_0010 catch error.code: ${error.code}`);
        expect(error.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })
  })
}