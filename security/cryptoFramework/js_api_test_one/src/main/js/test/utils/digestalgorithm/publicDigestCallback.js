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

async function generateSymKey(symKeyGenerator) {
  return new Promise((resolve, reject) => {
    symKeyGenerator.generateSymKey((err, symKey) => {
      if (err) {
        console.error("[Callback]generateSymKey failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]generateSymKey success. symKey is " + symKey);
        console.warn("[Callback]key algName:" + symKey.algName);
        console.warn("[Callback]key format:" + symKey.format);
        var encodeKey = symKey.getEncoded();
        console.warn(
          "[Callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data)
        );
        resolve(symKey);
      }
    });
  });
}

async function initMac(macGenerator, symKey) {
  return new Promise((resolve, reject) => {
    macGenerator.init(symKey, (err) => {
      if (err) {
        console.error("[Callback]macGenerator init failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]macGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateMac(macGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    macGenerator.update(dataBlob, (err) => {
      if (err) {
        console.error("[Callback]macGenerator update failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]macGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function doFinalMac(macGenerator) {
  return new Promise((resolve, reject) => {
    macGenerator.doFinal((err, output) => {
      if (err) {
        console.error("[Callback]macGenerator doFinal failed. error is " + err);
        reject(err);
      } else {
        console.log(
          "[Callback]macGenerator doFinal success! output is: " + output
        );
        resolve(output);
      }
    });
  });
}

async function updateMd(mdGenerator, dataBlob) {
  return new Promise((resolve, reject) => {
    mdGenerator.update(dataBlob, (err) => {
      if (err) {
        console.error("[Callback]mdGenerator update failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]mdGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function digestMd(mdGenerator) {
  return new Promise((resolve, reject) => {
    mdGenerator.digest((err, output) => {
      if (err) {
        console.error("[Callback]mdGenerator digest failed. error is " + err);
        reject(err);
      } else {
        console.log(
          "[Callback]mdGenerator digest success! output is: " + output
        );
        resolve(output);
      }
    });
  });
}

async function testMDDigestCallback(MDAlgoName) {
  var globalMd;
  var globalText = "my test data";
  var inBlob = {
    data: stringTouInt8Array(globalText),
  };

  return new Promise((resolve, reject) => {
    globalMd = cryptoFramework.createMd(MDAlgoName);
    expect(globalMd != null).assertTrue();
    console.warn("md= " + globalMd);
    console.warn("MD algName is: " + globalMd.algName);

    updateMd(globalMd, inBlob)
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return digestMd(globalMd);
      })
      .then((digestBlob) => {
        console.warn(
          "[callback]: digest result: " + uInt8ArrayToShowStr(digestBlob.data)
        );
        let mdLen = globalMd.getMdLength();
        console.warn("Md len: " + mdLen);
        expect(digestBlob != null && mdLen != 0 && mdLen != null).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("testMDDigestCallback catch error: " + err);
        reject(err);
      });
  });
}

async function testMDDigestCallbackLen(MDAlgoName, DatablobLen) {
  var globalMd;
  var i;
  var globalText;
  var t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (i = 0; i < DatablobLen; i++){
    globalText += t.charAt(Math.floor(Math.random() * n));
  }
  console.warn("Datablob = " + globalText);
  var ginBlob = {
    data: stringTouInt8Array(globalText),
  };

  return new Promise((resolve, reject) => {
    globalMd = cryptoFramework.createMd(MDAlgoName);
    expect(globalMd != null).assertTrue();
    console.warn("md= " + globalMd);
    console.warn("MD algName is: " + globalMd.algName);

    updateMd(globalMd, ginBlob)
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return digestMd(globalMd);
      })
      .then((digestBlob) => {
        console.warn(
          "[callback]: digest result: " + uInt8ArrayToShowStr(digestBlob.data)
        );
        let mdLen = globalMd.getMdLength();
        console.warn("Md len: " + mdLen);
        expect(digestBlob != null && mdLen != 0 && mdLen != null).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("testMDDigestCallback catch error: " + err);
        reject(err);
      });
  });
}

async function testMDDigestCallbackLenNull(MDAlgoName) {
  var globalMd;
  var globalText1 = null;
  var globalText2 = 0;
  var inBlob = {
    data: stringTouInt8Array(globalText2),
  };

  return new Promise((resolve, reject) => {
    globalMd = cryptoFramework.createMd(MDAlgoName);
    expect(globalMd != null).assertTrue();
    console.warn("md= " + globalMd);
    console.warn("MD algName is: " + globalMd.algName);

    updateMd(globalMd, globalText1)
      .then((updateData) => {
        console.warn("updateData: " + updateData);
      })
      .catch((err) => {
        console.error("testMDDigestCallback catch error1: " + err);
        expect(err == "Error: inBlob is null").assertTrue();
      });

    updateMd(globalMd, inBlob)
      .then((updateData) => {
        console.warn("updateData: " + updateData);
        reject();
      })
      .catch((err) => {
        console.error("testMDDigestCallback catch error2: " + err);
        expect(err == "Error: inBlob is null").assertTrue();
        resolve();
      });
  });
}

async function testMDErrorAlgorithm(MDAlgoName) {
  var globalMd;

  return new Promise((resolve, reject) => {
    console.warn("md= test begin");
    try {
      globalMd = cryptoFramework.createMd(MDAlgoName);
      reject();
    } catch (error) {
      console.error("[Promise]: error code: " + error.code + ", message is: " + error.message);
      expect(error.code == 801).assertTrue();
      resolve();
    }
  });
}

async function testMDErrorAlgorithmNull(MDAlgoName) {
  var globalMd;

  return new Promise((resolve, reject) => {
    try {
      globalMd = cryptoFramework.createMd(MDAlgoName);
      reject();
    } catch (error) {
      console.error("[Promise]: error code: " + error.code + ", message is: " + error.message);
      expect(error.code == 401).assertTrue();
      resolve();
    }
  });
}

async function testHMACDigestCallback(HMACAlgoName, keyAlgoName) {
  var globalHMAC;
  var globalText = "my test data";
  var globalsymKeyGenerator;
  var ginBlob = {
    data: stringTouInt8Array(globalText),
  };

  return new Promise((resolve, reject) => {
    globalHMAC = cryptoFramework.createMac(HMACAlgoName);
    expect(globalHMAC != null).assertTrue();
    console.warn("mac= " + globalHMAC);
    console.warn("HMAC algName is: " + globalHMAC.algName);
    console.log("start to call createSymKeyGenerator()");
    globalsymKeyGenerator = cryptoFramework.createSymKeyGenerator(keyAlgoName);
    expect(globalsymKeyGenerator != null).assertTrue();
    console.warn("symKeyGenerator algName:" + globalsymKeyGenerator.algName);

    generateSymKey(globalsymKeyGenerator)
      .then((symKey) => {
        expect(symKey != null).assertTrue();
        return initMac(globalHMAC, symKey);
      })
      .then((initData) => {
        expect(initData === "init success").assertTrue();
        return updateMac(globalHMAC, ginBlob);
      })
      .then((updateData) => {
        expect(updateData === "update success").assertTrue();
        return doFinalMac(globalHMAC);
      })
      .then((macOutput) => {
        console.warn("HMAC result:" + macOutput.data);
        let macLen = globalHMAC.getMacLength();
        console.warn("MAC len:" + macLen);
        expect(macOutput != null && macLen != 0 && macLen != null).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("testHMACDigestCallback catch error: " + err);
        reject(err);
      });
  });
}

export { testMDDigestCallback, testHMACDigestCallback, testMDErrorAlgorithm,
  testMDErrorAlgorithmNull, testMDDigestCallbackLen, testMDDigestCallbackLenNull };
