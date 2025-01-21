/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import { expect } from "@ohos/hypium";
import cryptoFramework from "@ohos.security.cryptoFramework";

//枚举值重新写
function testEnumCommon() {
    expect(100).assertEqual(cryptoFramework.SignSpecItem.PSS_MD_NAME_STR);
    expect(101).assertEqual(cryptoFramework.SignSpecItem.PSS_MGF_NAME_STR);
    expect(102).assertEqual(cryptoFramework.SignSpecItem.PSS_MGF1_MD_STR);
    expect(103).assertEqual(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM);
    expect(104).assertEqual(cryptoFramework.SignSpecItem.PSS_TRAILER_FIELD_NUM);

    expect(100).assertEqual(cryptoFramework.CipherSpecItem.OAEP_MD_NAME_STR);
    expect(101).assertEqual(cryptoFramework.CipherSpecItem.OAEP_MGF_NAME_STR);
    expect(102).assertEqual(cryptoFramework.CipherSpecItem.OAEP_MGF1_MD_STR);
    expect(103).assertEqual(
        cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
    );

    expect(0).assertEqual(cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC);
    expect(1).assertEqual(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
    expect(2).assertEqual(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
    expect(3).assertEqual(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);

    expect(101).assertEqual(cryptoFramework.AsyKeySpecItem.DSA_P_BN);
    expect(102).assertEqual(cryptoFramework.AsyKeySpecItem.DSA_Q_BN);
    expect(103).assertEqual(cryptoFramework.AsyKeySpecItem.DSA_G_BN);
    expect(104).assertEqual(cryptoFramework.AsyKeySpecItem.DSA_SK_BN);
    expect(105).assertEqual(cryptoFramework.AsyKeySpecItem.DSA_PK_BN);
    expect(201).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN);
    expect(202).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_A_BN);
    expect(203).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_B_BN);
    expect(204).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
    expect(205).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN);
    expect(206).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_N_BN);
    expect(207).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_H_NUM);
    expect(208).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
    expect(209).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
    expect(210).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
    expect(211).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR);
    expect(212).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM);
    expect(213).assertEqual(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
    expect(301).assertEqual(cryptoFramework.AsyKeySpecItem.RSA_N_BN);
    expect(302).assertEqual(cryptoFramework.AsyKeySpecItem.RSA_SK_BN);
    expect(303).assertEqual(cryptoFramework.AsyKeySpecItem.RSA_PK_BN);
}

export { testEnumCommon };
