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

import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import * as symCallback from "./utils/symmetric/publicSymmetricCallback";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";

async function genSymKeyPair(): Promise<cryptoFramework.SymKey> {
  try {
    let symGenerator: cryptoFramework.SymKeyGenerator = asyCommon.createSymKeyGenerator("SM4_128");
    let symKeyPair: cryptoFramework.SymKey = await symGenerator.generateSymKey();
    return symKeyPair;
  } catch (err) {
    throw err as Error;
  }
}

export default function SecurityCipherSM2SM4Jsunit() {
  describe("SecurityCipherSM2SM4Jsunit", () => {
    console.log("##########start SecurityCipherSM2SM4Jsunit##########");
    let symKeyPairSM4: cryptoFramework.SymKey | undefined;
    beforeAll(async () => {
      symKeyPairSM4 = await genSymKeyPair();
    });

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0100
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0100
     * @tc.desc   the asyAlgoName is "SM4_128|CTR|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CTR|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0200
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0200
     * @tc.desc   the asyAlgoName is "SM4_128|CTR|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CTR|PKCS5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0300
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0300
     * @tc.desc   the asyAlgoName is "SM4_128|CTR|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CTR|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0400
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0400
     * @tc.desc   the asyAlgoName is "SM4_128|ECB|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|ECB|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0500
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0500
     * @tc.desc   the asyAlgoName is "SM4_128|ECB|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|ECB|PKCS5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0600
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0600
     * @tc.desc   the asyAlgoName is "SM4_128|ECB|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|ECB|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0700
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0700
     * @tc.desc   the asyAlgoName is "SM4_128|CBC|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CBC|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0700 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0800
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0800
     * @tc.desc   the asyAlgoName is "SM4_128|CBC|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CBC|PKCS5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0800 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_0900
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0900
     * @tc.desc   the asyAlgoName is "SM4_128|CBC|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CBC|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0900 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1000
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1000
     * @tc.desc   the asyAlgoName is "SM4_128|OFB|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|OFB|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1000 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1100
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1100
     * @tc.desc   the asyAlgoName is "SM4_128|OFB|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|OFB|PKCS5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1200
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1200
     * @tc.desc   the asyAlgoName is "SM4_128|OFB|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|OFB|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1300
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1300
     * @tc.desc   the asyAlgoName is "SM4_128|CFB|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CFB|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1400
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1400
     * @tc.desc   the asyAlgoName is "SM4_128|CFB|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CFB|PKCS5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1500
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1500
     * @tc.desc   the asyAlgoName is "SM4_128|CFB|PKCS5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4_128|CFB|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1600
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1600
     * @tc.desc   the asyAlgoName is "SM4_128|CFB128|NoPadding", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CFB128|NoPadding"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1700
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1700
     * @tc.desc   the asyAlgoName is "SM4_128|CFB128|PKCS5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
         await symCallback
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CFB128|PKCS5"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1700 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1800
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1800
     * @tc.desc   the asyAlgoName is "SM4_128|CFB128|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4!,
            "SM4_128|CFB128|PKCS7"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1800 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_1900
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1900
     * @tc.desc   the asyAlgoName is "SM4|ECB|PKCS7", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4!, "SM4|ECB|PKCS7")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1900 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2000
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2000
     * @tc.desc   the asyAlgoName is "SM2_256|C1C3C2|MD5", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|MD5")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2000 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2100
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2100
     * @tc.desc   the asyAlgoName is "SM2_256|SM3", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SM3")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2200
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2200
     * @tc.desc   the asyAlgoName is "SM2_256|C1C3C2|SHA1", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA1")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2300
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2300
     * @tc.desc   the asyAlgoName is "SM2_256|SHA224", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SHA224")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2400
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2400
     * @tc.desc   the asyAlgoName is "SM2_256|C1C3C2||SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA256")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2500
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2500
     * @tc.desc   the asyAlgoName is "SM2_256|SHA384", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SHA384")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2600
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2600
     * @tc.desc   the asyAlgoName is "SM2_256|C1C3C2|SHA512", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA512")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2700
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2700
     * @tc.desc   Pass in an exception parameter "SM4_256|CFB|PKCS5" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createCipher("SM2257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("SM2_256|SHA257");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("SM2_256|NoHash");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          cryptoFramework.createCipher("SM2_256|C1C2C3|SHA512");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("SM4_192|CFB|PKCS5");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("SM4_256|CFB|PKCS5");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_2800
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2800
     * @tc.desc   Pass in an exception parameter "SM2257|SHA256" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSymKeyGenerator("SM2_256|SHA257");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createSymKeyGenerator("SM2257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_3000
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3000
     * @tc.desc   Pass in two exception parameters "This is a cipher test" and "This is a cipher test"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher(
          "SM4_128|CTR|NoPadding"
        );
        let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        let globalText: string = "This is a cipher test";
        let arr: number[] = [];
        for (let i = 0, j = globalText.length; i < j; ++i) {
          arr.push(globalText.charCodeAt(i));
        }
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(arr),
        };
        try {
          await new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
            cipherGenerator.update(input, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|null|undefined) => {
              if (err || data === undefined || data === null) { // success: error is null, failed: data is undefined
                reject(err as Error);
              } else {
                resolve(data as cryptoFramework.DataBlob);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        await cipherGenerator.init(encryptMode, symKeyPairSM4!, null);
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_3100
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3100
     * @tc.desc   Call it as a callback without passing in parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher(
          "SM4_128|CTR|NoPadding"
        );
        let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        let globalText: string = "This is a cipher test";
        let arr: number[] = [];
        for (let i = 0, j = globalText.length; i < j; ++i) {
          arr.push(globalText.charCodeAt(i));
        }
        let input: cryptoFramework.DataBlob = {
          data: new Uint8Array(arr),
        };
        try {
          await new Promise<cryptoFramework.DataBlob|null>((resolve, reject) => {
            cipherGenerator.doFinal(input, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|null|undefined) => {
              if (err || data === undefined) { // success: error is null, failed: data is undefined
                reject(err as Error);
              } else {
                resolve(data as cryptoFramework.DataBlob|null);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        await cipherGenerator.init(encryptMode, symKeyPairSM4!, null);
        try {
          await new Promise<cryptoFramework.DataBlob|null>((resolve, reject) => {
            cipherGenerator.doFinal(null, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|null|undefined) => {
              if (err || data === undefined) { // success: error is null, failed: data is undefined
                reject(err as Error);
              } else {
                resolve(data as cryptoFramework.DataBlob|null);
              }
            });
          });
        } catch (err) {
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_3200
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3200
     * @tc.desc   Pass in an exception parameter "SM4_257|SHA256" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSymKeyGenerator("SM4_257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_CipherSMX_Func_3300
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3300
     * @tc.desc   Pass in algorithm name "SM2_256|SM3" and call it using the async method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher("SM2_256|SM3");
          expect(cipherGenerator.algName == "SM2_256|SM3").assertTrue();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_CipherSMX_Func_3300 catch err: " + err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );
  });
}
