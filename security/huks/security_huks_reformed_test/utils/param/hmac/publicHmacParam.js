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

let  HuksHmac = {
  HuksKeyAlg: {
    tag: param.HksTag.HKS_TAG_ALGORITHM,
    value: param.HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeyPurpose: {
    tag: param.HksTag.HKS_TAG_PURPOSE,
    value: param.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeySIZE: {
    tag: param.HksTag.HKS_TAG_KEY_SIZE,
    value: param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksTagDigestSHA1: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagDigestSHA224: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagDigestSHA256: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagDigestSHA384: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagDigestSHA512: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksTagDigestSM3: {
    tag: param.HksTag.HKS_TAG_DIGEST,
    value: param.HksKeyDigest.HKS_DIGEST_SM3,
  },
};
export { HuksHmac };
