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
import { stringToUint8Array } from "../common/commonUtils"
import * as asyKeyGenCallbackFunc from '../keyGenerate/asyKeyGenCallbackFunc';

async function signInit(sign: cpFw.Sign, priKey: cpFw.PriKey): Promise<void> {
  return new Promise((resolve, reject) => {
    sign.init(priKey, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    })
  });
}

async function signUpdate(sign: cpFw.Sign, data: cpFw.DataBlob): Promise<void> {
  return new Promise((resolve, reject) => {
    sign.update(data, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    })
  });
}

async function signSign(sign: cpFw.Sign, data: cpFw.DataBlob): Promise<cpFw.DataBlob> {
  return new Promise((resolve, reject) => {
    sign.sign(data, (err, signedData) => {
      if (err) {
        reject(err);
      } else {
        resolve(signedData);
      }
    })
  });
}

async function verifyInit(verify: cpFw.Verify, priKey: cpFw.PubKey): Promise<void> {
  return new Promise((resolve, reject) => {
    verify.init(priKey, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    })
  });
}

async function verifyUpdate(verify: cpFw.Verify, data: cpFw.DataBlob): Promise<void> {
  return new Promise((resolve, reject) => {
    verify.update(data, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    })
  });
}

async function verifyVerify(verify: cpFw.Verify, data: cpFw.DataBlob, signatureData: cpFw.DataBlob): Promise<boolean> {
  return new Promise((resolve, reject) => {
    verify.verify(data, signatureData, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    })
  });
}

async function normalProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let input1: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test1.") };
  let input2: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test2.") };
  let signVerifyKeyPair: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Callback] signVerifyCallbackNormalProcess: signVerify start");
  try {
    signVerifyKeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
    console.log("[Callback] signVerifyCallbackNormalProcess: generateKeyPair succeed");
    await signInit(sign, signVerifyKeyPair.priKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: sign init succeed");
    await signUpdate(sign, input1);
    console.log("[Callback] signVerifyCallbackNormalProcess: sign update succeed");
    signedText = await signSign(sign, input2);
    await verifyInit(verify, signVerifyKeyPair.pubKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: verify init succeed");
    await verifyUpdate(verify, input1);
    console.log("[Callback] signVerifyCallbackNormalProcess: verify update succeed");
    return await verifyVerify(verify, input2, signedText);
  } catch (err) {
    console.error("[Callback] signVerifyCallbackNormalProcess: signVerify failed")
    throw err as Error;
  }
}

async function ECCCurveProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test.") };
  let signVerifyKeyPair: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Callback] signVerifyCallbackNormalProcess: signVerify start");
  try {
    signVerifyKeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
    console.log("[Callback] signVerifyCallbackNormalProcess: generateKeyPair succeed");
    await signInit(sign, signVerifyKeyPair.priKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: sign init succeed");
    signedText = await signSign(sign, input);
    await verifyInit(verify, signVerifyKeyPair.pubKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: verify init succeed");
    return await verifyVerify(verify, input, signedText);
  } catch (err) {
    console.error("[Callback] signVerifyCallbackNormalProcess: signVerify failed")
    throw err as Error;
  }
}

async function ECCCurveErrProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test.") };
  let signVerifyKeyPair1: cpFw.KeyPair;
  let signVerifyKeyPair2: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Callback] signVerifyCallbackNormalProcess: signVerify start");
  try {
    signVerifyKeyPair1 = await asyKeyGenCallbackFunc.genKeyPair(spec);
    signVerifyKeyPair2 = await asyKeyGenCallbackFunc.genKeyPair(spec);
    console.log("[Callback] signVerifyCallbackNormalProcess: generateKeyPair succeed");
    await signInit(sign, signVerifyKeyPair1.priKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: sign init succeed");
    signedText = await signSign(sign, input);
    await verifyInit(verify, signVerifyKeyPair2.pubKey);
    console.log("[Callback] signVerifyCallbackNormalProcess: verify init succeed");
    return await verifyVerify(verify, input, signedText);
  } catch (err) {
    console.error("[Callback] signVerifyCallbackNormalProcess: signVerify failed")
    throw err as Error;
  }
}

async function setUseridProcess(signVerifyAlgName: string, spec: cpFw.AsyKeySpec | string, userid1: string | null, userid2: string | null): Promise<boolean> {
  let input1: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test1.") };
  let input2: cpFw.DataBlob = { data: stringToUint8Array("This is a signVerify test2.") };
  let signVerifyKeyPair: cpFw.KeyPair;
  let signedText: cpFw.DataBlob;
  let sign: cpFw.Sign = cpFw.createSign(signVerifyAlgName);
  let verify: cpFw.Verify = cpFw.createVerify(signVerifyAlgName);
  console.log("[Callback] signVerifySetUseridProcess: signVerify start");
  try {
    signVerifyKeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
    console.log("[Callback] signVerifySetUseridProcess: generateKeyPair succeed");
    await signInit(sign, signVerifyKeyPair.priKey);
    console.log("[Callback] signVerifySetUseridProcess: sign init succeed");
    if (userid1 != null) {
      sign.setSignSpec(cpFw.SignSpecItem.SM2_USER_ID_UINT8ARR, stringToUint8Array(userid1));
      console.log("[Callback] signVerifySetUseridProcess: sign setSignSpec succeed");
    }
    await signUpdate(sign, input1);
    console.log("[Callback] signVerifySetUseridProcess: sign update succeed");
    signedText = await signSign(sign, input2);
    await verifyInit(verify, signVerifyKeyPair.pubKey);
    console.log("[Callback] signVerifySetUseridProcess: verify init succeed");
    if (userid2 != null) {
      verify.setVerifySpec(cpFw.SignSpecItem.SM2_USER_ID_UINT8ARR, stringToUint8Array(userid2));
      console.log("[Callback] signVerifySetUseridProcess: verify setVerifySpec succeed");
    }
    await verifyUpdate(verify, input1);
    console.log("[Callback] signVerifySetUseridProcess: verify update succeed");
    return await verifyVerify(verify, input2, signedText);
  } catch (err) {
    console.error("[Callback] signVerifySetUseridProcess: signVerify failed")
    throw err as Error;
  }
}

export {
  normalProcess,
  setUseridProcess,
  signInit,
  signUpdate,
  signSign,
  verifyInit,
  verifyUpdate,
  verifyVerify,
  ECCCurveProcess,
  ECCCurveErrProcess
}