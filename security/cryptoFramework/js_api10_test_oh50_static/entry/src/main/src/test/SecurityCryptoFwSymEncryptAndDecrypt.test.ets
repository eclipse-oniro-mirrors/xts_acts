/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as syncSymEncAndDecUtils from './utils/syncSymEncAndDec/syncSymEncAndDecUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSymEncryptAndDecryptTestUnit() {
  describe("SecurityCryptoFwSymEncryptAndDecryptTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0000
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0000
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 16;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        for (let cipherSpec of syncSymEncAndDecUtils.STREAM_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          let modes: string[] = cipherSpec[1];
          let keyLens: string[] = cipherSpec[2];
          let padding: string = cipherSpec[3][0];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < modes.length; j++) {
              let mode: string = modes[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0001
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0001
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 13;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "ECB";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_ECB_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0002
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0002
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 20;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "CBC";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_CBC_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0003
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0003
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 88;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "CTR";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_CTR_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0004
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0004
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 88;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "OFB";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_OFB_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0005
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0005
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 88;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "CFB";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_CFB_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0006
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0006
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
      let dataLen: int = 88;
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "CFB128";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_CFB128_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              let dataPlainText: syncSymEncAndDecUtils.dataSpec = syncSymEncAndDecUtils.encryptDecryptMessageSync(algEncDecName, false, symKey, dataCipher.data, dataCipher.paramSpec);
              let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
              expect(ret).assertTrue();
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0007
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0007
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
      let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
      let specAlgName: string = "GcmParamsSpec";
      let dataLen: int = 20;
      let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "GCM";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_GCM_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.tagEncryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              if (dataCipher.data === null) {
                throw new Error("[TEST] Data is null.")
              } else {
                let dataPlainText: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.tagEncryptDecryptMessageSync(algEncDecName, false, symKey, (dataCipher.data) as cryptoFramework.DataBlob, dataCipher.paramSpec);
                let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
                expect(ret).assertTrue();
              }
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_008
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_008
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0];
      let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
      let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      let specAlgName: string = "CcmParamsSpec";
      let dataLen: int = 20;
      let paramSpec: cryptoFramework.CcmParamsSpec = syncSymEncAndDecUtils.genCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
      try {
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let mode: string = "CCM";
        for (let cipherSpec of syncSymEncAndDecUtils.MODE_CCM_CIPHER_SEPC) {
          let algName: string = cipherSpec[0][0];
          let keyLens: string[] = cipherSpec[1];
          let paddings: string[] = cipherSpec[2];
          for (let i = 0; i < keyLens.length; i++) {
            let keyLen: string = keyLens[i];
            for (let j = 0; j < paddings.length; j++) {
              let padding: string = paddings[j];
              let algEncDecName = Number(keyLen) != 0 ? `${algName}${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
              keyLen = Number(keyLen) != 0 ? keyLen : "128";
              keyLen = algName != "3DES" ? keyLen : "192";
              let algKeyName: string = algName + keyLen;
              if (algName == "SM4") {
                algEncDecName = Number(keyLen) != 0 ? `${algName}_${keyLen}|${mode}|${padding}` : `${algName}|${mode}|${padding}`;
                algKeyName = Number(keyLen) != 0 ? `${algName}_${keyLen}` : algName + "_128";
              }
              let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algKeyName);
              let dataCipher: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.tagEncryptDecryptMessageSync(algEncDecName, true, symKey, data, paramSpec);
              if (dataCipher.data === null) {
                throw new Error("[TEST] Data is null.")
              } else {
                let dataPlainText: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.tagEncryptDecryptMessageSync(algEncDecName, false, symKey, (dataCipher.data) as cryptoFramework.DataBlob, dataCipher.paramSpec);
                let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText.data);
                expect(ret).assertTrue();
              }
            }
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0100
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0100
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let dataLen: int = 127;
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let algName: string = "RSA1024";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let padding: string = "NoPadding";
        let encAlgName: string = algName + "|" + padding;
        syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, data, true);
        expect(null).assertNull();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0200
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0200
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_CIPHER_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let paddings: string[] = rsaSpec[1];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          for (let j = 0; j < paddings.length; j++) {
            let padding: string = paddings[j];
            let dataLen: int = padding == "NoPadding" ? Number(rsaSpec[2][0]) as int : Number(rsaSpec[2][1]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? algName + "|" + padding : "RSA" + "|" + padding;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0300
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0300
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
          let algName: string = "RSA512";
          let padding: string = "PKCS1_OAEP";
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = "MD5";
          let maskName: string = "MGF1_MD5";
          let dataLen: int = 64 - 16 - 16 - 2 + 1;
          let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
          let encAlgName: string = `${algName}|${padding}|${mdName}|${maskName}`;
          syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
          expect(null).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0400
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0400
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0401
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0401
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA3072_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0402
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0402
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA4096_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0403
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0403
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0403", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_MD5_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0404
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0404
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0404", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0405
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0405
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0405", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0406
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0406
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0406", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0407
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0407
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0407", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0408
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0408
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0408", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let rsaSpec of syncSymEncAndDecUtils.ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC) {
          let algName: string = rsaSpec[0][0] != "RSA" ? rsaSpec[0][0] : "RSA2048";
          let padding: string = rsaSpec[1][0];
          let keyPair= await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let mdName: string = rsaSpec[2][0];
          let masksName: string[] = rsaSpec[3];
          for (let maskNameId = 0; maskNameId < masksName.length; maskNameId++) {
            let maskName: string = rsaSpec[3][maskNameId];
            let dataLen: int = Number(rsaSpec[4][0]) as int;
            let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
            let encAlgName: string = rsaSpec[0][0] != "RSA" ? `${algName}|${padding}|${mdName}|${maskName}` : `RSA|${padding}|${mdName}|${maskName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymOAaepMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: Boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0500
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0500
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let dataLen: int = 128;
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let algName: string = "RSA1024";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let padding: string = "PKCS7";
        let encAlgName: string = algName + "|" + padding;
        syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, data, true);
        expect(null).assertNull();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0600
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0600
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algName);
        let padding: string = "PKCS7";
        let encAlgName: string = algName + "|XTS|" + padding;
        let cipher = cryptoFramework.createCipher(encAlgName);
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let paramSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0700
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0700
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let padding: string = "PKCS1";
        let encAlgName: string = algName + "|" + padding;
        let cipher = cryptoFramework.createCipher(encAlgName);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.priKey, null)
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0800
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0800
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let dataLen: int = 117;
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let algName: string = "RSA1024";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let padding: string = "PKCS1";
        let encAlgName: string = algName + "|" + padding;
        syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, data, true);
        let cipher = cryptoFramework.createCipher(algName);
        cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.pubKey, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0900
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0900
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "AES128";
        let encAlgName: string = "AES128|GCM|PKCS7";
        let keySym: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algName);
        let cipher = cryptoFramework.createCipher(encAlgName);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keySym, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1000
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1000
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM2_256";
        let encAlgName: string = "SM2_256|SM3";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let cipher = cryptoFramework.createCipher(encAlgName);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
        cipher.doFinalSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1100
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1100
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let encAlgName: string = "RSA2048|PKCS1";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let cipher = cryptoFramework.createCipher(encAlgName);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
        cipher.doFinalSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1200
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1200
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let encAlgName: string = "RSA2048|PKCS1";
        let dataLen: int = 512;
        let cipherText1 = new Uint8Array();
        let cipherText2 = new Uint8Array();
        let cipherPlainText1 = new Uint8Array();
        let cipherPlainText2 = new Uint8Array();
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let cipher = cryptoFramework.createCipher(encAlgName);
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
        for(let dataSize = 0; dataSize < dataLen / 16; dataSize++) {
          let tmp = data.data.subarray(16 * dataSize, 16 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher = cipher.doFinalSync(doFinalText);
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText = new Uint8Array(cipherText1.length + encryptCipher.data.length);
          mergeText.set(cipherText1);
          mergeText.set(encryptCipher.data, cipherText1.length);
          cipherText1 = mergeText;
        }
        let mergeCipher: cryptoFramework.DataBlob = {data: cipherText1};
        for(let dataSize = 0; dataSize < dataLen / 32; dataSize++) {
          let tmp = data.data.subarray(32 * dataSize, 32 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher = cipher.doFinalSync(doFinalText);
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText = new Uint8Array(cipherText2.length + encryptCipher.data.length);
          mergeText.set(cipherText2);
          mergeText.set(encryptCipher.data, cipherText2.length);
          cipherText2 = mergeText;
        }
        let mergeCipher2: cryptoFramework.DataBlob = {data: cipherText2};
        let decCipher1 = cryptoFramework.createCipher(encAlgName);
        decCipher1.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
        let decCipher2 = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
        for(let dataSize = 0; dataSize < mergeCipher.data.byteLength / 256; dataSize++) {
          let tmp1 = mergeCipher.data.subarray(256 * dataSize, 256 * (dataSize + 1));
          let text1: cryptoFramework.DataBlob = { data:tmp1 };
          let dataPlainText1: cryptoFramework.DataBlob|null = decCipher1.doFinalSync(text1);
          if (dataPlainText1 === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText1 = new Uint8Array(cipherPlainText1.length + dataPlainText1.data.length);
          mergeText1.set(cipherPlainText1);
          mergeText1.set(dataPlainText1.data, cipherPlainText1.length);
          cipherPlainText1 = mergeText1;
        }
        for(let dataSize = 0; dataSize < mergeCipher2.data.byteLength / 256; dataSize++) {
          let tmp2 = mergeCipher2.data.subarray(256 * dataSize, 256 * (dataSize + 1));
          let text2: cryptoFramework.DataBlob = { data:tmp2 };
          let dataPlainText2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync(text2);
          if (dataPlainText2 === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText2 = new Uint8Array(cipherPlainText2.length + dataPlainText2.data.length);
          mergeText2.set(cipherPlainText2);
          mergeText2.set(dataPlainText2.data, cipherPlainText2.length);
          cipherPlainText2 = mergeText2;
        }
        let ret: boolean = commonUtils.compareDataBlob({data: cipherText1}, {data: cipherText1});
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1300
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1300
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|CFB|PKCS7"
        let dataLen: int = 512;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let cipherText1 = new Uint8Array();
        let cipherText2 = new Uint8Array();
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algName);
        let paramsSpec: cryptoFramework.IvParamsSpec = syncSymEncAndDecUtils.genIvParamsSpec(dataIv);
        let encCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        encCipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
        let encCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        encCipher2.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
        for(let dataSize = 0; dataSize < dataLen / 16; dataSize++) {
          let tmp = data.data.subarray(16 * dataSize, 16 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher: cryptoFramework.DataBlob|null = encCipher1.updateSync(doFinalText);
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText = new Uint8Array(cipherText1.length + encryptCipher.data.length);
          mergeText.set(cipherText1);
          mergeText.set(encryptCipher.data, cipherText1.length);
          cipherText1 = mergeText;
        }
        for(let dataSize = 0; dataSize < dataLen / 32; dataSize++) {
          let tmp = data.data.subarray(32 * dataSize, 32 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher: cryptoFramework.DataBlob|null = encCipher2.updateSync(doFinalText);
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText = new Uint8Array(cipherText2.length + encryptCipher.data.length);
          mergeText.set(cipherText2);
          mergeText.set(encryptCipher.data, cipherText2.length);
          cipherText2 = mergeText;
        }
        let decCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher1.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
        let decCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
        let cipherPlainText1: cryptoFramework.DataBlob|null = decCipher1.doFinalSync({data: cipherText1});
        let cipherPlainText2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync({data: cipherText2});
        let ret: boolean = commonUtils.compareDataBlob(cipherPlainText1, cipherPlainText2);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1400
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1400
     * @tc.desc   algorithm is SM2_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for(let sm2Spec of syncSymEncAndDecUtils.ASY_SM2_CIPHER_OAEP_SPEC) {
          let algName: string = sm2Spec[0][0] == "SM2" ? "SM2_256": sm2Spec[0][0];
          let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
          let dataLen: int = 256;
          let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
          for (let mdName of sm2Spec[1]) {
            let encAlgName: string = `${algName}|${mdName}`;
            let dataCipher: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, data, true);
            let dataPlainText: cryptoFramework.DataBlob = syncSymEncAndDecUtils.encryptDecryptAsymMessageSync(encAlgName, keyPair, dataCipher, false);
            let ret: boolean = commonUtils.compareDataBlob(data, dataPlainText);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertNull();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1500
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1500
     * @tc.desc   algorithm is SM2_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM2_256";
        let mdName: string = "SM3";
        let keyPair: cryptoFramework.KeyPair = await syncSymEncAndDecUtils.createAsymKeySync(algName);
        let dataLen: int = 512;
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let encAlgName: string = `${algName}|${mdName}`;
        let cipherText1 = new Uint8Array();
        let cipherText2 = new Uint8Array();
        let decText1 = new Uint8Array();
        let decText2 = new Uint8Array();
        let encCipherIndex1: int[] = [];
        let encCipherIndex2: int[] = [];
        let encTotal1: int = 0;
        let encTotal2: int = 0;
        let encCipher1 = cryptoFramework.createCipher(encAlgName);
        encCipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
        let encCipher2 = cryptoFramework.createCipher(encAlgName);
        encCipher2.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
        for(let dataSize = 0; dataSize < dataLen / 16; dataSize++) {
          let tmp = data.data.subarray(16 * dataSize, 16 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher: cryptoFramework.DataBlob|null = encCipher1.doFinalSync(doFinalText);
          // encCipherIndex1[dataSize] = encryptCipher.data.byteLength;
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          encCipherIndex1.push(encryptCipher.data.byteLength);
          let mergeText = new Uint8Array(cipherText1.length + encryptCipher.data.length);
          mergeText.set(cipherText1);
          mergeText.set(encryptCipher.data, cipherText1.length);
          cipherText1 = mergeText;
        }
        for(let dataSize = 0; dataSize < dataLen / 32; dataSize++) {
          let tmp = data.data.subarray(32 * dataSize, 32 * (dataSize + 1));
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let encryptCipher: cryptoFramework.DataBlob|null = encCipher2.doFinalSync(doFinalText);
          // encCipherIndex2[dataSize] = encryptCipher.data.byteLength;
          if (encryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          encCipherIndex2.push(encryptCipher.data.byteLength);
          let mergeText = new Uint8Array(cipherText2.length + encryptCipher.data.length);
          mergeText.set(cipherText2);
          mergeText.set(encryptCipher.data, cipherText2.length);
          cipherText2 = mergeText;
        }
        let decCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher1.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
        let decCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
        for (let index = 0; index < encCipherIndex1.length; index++) {
          let tmp = cipherText1.subarray(encTotal1, encTotal1 + encCipherIndex1[index]);
          let cipherPlain1: cryptoFramework.DataBlob|null = decCipher1.doFinalSync({data: tmp});
          if (cipherPlain1 === null) {
            throw new Error("[TEST] Data is null.")
          }
          encTotal1 = encTotal1 + encCipherIndex1[index];
          let mergeText = new Uint8Array(decText1.length + cipherPlain1.data.length);
          mergeText.set(decText1);
          mergeText.set(cipherPlain1.data, decText1.length);
          decText1 = mergeText;
        }
        for (let index = 0; index < encCipherIndex2.length; index++) {
          let tmp = cipherText2.subarray(encTotal2, encTotal2 + encCipherIndex2[index]);
          let cipherPlain2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync({data: tmp});
          if (cipherPlain2 === null) {
            throw new Error("[TEST] Data is null.")
          }
          encTotal2 = encTotal2 + encCipherIndex2[index];
          let mergeText = new Uint8Array(decText2.length + cipherPlain2.data.length);
          mergeText.set(decText2);
          mergeText.set(cipherPlain2.data, decText2.length);
          decText2 = mergeText;
        }
        let ret: boolean = commonUtils.compareDataBlob({data: decText1}, {data: decText2});
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1600
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1600
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataLen: int = 512;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = syncSymEncAndDecUtils.createSymKeySync(algName);
        let cipherData1: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.gcmEncOrDecMessageSync(encAlgName,
          true, symKey, 16, dataLen, data, paramSpec);
        let decCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher1.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText1: cryptoFramework.DataBlob|null = decCipher1.doFinalSync(cipherData1.data);

        let cipherData2: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.gcmEncOrDecMessageSync(encAlgName,
          true, symKey, 32, dataLen, data, paramSpec);
        let decCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync(cipherData2.data);
        let ret: boolean = commonUtils.compareDataBlob(cipherPlainText1, cipherPlainText2);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1700
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1700
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataLen: int = 512;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let cipherData1: syncSymEncAndDecUtils.dataGcmOrCCMSpec = await syncSymEncAndDecUtils.gcmEncOrDecMessagePromise(encAlgName,
          true, symKey, 16, dataLen, data, paramSpec);
        let decCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        await decCipher1.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText1: cryptoFramework.DataBlob|null = await decCipher1.doFinal(cipherData1.data);

        let cipherData2: syncSymEncAndDecUtils.dataGcmOrCCMSpec = syncSymEncAndDecUtils.gcmEncOrDecMessageSync(encAlgName,
          true, symKey, 32, dataLen, data, paramSpec);
        let decCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync(cipherData2.data);
        let ret: boolean = commonUtils.compareDataBlob(cipherPlainText1, cipherPlainText2);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1800
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1800
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let authTag1: cryptoFramework.GcmParamsSpec = await syncSymEncAndDecUtils.gcmEncOrDecNullPromise(encAlgName, true, symKey, paramSpec);
        let decCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        await decCipher1.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText1: cryptoFramework.DataBlob|null = await decCipher1.doFinal(null);
        let authTag2: cryptoFramework.GcmParamsSpec = await syncSymEncAndDecUtils.gcmEncOrDecNullPromise(encAlgName, true, symKey, paramSpec);
        let decCipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let cipherPlainText2: cryptoFramework.DataBlob|null = decCipher2.doFinalSync(null);
        expect(cipherPlainText1).assertNull();
        expect(cipherPlainText2).assertNull();
        let ret: boolean = commonUtils.compareDataBlob(authTag1.authTag, authTag2.authTag);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1900
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1900
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataLen: int = 128;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let cipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        cipher1.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        await cipher1.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        let cipherData: cryptoFramework.DataBlob|null = await cipher1.update(data);
        try {
          await cipher1.doFinal(data);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(17630001)
        }
        try {
          await cipher1.doFinal(null);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401)
        }
        let cipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher2.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        let cipherDataTmp = cipher2.doFinalSync(data);
        if (cipherDataTmp === null) {
          throw new Error("[TEST] DoFinal failed.")
        }
        let authTag = cipherDataTmp.data.subarray(cipherDataTmp.data.byteLength - 16, cipherDataTmp.data.byteLength);
        let cipherData2: cryptoFramework.DataBlob = {data: cipherDataTmp.data.subarray(0, cipherDataTmp.data.byteLength - 16)}
        let ret: boolean = commonUtils.compareDataBlob(cipherData, cipherData2);
        expect(ret).assertTrue();
        expect(authTag.byteLength).assertEqual(16);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2000
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2000
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "HMAC";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let keyLen: int = 15;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let symKeyBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.convertSymKeyPromise(algName, symKeyBlob);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        try {
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec)
          expect(null).assertFail();
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(401);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2100
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2100
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataLen: int = 128;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let cipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        let cipherData: cryptoFramework.DataBlob|null = await cipher1.update(data);
        let authTag = await cipher1.doFinal(null);
        if (authTag === null) {
          throw new Error("[TEST] DoFinal failed.")
        }
        expect(authTag.data.byteLength).assertEqual(16);
        paramSpec.authTag = authTag;
        let cipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let plainText = await cipher2.doFinal(cipherData);
        let ret: boolean = commonUtils.compareDataBlob(data, plainText);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2200
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2200
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|PKCS7"
        let dataLen: int = 128;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let cipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        let cipherData: cryptoFramework.DataBlob|null = await cipher1.update(data);
        let authTag = await cipher1.doFinal(null);
        if (authTag === null) {
          throw new Error("[TEST] DoFinal failed.")
        } else {
          expect(authTag.data.byteLength).assertEqual(16);
          paramSpec.authTag = authTag;
        }
        let cipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        cipher2.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        let plainText = await cipher2.doFinal(cipherData);
        let ret: boolean = commonUtils.compareDataBlob(data, plainText);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2300
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2300
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let encAlgName: string = "SM4_128|GCM|NoPadding"
        let dataLen: int = 128;
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let cipher1 : cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        try {
          cipher1.updateSync(data);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(401)
        }
        try {
          cipher1.doFinalSync(data);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(401)
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2400
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2400
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM|NoPadding";
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        for (let vector of syncSymEncAndDecUtils.SM4_GCM_VECTOR) {
          let dataIv: number[] = vector.iv;
          let dataAad: number[] = vector.aad;
          let dataKey: number[] = vector.key;
          let dataPlain: number[] = vector.plainText;
          let keyBlob: cryptoFramework.DataBlob = {
            data: new Uint8Array(dataKey)
          }
          let plainBlob: cryptoFramework.DataBlob = {
            data: new Uint8Array(dataPlain)
          }
          let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
          let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.convertSymKeyPromise(algName, keyBlob);
          let cipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
          cipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
          let cipherData: cryptoFramework.DataBlob|null = await cipher1.update(plainBlob);
          let authTag = await cipher1.doFinal(null);
          let ret: boolean = commonUtils.compareDataBlob(cipherData, {data: new Uint8Array(vector.cipherText)});
          ret = ret && commonUtils.compareDataBlob(authTag, {data: new Uint8Array(vector.authTag)});
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2500
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2500
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM4_128";
        let encAlgName: string = "SM4_128|GCM"
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        for (let vector of syncSymEncAndDecUtils.SM4_GCM_VECTOR) {
          let dataIv: number[] = vector.iv;
          let dataAad: number[] = vector.aad;
          let dataKey: number[] = vector.key;
          let dataPlain: number[] = vector.plainText;
          let keyBlob: cryptoFramework.DataBlob = {
            data: new Uint8Array(dataKey)
          }
          let plainBlob: cryptoFramework.DataBlob = {
            data: new Uint8Array(dataPlain)
          }
          let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
          let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.convertSymKeyPromise(algName, keyBlob);
          let cipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
          cipher1.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
          let cipherData: cryptoFramework.DataBlob|null = await cipher1.update(plainBlob);
          let authTag = await cipher1.doFinal(null);
          let ret: boolean = commonUtils.compareDataBlob(cipherData, {data: new Uint8Array(vector.cipherText)});
          ret = ret && commonUtils.compareDataBlob(authTag, {data: new Uint8Array(vector.authTag)});
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2600
     * @tc.number SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2600
     * @tc.desc   algorithm is AES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymEncryptAndDecrypt_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "AES128";
        let encAlgName: string = "AES128|GCM|PKCS7"
        let dataLen: int = 128;
        let dataIv: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let dataAad: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let dataTag: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0];
        let specAlgName: string = "GcmParamsSpec";
        let blockSize: int = 20;
        let paramSpec: cryptoFramework.GcmParamsSpec = syncSymEncAndDecUtils.genGcmOrCcmParamsSpec(dataIv, dataAad, dataTag, specAlgName);
        let data: cryptoFramework.DataBlob = await commonUtils.createData(dataLen);
        let symKey: cryptoFramework.SymKey = await syncSymEncAndDecUtils.createSymKeyPromise(algName);
        let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        encCipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
        let cipherText1: cryptoFramework.DataBlob|null = encCipher.doFinalSync(data);
        if (cipherText1 === null) {
          throw new Error("[TEST] Data is null.")
        }
        paramSpec.authTag = {data: cipherText1.data.subarray(cipherText1.data.length - 16 , cipherText1.data.length)};
        let plainText1 = new Uint8Array();
        let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(encAlgName);
        decCipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
        for(let dataSize = 0; dataSize < dataLen / blockSize + 1; dataSize++) {
          let tmp: Uint8Array = new Uint8Array();
          if (dataSize == 6) {
            tmp = cipherText1.data.subarray(blockSize * dataSize, 128);
          } else {
            tmp = cipherText1.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
          }
          let doFinalText: cryptoFramework.DataBlob = { data:tmp };
          let decryptCipher: cryptoFramework.DataBlob|null = decCipher.updateSync(doFinalText);
          if (decryptCipher === null) {
            throw new Error("[TEST] Data is null.")
          }
          let mergeText = new Uint8Array(plainText1.length + decryptCipher.data.length);
          mergeText.set(plainText1);
          mergeText.set(decryptCipher.data, plainText1.length);
          plainText1 = mergeText;
        }
        let noData: cryptoFramework.DataBlob|null = decCipher.doFinalSync(null);
        expect(noData).assertNull();
        let ret = commonUtils.compareDataBlob({data: plainText1}, data)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  })
}