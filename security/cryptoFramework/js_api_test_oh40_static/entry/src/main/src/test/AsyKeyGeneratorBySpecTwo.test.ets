/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as asyCallback from "./utils/asysmmetricspec/publicAsymmetricSpecCallback";
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as common from "./utils/common/publicDoSpec";
import * as callback from "./utils/asymmetric/publicAsymmetricCallback";
import * as promise from "./utils/asymmetric/publicAsymmetricPromise";

function genRsa2048KeyPairSpec(): cryptoFramework.RSAKeyPairSpec {
  return common.genRsa2048KeyPairSpec();
}

function genRsa2048CommonSpec(): cryptoFramework.RSACommonParamsSpec {
  return common.genRsa2048CommonSpec();
}

function genRsa2048PubKetSpec(): cryptoFramework.RSAPubKeySpec {
  return common.genRsa2048PubKetSpec();
}

function genDsa2048KeyPairSpec(): cryptoFramework.DSAKeyPairSpec {
  return common.genDsa2048KeyPairSpecBigE();
}

function genEccKeyTypeSpec(keyType: cryptoFramework.AsyKeySpecType): cryptoFramework.AsyKeySpec {
  return common.genEccKeySpec(keyType);
}

function genEccCommonSpecErr(): cryptoFramework.ECCCommonParamsSpec {
  let fieldFp: cryptoFramework.ECFieldFp = {
    fieldType: "Fp",
    p: BigInt("26959946667150639794667015087019630673557916260026308143510066298881"),
  };

  let G: cryptoFramework.Point = {
    x: BigInt("19277929113566293071110308034699488026831934219452440156649784352033"),
    y: BigInt("19926808758034470970197974370888749184205991990603949537637343198772"),
  };

  let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = {
    algName: "ECC",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    field: fieldFp,
    a: BigInt("26959946667150639794667015087019630673557916260026308143510066298878"),
    b: BigInt("18958286285566608000408668544493926415504680968679321075787234672564"),
    g: G,
    n: BigInt("26959946667150639794667015087019625940457807714424391721682722368061"),
    h: 1,
  };
  return eccCommonSpec;
}

function genDsaKeyPairSpecErr(): cryptoFramework.DSAKeyPairSpec {
  let dsaCommonSpec: cryptoFramework.DSACommonParamsSpec= common.genDsa2048CommonSpecBigE();
  let dsaKeyPairSpec: cryptoFramework.DSAKeyPairSpec = {
    algName: "DSA",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    params: dsaCommonSpec,
    sk: BigInt("111112222111"),
    pk: BigInt(
      "2974320683131303383593011718103778438067248821010128068603330890682877434550441281827351603361334506610914048116228047158214093207291532728181748676811787843316027859373324322706845202765204260289964362553170484033902517855022371250354897430992714094652148720967777508481265194493537489752556929433399052957551421373353304195295773950194626096020536543310165869112300390873999312126377909122302697760566740696966174036865456319235321580616931347110147760623816495949862659419251353007558185295016129505360845025009080058771674461404631229857893492589646335484050582997233310521320078311463229120799046072712830367694"
    ),
  };
  return dsaKeyPairSpec;
}

function genRsaKeyPairSpecErr(): cryptoFramework.RSAKeyPairSpec {
  let nIn: bigint = BigInt(
    "18478533428762900543234234052165078897463517255891144687945154912560048989428973394502225231475673469493935673076685067666412374336644121661834634328568716128398010589214210242328473325052801924104401463496007910632384934591085795699377924655299831802536043790200563589400549497200957189436092639854513167455276408048482654440065204807879459064738847828290321155399964745065695320081378543586408514487910074079683525564599260683751683646405712006009189387522266386739458730786983547267804377576955002031599762775938196698277063712871930011053484489532696001735479019329660933285131374020059017332898114690445944576549"
  );
  let rsaCommSpec: cryptoFramework.RSACommonParamsSpec = {
    n: nIn,
    algName: "RSA",
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
  };
  let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
    params: rsaCommSpec,
    sk: BigInt("11121"),
    pk: BigInt("11121"),
    algName: "RSA",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
  };
  return rsaKeyPairSpec;
}

export default function AsyKeyGeneratorBySpecTwoJsunit() {
  describe("AsyKeyGeneratorBySpecTwoJsunit", () => {
    console.info("##########start AsyKeyGeneratorBySpecTwoJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_0900
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0900
     * @tc.desc   the asyKeySpec is eccPrikeySpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC)
        );
        await asyKeyPairSpec
          .generatePubKey()
          .then((pubKey: cryptoFramework.PubKey) => {
            console.log("pubKey" + pubKey);
            expect(null).assertFail();
          })
          .catch((err: Error) => {
            console.error(
              "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_0900" +
                " failed. error is " +
                err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1000
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1000
     * @tc.desc   the asyKeySpec is eccPubkeySpec, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC)
        );
        await asyKeyPairSpec
          .generatePriKey()
          .then((priKey: cryptoFramework.PriKey) => {
            console.log("priKey" + priKey);
            expect(null).assertFail();
          })
          .catch((err: Error) => {
            console.error(
              "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_1000" +
                " failed. error is " +
                err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1100
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1100
     * @tc.desc   the asyKeySpec is genRsa2048CommonSpec, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .generateByCommonSpec(genRsa2048CommonSpec(), "RSA")
          .then((result: boolean) => {
            console.log("result :" + result);
            expect(null).assertFail();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_GeneratorBySpec_Func_1100 catch err " +
                err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1200
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1200
     * @tc.desc   the asyKeySpec is genRsa2048PubKetSpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .generateByPubKeySpec(genRsa2048PubKetSpec(), "RSA")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
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
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1300
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1300
     * @tc.desc   the asyKeySpec is genRsa2048KeyPairSpec, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .generateByKeyPairSpec(genRsa2048KeyPairSpec(), "RSA")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
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
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1400
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1400
     * @tc.desc   the asyKeySpec is genRsa2048PubKetSpec, Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          genRsa2048PubKetSpec()
        );
        await asyKeyPairSpec
          .generatePriKey()
          .then((priKey: cryptoFramework.PriKey) => {
            console.log("priKey" + priKey);
            expect(null).assertFail();
          })
          .catch((err: Error) => {
            console.error(
              "generatePubTopriSpecFailed generateSpecAsyKeyPair failed. error is " +
                err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1500
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1500
     * @tc.desc   Pass in an exception parameter error DsaKeyPairStruct and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGeneratorBySpec(genEccCommonSpecErr());
          expect(null).assertFail();
        } catch (err) {
          console.error(
            "Security_CryptoFramework_GeneratorBySpec_Func_1500 catch err " +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1600
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1600
     * @tc.desc   the asyKeySpec is genDsaKeyPairSpecErr, Use the promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await promise
          .keyGenerationBySpecProcess(genDsa2048KeyPairSpec())
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
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
     * @tc.name   Security_CryptoFramework_GeneratorBySpec_Func_1700
     * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_1700
     * @tc.desc   the asyKeySpec is "DSA", Use the callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_GeneratorBySpec_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await callback
          .keyGenerationBySpecProcess("DSA2048")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
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
