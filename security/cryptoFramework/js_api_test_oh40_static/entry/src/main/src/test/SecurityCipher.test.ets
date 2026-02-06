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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as common from "./utils/common/publicDoSpec";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import cryptoFramework from "@ohos.security.cryptoFramework";

async function genRsa2048KeyPairSpec(): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeySpec: cryptoFramework.RSAKeyPairSpec = common.genRsa2048KeyPairSpec();
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = asyCommon.createAsyKeyGeneratorBySpec(asyKeySpec);
    let specKeyPair: cryptoFramework.KeyPair = await specGenerator.generateKeyPair();
    return specKeyPair;
  } catch (err) {
    throw err as Error;
  }
}

export default function SecurityCipherJsunit() {
  describe("SecurityCipherJsunit", () => {
    console.log("##########start SecurityCipherJsunit##########");
    let gKeyPairSpec: cryptoFramework.KeyPair | undefined;
    beforeAll(async () => {
      gKeyPairSpec = await genRsa2048KeyPairSpec();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0100
     * @tc.number Security_CryptoFramework_Cipher_Func_0100
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA1", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0100 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0200
     * @tc.number Security_CryptoFramework_Cipher_Func_0200
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA224", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1|SHA224")
        .then((result:boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0200 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0300
     * @tc.number Security_CryptoFramework_Cipher_Func_0300
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1|SHA256")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0300 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0400
     * @tc.number Security_CryptoFramework_Cipher_Func_0400
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA384", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1|SHA384")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0400 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0500
     * @tc.number Security_CryptoFramework_Cipher_Func_0500
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA512", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1|SHA512")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0500 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0600
     * @tc.number Security_CryptoFramework_Cipher_Func_0600
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|MD5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec!, "RSA|PKCS1|MD5")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0600 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0700
     * @tc.number Security_CryptoFramework_Cipher_Func_0700
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA1", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA1"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0700 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0800
     * @tc.number Security_CryptoFramework_Cipher_Func_0800
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA224", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA224"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0800 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0900
     * @tc.number Encrypt_And_Decrypt_Test_0900
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA256"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0900 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1000
     * @tc.number Security_CryptoFramework_Cipher_Func_1000
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA384", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA384"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1000 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1100
     * @tc.number Security_CryptoFramework_Cipher_Func_1100
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA512", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA512"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1100 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1200
     * @tc.number Security_CryptoFramework_Cipher_Func_1200
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_MD5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA1|MGF1_MD5"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1200 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1300
     * @tc.number Security_CryptoFramework_Cipher_Func_1300
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptAndDecryptNormalProcess("RSA1024|PRIMES_2", "RSA|PKCS1|SHA256")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1300 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1400
     * @tc.number Security_CryptoFramework_Cipher_Func_1400
     * @tc.desc   the asyAlgoName is "AES|ECB|PKCS7", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await symPromise
        .encryptAndDecryptNormalProcess("AES256", "AES|ECB|PKCS7", "null")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1400 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1500
     * @tc.number Security_CryptoFramework_Cipher_Func_1500
     * @tc.desc   the asyAlgoName is "3DES|ECB|PKCS5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await symPromise
        .encryptAndDecryptNormalProcess("3DES192", "3DES|ECB|PKCS5", "null")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1500 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1600
     * @tc.number Security_CryptoFramework_Cipher_Func_1600
     * @tc.desc   Pass in an exception parameter "ECC128|GCM|PKCS7" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.createCipher("ECC128|GCM|PKCS7");
        expect(null).assertFail();
      } catch (err) {
        console.error("createCipherFail catch  error: " + err.code);
        expect((err as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1800
     * @tc.number Security_CryptoFramework_Cipher_Func_1800
     * @tc.desc   Third input empty parameter with  AsyncCallback interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("3DES192");
      let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
      let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher("3DES|ECB|PKCS5");
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
      await cipherGenerator.init(encryptMode, symKey, null);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1900
     * @tc.number Security_CryptoFramework_Cipher_Func_1900
     * @tc.desc   Third input empty parameter with  AsyncCallback interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher(
        "RSA1024|PKCS1|SHA256"
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
          cipherGenerator.doFinal(input, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|null|undefined) => {
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
      await cipherGenerator.init(encryptMode, gKeyPairSpec!.pubKey, null);
      try {
        await cipherGenerator.doFinal(null);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(401);
      }
      try {
        await new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
          cipherGenerator.doFinal(null, (err: BusinessError<void>|null, data: cryptoFramework.DataBlob|null|undefined) => {
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
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2000
     * @tc.number Security_CryptoFramework_Cipher_Func_2000
     * @tc.desc   the itemType is OAEP_MGF1_PSRC_UINT8ARR, Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyCallback
        .encryptSetAndGetSpecInitProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_2000 catch error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2100
     * @tc.number Security_CryptoFramework_Cipher_Func_2100
     * @tc.desc   the itemType is OAEP_MGF1_PSRC_UINT8ARR, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await asyPromise
        .encryptInitSetAndGetSpecProcess(
          gKeyPairSpec!,
          "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1"
        )
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_2100 catch error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2400
     * @tc.number Security_CryptoFramework_Cipher_Func_2400
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Cipher_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cipherGeneratorEncrypt: cryptoFramework.Cipher =
          cryptoFramework.createCipher("RSA1024|PKCS1");
        expect(cipherGeneratorEncrypt.algName == "RSA1024|PKCS1").assertTrue();
      } catch (err) {
        console.log(
          "Security_CryptoFramework_Cipher_Func_2400 catch err" + err
        );
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });
  });
}
