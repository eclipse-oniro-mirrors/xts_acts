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
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";

async function HmacDigestProcess(HMACAlgoName: string, keyAlgoName: string): Promise<any> {
  let globalText: string = "my test data";
  let ginBlob = { data: stringTouInt8Array(globalText) };

  try {
    let HmacObj: crypto.Mac = crypto.createMac(HMACAlgoName);
    console.log(`[Promise]MAC algName is: ${HmacObj.algName}`);
    let symKeyGenerator = crypto.createSymKeyGenerator(keyAlgoName);
    let symKey: crypto.SymKey = await symKeyGenerator.generateSymKey();
    await HmacObj.init(symKey);
    await HmacObj.update(ginBlob);
    let macOutput: crypto.DataBlob = await HmacObj.doFinal();
    console.warn(`[Promise]HMAC result: ${macOutput.data}`);
    let macLen: number = HmacObj.getMacLength();
    console.warn("[Promise]MAC len:" + macLen);
    symKey.clearMem();
    return { "output": macOutput, "macLength": macLen };
  } catch (err) {
    console.error(`[Promise]HmacDigestProcess catch error: ${err}`);
    throw err;
  }
}

async function HmacAnyLengthKeyDigestProcess(HMACAlgoName: string, dataBlob: crypto.DataBlob): Promise<any> {
  let globalText: string = "my test data";
  let ginBlob = { data: stringTouInt8Array(globalText) };

  try {
    let HmacObj: crypto.Mac = crypto.createMac(HMACAlgoName);
    console.log(`[Promise]MAC algName is: ${HmacObj.algName}`);
    let symKeyGenerator = crypto.createSymKeyGenerator("HMAC");
    let symKey: crypto.SymKey = await symKeyGenerator.convertKey(dataBlob);
    await HmacObj.init(symKey);
    await HmacObj.update(ginBlob);
    let macOutput: crypto.DataBlob = await HmacObj.doFinal();
    console.warn(`[Promise]HMAC result: ${macOutput.data}`);
    let macLen: number = HmacObj.getMacLength();
    console.warn("[Promise]MAC len:" + macLen);
    symKey.clearMem();
    return { "output": macOutput, "macLength": macLen };
  } catch (err) {
    console.error(`[Promise]HmacDigestProcess catch error: ${err}`);
    throw err;
  }
}

export { HmacDigestProcess, HmacAnyLengthKeyDigestProcess };
