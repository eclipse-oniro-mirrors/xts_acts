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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { DeleteParam, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { HuksMaxAliasLength } from './utils/huks/HuksCommonUtils.ets';
import { GetDataBySize } from './utils/common/CommonUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';

export default function SecurityHUKSKeyGenerateListAliasesTest() {
  let DEOption: huks.HuksOptions;
  let CEOption: huks.HuksOptions;
  let ECEOption: huks.HuksOptions;

  describe('SecurityHUKSKeyGenerateListAliasesTest', () => {

    beforeEach(async () => {
      DEOption = GetAesGenerateOptions(128);
      SetParam(DEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
      let resArr: Array<string> = (await huks.listAliases(DEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], DEOption);
      }
      CEOption = GetAesGenerateOptions(128);
      SetParam(CEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
      resArr = (await huks.listAliases(CEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], CEOption);
      }
      ECEOption = GetAesGenerateOptions(128);
      SetParam(ECEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
      resArr = (await huks.listAliases(ECEOption)).keyAliases;
      for (let i = 0; i < resArr.length; i++) {
        await huks.deleteKeyItem(resArr[i], ECEOption);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0100
     * @tc.desc   generate key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0200
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0200
     * @tc.desc   generate key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0300
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0300
     * @tc.desc   generate key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400
     * @tc.desc   generate key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0400";
      let CEArr = ["C", "C" + GetDataBySize(HuksMaxAliasLength - 1)];
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0500
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0500
     * @tc.desc   generate key, delete some key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0600
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0600
     * @tc.desc   generate key, delete some key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0700
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0700
     * @tc.desc   generate key, delete all key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800
     * @tc.desc   list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0800";
      try {
        DeleteParam(DEOption, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL);
        let resArr = (await huks.listAliases(DEOption)).keyAliases;
        expect(resArr.length).assertEqual(0);
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0900
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_0900
     * @tc.desc   generate 2048 key, list aliases, generate one more key, list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        for (let i = 0; i < DEArr.length; i++) {
          await huks.deleteKeyItem(DEArr[i], DEOption);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000
     * @tc.number SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000
     * @tc.desc   list aliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_ListAliases_API12_Func_1000";
      try {
        await huks.listAliases(null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + ` catch error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

  })
}