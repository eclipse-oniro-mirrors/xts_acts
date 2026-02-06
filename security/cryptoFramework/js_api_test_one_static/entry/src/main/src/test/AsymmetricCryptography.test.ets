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
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function AsymmetricCryptographyJsunit() {
  describe("AsymmetricCryptographyJsunit", () => {
    console.info("##########start AsymmetricCryptographyJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0100
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA1024|PRIMES_2",
            "RSA1024|PKCS1|SHA256"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0200
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA2048|PRIMES_2",
            "RSA2048|PKCS1|MD5"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0300
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA3072",
            "RSA3072|PKCS1|SHA224"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0400
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA4096",
            "RSA4096|PKCS1_OAEP|MD5|MGF1_SHA512"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0400 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0500
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0500
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA2048",
            "RSA2048|PKCS1_OAEP|SHA1|MGF1_SHA384"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0500 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0600
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0600
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA3072|PRIMES_3",
            "RSA3072|PKCS1|SHA256"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0600 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0700
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0700
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA3072",
            "RSA3072|PKCS1|SHA512"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0700 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0800
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA3072",
            "RSA3072|PKCS1_OAEP|SHA224|MGF1_SHA256"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0800 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_0900
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0900
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA1024",
            "RSA1024|PKCS1_OAEP|SHA256|MGF1_SHA224"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_0900 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_1000
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1000
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA3072|PRIMES_3",
            "RSA3072|PKCS1_OAEP|SHA384|MGF1_SHA1"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_1000 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_1100
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA3072",
            "RSA3072|PKCS1_OAEP|SHA512|MGF1_MD5"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_1100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_1200
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .encryptAndDecryptNormalProcess(
            "RSA3072",
            "RSA3072|PKCS1"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_1200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_Encryption_RSA_1300
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_Encryption_RSA_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .encryptAndDecryptNormalProcess(
            "RSA4096",
            "RSA4096|PKCS1"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_Encryption_RSA_1300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0100
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("RSA1024|PRIMES_2", "RSA1024|PKCS1|MD5")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0100 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0200
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("RSA2048|PRIMES_2", "RSA2048|PKCS1|SHA1")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0200 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0300
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("RSA3072|PRIMES_2", "RSA3072|PKCS1|SHA224")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0300 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0400
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("RSA4096|PRIMES_2", "RSA4096|PKCS1|SHA256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0400 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0500
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("RSA2048|PRIMES_3", "RSA2048|PKCS1|SHA384")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0500 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0600
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0600
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("RSA512|PRIMES_2", "RSA512|PKCS1|SHA256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0600 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0700
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0700
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("RSA1024", "RSA1024|PKCS1|MD5|MGF1_MD5")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0700 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0800
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("RSA2048", "RSA2048|PSS|SHA1|MGF1_SHA1")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0800 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_0900
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0900
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("RSA3072", "RSA3072|PSS|SHA224|MGF1_SHA224")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_0900 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_ASymmetric_SignVerify_RSA_1000
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1000
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_ASymmetric_SignVerify_RSA_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("RSA4096", "RSA4096|PSS|SHA256|MGF1_SHA256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_ASymmetric_SignVerify_RSA_1000 catch  error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );


  });
}

