/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import crypto from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString";

async function generateSymKey(symKeyGenerator: crypto.SymKeyGenerator): Promise<crypto.SymKey> {
  return new Promise((resolve, reject) => {
    symKeyGenerator.generateSymKey((err, symKey) => {
      if (err) {
        console.error(`[Callback]generateSymKey failed. error is: ${err}`);
        reject(err);
      } else {
        console.log("[Callback]symkey algName:" + symKey.algName);
        console.log("[Callback]symkey format:" + symKey.format);
        let encodeKey = symKey.getEncoded();
        console.log(`[Callback]symkey length is: ${encodeKey.data.length}`);
        resolve(symKey);
      }
    });
  });
}

async function convertSymKey(symKeyGenerator: crypto.SymKeyGenerator, dataBlob: crypto.DataBlob): Promise<crypto.SymKey> {
  return new Promise((resolve, reject) => {
    symKeyGenerator.convertKey(dataBlob, (err, symKey) => {
      if (err) {
        console.error(`[Callback]convertSymKey failed. error is: ${err}`);
        reject(err);
      } else {
        console.log("[Callback]symkey algName:" + symKey.algName);
        console.log("[Callback]symkey format:" + symKey.format);
        let encodeKey = symKey.getEncoded();
        console.log(`[Callback]symkey length is: ${encodeKey.data.length}`);
        resolve(symKey);
      }
    });
  });
}

async function initMac(macGenerator: crypto.Mac, symKey: crypto.SymKey): Promise<string> {
  return new Promise((resolve, reject) => {
    macGenerator.init(symKey, (err) => {
      if (err) {
        console.error(`[Callback]macGenerator init failed. error is: ${err}`);
        reject(err);
      } else {
        console.log("[Callback]macGenerator init success!");
        resolve("init success");
      }
    });
  });
}

async function updateMac(macGenerator: crypto.Mac, dataBlob: crypto.DataBlob): Promise<string> {
  return new Promise((resolve, reject) => {
    macGenerator.update(dataBlob, (err) => {
      if (err) {
        console.error(`[Callback]macGenerator update failed. error is: ${err}`);
        reject(err);
      } else {
        console.log("[Callback]macGenerator update success!");
        resolve("update success");
      }
    });
  });
}

async function doFinalMac(macGenerator: crypto.Mac): Promise<crypto.DataBlob> {
  return new Promise((resolve, reject) => {
    macGenerator.doFinal((err, output) => {
      if (err) {
        console.error(`[Callback]macGenerator doFinal failed. error is: ${err}`);
        reject(err);
      } else {
        console.log(`[Callback]macGenerator doFinal success! output is: ${output}`);
        resolve(output);
      }
    });
  });
}

async function HmacDigestProcess(HMACAlgoName: string, keyAlgoName: string): Promise<any> {
  let globalText: string = "my test data";
  let ginBlob = { data: stringTouInt8Array(globalText) };

  try {
    let HmacObj: crypto.Mac = crypto.createMac(HMACAlgoName);
    console.log(`[Callback]MAC algName is: ${HmacObj.algName}`);
    let symKeyGenerator = crypto.createSymKeyGenerator(keyAlgoName);
    let symKey: crypto.SymKey = await generateSymKey(symKeyGenerator);
    await initMac(HmacObj, symKey);
    await updateMac(HmacObj, ginBlob);
    let macOutput: crypto.DataBlob = await doFinalMac(HmacObj);
    console.warn(`[Callback]HMAC result: ${macOutput.data}`);
    let macLen: number = HmacObj.getMacLength();
    console.warn("[Callback]MAC len:" + macLen);
    symKey.clearMem();
    return { "output": macOutput, "macLength": macLen };
  } catch (err) {
    console.error(`[Callback]HmacDigestProcess catch error: ${err}`);
    throw err;
  }
}

async function HmacAnyLengthKeyDigestProcess(HMACAlgoName: string, dataBlob: crypto.DataBlob): Promise<any> {
  let globalText: string = "my test data";
  let ginBlob = { data: stringTouInt8Array(globalText) };

  try {
    let HmacObj: crypto.Mac = crypto.createMac(HMACAlgoName);
    console.log(`[Callback]MAC algName is: ${HmacObj.algName}`);
    let symKeyGenerator = crypto.createSymKeyGenerator("HMAC");
    let symKey: crypto.SymKey = await convertSymKey(symKeyGenerator, dataBlob);
    await initMac(HmacObj, symKey);
    await updateMac(HmacObj, ginBlob);
    let macOutput: crypto.DataBlob = await doFinalMac(HmacObj);
    console.warn(`[Callback]HMAC result: ${macOutput.data}`);
    let macLen: number = HmacObj.getMacLength();
    console.warn("[Callback]MAC len:" + macLen);
    symKey.clearMem();
    return { "output": macOutput, "macLength": macLen };
  } catch (err) {
    console.error(`[Callback]HmacDigestProcess catch error: ${err}`);
    throw err;
  }
}

export { HmacDigestProcess, HmacAnyLengthKeyDigestProcess };
