/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { CipherData, DoCipher, DoCipherAsUser, GetGcmNoPaddingOptions } from './CipherUtils';
import { GetAesGenerateOptions, GetEccGenerateOptions } from './GenerateKeyUtils';
import { GetAesImportData } from './ImportKeyUtils';
import { StringToUint8Array } from '../common/CommonUtils';
import { MergeOptions, SetParam } from './HuksOptionsUtils';

function assignLength(length: number, arrayBuf: Uint8Array, startIndex: number) {
  let index = startIndex;
  let mask = [0x000000FF, 0x0000FF00, 0x00FF0000, 0xFF000000];
  for (let i = 0; i < 4; i++) {
    arrayBuf[index++] = (length & mask[i]) >> (i * 8);
  }
  return 4;
}

function assignData(data: Uint8Array, arrayBuf: Uint8Array, startIndex: number) {
  let index = startIndex;
  for (let i = 0; i < data.length; i++) {
    arrayBuf[index++] = data[i];
  }
  return data.length;
}

async function BuildWrappedData(plainKeySize: number, pubKey: Uint8Array, aad: Uint8Array, nonce: Uint8Array, kekEncryptedData: Uint8Array,
  agreeKeyEncryptedData: Uint8Array) {
  let FILED_LENGTH = 4;
  let TAG_SIZE = 16;
  let plainKeySizeBuff = new Uint8Array(4);
  assignLength(plainKeySize, plainKeySizeBuff, 0);
  let kekEncryptedDataAad = kekEncryptedData.slice(kekEncryptedData.length - aad.length, kekEncryptedData.length);
  kekEncryptedData = kekEncryptedData.slice(0, kekEncryptedData.length - aad.length);
  let agreeKeyEncryptedDataAad = agreeKeyEncryptedData.slice(agreeKeyEncryptedData.length - aad.length, agreeKeyEncryptedData.length);
  agreeKeyEncryptedData = agreeKeyEncryptedData.slice(0, agreeKeyEncryptedData.length - aad.length);
  let wrappedData = new Uint8Array(
    FILED_LENGTH + pubKey.length +
      FILED_LENGTH + aad.length +
      FILED_LENGTH + nonce.length +
      FILED_LENGTH + TAG_SIZE +
      FILED_LENGTH + agreeKeyEncryptedData.length +
      FILED_LENGTH + aad.length +
      FILED_LENGTH + nonce.length +
      FILED_LENGTH + TAG_SIZE +
      FILED_LENGTH + plainKeySizeBuff.length +
      FILED_LENGTH + kekEncryptedData.length
  );
  let index = 0;
  index += assignLength(pubKey.length, wrappedData, index); // 4
  index += assignData(pubKey, wrappedData, index); // 91
  index += assignLength(aad.length, wrappedData, index); // 4
  index += assignData(aad, wrappedData, index); // 16
  index += assignLength(nonce.length, wrappedData, index); // 4
  index += assignData(nonce, wrappedData, index); // 12
  index += assignLength(agreeKeyEncryptedDataAad.length, wrappedData, index); // 4
  index += assignData(agreeKeyEncryptedDataAad, wrappedData, index); // 16
  index += assignLength(agreeKeyEncryptedData.length, wrappedData, index); // 4
  index += assignData(agreeKeyEncryptedData, wrappedData, index); // 32
  index += assignLength(aad.length, wrappedData, index); // 4
  index += assignData(aad, wrappedData, index); // 16
  index += assignLength(nonce.length, wrappedData, index); // 4
  index += assignData(nonce, wrappedData, index); // 12
  index += assignLength(kekEncryptedDataAad.length, wrappedData, index); // 4
  index += assignData(kekEncryptedDataAad, wrappedData, index); // 16
  index += assignLength(plainKeySizeBuff.length, wrappedData, index); // 4
  index += assignData(plainKeySizeBuff, wrappedData, index); // 4
  index += assignLength(kekEncryptedData.length, wrappedData, index); // 4
  index += assignData(kekEncryptedData, wrappedData, index); // 24
  return wrappedData;
}

