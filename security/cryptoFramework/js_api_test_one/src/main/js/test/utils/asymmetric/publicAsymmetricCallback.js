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
} from "../common/publicDoString";
import {
  createAsyKeyGenerator,
  createAsyCipher,
  createAsySign,
  createAsyVerify,
  createAsyKeyAgreement,
} from "./publicAsymmetricCommon";

async function generateAsyKeyPair(rsaGenerator) {
  var pubKey;
  var priKey;
  return new Promise((resolve, reject) => {
    rsaGenerator.generateKeyPair((err, rsaKeyPair) => {
      if (err) {
        console.error("[Callback]generateSymKey failed. error is " + err);
        reject(err);
      } else {
        pubKey = rsaKeyPair.pubKey;
        let encodedPubKey = pubKey.getEncoded();
        console.log("[Callback]: pubKey.getAlgorithm= " + pubKey.algName);
        console.log("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.log("[Callback]: pubKey.getFormat= " + pubKey.format);
        priKey = rsaKeyPair.priKey;
        let encodedPriKey = priKey.getEncoded();
        console.log("[Callback]: priKey.getAlgorithm= " + priKey.algName);
        console.log("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.log("[Callback]: priKey.getFormat= " + priKey.format);
        resolve(rsaKeyPair);
      }
    });
  });
}

async function convertAsyKey(rsaGenerator, pubKeyDataBlob, priKeyDataBlob) {
  return new Promise((resolve, reject) => {
    rsaGenerator.convertKey(
      pubKeyDataBlob,
      priKeyDataBlob,
      (err, convertKeyPair) => {
        if (err) {
          console.error("[Callback]convertKey failed. error is " + err);
          reject(err);
        } else {
          console.log(
            "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
          );
          resolve(convertKeyPair);
        }
      }
    );
  });
}

async function initCipher(cipherGenerator, mode, key, params) {
  return new Promise((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err) => {
      if (err) {
        console.error(
          "[Callback]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      } else {
        console.log(
          "[Callback]cipherGenerator init success! mode is : " + mode
        );
        resolve("init success");
      }
    });
  });
}

async function doFinalCipher(cipherGenerator, mode, dataBlob) {
  return new Promise((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob, (err, finalData) => {
      if (err) {
        console.error(
          "[Callback]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      } else {
        console.log(
          "[Callback]cipherGenerator doFinal success! mode is : " + mode
        );
        resolve(finalData);
      }
    });
  });
}

async function initSign(signGenerator, priKey) {
  return new Promise((resolve, reject) => {
    signGenerator.init(priKey, (err) => {
      if (err) {
        console.error("[Callback]signGenerator init failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]signGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateSign(signGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    signGenerator.update(dataBlob, (err) => {
      if (err) {
        console.error("[Callback]signGenerator update failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]signGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function signForSign(signGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    signGenerator.sign(dataBlob, (err, signOutput) => {
      if (err) {
        console.error("[Callback]signGenerator sign failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]signGenerator sign success!");
        resolve(signOutput);
      }
    });
  });
}

async function initVerify(verifyGenerator, pubKey) {
  return new Promise((resolve, reject) => {
    verifyGenerator.init(pubKey, (err) => {
      if (err) {
        console.error("[Callback]verifyGenerator init failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]verifyGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateVerify(verifyGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    verifyGenerator.update(dataBlob, (err) => {
      if (err) {
        console.error(
          "[Callback]verifyGenerator update failed. error is " + err
        );
        reject(err);
      } else {
        console.log("[Callback]verifyGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function verifyForVerify(verifyGenerator, dataBlob, signDataBlob) {
  return new Promise((resolve, reject) => {
    verifyGenerator.verify(dataBlob, signDataBlob, (err, verifyOutput) => {
      if (err) {
        console.error("[Callback]signGenerator sign failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]signGenerator sign success!");
        resolve(verifyOutput);
      }
    });
  });
}

async function generateAsySecret(generator, priKey, pubKey) {
  return new Promise((resolve, reject) => {
    generator.generateSecret(priKey, pubKey, (err, output) => {
      if (err) {
        console.error("[Callback]generateSecret failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]generateSecret success!");
        resolve(output);
      }
    });
  });
}

async function encryptAndDecryptNormalProcess(asyAlgoName, cipherAlgoName) {
  var globalCipherText;
  var globalRsaKeyPair;
  var globalText = "This is a cipher test";
  var input = { data: stringTouInt8Array(globalText) };
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorEncrypt != null).assertTrue();
    var cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorDecrypt != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair.pubKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then((finalOutput) => {
        expect(finalOutput != null).assertTrue();
        globalCipherText = finalOutput;
        console.log(
          "cipherOutput: " + uInt8ArrayToShowStr(globalCipherText.data)
        );
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair.priKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput) => {
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
        resolve();
      })
      .catch((err) => {
        console.error(
          "[Callback] encryptAndDecryptNormalProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyNormalProcess(asyAlgoName, signVerifyAlgoName) {
  var globalRsaKeyPair;
  var globalSignBlob;
  var globalText = "This is a sign test";
  var input = { data: stringTouInt8Array(globalText) };

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var signGenerator = createAsySign(signVerifyAlgoName);
    expect(signGenerator != null).assertTrue();
    var verifyGenerator = createAsyVerify(signVerifyAlgoName);
    expect(verifyGenerator != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initSign(signGenerator, globalRsaKeyPair.priKey);
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateSign(signGenerator, input);
      })
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return signForSign(signGenerator, input);
      })
      .then((finalOutput) => {
        expect(finalOutput != null).assertTrue();
        globalSignBlob = finalOutput;
        console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
        return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateVerify(verifyGenerator, input);
      })
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return verifyForVerify(verifyGenerator, input, globalSignBlob);
      })
      .then((finalStatus) => {
        expect(finalStatus).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("[Callback] signAndVerifyNormalProcess catch err:" + err);
        reject(err);
      });
  });
}

async function convertKeyEncryptAndDecryptProcess(asyAlgoName) {
  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        let encodedPubKey = rsaKeyPair.pubKey.getEncoded();
        let encodedPriKey = rsaKeyPair.priKey.getEncoded();
        return convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
      })
      .then((convertKeyPair) => {
        expect(convertKeyPair != null).assertTrue();
        let encodedConvertPubKey = convertKeyPair.pubKey.getEncoded();
        console.warn(
          "[Callback]: pubKey.getAlgorithm= " + convertKeyPair.pubKey.algName
        );
        console.warn(
          "[Callback]: pubKey.getEncoded= " + encodedConvertPubKey.data
        );
        console.warn(
          "[Callback]: pubKey.getFormat= " + convertKeyPair.pubKey.format
        );
        let encodedConvertPriKey = convertKeyPair.priKey.getEncoded();
        console.warn(
          "[Callback]: priKey.getAlgorithm= " + convertKeyPair.priKey.algName
        );
        console.warn(
          "[Callback]: priKey.getEncoded= " + encodedConvertPriKey.data
        );
        console.warn(
          "[Callback]: priKey.getFormat= " + convertKeyPair.priKey.format
        );
        resolve();
      })
      .catch((err) => {
        console.error(
          "[Callback] convertKeyEncryptAndDecryptProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function createAsyKeyAgreementFail(ECDHAlgoName) {
  return new Promise((resolve, reject) => {
    var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
    resolve(globalECDHData);
    expect(globalECDHData == "TypeError: Cannot read property algName of undefined").assertTrue();
    if (globalECDHData != "TypeError: Cannot read property algName of undefined"){
      reject();
    }
  });
}

async function keyAgreementProcess(ECDHAlgoName) {
  var globalRsaKeyPair;

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(ECDHAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
    expect(globalECDHData != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, globalRsaKeyPair.priKey, globalRsaKeyPair.pubKey);
      })
      .then((result) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("[Callback] keyAgreementProcess catch err:" + err);
        reject(err);
      });
  });
}

async function keyAgreementProcessFail(ECDHAlgoName, ECDHAlgoName1) {
  var globalRsaKeyPair;

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(ECDHAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var globalECDHData = createAsyKeyAgreement(ECDHAlgoName1);
    expect(globalECDHData != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, globalRsaKeyPair.priKey, globalRsaKeyPair.pubKey);
      })
      .then((result) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
        reject();
      })
      .catch((err) => {
        console.error("[Callback] keyAgreementProcess catch err:" + err);
        resolve(err);
      });
  });
}

async function keyAgreementProcessParameterException(ECDHAlgoName) {
  var globalRsaKeyPair;

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(ECDHAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
    expect(globalECDHData != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, null, null);
      })
      .then((result) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
      })
      .catch((err) => {
        expect(err == "Error: [PriKey]: param unwarp error.").assertTrue();
      });
    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, globalRsaKeyPair.pubKey, null);
      })
      .then((result) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
      })
      .catch((err) => {
        expect(err == "Error: [PubKey]: param unwarp error.").assertTrue();
      });
    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(globalECDHData, null, globalRsaKeyPair.priKey);
      })
      .then((result) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        expect(result != null).assertTrue();
        reject();
      })
      .catch((err) => {
        expect(err == "Error: [PriKey]: param unwarp error.").assertTrue();
        resolve(err);
      });
  });
}

