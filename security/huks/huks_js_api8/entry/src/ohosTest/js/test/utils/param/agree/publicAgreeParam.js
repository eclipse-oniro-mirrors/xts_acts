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

let HuksAgreeDH = {
    HuksKeySTORAGE: {
        tag: param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
        value: param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
    },
    HuksKeyISKEYALIAS: { tag: param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
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
    HuksKeyPADDINGNONE: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_NONE,
    },
    HuksKeyPADDINGPKCS7: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_PKCS7,
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
        value: param.HksKeySize.HKS_DH_KEY_SIZE_256,
    },
    HuksKeySIZE128: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_128,
    },
    HuksKeySIZE192: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_192,
    },
    HuksKeyAlgDH: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_DH,
    },
    HuksKeyAlgAES: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_AES,
    },
    HuksKeyAlgHMAC: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_HMAC,
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
    HuksKeyPurposeDH: {
        tag: param.HksTag.HKS_TAG_PURPOSE,
        value: param.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    },
    HuksKeyDHSize2048: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_2048,
    },
    HuksKeyDHSize3072: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_3072,
    },
    HuksKeyDHSize4096: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_4096,
    },
};

let HuksAgreeECDH = {
    HuksKeyAlgECDH: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_ECDH,
    },
    HuksKeyAlgECC: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_ECC,
    },
    HuksKeyECCSize224: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_224,
    },
    HuksKeyECCSize256: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_256,
    },
    HuksKeyECCSize384: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_384,
    },
    HuksKeyECCSize521: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_521,
    },
    HuksKeyECCDIGEST: {
        tag: param.HksTag.HKS_TAG_DIGEST,
        value: param.HksKeyDigest.HKS_DIGEST_NONE,
    },
    HuksKeyECCPADDING: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_NONE,
    },
    HuksKeyECCBLOCKMODE: {
        tag: param.HksTag.HKS_TAG_BLOCK_MODE,
        value: param.HksCipherMode.HKS_MODE_CBC,
    },
    HuksKeySTORAGE: {
        tag: param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
        value: param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
    },
    HuksKeyISKEYALIAS: { tag: param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
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
    HuksKeyPADDINGNONE: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_NONE,
    },
    HuksKeyPADDINGPKCS7: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_PKCS7,
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
    HuksKeyALGORITHMAES: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_AES,
    },
    HuksKeyALGORITHMHMAC: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_HMAC,
    },
    HuksKeySIZE521: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_521,
    },
    HuksKeySIZE256: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_256,
    },
    HuksKeySIZE128: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_128,
    },
    HuksKeySIZE192: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_ECC_KEY_SIZE_192,
    },
    HuksKeyAlgAES: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_AES,
    },
    HuksKeyAlgHMAC: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_HMAC,
    },
    HuksKeyPurposeECDH: {
        tag: param.HksTag.HKS_TAG_PURPOSE,
        value: param.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
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
};

let HuksKeyAlgX25519 = {
    HuksKeyAlgX25519: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_X25519,
    },
    HuksKeyPurposeAGREE: {
        tag: param.HksTag.HKS_TAG_PURPOSE,
        value: param.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    },
    HuksKeyCURVE25519Size256: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_CURVE25519_KEY_SIZE_256,
    },
    HuksKeyBLOCKMODE: {
        tag: param.HksTag.HKS_TAG_BLOCK_MODE,
        value: param.HksCipherMode.HKS_MODE_CBC,
    },
    HuksKeyPADDING: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_NONE,
    },
    HuksKeyDIGEST: {
        tag: param.HksTag.HKS_TAG_DIGEST,
        value: param.HksKeyDigest.HKS_DIGEST_NONE,
    },
    HuksKeySTORAGE: {
        tag: param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
        value: param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
    },
    HuksKeyISKEYALIAS: { tag: param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
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
    HuksKeyPADDINGNONE: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_NONE,
    },
    HuksKeyPADDINGPKCS7: {
        tag: param.HksTag.HKS_TAG_PADDING,
        value: param.HksKeyPadding.HKS_PADDING_PKCS7,
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
        value: param.HksKeySize.HKS_DH_KEY_SIZE_256,
    },
    HuksKeySIZE128: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_128,
    },
    HuksKeySIZE192: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_192,
    },
    HuksKeyAlgDH: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_DH,
    },
    HuksKeyAlgAES: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_AES,
    },
    HuksKeyAlgHMAC: {
        tag: param.HksTag.HKS_TAG_ALGORITHM,
        value: param.HksKeyAlg.HKS_ALG_HMAC,
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
    HuksKeyPurposeX25519: {
        tag: param.HksTag.HKS_TAG_PURPOSE,
        value: param.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    },
    HuksKeyDHSize2048: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_2048,
    },
    HuksKeyDHSize3072: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_3072,
    },
    HuksKeyDHSize4096: {
        tag: param.HksTag.HKS_TAG_KEY_SIZE,
        value: param.HksKeySize.HKS_DH_KEY_SIZE_4096,
    },
};

export { HuksAgreeDH, HuksAgreeECDH, HuksKeyAlgX25519 };
