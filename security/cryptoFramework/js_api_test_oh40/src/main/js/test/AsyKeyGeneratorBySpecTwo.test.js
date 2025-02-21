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

import cryptoFramework from "@ohos.security.cryptoFramework";
import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium";
import * as asyCallback from "./utils/asysmmetricspec/publicAsymmetricSpecCallback";
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as common from "./utils/common/publicDoSpec";
import * as callback from "./utils/asymmetric/publicAsymmetricCallback";
import * as promise from "./utils/asymmetric/publicAsymmetricPromise";

function genRsa2048KeyPairSpec() {
  return common.genRsa2048KeyPairSpec();
}

function genRsa2048CommonSpec() {
  return common.genRsa2048CommonSpec();
}

function genRsa2048PubKetSpec() {
  return common.genRsa2048PubKetSpec();
}

function genDsa2048KeyPairSpec() {
  return common.genDsa2048KeyPairSpecBigE();
}

function genEccKeyTypeSpec(keyType) {
  return common.genEccKeySpec(keyType);
}

function genEccCommonSpecErr() {
  let fieldFp = {
    fieldType: "Fp",
    p: BigInt("0xffffffffffffffffffffffffffffffff000000000000000000000001"),
  };

  let G = {
    x: BigInt("0xb70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21"),
    y: BigInt("0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34"),
  };

  let eccCommonSpec = {
    algName: "ECC",
    specType: 5,
    field: fieldFp,
    a: BigInt("0xfffffffffffffffffffffffffffffffefffffffffffffffffffffffe"),
    b: BigInt("0xb4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4"),
    g: G,
    n: BigInt("0xffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d"),
    h: 1,
  };
  return eccCommonSpec;
}

function genDsaKeyPairSpecErr() {
  let dsaCommonSpec = common.genDsa2048CommonSpecBigE();
  let dsaKeyPairSpec = {
    algName: "DSA",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    params: dsaCommonSpec,
    sk: "111112222111",
    pk: BigInt(
      "0x178fa8118492ec8347c76ab092af5a2037a36479d2d03dcde061888821cc745dce4c5147f0c55c4c827aaf72adb9" +
        "e053f278b7f0b5487f8a3a18d19f8b7da547b795ab98f87b7450568e57f0eef5b7baab8586f92bef4156a0a49fb73800460aa6f1f" +
        "c1fd84e85449243215d6eccc2cb26310d21c4bd8d24bcd91819d7dcf1e7935048032cae2ee749885f9357279936b420abfca72bf2" +
        "d998d7d4349d9650589aea54f3eef56314ee85837476e15295c3f7eb04047ba7281bccea4a4e84dad89c79d89b66892fcfacd779f" +
        "9a9d8451378b90014c97e22518667b09f261123c838d7701d158e4d4f959740a1c27e011872f410e68d52167ff2c9f8338b33b7ce"
    ),
  };
  return dsaKeyPairSpec;
}

function genRsaKeyPairSpecErr() {
  let nIn = BigInt(
    "0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88" +
      "b57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef7" +
      "686e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c21" +
      "0932b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39" +
      "fa5c0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25"
  );
  let rsaCommSpec = {
    n: nIn,
    algName: "RSA",
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
  };
  let rsaKeyPairSpec = {
    params: rsaCommSpec,
    sk: "11121",
    pk: "11121",
    algName: "RSA",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
  };
  return rsaKeyPairSpec;
}

export default function AsyKeyGeneratorBySpecTwoJsunit() {
    describe("AsyKeyGeneratorBySpecTwoJsunit", function () {
        console.info("##########start AsyKeyGeneratorBySpecTwoJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0900
     * @tc.name ECC PriKey generation Pubkey
     * @tc.desc the asyKeySpec is eccPrikeySpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0900",
      0,
      async function (done) {
        let asyKeyPairSpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC)
        );
        asyKeyPairSpec
          .generatePubKey()
          .then((pubKey) => {
            console.log("pubKey" + pubKey);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_0900" +
                " failed. error is " +
                err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1000
     * @tc.name ECC PubKey generation Prikey
     * @tc.desc the asyKeySpec is eccPubkeySpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1000",
      0,
      async function (done) {
        let asyKeyPairSpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC)
        );
        asyKeyPairSpec
          .generatePriKey()
          .then((priKey) => {
            console.log("priKey" + priKey);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_1000" +
                " failed. error is " +
                err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1100
         * @tc.name RSA Key generation scenario by spec
         * @tc.desc the asyKeySpec is genRsa2048CommonSpec, Use the callback Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_1100",
            0,
            async function (done) {
                asyCallback
                    .generateByCommonSpec(genRsa2048CommonSpec(), "RSA")
                    .then((result) => {
                        console.log("result :" + result);
                        expect(null).assertFail();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_1100 catch err " +
                            err
                      );
                        expect(err.code).assertEqual(401);
                    });
                done();
            }
        );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1200
     * @tc.name RSA Key generation scenario by spec
     * @tc.desc the asyKeySpec is genRsa2048PubKetSpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1200",
      0,
      async function (done) {
        asyPromise
          .generateByPubKeySpec(genRsa2048PubKetSpec(), "RSA")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1200 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1300
     * @tc.name RSA Key generation scenario by spec
     * @tc.desc the asyKeySpec is genRsa2048KeyPairSpec, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1300",
      0,
      async function (done) {
        asyPromise
          .generateByKeyPairSpec(genRsa2048KeyPairSpec(), "RSA")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1300 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1400
     * @tc.name RSA pubKey generation prikey failed
     * @tc.desc the asyKeySpec is genRsa2048PubKetSpec, Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1400",
      0,
      async function (done) {
        let asyKeyPairSpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genRsa2048PubKetSpec()
        );
        asyKeyPairSpec
          .generatePriKey()
          .then((priKey) => {
            console.log("priKey" + priKey);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "generatePubTopriSpecFailed generateSpecAsyKeyPair failed. error is " +
                err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1500
     * @tc.name create key parser failed
     * @tc.desc Pass in an exception parameter error EccCommonStruct and call it as a async
     * @tc.desc Pass in an exception parameter error RsaKeyPairStruct and call it as a async
     * @tc.desc Pass in an exception parameter error DsaKeyPairStruct and call it as a async
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1500",
      0,
      async function (done) {
        try {
          cryptoFramework.createAsyKeyGeneratorBySpec(genEccCommonSpecErr());
          expect(null).assertFail();
        } catch (err) {
          console.error(
            "Security_CryptoFramework_GeneratorBySpec_Func_1500 catch err " +
              err
          );
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createAsyKeyGeneratorBySpec(genRsaKeyPairSpecErr());
          expect(null).assertFail();
        } catch (err) {
          console.error(
            "Security_CryptoFramework_GeneratorBySpec_Func_1500 catch err " +
              err
          );
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createAsyKeyGeneratorBySpec(genDsaKeyPairSpecErr());
          expect(null).assertFail();
        } catch (err) {
          console.error(
            "Security_CryptoFramework_GeneratorBySpec_Func_1500 catch err " +
              err
          );
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1600
     * @tc.name relatively pubkey and prikey
     * @tc.desc the asyKeySpec is genDsaKeyPairSpecErr, Use the promise Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1600",
      0,
      async function (done) {
        promise
          .keyGenerationBySpecProcess(genDsa2048KeyPairSpec())
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1600 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1700
     * @tc.name relatively pubkey and prikey
     * @tc.desc the asyKeySpec is "DSA", Use the callback Style of Interface
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1700",
      0,
      async function (done) {
        callback
          .keyGenerationBySpecProcess("DSA2048")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1700 catch err " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
