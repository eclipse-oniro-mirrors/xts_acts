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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { GetEd25519GenerateOptions, GetX25519GenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils.ets';
import { GetImportPubKeyOptions } from './utils/huks/ImportKeyUtils.ets';
import { Logger } from './utils/common/Logger.ets';
import { CheckWifiInfo } from './utils/common/NetworkUtils';


export default function SecurityHuksKeyAttestationTest() {

  describe('SecurityHuksKeyAttestationTest', () => {

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100
     * @tc.desc   generate key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await CheckWifiInfo();
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOptions(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await CheckWifiInfo();
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0200";
      let genKeyOptions: huks.HuksOptions = GetX25519GenerateOptions(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetX25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300
     * @tc.desc   generate key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await CheckWifiInfo();
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0300";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOptions(256);
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = (await huks.anonAttestKeyItem(testNumber, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400
     * @tc.number SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400
     * @tc.desc   import key, anonAttest key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await CheckWifiInfo();
      let testNumber: string = "SUB_Security_HUKS_KeyAttestation_AnonAttestKey_API16_Func_0400";
      let genKeyOptions: huks.HuksOptions = GetEd25519GenerateOptions(256);
      let importPubKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetImportPubKeyOptions());
      let anonAttestKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(256), GetAttestKeyOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        importPubKeyOptions.inData = (await huks.exportKeyItem(testNumber, genKeyOptions)).outData as Uint8Array;
        SetParam(importPubKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        let importKeyAlias: string = testNumber + "pub";
        await huks.importKeyItem(importKeyAlias, importPubKeyOptions);
        let res = (await huks.anonAttestKeyItem(importKeyAlias, anonAttestKeyOptions)).certChains as Array<string>;
        expect(res.length).assertEqual(3);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${err.code}`);
        expect(null).assertFail();
      }
    })
  }
  )
}