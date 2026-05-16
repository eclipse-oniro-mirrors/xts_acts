/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';
import huks from '@ohos.security.huks';
import { BusinessError } from '@ohos.base';

export default class SecurityUtils {
  static async genSymKeyByData(symKeyData: Uint8Array, algName: string) {
    let symKeyBlob: cryptoFramework.DataBlob = {
      data: symKeyData
    };
    let aesGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey = await aesGenerator.convertKey(symKeyBlob);
    console.info('convertKey success');
    return symKey;
  }

  static genGcmParamsSpec() {
    let arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let dataIv = new Uint8Array(arr)
    let ivBlob: cryptoFramework.DataBlob = {
      data: dataIv
    }
    arr = [0, 0, 0, 0, 0, 0, 0, 0]
    let dataAad = new Uint8Array(arr)
    let aadBlob: cryptoFramework.DataBlob = {
      data: dataAad
    }
    arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let dataTag = new Uint8Array(arr)
    let tagBlob: cryptoFramework.DataBlob = {
      data: dataTag
    };
    let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
      iv: ivBlob,
      aad: aadBlob,
      authTag: tagBlob,
      algName: "GcmParamsSpec"
    };
    return gcmParamsSpec;
  }

  static genIvParamsSpec() {
    let arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let dataIv = new Uint8Array(arr)
    let ivBlob: cryptoFramework.DataBlob = {
      data: dataIv
    }
    let ivParamsSpec: cryptoFramework.IvParamsSpec = {
      algName: "IvParamsSpec",
      iv: ivBlob
    };
    return ivParamsSpec;
  }

  static genCcmParamsSpec() {
    let arr = [0, 0, 0, 0, 0, 0, 0]
    let dataIv = new Uint8Array(arr)
    let ivBlob: cryptoFramework.DataBlob = {
      data: dataIv
    }
    arr = [0, 0, 0, 0, 0, 0, 0, 0]
    let dataAad = new Uint8Array(arr)
    let aadBlob: cryptoFramework.DataBlob = {
      data: dataAad
    }
    arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let dataTag = new Uint8Array(arr)
    let tagBlob: cryptoFramework.DataBlob = {
      data: dataTag
    };
    let ccmParamsSpec: cryptoFramework.CcmParamsSpec = {
      iv: ivBlob,
      aad: aadBlob,
      authTag: tagBlob,
      algName: "CcmParamsSpec"
    };
    return ccmParamsSpec;
  }

  static async encryptMessagePromise(algName: string, symKey: cryptoFramework.SymKey,
                                     plainText: cryptoFramework.DataBlob,
                                     ivParams?: cryptoFramework.IvParamsSpec) {
    let cipher = cryptoFramework.createCipher(algName)
    if (ivParams) {
      await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams)
    }
    else {
      await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null)
    }
    let cipherData = await cipher.doFinal(plainText)
    return cipherData;
  }

  static async decryptMessagePromise(algName: string, symKey: cryptoFramework.SymKey,
                                     encryptUpdate: cryptoFramework.DataBlob,
                                     ivParams?: cryptoFramework.IvParamsSpec) {
    let decoder = cryptoFramework.createCipher(algName)
    if (ivParams) {
      await decoder.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
    }
    else {
      await decoder.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, null);
    }
    let decryptData = await decoder.doFinal(encryptUpdate);
    return decryptData;
  }

  static async encryptMessageByAESGCMPromise(algName: string, symKey: cryptoFramework.SymKey,
                                             plainText: cryptoFramework.DataBlob,
                                             gcmParams: cryptoFramework.GcmParamsSpec) {
    let cipher = cryptoFramework.createCipher(algName)
    await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParams)
    let encryptUpdate = await cipher.update(plainText)
    gcmParams.authTag = await cipher.doFinal(null)
    return encryptUpdate
  }

  static async decryptMessageByAESGCMPromise(algName: string, symKey: cryptoFramework.SymKey,
                                             encryptUpdate: cryptoFramework.DataBlob,
                                             gcmParams: cryptoFramework.GcmParamsSpec) {
    let decoder = cryptoFramework.createCipher(algName)
    await decoder.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, gcmParams)
    let decryptUpdate = await decoder.update(encryptUpdate)
    let decryptData = await decoder.doFinal(null)
    return decryptUpdate;
  }

  static async encryptMessageByAESCCMPromise(algName: string, symKey: cryptoFramework.SymKey,
                                             plainText: cryptoFramework.DataBlob,
                                             ccmParams: cryptoFramework.CcmParamsSpec) {
    let cipher = cryptoFramework.createCipher(algName)
    await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ccmParams)
    let encryptUpdate = await cipher.update(plainText)
    ccmParams.authTag = await cipher.doFinal(null)
    return encryptUpdate
  }

  static async decryptMessageByAESCCMPromise(algName: string, symKey: cryptoFramework.SymKey,
                                             encryptUpdate: cryptoFramework.DataBlob,
                                             ccmParams: cryptoFramework.CcmParamsSpec) {
    let decoder = cryptoFramework.createCipher(algName)
    await decoder.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ccmParams)
    let decryptUpdate = await decoder.update(encryptUpdate)
    let decryptData = await decoder.doFinal(null)
    return decryptUpdate;
  }

  static async signMessagePromise(signAlg: string, input: cryptoFramework.DataBlob, priKey: cryptoFramework.PriKey) {
    let signer = cryptoFramework.createSign(signAlg);
    await signer.init(priKey);
    let signData = await signer.sign(input);
    return signData;
  }

  static async verifyMessagePromise(verifyAlg: string, input: cryptoFramework.DataBlob,
                                    signMessageBlob: cryptoFramework.DataBlob, pubKey: cryptoFramework.PubKey) {
    let verifier = cryptoFramework.createVerify(verifyAlg);
    await verifier.init(pubKey);
    let res = await verifier.verify(input, signMessageBlob);
    return res;
  }

  static StringToUint8Array(str: String) {
    let arr: number[] = new Array();
    for (let i = 0, j = str.length; i < j; ++i) {
      arr.push(str.charCodeAt(i));
    }
    return new Uint8Array(arr);
  }

  static async generateKeyItem(keyAlias: string, huksKeyStorageType: huks.HuksKeyStorageType) {
    let properties: Array<huks.HuksParam> = new Array();
    properties[0] = {
      tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_AES,
    }
    properties[1] = {
      tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE,
    }
    properties[2] = {
      tag: huks.HuksTag.HUKS_TAG_DIGEST, value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256,
    }
    properties[3] = {
      tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128,
    }
    properties[4] = {
      tag: huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, value: huksKeyStorageType,
    }
    let huksOptions: huks.HuksOptions = {
      properties: properties, inData: new Uint8Array(new Array())
    }
    try {
      await huks.generateKeyItem(keyAlias, huksOptions)
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to generate key item. error: ${JSON.stringify(err)}`)
      return [false, huksOptions] as [boolean, huks.HuksOptions]
    }
    return [true, huksOptions] as [boolean, huks.HuksOptions]
  }

  static async deleteKeyItem(keyAlias: string, huksOptions: huks.HuksOptions) {
    try {
      await huks.deleteKeyItem(keyAlias, huksOptions)
      return true
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to update session. error: ${JSON.stringify(err)}`)
      return false
    }
  }

  static async createSession(keyAlias: string, HuksKeyDeriveKeySize: number, deriveHkdfInData: string) {
    let initProperties: Array<huks.HuksParam> = new Array();
    initProperties[0] = {
      tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_HKDF,
    }
    initProperties[1] = {
      tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE
    }
    initProperties[2] = {
      tag: huks.HuksTag.HUKS_TAG_DIGEST, value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256,
    }
    initProperties[3] = {
      tag: huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, value: HuksKeyDeriveKeySize,
    }
    let initOptions: huks.HuksOptions = {
      properties: initProperties, inData: new Uint8Array(new Array())
    }
    try {
      let sessionHandle = await huks.initSession(keyAlias, initOptions)
      let handle = sessionHandle.handle
      initOptions.inData = SecurityUtils.StringToUint8Array(deriveHkdfInData)
      return [handle, initOptions] as [number, huks.HuksOptions]
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to init session. error: ${JSON.stringify(err)}`)
      return [-1, initOptions] as [number, huks.HuksOptions]
    }
  }

  static async updateSession(handle: number, initOptions: huks.HuksOptions) {
    try {
      await huks.updateSession(handle, initOptions)
      return true
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to update session. error: ${JSON.stringify(err)}`)
      return false
    }
  }

  static async finishSession(keyAlias: string, handle: number) {
    let finishProperties: Array<huks.HuksParam> = new Array();
    finishProperties[0] = {
      tag: huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
      value: huks.HuksKeyStorageType.HUKS_STORAGE_KEY_EXPORT_ALLOWED,
    }
    finishProperties[1] = {
      tag: huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS, value: true,
    }
    finishProperties[2] = {
      tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_AES,
    }
    finishProperties[3] = {
      tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
    }
    finishProperties[4] = {
      tag: huks.HuksTag.HUKS_TAG_PURPOSE,
      value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
    }
    finishProperties[5] = {
      tag: huks.HuksTag.HUKS_TAG_DIGEST, value: huks.HuksKeyDigest.HUKS_DIGEST_NONE,
    }
    finishProperties[6] = {
      tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS, value: SecurityUtils.StringToUint8Array(keyAlias),
    }
    finishProperties[7] = {
      tag: huks.HuksTag.HUKS_TAG_PADDING, value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
    }
    finishProperties[8] = {
      tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE, value: huks.HuksCipherMode.HUKS_MODE_ECB,
    }
    let finishOptions: huks.HuksOptions = {
      properties: finishProperties, inData: new Uint8Array(new Array())
    }
    try {
      await huks.finishSession(handle, finishOptions)
      return true
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to update session. error: ${JSON.stringify(err)}`)
      return false
    }
  }
}