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

import { expect } from "../../../../../hypium/index";
import { BusinessError } from '@ohos.base';
import * as asyCommon from "../common/publicDoSpec";
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";
import {
  createAsyKeyGenerator,
  createAsyKeyGeneratorBySpec,
  createAsyCipher,
  createAsySign,
  createAsyVerify,
  createAsyKeyAgreement,
} from "./publicAsymmetricCommon";

async function generateAsyKeyPair(rsaGenerator: cryptoFramework.AsyKeyGenerator
  |cryptoFramework.AsyKeyGeneratorBySpec): Promise<cryptoFramework.KeyPair> {
  let pubKey: cryptoFramework.PubKey;
  let priKey: cryptoFramework.PriKey;
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    rsaGenerator.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]generateSymKey failed. error is " + err);
        reject(err as Error);
      } else {
        let rsaKeyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        pubKey = rsaKeyPair.pubKey;
        let encodedPubKey: cryptoFramework.DataBlob = pubKey.getEncoded();
        console.log("[Callback]: pubKey.getAlgorithm= " + pubKey.algName);
        console.log("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.log("[Callback]: pubKey.getFormat= " + pubKey.format);
        priKey = rsaKeyPair.priKey;
        let encodedPriKey: cryptoFramework.DataBlob = priKey.getEncoded();
        console.log("[Callback]: priKey.getAlgorithm= " + priKey.algName);
        console.log("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.log("[Callback]: priKey.getFormat= " + priKey.format);
        resolve(rsaKeyPair as cryptoFramework.KeyPair);
      }
    });
  });
}

async function convertAsyKey(rsaGenerator: cryptoFramework.AsyKeyGenerator,
  pubKeyDataBlob: cryptoFramework.DataBlob, priKeyDataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    rsaGenerator.convertKey(
      pubKeyDataBlob,
      priKeyDataBlob,
      (err: BusinessError<void>|null, convertKeyPair: cryptoFramework.KeyPair|undefined) => {
        if (err || convertKeyPair === undefined) { // success: error is null, failed: data is undefined
          console.error("[Callback]convertKey failed. error is " + err);
          reject(err as Error);
        } else {
          console.log(
            "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
          );
          resolve(convertKeyPair as cryptoFramework.KeyPair);
        }
      }
    );
  });
}

async function initCipher(cipherGenerator: cryptoFramework.Cipher,
  mode: cryptoFramework.CryptoMode, key: cryptoFramework.Key, params: cryptoFramework.ParamsSpec | null): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback]cipherGenerator init success! mode is : " + mode
        );
        resolve("init success");
      }
    });
  });
}

async function doFinalCipher(cipherGenerator: cryptoFramework.Cipher,
  mode: cryptoFramework.CryptoMode, dataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob, (err: BusinessError<void>|null, finalData: cryptoFramework.DataBlob|null|undefined) => {
      if (err || finalData === undefined || finalData === null) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback]cipherGenerator doFinal success! mode is : " + mode
        );
        resolve(finalData as cryptoFramework.DataBlob);
      }
    });
  });
}

async function initSign(signGenerator: cryptoFramework.Sign, priKey: cryptoFramework.PriKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    signGenerator.init(priKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]signGenerator init failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]signGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateSign(signGenerator: cryptoFramework.Sign, dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    signGenerator.update(dataBlob, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]signGenerator update failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]signGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function signForSign(signGenerator: cryptoFramework.Sign,
  dataBlob: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    signGenerator.sign(dataBlob, (err: BusinessError<void>|null, signOutput: cryptoFramework.DataBlob|undefined) => {
      if (err || signOutput === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]signGenerator sign failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]signGenerator sign success!");
        resolve(signOutput as cryptoFramework.DataBlob);
      }
    });
  });
}

async function initVerify(verifyGenerator: cryptoFramework.Verify, pubKey: cryptoFramework.PubKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verifyGenerator.init(pubKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]verifyGenerator init failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]verifyGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateVerify(verifyGenerator: cryptoFramework.Verify, dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verifyGenerator.update(dataBlob, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]verifyGenerator update failed. error is " + err
        );
        reject(err as Error);
      } else {
        console.log("[Callback]verifyGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function verifyForVerify(verifyGenerator: cryptoFramework.Verify,
  dataBlob: cryptoFramework.DataBlob|null, signDataBlob: cryptoFramework.DataBlob): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    verifyGenerator.verify(dataBlob, signDataBlob,
      (err: BusinessError<void>|null, verifyOutput: boolean|undefined) => {
      if (err || verifyOutput === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]signGenerator sign failed. error is " + err);
        reject(err as Error);
      } else {
        console.error(
          "[Callback]signGenerator sign success is  " + verifyOutput
        );
        resolve(verifyOutput as boolean);
      }
    });
  });
}

