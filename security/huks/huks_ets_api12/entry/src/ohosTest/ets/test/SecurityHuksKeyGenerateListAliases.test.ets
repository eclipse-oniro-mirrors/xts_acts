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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { GenParam, GetDataBySize, DeleteParam } from './utils/HuksOptionUtil';

export default function SecurityHUKSKeyGenerateListAliasesTest() {
  let DEOption: huks.HuksOptions;
  let CEOption: huks.HuksOptions;
  let ECEOption: huks.HuksOptions;

  describe('SecurityHUKSKeyGenerateListAliasesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      DEOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE),
        ],
        inData: new Uint8Array()
      };
      let resArr: Array<string> = (await huks.listAliases(DEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], DEOption);
      }
      CEOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE),
        ],
        inData: new Uint8Array()
      };
      resArr = (await huks.listAliases(CEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], CEOption);
      }
      ECEOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_128),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE),
        ],
        inData: new Uint8Array()
      };
      resArr = (await huks.listAliases(ECEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], ECEOption);
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
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0100
     * @tc.name   : test listAliases with de level, process success
     * @tc.desc   : generate key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0100";
      let DEArr = ["DE_Alias-001", "DE_Alias-002", "DE_Alias-003", "DE_Alias-004", "DE_Alias-005"];
      let CEArr = ["CE_Alias-001", "CE_Alias-002", "CE_Alias-003", "CE_Alias-004", "CE_Alias-005"];
      let ECEArr = ["ECE_Alias-001", "ECE_Alias-002", "ECE_Alias-003", "ECE_Alias-004", "ECE_Alias-005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
        }
        let resArr = (await huks.listAliases(DEOption)).keyAliases;
        expect(resArr.length).assertEqual(DEArr.length);
        for (let i = 0; i < DEArr.length; i++) {
          expect(resArr.includes(DEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0200
     * @tc.name   : test listAliases with ce level, process success
     * @tc.desc   : generate key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level1
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0200";
      let DEArr = ["DE_Alias-001", "DE_Alias-002", "DE_Alias-003", "DE_Alias-004", "DE_Alias-005"];
      let CEArr = ["CE_Alias#:<>?\\\|001", "CE_Alias#:<>?\\\|002", "CE_Alias#:<>?\\\|003", "CE_Alias#:<>?\\\|004", "CE_Alias#:<>?\\\|005"];
      let ECEArr = ["ECE_Alias-001", "ECE_Alias-002", "ECE_Alias-003", "ECE_Alias-004", "ECE_Alias-005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
        }
        let resArr = (await huks.listAliases(CEOption)).keyAliases;
        expect(resArr.length).assertEqual(CEArr.length);
        for (let i = 0; i < CEArr.length; i++) {
          expect(resArr.includes(CEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0300
     * @tc.name   : test listAliases with ece level, process success
     * @tc.desc   : generate key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0300";
      let DEArr = ["DE_Alias-001", "DE_Alias-002", "DE_Alias-003", "DE_Alias-004", "DE_Alias-005"];
      let CEArr = ["CE_Alias-001", "CE_Alias-002", "CE_Alias-003", "CE_Alias-004", "CE_Alias-005"];
      let ECEArr = ["ECE_Alias#:<>?\\\|001", "ECE_Alias#:<>?\\\|002", "ECE_Alias#:<>?\\\|003", "ECE_Alias#:<>?\\\|004", "ECE_Alias#:<>?\\\|005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
        }
        let resArr = (await huks.listAliases(ECEOption)).keyAliases;
        expect(resArr.length).assertEqual(ECEArr.length);
        for (let i = 0; i < ECEArr.length; i++) {
          expect(resArr.includes(ECEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400
     * @tc.name   : test listAliases with default level, process success
     * @tc.desc   : generate key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400";
      let CEArr = ["C", "C" + GetDataBySize(63)];
      try {
        DeleteParam(CEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL);
        for (let arrElement of CEArr) {
          await huks.generateKeyItem(arrElement, CEOption);
        }
        let resArr = (await huks.listAliases(CEOption)).keyAliases;
        expect(resArr.length).assertEqual(CEArr.length);
        for (let i = 0; i < CEArr.length; i++) {
          expect(resArr.includes(CEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(CEArr[i], CEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0500
     * @tc.name   : test listAliases with de level, process success
     * @tc.desc   : generate key, delete some key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0500";
      let DEArr = ["DE_Alias#001", "DE_Alias#002", "DE_Alias#003", "DE_Alias#004", "DE_Alias#005"];
      let CEArr = ["CE_Alias#001", "CE_Alias#002", "CE_Alias#003", "CE_Alias#004", "CE_Alias#005"];
      let ECEArr = ["ECE_Alias#001", "ECE_Alias#002", "ECE_Alias#003", "ECE_Alias#004", "ECE_Alias#005"];
      let deleteArr = ["DE_Alias#004", "DE_Alias#005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
        }
        for (let arrElement of deleteArr) {
          await huks.deleteKeyItem(arrElement, DEOption);
        }
        let resArr = (await huks.listAliases(DEOption)).keyAliases;
        expect(resArr.length).assertEqual(DEArr.length - deleteArr.length);
        for (let i = 0; i < DEArr.length - deleteArr.length; i++) {
          expect(resArr.includes(DEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
        for (let i = DEArr.length - deleteArr.length; i < DEArr.length; i++) {
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0600
     * @tc.name   : test listAliases with ce level, process success
     * @tc.desc   : generate key, delete some key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0600";
      let DEArr = ["DE_Alias#001", "DE_Alias#002", "DE_Alias#003", "DE_Alias#004", "DE_Alias#005"];
      let CEArr = ["CE_Alias#001", "CE_Alias#002", "CE_Alias#003", "CE_Alias#004", "CE_Alias#005"];
      let ECEArr = ["ECE_Alias#001", "ECE_Alias#002", "ECE_Alias#003", "ECE_Alias#004", "ECE_Alias#005"];
      let deleteArr = ["CE_Alias#004", "CE_Alias#005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
        }
        for (let arrElement of deleteArr) {
          await huks.deleteKeyItem(arrElement, CEOption);
        }
        let resArr = (await huks.listAliases(CEOption)).keyAliases;
        expect(resArr.length).assertEqual(DEArr.length - deleteArr.length);
        for (let i = 0; i < DEArr.length - deleteArr.length; i++) {
          expect(resArr.includes(CEArr[i])).assertEqual(true);
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
        for (let i = DEArr.length - deleteArr.length; i < DEArr.length; i++) {
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0700
     * @tc.name   : test listAliases with ece level, process success
     * @tc.desc   : generate key, delete all key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0700";
      let DEArr = ["DE_Alias#001", "DE_Alias#002", "DE_Alias#003", "DE_Alias#004", "DE_Alias#005"];
      let CEArr = ["CE_Alias#001", "CE_Alias#002", "CE_Alias#003", "CE_Alias#004", "CE_Alias#005"];
      let ECEArr = ["ECE_Alias#001", "ECE_Alias#002", "ECE_Alias#003", "ECE_Alias#004", "ECE_Alias#005"];
      try {
        for (let i = 0; i < DEArr.length; i++) {
          await huks.generateKeyItem(DEArr[i], DEOption);
          await huks.generateKeyItem(CEArr[i], CEOption);
          await huks.generateKeyItem(ECEArr[i], ECEOption);
          await huks.deleteKeyItem(ECEArr[i], ECEOption);
        }
        let resArr = (await huks.listAliases(ECEOption)).keyAliases;
        expect(resArr.length).assertEqual(0);
        for (let i = DEArr.length; i < DEArr.length; i++) {
          await huks.deleteKeyItem(DEArr[i], DEOption);
          await huks.deleteKeyItem(CEArr[i], CEOption);
        }
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800
     * @tc.name   : test listAliases with default level, process success
     * @tc.desc   : list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800";
      try {
        DeleteParam(DEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL);
        let resArr = (await huks.listAliases(DEOption)).keyAliases;
        expect(resArr.length).assertEqual(0);
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0900
     * @tc.name   : test listAliases with 2049 DE level key, process fail
     * @tc.desc   : generate 2048 key, list aliases, generate one more key, list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0900";
      let CEArr = ["CE_Alias#001", "CE_Alias#002", "CE_Alias#003", "CE_Alias#004", "CE_Alias#005"];
      let ECEArr = ["ECE_Alias#001", "ECE_Alias#002", "ECE_Alias#003", "ECE_Alias#004", "ECE_Alias#005"];
      let DEArr: Array<string> = new Array();
      for (let i = 0; i < 2048; i++) {
        let str = "0000" + i;
        let keyAlias = "alias" + str.substring(str.length - 4);
        DEArr.push(keyAlias);
        await huks.generateKeyItem(DEArr[i], DEOption);
      }
      for (let i = 0; i < CEArr.length; i++) {
        await huks.generateKeyItem(CEArr[i], CEOption);
        await huks.generateKeyItem(ECEArr[i], ECEOption);
      }
      let resArr = (await huks.listAliases(DEOption)).keyAliases;
      expect(resArr.length).assertEqual(DEArr.length);
      for (let i = 0; i < DEArr.length; i++) {
        expect(resArr.includes(DEArr[i])).assertEqual(true);
        await huks.deleteKeyItem(DEArr[i], DEOption);
      }
      for (let i = 0; i < CEArr.length; i++) {
        await huks.deleteKeyItem(CEArr[i], CEOption);
        await huks.deleteKeyItem(ECEArr[i], ECEOption);
      }
      DEArr.push("alias2048");
      await huks.generateKeyItem(DEArr[2048], DEOption);
      try {
        await huks.listAliases(DEOption);
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        for (let i = 0; i < DEArr.length; i++) {
          await huks.deleteKeyItem(DEArr[i], DEOption);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000
     * @tc.name   : test listAliases with null, process fail
     * @tc.desc   : list aliases
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000";
      try {
        await huks.listAliases(null);
        expect(null).assertFail();
      } catch (err) {
        console.log(testNumber + `: catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

  })
}