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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { SetParam, MergeOption } from './utils/HuksOptionUtil';
import { GetEd25519GenerateOption, GetX25519GenerateOption } from './options/GenerateKeyOptions';
import { GetAttestKeyOption } from './options/AttestKeyOptions';
import { GetImportPubKeyOptions } from './options/ImportOptions';


export default function SecurityHuksKeyAttestationTest() {

  describe('SecurityHuksKeyAttestationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number : SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100
     * @tc.name   : test x25519 anonAttest, process success
     * @tc.desc   : generate key, anonAttest key
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOption(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOption(GetX25519GenerateOption(256), GetAttestKeyOption());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200
     * @tc.name   : test x25519 anonAttest, process success
     * @tc.desc   : import key, anonAttest key
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOption(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOption(GetX25519GenerateOption(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOption(GetX25519GenerateOption(256), GetAttestKeyOption());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300
     * @tc.name   : test ed25519 anonAttest, process success
     * @tc.desc   : generate key, anonAttest key
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOption(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOption(GetEd25519GenerateOption(256), GetAttestKeyOption());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400
     * @tc.name   : test ed25519 anonAttest, process success
     * @tc.desc   : import key, anonAttest key
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOption(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOption(GetEd25519GenerateOption(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOption(GetEd25519GenerateOption(256), GetAttestKeyOption());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        SetParam(importPubKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        console.log(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

  }
  )
}