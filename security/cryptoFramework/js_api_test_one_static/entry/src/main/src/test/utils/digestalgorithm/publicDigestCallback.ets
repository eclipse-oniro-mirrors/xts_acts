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
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, } from "../common/publicDoString";

async function generateSymKey(symKeyGenerator: cryptoFramework.SymKeyGenerator): Promise<cryptoFramework.SymKey> {
  return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
    symKeyGenerator.generateSymKey((err: BusinessError<void>|null, tmp: cryptoFramework.SymKey|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback] generateSymKey failed. error is " + err);
        reject(err as Error);
      } else {
        let symKey: cryptoFramework.SymKey = tmp as cryptoFramework.SymKey;
        console.log("[Callback] generateSymKey success. symKey is " + symKey);
        console.log("[Callback] key algName:" + symKey.algName);
        console.log("[Callback] key format:" + symKey.format);
        let encodeKey: cryptoFramework.DataBlob = symKey.getEncoded();
        console.log(
          "[Callback] key getEncoded hex: " +
          uInt8ArrayToShowStr(encodeKey.data)
        );
        resolve(symKey);
      }
    });
  });
}

async function initMac(macGenerator: cryptoFramework.Mac, symKey: cryptoFramework.SymKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    macGenerator.init(symKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback] macGenerator init failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback] macGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateMac(macGenerator: cryptoFramework.Mac, dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    macGenerator.update(dataBlob, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback] macGenerator update failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback] macGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function doFinalMac(macGenerator: cryptoFramework.Mac): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    macGenerator.doFinal((err: BusinessError<void>|null, output: cryptoFramework.DataBlob|undefined) => {
      if (err || output === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback] macGenerator doFinal failed. error is " + err
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback] macGenerator doFinal success! output is: " + output
        );
        resolve(output as cryptoFramework.DataBlob);
      }
    });
  });
}

async function testHMACDigestCallback(HMACAlgoName: string, keyAlgoName: string): Promise<boolean> {
  let globalHMAC: cryptoFramework.Mac;
  let globalText: string = "my test data";
  let globalSymKeyGenerator: cryptoFramework.SymKeyGenerator;
  let ginBlob: cryptoFramework.DataBlob = {
    data: stringTouInt8Array(globalText),
  };

  return new Promise<boolean>((resolve, reject) => {
    globalHMAC = cryptoFramework.createMac(HMACAlgoName);
    console.log("[Callback] mac= " + globalHMAC);
    console.log("[Callback] HMAC algName is: " + globalHMAC.algName);
    globalSymKeyGenerator = cryptoFramework.createSymKeyGenerator(keyAlgoName);
    console.log(
      "[Callback] symKeyGenerator algName:" + globalSymKeyGenerator.algName
    );

    generateSymKey(globalSymKeyGenerator)
      .then<string>((symKey: cryptoFramework.SymKey) => {
        return initMac(globalHMAC, symKey);
      })
      .then<string>((initData: string) => {
        console.log("[Callback] init success: " + initData);
        return updateMac(globalHMAC, ginBlob);
      })
      .then<cryptoFramework.DataBlob>((updateData: string) => {
        console.log("[Callback] update success: " + updateData);
        return doFinalMac(globalHMAC);
      })
      .then((macOutput: cryptoFramework.DataBlob) => {
        console.log("[Callback] HMAC result:" + macOutput.data);
        let macLen = globalHMAC.getMacLength();
        console.log("[Callback] MAC len:" + macLen);
        if (macOutput != null && macLen != 0 && macLen != null) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("[Callback] testHMACDigestCallback catch error: " + err);
        reject(err);
      });
  });
}

async function updateMd(mdGenerator: cryptoFramework.Md, dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    mdGenerator.update(dataBlob, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]mdGenerator update failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]mdGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function digestMd(mdGenerator: cryptoFramework.Md): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    mdGenerator.digest((err: BusinessError<void>|null, output: cryptoFramework.DataBlob|undefined) => {
      if (err || output === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]mdGenerator digest failed. error is " + err);
        reject(err as Error);
      } else {
        console.log(
          "[Callback]mdGenerator digest success! output is: " + output
        );
        resolve(output as cryptoFramework.DataBlob);
      }
    });
  });
}

async function testMDDigestCallbackLen(MDAlgoName: string, DatablobLen: number): Promise<boolean> {
  let globalText: string = "";
  let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
  for (let i = 0; i < DatablobLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * t.length).toInt());
  }
  console.warn("Datablob = " + globalText);
  let ginBlob: cryptoFramework.DataBlob = {
    data: stringTouInt8Array(globalText),
  };

  try {
    let mdObj: cryptoFramework.Md = cryptoFramework.createMd(MDAlgoName);
    expect(mdObj != null).assertTrue();
    let updateData: string = await updateMd(mdObj, ginBlob);
    expect(updateData === "update success").assertTrue();
    let digestBlob: cryptoFramework.DataBlob = await digestMd(mdObj);
    console.warn(
      "[callback]: digest result: " + uInt8ArrayToShowStr(digestBlob.data)
    );
    let mdLen: int = mdObj.getMdLength();
    console.log("mdLen is: " + mdLen);
    expect(digestBlob != null && mdLen != 0 && mdLen != null).assertTrue();

    return true;
  } catch (err) {
    console.error("testMDDigestCallback catch error: " + err);
    throw err as Error;
  }
}

async function testMDDigestCallback(MDAlgoName: string): Promise<boolean> {
  let globalMd: cryptoFramework.Md;
  let globalText: string = "my test data";
  let inBlob: cryptoFramework.DataBlob = {
    data: stringTouInt8Array(globalText),
  };

  return new Promise<boolean>((resolve, reject) => {
    globalMd = cryptoFramework.createMd(MDAlgoName);
    expect(globalMd != null).assertTrue();
    console.warn("md= " + globalMd);
    console.warn("MD algName is: " + globalMd.algName);

    updateMd(globalMd, inBlob)
      .then<cryptoFramework.DataBlob>((updateData) => {
        expect(updateData === "update success").assertTrue();
        return digestMd(globalMd);
      })
      .then((digestBlob: cryptoFramework.DataBlob) => {
        console.warn(
          "[callback]: digest result: " + uInt8ArrayToShowStr(digestBlob.data)
        );
        let mdLen: int = globalMd.getMdLength();
        console.warn("Md len: " + mdLen);
        expect(digestBlob != null && mdLen != 0 && mdLen != null).assertTrue();
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("testMDDigestCallback catch error: " + err);
        reject(err);
      });
  });
}

export { testHMACDigestCallback, testMDDigestCallbackLen, testMDDigestCallback };
