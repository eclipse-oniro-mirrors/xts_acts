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

let HuksCipherAES = {
  HuksKeyAlgAES: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurpose: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyAESSize128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyAESSize192: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyAESSize256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyAESSize512: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_AES_KEY_SIZE_512,
  },
  HuksKeyAESPADDINGNONE: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyAESPADDINGPKCS7: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyAESBLOCKMODE: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyAESBLOCKMODECTR: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyAESBLOCKMODEECB: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyAESDIGESTNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyAESBLOCKMODEGCM: {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_GCM,
  },
};

let HuksCipherRSA = {
  HuksKeyAlgRSA: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_RSA,
  },
  HuksKeyPurpose: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyRSASize512: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyRSASize2048: {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048,
  },
  HuksKeyRSASize3072: {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_3072,
  },
  HuksKeyRSASize4096: {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_4096,
  },
  HuksKeyRSAPADDINGNONE: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyRSAPADDINGPKCS1V15: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  },
  HuksKeyRSAPADDINGOAEP: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_OAEP,
  },
  HuksKeyRSABLOCKMODEECB: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyRSADIGESTNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyRSADIGESTSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyRSADIGESTSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyRSADIGESTSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyRSADIGESTSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyRSADIGESTSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
};

let HuksCipherSM4 = {
  HuksKeyAlgSM4: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_SM4,
  },
  HuksKeyPurpose: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value:
      param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeySM4Size128: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_SM4_KEY_SIZE_128,
  },
  HuksKeySM4PADDINGNONE: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeySM4PADDINGPKCS7: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeySM4BLOCKMODECBC: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeySM4BLOCKMODECTR: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeySM4BLOCKMODEECB: {
    tag: param.HksTag.HKS_TAG_BLOCK_MODE,
    value: param.HksCipherMode.HKS_MODE_ECB,
  },
};
export { HuksCipherAES, HuksCipherRSA, HuksCipherSM4 };
