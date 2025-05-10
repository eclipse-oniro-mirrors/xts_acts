/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BusinessError } from '@ohos.base';
import cpFw from '@ohos.security.cryptoFramework';
import { stringToUint8Array } from "../common/commonUtils";
import * as asyKeyGenPromiseFunc from '../keyGenerate/asyKeyGenPromiseFunc';

export async function normalProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let signVerifyKeyPair: cpFw.KeyPair;
  try {
    signVerifyKeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
    console.log("[Promise] signVerifyPromiseNormalProcess: generateKeyPair succeed");
    return await keyPairProcess(signVerifyAlgName, signVerifyKeyPair);
  } catch (err) {
    console.error("[Promise] signVerifyPromiseNormalProcess: signVerify failed:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}

export async function keyPairProcess(signVerifyAlgName: string, signVerifyKeyPair: cpFw.KeyPair): Promise<boolean> {
  let input1: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test1.") };
  let input2: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test2.") };
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Promise] signVerifyPromiseNormalProcess: signVerify start");
  try {
    await sign.init(signVerifyKeyPair.priKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: sign init succeed");
    await sign.update(input1);
    console.log("[Promise] signVerifyPromiseNormalProcess: sign update succeed");
    signedText = await sign.sign(input2);
    await verify.init(signVerifyKeyPair.pubKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: verify init succeed");
    await verify.update(input1);
    console.log("[Promise] signVerifyPromiseNormalProcess: verify update succeed");
    return await verify.verify(input2, signedText);
  } catch (err) {
    console.error("[Promise] signVerifyPromiseNormalProcess: signVerify failed:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}

export async function ECCCurveProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test.") };
  let signVerifyKeyPair: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Promise] signVerifyPromiseNormalProcess: signVerify start");
  try {
    signVerifyKeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
    console.log("[Promise] signVerifyPromiseNormalProcess: generateKeyPair succeed");
    await sign.init(signVerifyKeyPair.priKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: sign init succeed");
    signedText = await sign.sign(input);
    await verify.init(signVerifyKeyPair.pubKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: verify init succeed");
    return await verify.verify(input, signedText);
  } catch (err) {
    console.error("[Promise] signVerifyPromiseNormalProcess: signVerify failed:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}

export async function ECCCurveErrProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test.") };
  let signVerifyKeyPair1: cpFw.KeyPair;
  let signVerifyKeyPair2: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Promise] signVerifyPromiseNormalProcess: signVerify start");
  try {
    signVerifyKeyPair1 = await asyKeyGenPromiseFunc.genKeyPair(spec);
    signVerifyKeyPair2 = await asyKeyGenPromiseFunc.genKeyPair(spec);
    console.log("[Promise] signVerifyPromiseNormalProcess: generateKeyPair succeed");
    await sign.init(signVerifyKeyPair1.priKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: sign init succeed");
    signedText = await sign.sign(input);
    await verify.init(signVerifyKeyPair2.pubKey);
    console.log("[Promise] signVerifyPromiseNormalProcess: verify init succeed");
    return await verify.verify(input, signedText);
  } catch (err) {
    console.error("[Promise] signVerifyPromiseNormalProcess: signVerify failed:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}

export async function setUseridProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string, userid1: string | null, userid2: string | null): Promise<boolean> {
  let input1: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test1.") };
  let input2: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test2.") };
  let signVerifyKeyPair: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Promise] signVerifySetUseridProcess: signVerify start");
  try {
    signVerifyKeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
    console.log("[Promise] signVerifySetUseridProcess: generateKeyPair succeed");
    await sign.init(signVerifyKeyPair.priKey);
    console.log("[Promise] signVerifySetUseridProcess: sign init succeed");
    if (userid1 != null) {
      sign.setSignSpec(cpFw.SignSpecItem.SM2_USER_ID_UINT8ARR, stringToUint8Array(userid1));
      console.log("[Promise] signVerifySetUseridProcess: sign setSignSpec succeed");
    }
    await sign.update(input1);
    console.log("[Promise] signVerifySetUseridProcess: sign update succeed");
    signedText = await sign.sign(input2);
    await verify.init(signVerifyKeyPair.pubKey);
    console.log("[Promise] signVerifySetUseridProcess: verify init succeed");
    if (userid2 != null) {
      verify.setVerifySpec(cpFw.SignSpecItem.SM2_USER_ID_UINT8ARR, stringToUint8Array(userid2));
      console.log("[Promise] signVerifySetUseridProcess: verify setVerifySpec succeed");
    }
    await verify.update(input1);
    console.log("[Promise] signVerifySetUseridProcess: verify update succeed");
    return await verify.verify(input2, signedText);
  } catch (err) {
    console.error("[Promise] signVerifySetUseridProcess: signVerify failed:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}
