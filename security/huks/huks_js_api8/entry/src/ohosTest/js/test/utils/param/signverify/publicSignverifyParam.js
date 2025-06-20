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
let DSA_COMMON_SIZE = 1024;
let HuksSignVerifyDSA = {
  HuksTagDSACOMMONSIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: DSA_COMMON_SIZE,
  },
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_DSA_KEY_SIZE_512,
  },
  HuksKeySIZE1024: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_DSA_KEY_SIZE_1024,
  },
  HuksKeyAlgDSA: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_DSA,
  },
  HuksKeyDSAPurposeSIGN: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyDSAPurposeVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDSADigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagDSADigestSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagDSADigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagDSADigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagDSADigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
};

let HuksSignVerifyECC = {
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_ECC_KEY_SIZE_521,
  },
  HuksKeyAlgECC: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_ECC,
  },
  HuksKeyECCPurposeSIGN: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyECCPurposeVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagECCDigestNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksTagECCDigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagECCDigestSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagECCDigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagECCDigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagECCDigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
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
  HuksKeyECCPurposeSINGVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
};

let HuksSignVerifyED25519 = {
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_ED25519_KEY_SIZE_512,
  },
  HuksKeyAlgED25519: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_ED25519,
  },
  HuksKeyED25519Size256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_CURVE25519_KEY_SIZE_256,
  },
  HuksKeyED25519PurposeSIGN: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyED25519PurposeVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagDigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
};

let HuksSignVerifyRSA = {
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyAlgRSA: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_RSA,
  },
  HuksKeyRSASize512: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyRSASize768: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_768,
  },
  HuksKeyRSASize1024: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_1024,
  },
  HuksKeyRSASize2048: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_2048,
  },
  HuksKeyRSASize3072: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_3072,
  },
  HuksKeyRSASize4096: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_4096,
  },
  HuksKeyRSAPurposeSIGN: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyRSAPurposeVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPADDINGPKCS1V15: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  },
  HuksKeyRSAPADDINGPSS: {
    tag: param.HksTag.HKS_TAG_PADDING,
    value: param.HksKeyPadding.HKS_PADDING_PSS,
  },
  HuksTagPKCS1DigestMD5: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_MD5,
  },
  HuksTagPKCS1DigestNONE: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksTagPKCS1DigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagPKCS1DigestSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagPKCS1DigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPKCS1DigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPKCS1DigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksTagPSSDigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagPSSDigestSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagPSSDigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPSSDigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPSSDigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
};
let HuksSignVerifySM2 = {
  HuksKeySize256: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_SM2_KEY_SIZE_256,
  },
  HuksKeyAlgSM2: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_SM2,
  },
  HuksKeySM2PurposeSIGN: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeySM2PurposeVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagSM2DigestSM3: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SM3,
  },
  HuksKeySM2PurposeSINGVERIFY: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value:
    param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
    param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
};
export { HuksSignVerifyRSA, HuksSignVerifyDSA, HuksSignVerifyECC, HuksSignVerifyED25519 ,HuksSignVerifySM2};
