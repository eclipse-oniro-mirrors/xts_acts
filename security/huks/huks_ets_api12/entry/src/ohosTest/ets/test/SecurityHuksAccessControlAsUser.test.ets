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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { setParam, genParam } from './utils/HuksOptionUtil';
import { stringToUint8Array } from './utils/CommonUtil'

export default function SecurityHUKSAccessControlAsUserTest() {
  describe('SecurityHuksAccessControlAsUserTest', () => {
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
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2200
     * @tc.name Test non_system hap use generateKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level1
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2200', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2200";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItemAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2300
     * @tc.name Test non_system hap use deleteKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level2
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2300', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2300";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE),
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.deleteKeyItemAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2400
     * @tc.name Test non_system hap use importKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2400', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2400";
      let userid: number = 100;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        ],
        inData: new Uint8Array()
      };
      let keyData = new Uint8Array([
        0xfb, 0x8b, 0x9f, 0x12, 0xa0, 0x83, 0x19, 0xbe, 0x6a, 0x6f, 0x63, 0x2a, 0x7c, 0x86, 0xba, 0xca,
        0x64, 0x0b, 0x88, 0x96, 0xe2, 0xfa, 0x77, 0xbc, 0x71, 0xe3, 0x0f, 0x0f, 0x9e, 0x3c, 0xe5, 0xf9
      ]);
      try {
        importKeyOption.inData = keyData;
        await huks.importKeyItemAsUser(userid, testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2500
     * @tc.name Test non_system hap use importWrappedKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2500', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2500";
      let userid: number = 100;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        ],
        inData: new Uint8Array()
      };
      let keyData = new Uint8Array([
        0xfb, 0x8b, 0x9f, 0x12, 0xa0, 0x83, 0x19, 0xbe, 0x6a, 0x6f, 0x63, 0x2a, 0x7c, 0x86, 0xba, 0xca,
        0x64, 0x0b, 0x88, 0x96, 0xe2, 0xfa, 0x77, 0xbc, 0x71, 0xe3, 0x0f, 0x0f, 0x9e, 0x3c, 0xe5, 0xf9
      ]);
      try {
        importKeyOption.inData = keyData;
        await huks.importWrappedKeyItemAsUser(userid, testNumber, testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2600
     * @tc.name Test non_system hap use exportKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2600', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2600";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.exportKeyItemAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2700
     * @tc.name Test non_system hap use getKeyItemPropertiesAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2700', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2700";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.getKeyItemPropertiesAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2800
     * @tc.name Test non_system hap use hasKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2800', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2800";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.hasKeyItemAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_2900
     * @tc.name Test non_system hap use initSessionAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_2900', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_2900";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      let encryptOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          genParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
          genParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE),
          genParam(huks.HuksTag.HUKS_TAG_IV, stringToUint8Array("000000000000")),
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.initSessionAsUser(userid, testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_3000
     * @tc.name Test non_system hap use attestKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_3000', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_3000";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.attestKeyItemAsUser(userid, testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })

    /**
     * @tc.number SUB_Security_HUKS_AccessControl_AsUser_Func_3100
     * @tc.name Test non_system hap use anonAttestKeyItemAsUser, process fail
     * @tc.size Small
     * @tc.type Func
     * @tc.level Level3
     */
    it('SUB_Security_HUKS_AccessControl_AsUser_Func_3100', 0, async () => {
      let testNumber: string = "SUB_Security_HUKS_AccessControl_AsUser_Func_3100";
      let userid: number = 100;
      let genKeyOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          genParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048),
          genParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          genParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
          genParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS),
          genParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      let anonAttestOption: huks.HuksOptions = {
        properties: [
          genParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, stringToUint8Array('sec_level')),
          genParam(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, stringToUint8Array('challenge_data')),
          genParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, stringToUint8Array('version_info')),
          genParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, stringToUint8Array(testNumber)),
          genParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE)
        ],
        inData: new Uint8Array()
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await huks.anonAttestKeyItemAsUser(userid, testNumber, anonAttestOption);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP);
      }
    })
  })
}