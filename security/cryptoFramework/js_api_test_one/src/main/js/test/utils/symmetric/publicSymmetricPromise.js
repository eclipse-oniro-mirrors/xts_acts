/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  uInt8ArrayToString,
  genGcmParamsSpec,
  genIvParamsSpec,
  genCcmParamsSpec,
} from "../common/publicDoString";

import {
  createSymKeyGenerator,
  createSymCipher,
} from "./publicSymmetricCommon";

function createGlobalParams(symAlgoName, paramType) {
  let params;
  try {
    if (paramType == "genIvParamsSpec") {
      if (symAlgoName.includes("AES")) {
        params = genIvParamsSpec(16);
      } else if (symAlgoName.includes("3DES")) {
        params = genIvParamsSpec(8);
      } else {
        throw "[error]invalid symAlgoName!";
      }
    } else if (paramType == "genGcmParamsSpec") {
      params = genGcmParamsSpec();
    } else if (paramType == "genCcmParamsSpec") {
      params = genCcmParamsSpec();
    } else if (paramType == "null") {
      params = null;
    } else {
      throw "[error]invalid paramType!";
    }
    return params;
  } catch (err) {
    return err;
  }
}

async function generateSymKey(symKeyGenerator) {
  return new Promise((resolve, reject) => {
    symKeyGenerator
      .generateSymKey()
      .then((symKey) => {
        console.log("[Promise]generateSymKey success. symKey is " + symKey);
        console.warn("[promise]key algName:" + symKey.algName);
        console.warn("[promise]key format:" + symKey.format);
        let encodeKey = symKey.getEncoded();
        console.warn(
          "[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data)
        );
        resolve(symKey);
      })
      .catch((err) => {
        console.error("[Promise]generateSymKey failed. error is " + err);
        reject(err);
      });
  });
}

async function convertSymKey(symKeyGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    symKeyGenerator
      .convertKey(dataBlob)
      .then((symKey) => {
        console.log("[Promise]convertKey success. symKey is " + symKey);
        resolve(symKey);
      })
      .catch((err) => {
        console.error("[Promise]convertKey failed. error is " + err);
        reject(err);
      });
  });
}

