/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import * as symCallback from "./utils/symmetric/publicSymmetricCallback";
import * as publicModule from  "./utils/common/publicDoString";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SymmetricCryptographyJsunit() {
  describe("SymmetricCryptographyJsunit", () => {
    console.info("##########start SymmetricCryptographyJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0100
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES128",
            "AES128|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0200
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0200
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES192",
            "AES192|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0200 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0300
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0300 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0400
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0400
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|ECB|PKCS7",
            "null"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0400 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0500
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0500
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|CBC|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0500 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0600
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0600
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|CTR|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0600 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0700
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|OFB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0700 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0800
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|CFB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0800 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_0900
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0900
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|CCM|PKCS7",
            "genCcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0900 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1000
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1000
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|GCM|PKCS5",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_1000 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1100
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1100
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|GCM|NoPadding",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_1100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1200
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES128",
            "AES128|GCM|NoPadding",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_1200 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1300
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1300
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSymKeyGenerator("AES257");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createSymKeyGenerator("AESNULL");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1400
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createCipher("AES128|NULL|PKCS7");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("AES128|ADF|PKCS7");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_1500
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_1500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createCipher("AES128|GCM|NULL");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("AES128|GCM|CCCC");
          expect(null).assertFail();
        } catch (err) {
          console.error("err is :" + err.code);
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0100
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0100
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|ECB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0200
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|CBC|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0200 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0300
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0300
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|OFB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0300 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0400
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|CFB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0400 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0500
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|ECB|PKCS5",
            "genIvParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0500 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0600
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0600
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "3DES192",
            "3DES192|ECB|NoPadding",
            "null"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_0600 catch error: " + err
            );
            expect((err as BusinessError).code).assertEqual(17630001);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0700
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createCipher("3DES192|null|PKCS7");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("3DES192|DDD|PKCS7");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_0800
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_0800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createCipher("3DES192|ECB|null");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        try {
          cryptoFramework.createCipher("3DES192|ECB|CCCCC");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_2000
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2000
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcessSuperdata(
            "AES256",
            "AES256|CCM|PKCS7",
            "genCcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2000 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_2000
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_2000
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .encryptAndDecryptNormalProcessSuperdata(
            "3DES192",
            "3DES192|ECB|PKCS7",
            "null"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_2000 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_2100
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .convertKeyEncryptAndDecryptProcess(
            "AES128",
            "AES128|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_2200
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2200
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .convertKeyEncryptAndDecryptProcess(
            "AES192",
            "AES192|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2200 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_2300
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2300
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .convertKeyEncryptAndDecryptProcess(
            "AES256",
            "AES256|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2300 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_2100
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_2100
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symCallback
          .convertKeyEncryptAndDecryptProcess(
            "3DES192",
            "3DES192|ECB|PKCS7",
            "null"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_2100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_3DES_2200
     * @tc.number Security_crypto_framework_Symmetric_Encryption_3DES_2200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_3DES_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .convertKeyEncryptAndDecryptProcess(
            "3DES192",
            "3DES192|ECB|PKCS7",
            "null"
          )
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_3DES_2200 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_Symmetric_Encryption_AES_3700
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_3700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await symPromise
          .ClearMemProcess("AES256")
          .then((data: boolean) => {
            expect(data).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_3700 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