async function encryptAndDecryptNormalProcess(asyAlgoName: string, cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob | undefined;
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);

    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair!.pubKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptAndDecryptNormalProcess encryptMode initOut:" +
            initCipherOut
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair!.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptAndDecryptNormalProcess decryptMode initOut:" +
            initCipherOut
        );
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText!
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        }
        resolve(false);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] encryptAndDecryptNormalProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyNormalProcess(asyAlgoName: string,
  signVerifyAlgoName: string): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalSignBlob: cryptoFramework.DataBlob | undefined;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = rsaKeyPair;
        let encodedPubKey: cryptoFramework.DataBlob = rsaKeyPair.pubKey.getEncoded();
        let encodedPriKey: cryptoFramework.DataBlob = rsaKeyPair.priKey.getEncoded();
        convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
        return initSign(signGenerator, globalRsaKeyPair!.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[Callback] signAndVerifyNormalProcess initSignOut:" + initSignOut
        );
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[Callback] signAndVerifyNormalProcess updateSignOut:" + updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        return initVerify(verifyGenerator, globalRsaKeyPair!.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifyNormalProcess initVerifyOut:" + initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then<boolean>((updateVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifyNormalProcess updateVerifyOut:" +
            updateVerifyOut
        );
        return verifyForVerify(verifyGenerator, input, globalSignBlob!);
      })
      .then((verifyOutput: boolean) => {
        resolve(verifyOutput);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function signAndVerifySetAndGetSpecProcess(
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  itemType: cryptoFramework.SignSpecItem,
  itemValue: int | Uint8Array
): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalSignBlob: cryptoFramework.DataBlob | undefined;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    specGenerator.generateKeyPair()
      .then<string>((keyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = keyPair;
        signGenerator.setSignSpec(itemType, itemValue);
        verifyGenerator.setVerifySpec(itemType, itemValue);
        return initSign(signGenerator, globalRsaKeyPair!.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[Callback] signAndVerifySetAndGetSpecProcess initSignOut:" +
            initSignOut
        );
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[Callback] signAndVerifySetAndGetSpecProcess updateSignOut:" +
            updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        return initVerify(verifyGenerator, globalRsaKeyPair!.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifySetAndGetSpecProcess initVerifyOut:" +
            initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then<boolean>((updateVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifySetAndGetSpecProcess updateVerifyOut:" +
            updateVerifyOut
        );
        return verifyForVerify(verifyGenerator, input, globalSignBlob!);
      })
      .then((verifyOutput: boolean) => {
        let signSpec: string | int = signGenerator.getSignSpec(itemType);
        let verifySpec: string | int = verifyGenerator.getVerifySpec(itemType);
        if (signSpec != itemValue || verifySpec != itemValue) {
          resolve(false);
        }
        resolve(verifyOutput);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] signAndVerifySetAndGetSpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function encryptAndDecryptBySpecProcess(asyKeyPairSpec: cryptoFramework.KeyPair,
  cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob | undefined;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<boolean>((resolve, reject) => {
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptAndDecryptBySpecProcess encryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        return initCipher(
          cipherGeneratorDncrypt,
          decryptMode,
          asyKeyPairSpec.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptAndDecryptBySpecProcess decryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(
          cipherGeneratorDncrypt,
          decryptMode,
          globalCipherText!
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] encryptAndDecryptBySpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAbnormalParameterProcess(
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  signType: int
) {
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  try {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let keyPair: cryptoFramework.KeyPair = await specGenerator.generateKeyPair();
    switch (signType) {
      case 1:
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, input);
        await signForSign(signGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      case 2:
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, input);
        await signForSign(signGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      default:
        await signForSign(signGenerator, input);
        break;
    }
  } catch (err) {
    console.error("[Callback] signAbnormalParameterProcess catch err: " + err);
    throw err as Error;
  }
}

async function encryptSetAndGetSpecInitProcess(asyKeyPairSpec: cryptoFramework.KeyPair,
  cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob | undefined;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  let pSource: Uint8Array = new Uint8Array([1, 2, 3, 4]);

  return new Promise<boolean>((resolve, reject) => {
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);

    cipherGeneratorEncrypt.setCipherSpec(
      cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
      pSource
    );
    let retP: string | Uint8Array = cipherGeneratorEncrypt.getCipherSpec(
      cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
    );
    if (retP.toString() != pSource.toString()) {
      console.log("error init pSource" + retP);
    } else {
      console.log("pSource changed ==" + retP);
    }
    initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptSetAndGetSpecInitProcess encryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        cipherGeneratorDecrypt.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          pSource
        );
        cipherGeneratorDecrypt.getCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
        );
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          asyKeyPairSpec.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[Callback] encryptSetAndGetSpecInitProcess decryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText!
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function signAndVerifyBySpecProcess(asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalSignBlob: cryptoFramework.DataBlob | undefined;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    console.log(
      "[callback]: verifyGenerator.algName : " + verifyGenerator.algName
    );
    specGenerator.generateKeyPair()
      .then<string>((keyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = keyPair;
        return initSign(signGenerator, globalRsaKeyPair!.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[Callback] signAndVerifyBySpecProcess initSignOut:" + initSignOut
        );
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[Callback] signAndVerifyBySpecProcess updateSignOut:" + updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        console.log(
          "[callback] signOutput: " + uInt8ArrayToShowStr(globalSignBlob!.data)
        );
        return initVerify(verifyGenerator, globalRsaKeyPair!.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifyBySpecProcess initVerifyOut:" + initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then((updateVerifyOut: string) => {
        console.log(
          "[Callback] signAndVerifyBySpecProcess updateVerifyOut:" +
            updateVerifyOut
        );
        let result = verifyForVerify(verifyGenerator, input, globalSignBlob!);
        console.log("[callback] verifyForVerify result: " + result);
        resolve(result);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function keyGenerationBySpecProcess(asyAlgoName: string): Promise<boolean> {
  let sk: bigint | string | int = 0;
  let pk: bigint | string | int = 0;
  let generatorBySpec: cryptoFramework.AsyKeyGeneratorBySpec;
  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    generateAsyKeyPair(rsaGenerator)
      .then<cryptoFramework.KeyPair>((rsaKeyPair: cryptoFramework.KeyPair) => {
        let encodedPubKey: cryptoFramework.DataBlob = rsaKeyPair.pubKey.getEncoded();
        let encodedPriKey: cryptoFramework.DataBlob = rsaKeyPair.priKey.getEncoded();
        return convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
      })
      .then<cryptoFramework.KeyPair>((convertKeyPair: cryptoFramework.KeyPair) => {
        let dsap: bigint | string | int = convertKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_P_BN
        );
        let dsaq: bigint | string | int = convertKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_Q_BN
        );
        let dsag: bigint | string | int = convertKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_G_BN
        );
        sk = convertKeyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_SK_BN
        );
        pk = convertKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_PK_BN
        );
        console.log("keyGenerationBySpecProcess sk " + sk);
        console.log("keyGenerationBySpecProcess pk " + pk);
        if (sk instanceof bigint && pk instanceof bigint) {
          let commKeySpec: cryptoFramework.AsyKeySpec = asyCommon.genDsaKeyPairSpec(dsap, dsaq, dsag, sk as bigint, pk as bigint);
          generatorBySpec = createAsyKeyGeneratorBySpec(commKeySpec);
        } else {
          let sk_0: bigint = BigInt("00");
          let pk_0: bigint = BigInt("00");
          let commKeySpec: cryptoFramework.AsyKeySpec = asyCommon.genDsaKeyPairSpec(dsap, dsaq, dsag, sk_0, pk_0);
          generatorBySpec = createAsyKeyGeneratorBySpec(commKeySpec);
        }
        return generateAsyKeyPair(generatorBySpec);
      })
      .then((specKeyPair: cryptoFramework.KeyPair) => {
        let skSpec: bigint | string | int = specKeyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_SK_BN
        );
        let pkSpec: bigint | string | int = specKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_PK_BN
        );
        console.log("keyGenerationBySpecProcess skSpec " + skSpec);
        console.log("keyGenerationBySpecProcess pkSpec " + pkSpec);
        if (skSpec instanceof bigint && pkSpec instanceof bigint && sk == skSpec && pk == pkSpec) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function verifyAbnormalParameterProcess (
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  verifyType: int
): Promise<boolean> {
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  try {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    let keyPair: cryptoFramework.KeyPair = await specGenerator.generateKeyPair();
    await initSign(signGenerator, keyPair.priKey);
    await updateSign(signGenerator, input);
    let signBlob = await signForSign(signGenerator, input);
    switch (verifyType) {
      case 1:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, input);
        return await verifyForVerify(verifyGenerator, null, signBlob);
      case 2:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, input);
        return await verifyForVerify(verifyGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob, signBlob);
      case 3:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, input);
        return await verifyForVerify(verifyGenerator, input, {data: new Uint8Array()} as cryptoFramework.DataBlob);
      default:
        return await verifyForVerify(verifyGenerator, input, signBlob);
    }
  } catch (err) {
    console.error("[Callback] verifyUpdateAbnormalParameterProcess catch err: " + err);
    throw err as Error;
  }
}

async function encryptAndDecryptNormalProcessSuperdata(asyAlgoName: string,
  cipherAlgoName: string, globalTextLen: number): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob | undefined;
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalText: string = '';
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz";
  let n: number = t.length;
  for (let i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n).toInt());
  }
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorEncrypt != null).assertTrue();
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorDecrypt != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair!.pubKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        expect(finalOutput != null).assertTrue();
        globalCipherText = finalOutput;
        console.log(
          "cipherOutput: " + uInt8ArrayToShowStr(globalCipherText!.data)
        );
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair!.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText!
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        if (finalOutput == null) {
          console.error("[Callback]decrypt doFinal out is null");
        } else {
          console.log(
            "[Callback]decrypt doFinal out hex: " +
            uInt8ArrayToShowStr(finalOutput.data)
          );
        }
        let decryptData = uInt8ArrayToString(finalOutput.data);
        expect(decryptData == globalText).assertTrue();
        resolve(true);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] encryptAndDecryptNormalProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyNormalProcessSuperdata(asyAlgoName: string,
  signVerifyAlgoName: string, globalTextLen: number): Promise<boolean> {
  let globalSignBlob: cryptoFramework.DataBlob | undefined;
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;
  let globalText: string = '';
  let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (let i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n).toInt());
  }
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    expect(signGenerator != null).assertTrue();
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    expect(verifyGenerator != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initSign(signGenerator, globalRsaKeyPair!.priKey);
      })
      .then<string>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateData: string) => {
        expect(updateData === "update success").assertTrue();
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        expect(finalOutput != null).assertTrue();
        globalSignBlob = finalOutput;
        console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob!.data));
        return initVerify(verifyGenerator, globalRsaKeyPair!.pubKey);
      })
      .then<string>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return updateVerify(verifyGenerator, input);
      })
      .then<boolean>((updateData: string) => {
        expect(updateData === "update success").assertTrue();
        return verifyForVerify(verifyGenerator, input, globalSignBlob!);
      })
      .then((finalStatus: boolean) => {
        expect(finalStatus).assertTrue();
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[Callback] signAndVerifyNormalProcess catch err:" + err);
        reject(err);
      });
  });
}

