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
import { MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils.ets';
import { Cipher, CipherData, GetEcbNoPaddingOptions } from './utils/huks/CipherUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import { GetDesGenerateOptions } from './utils/huks/GenerateKeyUtils.ets';


export default function SecurityHuksCipherDESTest() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipherDESTest', () => {

    beforeEach(() => {
      genKeyOption = GetDesGenerateOptions(64);
      cipherOption = MergeOptions(GetDesGenerateOptions(64), GetEcbNoPaddingOptions());
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_DES_API16_Func_0100
     * @tc.number SUB_Security_HUKS_Cipher_DES_API16_Func_0100
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_DES_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_DES_API16_Func_0100";
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_DES_API16_Func_0200
     * @tc.number SUB_Security_HUKS_Cipher_DES_API16_Func_0200
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_DES_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_DES_API16_Func_0200";
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"));
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_DES_API16_Func_0300
     * @tc.number SUB_Security_HUKS_Cipher_DES_API16_Func_0300
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_DES_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_DES_API16_Func_0300";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_DES_API16_Func_0400
     * @tc.number SUB_Security_HUKS_Cipher_DES_API16_Func_0400
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_DES_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_DES_API16_Func_0400";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(65)),
      }
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("12345678"));
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_DES_API16_Func_0500
     * @tc.number SUB_Security_HUKS_Cipher_DES_API16_Func_0500
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_DES_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_DES_API16_Func_0500";
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 128);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })
  }
  )
}