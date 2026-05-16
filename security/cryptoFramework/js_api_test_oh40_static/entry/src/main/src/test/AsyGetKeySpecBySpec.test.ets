/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as asyCommon from "./utils/common/publicDoSpec";

function genRsa2048KeyPairSpec(): cryptoFramework.RSAKeyPairSpec {
  return asyCommon.genRsa2048KeyPairSpec();
}

function genDsa2048KeyPairSpec(): cryptoFramework.DSAKeyPairSpec {
  return asyCommon.genDsa2048KeyPairSpecBigE();
}

function genEccKeyTypeSpec(keyType: cryptoFramework.AsyKeySpecType): cryptoFramework.AsyKeySpec {
  return asyCommon.genEccKeySpec(keyType);
}


export default function AsyGetKeySpecBySpecJsunit() {
  describe("AsyGetKeySpecBySpecJsunit", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0100
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0100
     * @tc.desc   the asyKeySpec is RSA key pair, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = genRsa2048KeyPairSpec();
        let asyKeyGeneratorSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            let pk: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.RSA_PK_BN
            );
            expect(pk == rsaKeyPairSpec.pk).assertTrue();
            let n: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.RSA_N_BN
            );
            expect(n == rsaKeyPairSpec.params.n).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0100 failed. error is " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0200
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0200
     * @tc.desc   the asyKeySpec is Dsa Key Pair, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let dsaKeyPairSpec: cryptoFramework.DSAKeyPairSpec = genDsa2048KeyPairSpec();
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(dsaKeyPairSpec);
        await asyKeyPairSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            let p: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_P_BN
            );
            expect(p == dsaKeyPairSpec.params.p).assertTrue();
            let q: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_Q_BN
            );
            expect(q == dsaKeyPairSpec.params.q).assertTrue();
            let g: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_G_BN
            );
            expect(g == dsaKeyPairSpec.params.g).assertTrue();
            let pk: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_PK_BN
            );
            expect(pk == dsaKeyPairSpec.pk).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0200 failed. error is " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0300
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0300
     * @tc.desc   the asyKeySpec is RSA key pair, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let eccKeyPairSpec: cryptoFramework.AsyKeySpec = genEccKeyTypeSpec(
          cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC
        );
        let asyKeyGeneratorSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(eccKeyPairSpec);
        let callbackKeyPair: cryptoFramework.KeyPair;
        await asyKeyGeneratorSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            callbackKeyPair = keyPair;
            let p: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
            );
            expect(p == ((eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.field as cryptoFramework.ECFieldFp).p).assertTrue();
            let a: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_A_BN
            );
            expect(a == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.a).assertTrue();
            let b: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_B_BN
            );
            expect(b == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.b).assertTrue();
            let gx: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
            );
            expect(gx == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.g.x).assertTrue();
            let gy: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
            );
            expect(gy == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.g.y).assertTrue();
            let n: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_N_BN
            );
            expect(n == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.n).assertTrue();
            let h: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_H_NUM
            );
            expect(h == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.h).assertTrue();
            let pkx: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
            );
            expect(pkx == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).pk.x).assertTrue();
            let pky: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
            );
            expect(pky == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).pk.y).assertTrue();
            let fieldType: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
            );
            expect(
              fieldType == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.field.fieldType
            ).assertTrue();
            let fieldSize: bigint | string | int = callbackKeyPair.pubKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
            );
            expect(fieldSize == 224).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0300 failed. error is " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0400
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0400
     * @tc.desc   the asyKeySpec is genRsa2048KeyPairSpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = genRsa2048KeyPairSpec();
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyPairSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            let n: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.RSA_N_BN
            );
            expect(n == rsaKeyPairSpec.params.n).assertTrue();
            let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.RSA_SK_BN
            );
            expect(sk == rsaKeyPairSpec.sk).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0400 failed. error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0500
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0500
     * @tc.desc   the asyKeySpec is genDsa2048KeyPairSpec, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let dsaKeyPairSpec: cryptoFramework.DSAKeyPairSpec = genDsa2048KeyPairSpec();
        let asyKeyGeneratorSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(dsaKeyPairSpec);
        await asyKeyGeneratorSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            let p: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_P_BN
            );
            expect(p == dsaKeyPairSpec.params.p).assertTrue();
            let q: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_Q_BN
            );
            expect(q == dsaKeyPairSpec.params.q).assertTrue();
            let g: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_G_BN
            );
            expect(g == dsaKeyPairSpec.params.g).assertTrue();
            let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.DSA_SK_BN
            );
            expect(sk == dsaKeyPairSpec.sk).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0500 failed. error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0600
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0600
     * @tc.desc   the asyKeySpec is eccCommonSpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let eccKeyPairSpec: cryptoFramework.AsyKeySpec = genEccKeyTypeSpec(
          cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC
        );
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(eccKeyPairSpec);
        await asyKeyPairSpec
          .generateKeyPair()
          .then((keyPair: cryptoFramework.KeyPair) => {
            let p: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
            );
            expect(p == ((eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.field as cryptoFramework.ECFieldFp).p).assertTrue();
            let a: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_A_BN
            );
            expect(a == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.a).assertTrue();
            let b: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_B_BN
            );
            expect(b == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.b).assertTrue();
            let gx: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
            );
            expect(gx == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.g.x).assertTrue();
            let gy: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
            );
            expect(gy == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.g.y).assertTrue();
            let n: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_N_BN
            );
            expect(n == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.n).assertTrue();
            let h: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_H_NUM
            );
            expect(h == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.h).assertTrue();
            let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_SK_BN
            );
            expect(sk == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).sk).assertTrue();
            let fieldType: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
            );
            expect(
              fieldType == (eccKeyPairSpec as cryptoFramework.ECCKeyPairSpec).params.field.fieldType
            ).assertTrue();
            let fieldSize: bigint | string | int = keyPair.priKey.getAsyKeySpec(
              cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
            );
            expect(fieldSize == 224).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_0600 failed. error is " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0700
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0700
     * @tc.desc   Call it as a synchronously without passing in parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = genRsa2048KeyPairSpec();
        let rsaKeyGeneratorSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        let rsaKeyPair: cryptoFramework.KeyPair = await rsaKeyGeneratorSpec.generateKeyPair();
        try {
          rsaKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_P_BN
          );
          expect(null).assertFalse();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0800
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0800
     * @tc.desc   Call it as a synchronously without passing in parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = genRsa2048KeyPairSpec();
        let rsaKeyGeneratorSpec: cryptoFramework.AsyKeyGeneratorBySpec =
          cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        let rsaKeyPair: cryptoFramework.KeyPair = await rsaKeyGeneratorSpec.generateKeyPair();
        try {
          rsaKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_P_BN
          );
          expect(null).assertFalse();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_1000
     * @tc.number Security_CryptoFramework_AsyKeySpec_Func_1000
     * @tc.desc   the asyKeySpec is eccCommonSpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_AsyKeySpec_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .clearMemGetAsyKeySpec(
            genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC)
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_AsyKeySpec_Func_1000 catch err " + err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

  });

}