async function generateAsySecret(generator: cryptoFramework.KeyAgreement,
  priKey: cryptoFramework.PriKey, pubKey: cryptoFramework.PubKey): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    generator.generateSecret(priKey, pubKey, (err: BusinessError<void>|null, output: cryptoFramework.DataBlob|undefined) => {
      if (err || output === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]generateSecret failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]generateSecret success!");
        resolve(output as cryptoFramework.DataBlob);
      }
    });
  });
}

async function keyAgreementProcess(ECDHAlgoName: string): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair | undefined;

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(ECDHAlgoName);
    expect(rsaGenerator != null).assertTrue();
    let globalECDHData: cryptoFramework.KeyAgreement = createAsyKeyAgreement(ECDHAlgoName);
    expect(globalECDHData != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then<cryptoFramework.DataBlob>((rsaKeyPair: cryptoFramework.KeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, globalRsaKeyPair!.priKey, globalRsaKeyPair!.pubKey);
      })
      .then((result: cryptoFramework.DataBlob) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[Callback] keyAgreementProcess catch err:" + err);
        reject(err);
      });
  });
}

export {
  encryptAndDecryptNormalProcess,
  signAndVerifyNormalProcess,
  encryptSetAndGetSpecInitProcess,
  encryptAndDecryptBySpecProcess,
  signAndVerifyBySpecProcess,
  keyGenerationBySpecProcess,
  signAndVerifySetAndGetSpecProcess,
  signAbnormalParameterProcess,
  verifyAbnormalParameterProcess,
  encryptAndDecryptNormalProcessSuperdata,
  signAndVerifyNormalProcessSuperdata,
  keyAgreementProcess
};
