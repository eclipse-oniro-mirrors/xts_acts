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
import {
  testHMACDigestPromise,
  testMDDigestPromise,
} from "./utils/digestalgorithm/publicDigestPromise";
import {
  testHMACDigestCallback,
  testMDDigestCallback,
  testMDDigestCallbackLen,
} from "./utils/digestalgorithm/publicDigestCallback";

import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array } from "./utils/common/publicDoString";

export default function DigestAlgorithmJsunit() {
  describe("DigestAlgorithmJsunit", () => {
    console.info("##########start DigestAlgorithmJsunit##########");
    beforeAll(async () => {});

    /**
     * @tc.name   Security_crypto_framework_MD_0100
     * @tc.number Security_crypto_framework_MD_0100
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestPromise("MD5")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0200
     * @tc.number Security_crypto_framework_MD_0200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestPromise("SHA1")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0300
     * @tc.number Security_crypto_framework_MD_0300
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestPromise("SHA224")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0400
     * @tc.number Security_crypto_framework_MD_0400
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestCallback("SHA256")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0500
     * @tc.number Security_crypto_framework_MD_0500
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestCallback("SHA384")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0600
     * @tc.number Security_crypto_framework_MD_0600
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestCallback("SHA512")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0700
     * @tc.number Security_crypto_framework_MD_0700
     * @tc.desc   Input SHA5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.createMd("SHA5");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_0900
     * @tc.number Security_crypto_framework_MD_0900
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testMDDigestCallbackLen("SHA224", 10000)
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_MD_1000
     * @tc.number Security_crypto_framework_MD_1000
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_MD_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mdGenerator: cryptoFramework.Md = cryptoFramework.createMd("SHA224");
        await mdGenerator.digest();
      } catch (err: BusinessError) {
        console.error("err is " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0100
     * @tc.number Security_crypto_framework_HMAC_0100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testHMACDigestCallback("SHA1", "AES128")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0200
     * @tc.number Security_crypto_framework_HMAC_0200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testHMACDigestPromise("SHA224", "AES192")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0300
     * @tc.number Security_crypto_framework_HMAC_0300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testHMACDigestCallback("SHA256", "AES256")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0400
     * @tc.number Security_crypto_framework_HMAC_0400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testHMACDigestPromise("SHA384", "3DES192")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0500
     * @tc.number Security_crypto_framework_HMAC_0500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testHMACDigestPromise("SHA512", "3DES192")
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0600
     * @tc.number Security_crypto_framework_HMAC_0600
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.createMac("SHA5");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(
          "[Promise]: error code: " + err.code + ", message is: " + err.message
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_HMAC_0900
     * @tc.number Security_crypto_framework_HMAC_0900
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_HMAC_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let globalText: string = "";
      let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      for (let i = 0; i < 10000; i++) {
        globalText += t.charAt(Math.floor(Math.random() * t.length).toInt());
      }
      console.log("Datablob = " + globalText);
      let inBlob: cryptoFramework.DataBlob = {
        data: stringTouInt8Array(globalText),
      };
      try {
        let macObj: cryptoFramework.Mac = cryptoFramework.createMac("SHA512");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("3DES192");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await macObj.init(symKey);
        await macObj.update(inBlob);
        await macObj.doFinal();
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });
  });
}
