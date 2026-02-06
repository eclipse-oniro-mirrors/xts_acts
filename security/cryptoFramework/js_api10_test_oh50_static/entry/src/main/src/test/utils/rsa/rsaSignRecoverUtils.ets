/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtil from '../common/commonUtils';
import * as rsa from '../pkcs1Topkcs8/pkcs1topkcs8';

async function signPromise(signAlg: string,
  priKey: cryptoFramework.PriKey, rawData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let signer: cryptoFramework.Sign = cryptoFramework.createSign(signAlg);
    await signer.init(priKey);
    let signData: cryptoFramework.DataBlob = await signer.sign(rawData);

    return signData;
  } catch (error) {
    console.error('sign sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function signPromiseWithUpdate(signAlg: string,
  priKey: cryptoFramework.PriKey, rawData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let signer: cryptoFramework.Sign = cryptoFramework.createSign(signAlg);
    await signer.init(priKey);
    await signer.update(rawData);
    let signData: cryptoFramework.DataBlob = await signer.sign(rawData);
    return signData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function verifyRSARecover(verifyAlg: string,
  pubKey: cryptoFramework.PubKey, signData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob|null> {
  try {
    let verifier: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlg);
    await verifier.init(pubKey);
    let rawSignData: cryptoFramework.DataBlob|null = await verifier.recover(signData);

    return rawSignData;
  } catch (error) {
    console.error('recover sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function verifyRSARecoverWithUpdate(verifyAlg: string,
  pubKey: cryptoFramework.PubKey, signData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob|null> {
  try {
    let verifier: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlg);
    await verifier.init(pubKey);
    await verifier.update(signData);
    let rawSignData: cryptoFramework.DataBlob|null = await verifier.recover(signData);

    return rawSignData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function verifyRSARecoverSync(verifyAlg: string,
  pubKey: cryptoFramework.PubKey, signData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob|null> {
  try {
    let verifier: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlg);
    await verifier.init(pubKey);
    let rawSignData: cryptoFramework.DataBlob|null = verifier.recoverSync(signData);

    return rawSignData;
  } catch (error) {
    console.error('recover sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function doMd(mdName: string, rawData: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let md: cryptoFramework.Md = cryptoFramework.createMd(mdName);
    let mdResult: cryptoFramework.DataBlob = await md.digest();
    return mdResult;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createSignRecover(algName: string, paddingName: string, mdName: string,
  dataLen: int, isOnlySign: boolean, isSync: boolean, isPadding: boolean): Promise<boolean> {
  let rawData: cryptoFramework.DataBlob;
  let keyPair: cryptoFramework.KeyPair;
  try {
    rawData = await commonUtil.createData(dataLen);
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    if (algName === "RSA1024") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str1024, rsa.priKeyPkcs1Str1024);
    } else if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str2048, rsa.priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str3072, rsa.priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str8192, rsa.priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
  try {
    let signAlg: string = "";
    if (isPadding) {
      signAlg = algName + "|" + paddingName + "|" + mdName;
    } else {
      signAlg = algName + "|" + mdName;
    }
    let algSignType: string = signAlg;
    let algVerifyType: string = signAlg + "|Recover";
    let ret: boolean = false;
    let verifyData: cryptoFramework.DataBlob|null;
    if (isOnlySign) {
      algSignType = algSignType + "|OnlySign";
    }
    let signData: cryptoFramework.DataBlob = await signPromise(algSignType, keyPair.priKey, rawData);
    if (isSync) {
      verifyData = await verifyRSARecoverSync(algVerifyType, keyPair.pubKey, signData);
    } else {
      verifyData = await verifyRSARecover(algVerifyType, keyPair.pubKey, signData);
    }
    if (verifyData != null) {
      ret = commonUtil.compareDataBlob(rawData, verifyData);
      return ret;
    } else {
      return ret;
    }
  } catch (error) {
    console.error('1sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export {
  signPromise,
  signPromiseWithUpdate,
  verifyRSARecover,
  verifyRSARecoverWithUpdate,
  doMd,
  createSignRecover,
}