async function initCipher(cipherGenerator, mode, key, params) {
  return new Promise((resolve, reject) => {
    cipherGenerator
      .init(mode, key, params)
      .then(() => {
        console.log("[Promise]cipherGenerator init success! mode is : " + mode);
        resolve("init success");
      })
      .catch((err) => {
        console.error(
          "[Promise]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function updateCipher(cipherGenerator, mode, plainText) {
  return new Promise((resolve, reject) => {
    cipherGenerator
      .update(plainText)
      .then((updateData) => {
        console.log(
          "[Promise]cipherGenerator update success! mode is : " + mode
        );
        resolve(updateData);
      })
      .catch((err) => {
        console.error(
          "[Promise]cipherGenerator update failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function doFinalCipher(cipherGenerator, mode, dataBlob) {
  return new Promise((resolve, reject) => {
    cipherGenerator
      .doFinal(dataBlob)
      .then((finalData) => {
        console.log(
          "[Promise]cipherGenerator doFinal success! mode is : " + mode
        );
        resolve(finalData);
      })
      .catch((err) => {
        console.error(
          "[Promise]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function createSymKeyGeneratorFail(
    symAlgoName,
) {
  return new Promise((resolve, reject) => {
      var symKeyGenerator = createSymKeyGenerator(symAlgoName);
      resolve(symKeyGenerator);
      expect(symKeyGenerator == "Error: create C generator fail.").assertTrue();
      if (symKeyGenerator != "Error: create C generator fail.") {
        reject();
      }
    });
}

async function createSymCipherFail(
    cipherAlgoName,
) {
  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymCipher(cipherAlgoName);
    resolve(symKeyGenerator);
    expect(symKeyGenerator == "Error: create C cipher fail!").assertTrue();
    if (symKeyGenerator != "Error: create C cipher fail!") {
      reject();
    }
  });
}

async function encryptAndDecryptNormalProcessSpecialdata(
    symAlgoName,
    cipherAlgoName,
    paramType
) {
  var updateOutputdata;
  var globalCipherText;
  var globalKey;
  var globalText = null;
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    var cipherGenerator = createSymCipher(cipherAlgoName);
    if (cipherGenerator == "Error: create C cipher fail!") {
      resolve(cipherGenerator);
    }
    expect(cipherGenerator != null).assertTrue();
    var globalParams = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then((promiseKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          promiseKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        let plainText = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then((updateOutput) => {
        console.warn(
          "[promise]encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
        } else {
          if (
          paramType == "genGcmParamsSpec" ||
          paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr(finalOutput.data)
            );
            globalParams.authTag = finalOutput;
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr(finalOutput.data)
            );
            globalCipherText = Array.from(globalCipherText.data);
            finalOutput = Array.from(finalOutput.data);
            globalCipherText = globalCipherText.concat(finalOutput);
            globalCipherText = new Uint8Array(globalCipherText);
            globalCipherText = { data: globalCipherText };
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then((updateOutput) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString(finalOutput.data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
            updateOutputdata + uInt8ArrayToString(finalOutput.data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString(finalOutput.data) == globalText
          ).assertTrue();
        }
          reject();
      })
      .catch((err) => {
        console.error("[promise] encryptProcess catch err:" + err);
          resolve(err);
      });
  });
}

async function encryptAndDecryptNormalProcess(
  symAlgoName,
  cipherAlgoName,
  paramType
) {
  var updateOutputdata;
  var globalCipherText;
  var globalKey;
  var globalText = "aaa this is test! this is test! bbb";
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    var cipherGenerator = createSymCipher(cipherAlgoName);
    if (cipherGenerator == "Error: create C cipher fail!") {
      resolve(cipherGenerator);
    }
    expect(cipherGenerator != null).assertTrue();
    var globalParams = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then((promiseKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          promiseKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        let plainText = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then((updateOutput) => {
        console.warn(
          "[promise]encrypt update out hex:" +
            uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
        } else {
          if (
            paramType == "genGcmParamsSpec" ||
            paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
                uInt8ArrayToShowStr(finalOutput.data)
            );
            globalParams.authTag = finalOutput;
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
                uInt8ArrayToShowStr(finalOutput.data)
            );
            globalCipherText = Array.from(globalCipherText.data);
            finalOutput = Array.from(finalOutput.data);
            globalCipherText = globalCipherText.concat(finalOutput);
            globalCipherText = new Uint8Array(globalCipherText);
            globalCipherText = { data: globalCipherText };
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then((updateOutput) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
            uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString(finalOutput.data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
            updateOutputdata + uInt8ArrayToString(finalOutput.data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString(finalOutput.data) == globalText
          ).assertTrue();
        }
        resolve();
      })
      .catch((err) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function convertKeyEncryptAndDecryptProcess(
  symAlgoName,
  cipherAlgoName,
  paramType
) {
  var updateOutputdata;
  var globalCipherText;
  var globalKey;
  var globalText = "aaa this is test! this is test! bbb";
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    var cipherGenerator = createSymCipher(cipherAlgoName);
    expect(cipherGenerator != null).assertTrue();
    var globalParams = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then((promiseKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        let encodeKey = promiseKey.getEncoded();
        return convertSymKey(symKeyGenerator, encodeKey);
      })
      .then((convertKey) => {
        expect(convertKey != null).assertTrue();
        return initCipher(
          cipherGenerator,
          encryptMode,
          convertKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        let plainText = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then((updateOutput) => {
        console.warn(
          "[promise]encrypt update out hex:" +
            uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
        } else {
          if (
            paramType == "genGcmParamsSpec" ||
            paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
                uInt8ArrayToShowStr(finalOutput.data)
            );
            globalParams.authTag = finalOutput;
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
                uInt8ArrayToShowStr(finalOutput.data)
            );
            globalCipherText = Array.from(globalCipherText.data);
            finalOutput = Array.from(finalOutput.data);
            globalCipherText = globalCipherText.concat(finalOutput);
            globalCipherText = new Uint8Array(globalCipherText);
            globalCipherText = { data: globalCipherText };
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then((updateOutput) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
            uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString(finalOutput.data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
            updateOutputdata + uInt8ArrayToString(finalOutput.data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString(finalOutput.data) == globalText
          ).assertTrue();
        }
        resolve();
      })
      .catch((err) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

function ClearMemProcess(symAlgoName) {
  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();

    generateSymKey(symKeyGenerator)
      .then((symKey) => {
        symKey.clearMem();
        resolve();
      })
      .catch((err) => {
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcessSuperdata(
    symAlgoName,
    cipherAlgoName,
    paramType
) {
  var updateOutputdata;
  var globalCipherText;
  var globalKey;
  var globalText;
  var globalTextLen = 1025;
  var i;
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  var t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n));
  }

  return new Promise((resolve, reject) => {
    var symKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    var cipherGenerator = createSymCipher(cipherAlgoName);
    if (cipherGenerator == "Error: create C cipher fail!") {
      resolve(cipherGenerator);
    }
    expect(cipherGenerator != null).assertTrue();
    var globalParams = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then((promiseKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          promiseKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        let plainText = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then((updateOutput) => {
        console.warn(
          "[promise]encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
        } else {
          if (
          paramType == "genGcmParamsSpec" ||
          paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr(finalOutput.data)
            );
            globalParams.authTag = finalOutput;
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr(finalOutput.data)
            );
            globalCipherText = Array.from(globalCipherText.data);
            finalOutput = Array.from(finalOutput.data);
            globalCipherText = globalCipherText.concat(finalOutput);
            globalCipherText = new Uint8Array(globalCipherText);
            globalCipherText = { data: globalCipherText };
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then((updateOutput) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString(finalOutput.data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
            updateOutputdata + uInt8ArrayToString(finalOutput.data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString(finalOutput.data) == globalText
          ).assertTrue();
        }
        resolve();
      })
      .catch((err) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject();
      });
  });
}
export {
  encryptAndDecryptNormalProcess,
  convertKeyEncryptAndDecryptProcess,
  ClearMemProcess,
  createSymKeyGeneratorFail,
  createSymCipherFail,
  encryptAndDecryptNormalProcessSpecialdata,
  encryptAndDecryptNormalProcessSuperdata,
};
