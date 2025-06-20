/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import * as param from '../publicParam';
import huks from '@ohos.security.huks';

let salt = new Uint8Array([
  0x14, 0x10, 0x11, 0x3a, 0x27, 0x9e, 0xc8, 0x5f, 0xe0, 0xf3, 0x36, 0x17, 0x57, 0x42, 0x8e, 0xff
]);

let HuksDeriveHKDF = {
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_512,
  },
  HuksKeyAlgHKDF: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_HKDF,
  },
  HuksKeyAlgAES: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposeHKDF: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagHKDFDigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagHKDFDigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagHKDFDigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyHKDFSize128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyHKDFSize192: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyHKDFSize256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: param.HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: param.HksKeySize.DERIVE_KEY_SIZE_32,
  },

  HuksKeyISKEYALIAS: { tag: param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeySTORAGE: {
    tag: param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyALGORITHMAES: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyALGORITHMHMAC: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeySIZE256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeySIZE128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeySIZE192: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPurposeDERIVE: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksKeyPurposeMAC: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPADDINGNONE: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyPADDINGPKCS7: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyDIGESTNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyDIGESTSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyDIGESTSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyDIGESTSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyDIGESTSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyDIGESTSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyBLOCKMODECBC: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyBLOCKMODECCM: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CCM,
  },
  HuksKeyBLOCKMODEECB: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyBLOCKMODECTR: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyBLOCKMODEGCM: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_GCM,
  },
};

let HuksDerivePBKDF2 = {
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_512,
  },
  HuksKeyAlgPBKDF2: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_PBKDF2,
  },
  HuksKeyAlgAES: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposePBKDF2: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagPBKDF2DigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPBKDF2DigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPBKDF2DigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyPBKDF2Size128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyPBKDF2Size192: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPBKDF2Size256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: param.HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: param.HksKeySize.DERIVE_KEY_SIZE_32,
  },

  HuksKeyISKEYALIAS: { tag: param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeySTORAGE: {
    tag: param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyALGORITHMAES: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyALGORITHMHMAC: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeySIZE256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeySIZE128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeySIZE192: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPurposeDERIVE: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksKeyPurposeMAC: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPADDINGNONE: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyPADDINGPKCS7: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyDIGESTNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyDIGESTSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyDIGESTSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyDIGESTSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyDIGESTSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyDIGESTSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyBLOCKMODECBC: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyBLOCKMODECCM: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CCM,
  },
  HuksKeyBLOCKMODEECB: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyBLOCKMODECTR: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyBLOCKMODEGCM: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_GCM,
  },
  HuksKeyPBKDF2Iteration: {
    tag: huks.HuksTag.HUKS_TAG_ITERATION,
    value: 1000
  },
  HuksKeyPBKDF2Salt: {
    tag: huks.HuksTag.HUKS_TAG_SALT,
    value: salt
  },
};

export { HuksDeriveHKDF, HuksDerivePBKDF2 };
