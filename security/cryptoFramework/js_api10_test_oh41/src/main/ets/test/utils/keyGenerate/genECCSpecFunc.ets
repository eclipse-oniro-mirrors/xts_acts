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

function compareECCParams(param: cpFw.ECCCommonParamsSpec, pubKey: cpFw.PubKey): boolean {
  return param.a == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_A_BN) &&
    param.b == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_B_BN) &&
    param.g.x == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_X_BN) &&
    param.g.y == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_Y_BN) &&
    param.n == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_N_BN) &&
    param.h == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_H_NUM);
}

function comparePairParams(priKey: cpFw.PriKey, pubKey: cpFw.PubKey): boolean {
  return priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_A_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_A_BN) &&
    priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_B_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_B_BN) &&
    priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_X_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_X_BN) &&
    priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_Y_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_G_Y_BN) &&
    priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_N_BN) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_N_BN) &&
    priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_H_NUM) == pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ECC_H_NUM);
}

export {
  compareECCParams,
  comparePairParams
}