async function createAsyKeyGeneratorFail(asyAlgoName) {

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    resolve(rsaGenerator);
    expect(rsaGenerator == "TypeError: Cannot read property algName of null").assertTrue();
    if (rsaGenerator != "TypeError: Cannot read property algName of null") {
      reject();
    }
  });
}

async function encryptAndDecryptNormalProcessSuperdata(asyAlgoName, cipherAlgoName, globalTextLen) {
  var globalCipherText;
  var globalRsaKeyPair;
  var globalText;
  var i;
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  var t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n));
  }
  var input = { data: stringTouInt8Array(globalText) };

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorEncrypt != null).assertTrue();
    var cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorDecrypt != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair.pubKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then((finalOutput) => {
        expect(finalOutput != null).assertTrue();
        globalCipherText = finalOutput;
        console.log(
          "cipherOutput: " + uInt8ArrayToShowStr(globalCipherText.data)
        );
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair.priKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput) => {
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
        resolve();
      })
      .catch((err) => {
        console.error(
          "[Callback] encryptAndDecryptNormalProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyNormalProcessSuperdata(asyAlgoName, signVerifyAlgoName, globalTextLen) {
  var globalSignBlob;
  var globalRsaKeyPair;
  var globalText;
  var i;
  var t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n));
  }
  var input = { data: stringTouInt8Array(globalText) };

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var signGenerator = createAsySign(signVerifyAlgoName);
    expect(signGenerator != null).assertTrue();
    var verifyGenerator = createAsyVerify(signVerifyAlgoName);
    expect(verifyGenerator != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initSign(signGenerator, globalRsaKeyPair.priKey);
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateSign(signGenerator, input);
      })
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return signForSign(signGenerator, input);
      })
      .then((finalOutput) => {
        expect(finalOutput != null).assertTrue();
        globalSignBlob = finalOutput;
        console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
        return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateVerify(verifyGenerator, input);
      })
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return verifyForVerify(verifyGenerator, input, globalSignBlob);
      })
      .then((finalStatus) => {
        expect(finalStatus).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("[Callback] signAndVerifyNormalProcess catch err:" + err);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcessNull(asyAlgoName, cipherAlgoName) {
  var globalCipherText;
  var globalRsaKeyPair;
  var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise((resolve, reject) => {
    var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
    expect(rsaGenerator != null).assertTrue();
    var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorEncrypt != null).assertTrue();
    var cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);
    expect(cipherGeneratorDecrypt != null).assertTrue();

    generateAsyKeyPair(rsaGenerator)
      .then((rsaKeyPair) => {
        expect(rsaKeyPair != null).assertTrue();
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair.pubKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, null);
      })
      .then((finalOutput) => {
        expect(finalOutput != null).assertTrue();
        globalCipherText = finalOutput;
        console.log(
          "cipherOutput: " + uInt8ArrayToShowStr(globalCipherText.data)
        );
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair.priKey,
          null
        );
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput) => {
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
        reject();
      })
      .catch((err) => {
        console.error(
          "[Callback] encryptAndDecryptNormalProcess catch err:" + err
        );
        resolve(err);
      });
  });
}
export {
  encryptAndDecryptNormalProcess,
  signAndVerifyNormalProcess,
  convertKeyEncryptAndDecryptProcess,
  keyAgreementProcess,
  createAsyKeyAgreementFail,
  keyAgreementProcessFail,
  keyAgreementProcessParameterException,
  createAsyKeyGeneratorFail,
  encryptAndDecryptNormalProcessSuperdata,
  signAndVerifyNormalProcessSuperdata,
  encryptAndDecryptNormalProcessNull,
};