export async function BuildWrappedKeyData(deviceAPubKeyData: Uint8Array): Promise<Uint8Array> {
  let kekSize = 256;
  let kekAlias = "kekAlias";
  let genKekKeyOptions = GetAesGenerateOptions(kekSize);
  let kekData = GetAesImportData(kekSize);
  genKekKeyOptions.inData = kekData;
  await huks.importKeyItem(kekAlias, genKekKeyOptions);
  let plainKeySize = 192;
  let plainKeyData = GetAesImportData(plainKeySize);
  let kekEncryptData: CipherData = {
    updateDataArr: null,
    finishData: plainKeyData
  }
  let kekEncryptOptions = MergeOptions(GetAesGenerateOptions(kekSize), GetGcmNoPaddingOptions());
  let kekEncryptedData = (await DoCipher(kekAlias, kekEncryptOptions, kekEncryptData)).finishData as Uint8Array;
  let keyPairSize = 256;
  let keyPairAlias = "deviceBKeyPairAlias";
  let genKeyPairOptions = GetEccGenerateOptions(keyPairSize);
  SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
  await huks.generateKeyItem(keyPairAlias, genKeyPairOptions);
  let agreeKeySize = 256;
  let agreeKeyAlias = "agreeKeyAlias";
  let agreeInitOptions = GetEccGenerateOptions(keyPairSize);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECDH);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, agreeKeySize / 8);
  agreeInitOptions.inData = deviceAPubKeyData;
  let agreeFinishOptions = GetAesGenerateOptions(agreeKeySize);
  SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS);
  SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(agreeKeyAlias));
  let handle = (await huks.initSession(keyPairAlias, agreeInitOptions)).handle as number;
  await huks.updateSession(handle, agreeInitOptions);
  await huks.finishSession(handle, agreeFinishOptions);
  let agreeKeyEnceyptData: CipherData = {
    updateDataArr: null,
    finishData: kekData
  }
  let agreeKeyEncryptOptions = MergeOptions(GetAesGenerateOptions(agreeKeySize), GetGcmNoPaddingOptions());
  let agreeKeyEncryptedData = (await DoCipher(agreeKeyAlias, agreeKeyEncryptOptions, agreeKeyEnceyptData)).finishData as Uint8Array;
  let deviceBPubKeyData = (await huks.exportKeyItem(keyPairAlias, genKeyPairOptions)).outData as Uint8Array;
  let NONCE = StringToUint8Array("120123456789");
  let AAD = StringToUint8Array("1601234567890123");
  return BuildWrappedData(plainKeySize, deviceBPubKeyData, AAD, NONCE, kekEncryptedData, agreeKeyEncryptedData);
}

export async function BuildWrappedKeyDataAsUser(userId: number, deviceAPubKeyData: Uint8Array): Promise<Uint8Array> {
  let kekSize = 256;
  let kekAlias = "kekAlias";
  let genKekKeyOptions = GetAesGenerateOptions(kekSize);
  let kekData = GetAesImportData(kekSize);
  genKekKeyOptions.inData = kekData;
  await huks.importKeyItemAsUser(userId, kekAlias, genKekKeyOptions);
  let plainKeySize = 192;
  let plainKeyData = GetAesImportData(plainKeySize);
  let kekEncryptData: CipherData = {
    updateDataArr: null,
    finishData: plainKeyData
  }
  let kekEncryptOptions = MergeOptions(GetAesGenerateOptions(kekSize), GetGcmNoPaddingOptions());
  let kekEncryptedData = (await DoCipherAsUser(userId, kekAlias, kekEncryptOptions, kekEncryptData)).finishData as Uint8Array;
  let keyPairSize = 256;
  let keyPairAlias = "deviceBKeyPairAlias";
  let genKeyPairOptions = GetEccGenerateOptions(keyPairSize);
  SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
  await huks.generateKeyItemAsUser(userId, keyPairAlias, genKeyPairOptions);
  let agreeKeySize = 256;
  let agreeKeyAlias = "agreeKeyAlias";
  let agreeInitOptions = GetEccGenerateOptions(keyPairSize);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECDH);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
  SetParam(agreeInitOptions, huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, agreeKeySize / 8);
  agreeInitOptions.inData = deviceAPubKeyData;
  let agreeFinishOptions = GetAesGenerateOptions(agreeKeySize);
  SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS);
  SetParam(agreeFinishOptions, huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(agreeKeyAlias));
  let handle = (await huks.initSessionAsUser(userId, keyPairAlias, agreeInitOptions)).handle as number;
  await huks.updateSession(handle, agreeInitOptions);
  await huks.finishSession(handle, agreeFinishOptions);
  let agreeKeyEnceyptData: CipherData = {
    updateDataArr: null,
    finishData: kekData
  }
  let agreeKeyEncryptOptions = MergeOptions(GetAesGenerateOptions(agreeKeySize), GetGcmNoPaddingOptions());
  let agreeKeyEncryptedData = (await DoCipherAsUser(userId, agreeKeyAlias, agreeKeyEncryptOptions, agreeKeyEnceyptData)).finishData as Uint8Array;
  let deviceBPubKeyData = (await huks.exportKeyItemAsUser(userId, keyPairAlias, genKeyPairOptions)).outData as Uint8Array;
  let NONCE = StringToUint8Array("120123456789");
  let AAD = StringToUint8Array("1601234567890123");
  return BuildWrappedData(plainKeySize, deviceBPubKeyData, AAD, NONCE, kekEncryptedData, agreeKeyEncryptedData);
}