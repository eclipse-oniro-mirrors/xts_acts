/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import cpFw from '@ohos.security.cryptoFramework';
import { BusinessError } from '@ohos.base';

function DHKeyPair(priKey: cpFw.PriKey, pubKey: cpFw.PubKey): boolean {
  return priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN)
    && priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN)
    && priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_L_NUM) != null
    && priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_SK_BN) != null
    && pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_PK_BN) != null;
}

function DHKey(keyPair1: cpFw.KeyPair, keyPair2: cpFw.KeyPair): boolean {
  return keyPair1.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN) == keyPair2.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN)
    && keyPair1.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN) == keyPair2.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN)
    && keyPair1.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN) == keyPair2.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN)
    && keyPair1.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN) == keyPair2.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN);
}

function X25519KeyPair(priKey: cpFw.PriKey, pubKey: cpFw.PubKey): boolean {
  return priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_SK_BN) != null
    && pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_PK_BN) != null;
}

function Ed25519KeyPair(priKey: cpFw.PriKey, pubKey: cpFw.PubKey): boolean {
  return priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_SK_BN) != null
    && pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_PK_BN) != null;
}

export {
  DHKeyPair, DHKey, X25519KeyPair, Ed25519KeyPair
}