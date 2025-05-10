/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as secp256k1 from './/utils/secp256k1/secp256k1Utils'
import { taskpool } from '@kit.ArkTS';
import {
  createFullData,
  compareDataBlob,
} from './utils/common/commonUtils';
import {
  createAsyKeyPromise,
  createAsyKeySync,
  digestSpec,
  doVerifyInitCallback,
  doVerifyUpdateCallback,
  doVerifyVerifyCallback,
  doSignInitCallback,
  doSignSignCallback,
  doSignUpdateCallback,
  doAgreementCallback,
  vectorTest,
} from './/utils/secp256k1/secp256k1Utils'

@Concurrent
async function doSignVerifyByDigestSpecStub(algName: string, dataLen: number): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  let msgData: cryptoFramework.DataBlob = await createFullData(dataLen);
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  while (!timeFlag) {
    try {
      let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
      for (let digestAlgName of digestSpec) {
        let signAlgName: string = algName + "|" + digestAlgName;
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        await sign.init(keyPair.priKey);
        let rawData: cryptoFramework.DataBlob = await sign.sign(msgData);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        await verify.init(keyPair.pubKey);
        ret = ret && await verify.verify(msgData, rawData);
        console.info("#################### res:" + algName + ":" + ret)
        if (!ret) {
          timeFlag = true;
        }
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doSignVerifyByDigestSpec “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

@Concurrent
async function doSignVerifyByDigestSpecCallbackStub(algName: string, dataLen: number): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  let msgData: cryptoFramework.DataBlob = await createFullData(dataLen);
  while (!timeFlag) {
    try {
      let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
      for (let digestAlgName of digestSpec) {
        let signAlgName: string = algName + "|" + digestAlgName;
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        await doSignInitCallback(sign, keyPair);
        let rawData: cryptoFramework.DataBlob = await doSignSignCallback(sign, msgData);

        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        await doVerifyInitCallback(verify, keyPair);
        ret = ret && await doVerifyVerifyCallback(verify, msgData, rawData);
        if (!ret) {
          timeFlag = true;
        }
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doSignVerifyByDigestSpecCallback “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doAgreementByDigestSpecStub(algName: string): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  while (!timeFlag) {
    try {
      let keyPair_r: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
      let keyPair_h: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
      let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
      let secret_r: cryptoFramework.DataBlob = await agreement.generateSecret(keyPair_r.priKey, keyPair_h.pubKey);
      let secret_h: cryptoFramework.DataBlob = await doAgreementCallback(algName, keyPair_r.pubKey, keyPair_h.priKey);
      let secret_y: cryptoFramework.DataBlob = agreement.generateSecretSync(keyPair_r.priKey, keyPair_h.pubKey);
      ret = compareDataBlob(secret_r, secret_h);
      ret = ret && compareDataBlob(secret_r, secret_y);
      if (!ret) {
        timeFlag = true;
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doAgreementByDigestSpecStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

@Concurrent
async function doSignVerifyWithUpdateByDigestSpecCallbackStub(algName: string, dataLen: number, blockSize: number): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  let msg: cryptoFramework.DataBlob = await createFullData(dataLen);
  while (!timeFlag) {
    try {
      let ret: boolean = true;
      let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
      for (let digestAlgName of digestSpec) {
        let signAlgName: string = algName + "|" + digestAlgName;
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        await doSignInitCallback(sign, keyPair);
        let msgLen: number = msg.data.byteLength;
        let iterate: number = msgLen / blockSize;
        let rem: number = msgLen % blockSize;
        if (rem != 0) {
          iterate = (msgLen - rem) / blockSize;
        }
        for (let index = 0; index < iterate; index++) {
          let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await doSignUpdateCallback(sign, updateText);
          if (rem != 0 && index + 1 == iterate) {
            let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
            let updateText: cryptoFramework.DataBlob = { data: tmp };
            await doSignUpdateCallback(sign, updateText);
          }
        }
        let dataSign = await doSignSignCallback(sign, null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        await verify.init(keyPair.pubKey);
        for (let index = 0; index < iterate; index++) {
          let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await doVerifyUpdateCallback(verify, updateText);
          if (rem != 0 && index + 1 == iterate) {
            let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
            let updateText: cryptoFramework.DataBlob = { data: tmp };
            await doVerifyUpdateCallback(verify, updateText);
          }
        }
        ret = ret && await doVerifyVerifyCallback(verify, null, dataSign);
        console.info("############################### alg:" + signAlgName + ":" + ret)
        if (!ret) {
          timeFlag = true;
        }
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doSignVerifyWithUpdateByDigestSpecCallbackStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}


@Concurrent
async function doSignVerifyByDigestSpec(algName: string, msgData: cryptoFramework.DataBlob): Promise<boolean> {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      await sign.init(keyPair.priKey);
      let rawData: cryptoFramework.DataBlob = await sign.sign(msgData);

      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      await verify.init(keyPair.pubKey);
      ret = ret && await verify.verify(msgData, rawData);
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyByDigestSpec “${error}“, error code: ${error.code}`);
    return false;
  }
}

@Concurrent
async function doSignVerifyWithUpdateByDigestSpec(algName: string,
  msg: cryptoFramework.DataBlob, blockSize: number): Promise<boolean> {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      await sign.init(keyPair.priKey);
      let msgLen: number = msg.data.byteLength;
      let iterate: number = msgLen / blockSize;
      let rem: number = msgLen % blockSize;
      if (rem != 0) {
        iterate = (msgLen - rem) / blockSize;
      }
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        await sign.update(updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await sign.update(updateText);
        }
      }
      let dataSign = await sign.sign(null);
      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      await verify.init(keyPair.pubKey);
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        await verify.update(updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await verify.update(updateText);
        }
      }
      ret = ret && await verify.verify(null, dataSign);
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyWithUpdateByDigestSpec “${error}“, error code: ${error.code}`);
    return false;
  }
}

@Concurrent
function doSignVerifyByDigestSpecSync(algName: string, msgData: cryptoFramework.DataBlob): boolean {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = createAsyKeySync(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      sign.initSync(keyPair.priKey);
      let rawData: cryptoFramework.DataBlob = sign.signSync(msgData);

      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      verify.initSync(keyPair.pubKey);
      ret = ret && verify.verifySync(msgData, rawData);
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyByDigestSpecSync “${error}“, error code: ${error.code}`);
    return false;
  }
}

@Concurrent
function doSignVerifyWithUpdateByDigestSpecSync(algName: string,
  msg: cryptoFramework.DataBlob, blockSize: number): boolean {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = createAsyKeySync(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      sign.initSync(keyPair.priKey);
      let msgLen: number = msg.data.byteLength;
      let iterate: number = msgLen / blockSize;
      let rem: number = msgLen % blockSize;
      if (rem != 0) {
        iterate = (msgLen - rem) / blockSize;
      }
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        sign.updateSync(updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          sign.updateSync(updateText);
        }
      }
      let dataSign = sign.signSync(null);
      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      verify.initSync(keyPair.pubKey);
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        verify.updateSync(updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          verify.updateSync(updateText);
        }
      }
      ret = ret && verify.verifySync(null, dataSign);
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyWithUpdateByDigestSpec “${error}“, error code: ${error.code}`);
    return false;
  }
}

@Concurrent
async function doSignVerifyByDigestSpecCallback(algName: string, msgData: cryptoFramework.DataBlob): Promise<boolean> {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      await doSignInitCallback(sign, keyPair);
      let rawData: cryptoFramework.DataBlob = await doSignSignCallback(sign, msgData);

      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      await doVerifyInitCallback(verify, keyPair);
      ret = ret && await doVerifyVerifyCallback(verify, msgData, rawData);
      console.info("############################### alg:" + signAlgName + ":" + ret + ":" + msgData.data.byteLength + "#############" + rawData.data.byteLength)
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyByDigestSpecCallback “${error}“, error code: ${error.code}`);
    return false;
  }
}

@Concurrent
async function doSignVerifyWithUpdateByDigestSpecCallback(algName: string,
  msg: cryptoFramework.DataBlob, blockSize: number): Promise<boolean> {
  try {
    let ret: boolean = true;
    let keyPair: cryptoFramework.KeyPair = await createAsyKeyPromise(algName);
    for (let digestAlgName of digestSpec) {
      let signAlgName: string = algName + "|" + digestAlgName;
      let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
      await doSignInitCallback(sign, keyPair);
      let msgLen: number = msg.data.byteLength;
      let iterate: number = msgLen / blockSize;
      let rem: number = msgLen % blockSize;
      if (rem != 0) {
        iterate = (msgLen - rem) / blockSize;
      }
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        await doSignUpdateCallback(sign, updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await doSignUpdateCallback(sign, updateText);
        }
      }
      let dataSign = await doSignSignCallback(sign, null);
      let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
      await verify.init(keyPair.pubKey);
      for (let index = 0; index < iterate; index++) {
        let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
        let updateText: cryptoFramework.DataBlob = { data: tmp };
        await doVerifyUpdateCallback(verify, updateText);
        if (rem != 0 && index + 1 == iterate) {
          let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
          let updateText: cryptoFramework.DataBlob = { data: tmp };
          await doVerifyUpdateCallback(verify, updateText);
        }
      }
      ret = ret && await doVerifyVerifyCallback(verify, null, dataSign);
      console.info("############################### alg:" + signAlgName + ":" + ret + ":" + msg.data.byteLength + "#############" + dataSign.data.byteLength)
    }
    return ret;
  } catch (error) {
    console.error(`doSignVerifyWithUpdateByDigestSpecCallback “${error}“, error code: ${error.code}`);
    return false;
  }
}

export default function SecurityCryptoFwSECP256K1TestUnit() {
  describe('SecurityCryptoFwSECP256K1TestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0100
     * @tc.name Test ECC secp256k1 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0100", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let keyPair: cryptoFramework.KeyPair = await secp256k1.createAsyKeyPromise(algName);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let priKeyBlobDer: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS8");
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let convKeyPairDer: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, null, priKeyBlobDer);
        let conPriKeyBlobDer: cryptoFramework.DataBlob = convKeyPairDer.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA512";
        let ret: boolean = await secp256k1.doSignVerifyPromise(algSignName, keyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algName, keyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algName, convKeyPair.pubKey, keyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algName, keyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlobDer);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0200
     * @tc.name Test ECC secp256k1 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0200", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let algAgreeName: string = "ECC";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub, secp256k1.secp256k1_pri);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = await secp256k1.doSignVerifyPromise(algSignName, keyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algAgreeName, keyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algAgreeName, convKeyPair.pubKey, keyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algAgreeName, keyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0300
     * @tc.name Test ECC secp256k1 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0300", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub, secp256k1.secp256k1_pri);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA384";
        let rawData: cryptoFramework.DataBlob = await secp256k1.doSignPromise(algSignName, keyPair, msgBlob);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algSignName);
        let result: string = await secp256k1.doVerifyInitCallback(verify, keyPair);
        if (result === "init success") {
          let verifyRes: boolean = await secp256k1.doVerifyVerifyCallback(verify, msgBlob, rawData);
          expect(verifyRes).assertTrue();
        } else {
          expect(null).assertFail();
        }
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0400
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0400", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub_r, secp256k1.secp256k1_pri);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
        ret = await secp256k1.doSignVerifyPromise(algSignName, convKeyPair, dataBlob);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0500
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0500", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(null, secp256k1.secp256k1_pri);
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0600
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0600", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub, null);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, null);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0700
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0700", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub, null);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, null);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0800
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0800", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_0900
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_0900", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, null);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1000
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1000", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1100
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1100", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let keyPair: cryptoFramework.KeyPair = await secp256k1.createAsyKeyPromise(algName);
        secp256k1.showEccSpecDetailInfo(keyPair.pubKey, "pubKey")
        secp256k1.showEccSpecDetailInfo(keyPair.priKey, "priKey")
        let rawData: cryptoFramework.DataBlob = secp256k1.doSignSync(algSignName, keyPair, msgBlob);
        let ret: boolean = await secp256k1.doVerifyPromise(algSignName, keyPair, msgBlob, rawData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1200
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1200", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let keyPair: cryptoFramework.KeyPair = await secp256k1.createAsyKeyPromise(algName);
        let rawData: cryptoFramework.DataBlob = secp256k1.doSignSync(algSignName, keyPair, msgBlob);
        let ret: boolean = await secp256k1.doVerifyPromise(algSignName, keyPair, msgBlob, rawData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1300
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1300", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair =
          await generator.convertPemKey(secp256k1.secp256k1_pub, secp256k1.ECC_BrainPoolP256r1_pri);
        let rawData: cryptoFramework.DataBlob = await secp256k1.doSignPromise(algSignName, keyPair, msgBlob);
        let ret: boolean = await secp256k1.doVerifyPromise(algSignName, keyPair, msgBlob, rawData);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1400
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1400", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.ECC_BrainPoolP192r1_pri_number)};
        let keyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyPromise(algName, pubKeyBlob, priKeyBlob);
        let rawData: cryptoFramework.DataBlob = await secp256k1.doSignPromise(algSignName, keyPair, msgBlob);
        let ret: boolean = await secp256k1.doVerifyPromise(algSignName, keyPair, msgBlob, rawData);
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
        await agreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1500
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1500", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgData: cryptoFramework.DataBlob = await createFullData(dataLen);
        let ret = await taskpool.execute(doSignVerifyByDigestSpec, algName, msgData)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1600
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1600", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 60;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let blockSize: number = 8;
        let ret = await taskpool.execute(doSignVerifyWithUpdateByDigestSpec, algName, msgBlob, blockSize)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1700
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1700", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 60;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let blockSize: number = 8;
        let ret = await taskpool.execute(doSignVerifyWithUpdateByDigestSpecSync, algName, msgBlob, blockSize)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1800
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1800", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 60;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let ret = await taskpool.execute(doSignVerifyByDigestSpecSync, algName, msgBlob)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_1900
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_1900", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let keyPair: cryptoFramework.KeyPair = secp256k1.createAsyKeySync(algName);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let priKeyBlobDer: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS8");
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let convKeyPairDer: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, null, priKeyBlobDer);
        let conPriKeyBlobDer: cryptoFramework.DataBlob = convKeyPairDer.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        let ret: boolean = secp256k1.doSignVerifySync(algSignName, keyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algName, keyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algName, convKeyPair.pubKey, keyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algName, keyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlobDer);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2000
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2000", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        let ret: boolean = secp256k1.doSignVerifySync(algSignName, convKeyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algName, convKeyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algName, convKeyPair.pubKey, convKeyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algName, convKeyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2100
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2100", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        secp256k1.doSignSync(algSignName, convKeyPair, dataBlob);
        let ret: boolean = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2200
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2200", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, null);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let algSignName: string = "ECC|SHA224";
        let msgBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.msgData)};
        let rawBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.rawData)}
        let ret: boolean = secp256k1.doVerifySync(algSignName, convKeyPair, msgBlob, rawBlob);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2300
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2300", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let algAgreeName: string = "ECC";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(secp256k1.secp256k1_pub, secp256k1.secp256k1_pri);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = await secp256k1.doSignVerifyPromise(algSignName, keyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algAgreeName, keyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algAgreeName, convKeyPair.pubKey, keyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algAgreeName, keyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2400
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2400", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(null, secp256k1.secp256k1_pri);
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA1";
        secp256k1.doSignSync(algSignName, keyPair, dataBlob);
        expect(true).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2500
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2500", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(secp256k1.secp256k1_pub, null);
        let algSignName: string = "ECC|SHA1";
        let msgBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.msgData_r)};
        let rawBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.rawData_r)}
        let ret: boolean = secp256k1.doVerifySync(algSignName, keyPair, msgBlob, rawBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2600
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2600", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(secp256k1.secp256k1_pub_r, secp256k1.secp256k1_pri);
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = secp256k1.doSignVerifySync(algSignName, keyPair, dataBlob);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2700
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2700", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number_r)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = secp256k1.doSignVerifySync(algSignName, convKeyPair, dataBlob);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2800
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2800", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA384";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair =
          generator.convertPemKeySync(secp256k1.secp256k1_pub, secp256k1.ECC_BrainPoolP256r1_pri);
        let rawData: cryptoFramework.DataBlob = secp256k1.doSignSync(algSignName, keyPair, msgBlob);
        let ret: boolean = secp256k1.doVerifySync(algSignName, keyPair, msgBlob, rawData);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_2900
     * @tc.name Test ECC secp256k1 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_2900", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.ECC_BrainPoolP192r1_pri_number)};
        let keyPair: cryptoFramework.KeyPair = secp256k1.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
        let rawData: cryptoFramework.DataBlob = secp256k1.doSignSync(algSignName, keyPair, msgBlob);
        let ret: boolean = secp256k1.doVerifySync(algSignName, keyPair, msgBlob, rawData);
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
        await agreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3000
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3000", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let keyPair: cryptoFramework.KeyPair = await secp256k1.createAsyKeyCallback(algName);
        let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        let priKeyBlobDer: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS8");
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let convKeyPairDer: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, null, priKeyBlobDer);
        let conPriKeyBlobDer: cryptoFramework.DataBlob = convKeyPairDer.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        let ret: boolean = secp256k1.doSignVerifySync(algSignName, keyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algName, keyPair.pubKey, convKeyPair.priKey);
        let secret_b: cryptoFramework.DataBlob = secp256k1.doAgreementSync(algName, convKeyPair.pubKey, keyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algName, keyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_b);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlobDer);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3100
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3100", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, pubKeyBlob, priKeyBlob);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        let ret: boolean = await secp256k1.doSignVerifyPromise(algSignName, convKeyPair, dataBlob);
        let secret_a: cryptoFramework.DataBlob = await secp256k1.doAgreementPromise(algName, convKeyPair.pubKey, convKeyPair.priKey);
        let secret_c: cryptoFramework.DataBlob = await secp256k1.doAgreementCallback(algName, convKeyPair.pubKey, convKeyPair.priKey);
        ret= ret && commonUtils.compareDataBlob(secret_a, secret_c);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3200
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3200", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let dataLen: number = 64;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA224";
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(algSignName);
        let signRes: string = await secp256k1.doSignInitCallback(sign, convKeyPair);
        if (signRes === "init success") {
          expect(null).assertNull();
        } else {
          expect(null).assertTrue();
        }
        await secp256k1.doSignSignCallback(sign, dataBlob);
        let ret: boolean = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3300
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3300", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, pubKeyBlob, null);
        let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
        let algSignName: string = "ECC|SHA224";
        let msgBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.msgData)};
        let rawBlob: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.rawData)}
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algSignName);
        let verifyRes: string = await secp256k1.doVerifyInitCallback(verify, convKeyPair);
        if (verifyRes === "init success") {
          expect(null).assertNull();
        } else {
          expect(null).assertTrue();
        }
        let ret: boolean = await secp256k1.doVerifyVerifyCallback(verify, msgBlob, rawBlob);
        ret= ret && commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3400
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3400", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgData: cryptoFramework.DataBlob = await createFullData(dataLen);
        let ret = await taskpool.execute(doSignVerifyByDigestSpecCallback, algName, msgData)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3500
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3500", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 60;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let blockSize: number = 8;
        let ret = await taskpool.execute(doSignVerifyWithUpdateByDigestSpecCallback, algName, msgBlob, blockSize)
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3600
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3600", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let dataLen: number = 64;
        let msgBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC_Secp256k1|SHA1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.ECC_BrainPoolP192r1_pri_number)};
        let keyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, pubKeyBlob, priKeyBlob);
        let rawData: cryptoFramework.DataBlob = await secp256k1.doSignPromise(algSignName, keyPair, msgBlob);
        let ret: boolean = await secp256k1.doVerifyPromise(algSignName, keyPair, msgBlob, rawData);
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
        await agreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3700
     * @tc.name Test ECC secp256k1 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3700", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let pubKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pub_number_r)};
        let priKeyBlob: cryptoFramework.DataBlob = {data:new Uint8Array(secp256k1.secp256k1_pri_number)};
        let convKeyPair: cryptoFramework.KeyPair = await secp256k1.convertAsyKeyCallback(algName, pubKeyBlob, priKeyBlob);
        let dataLen: number = 10;
        let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(dataLen);
        let algSignName: string = "ECC|SHA256";
        let ret: boolean = await secp256k1.doSignVerifyPromise(algSignName, convKeyPair, dataBlob);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_3900
     * @tc.name Test ECC secp256k1 algorithm traversal test. vector style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_3900", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let ret: boolean = await vectorTest(algName);

        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SECP256K1_Func_4000
     * @tc.name Test ECC secp256k1 algorithm traversal test. demo style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SECP256K1_Func_4000", 0, async (done: Function) => {
      try {
        let algName: string = "ECC_Secp256k1";
        let verifyAlgName: string = "ECC_Secp256k1|SHA256";
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.demo_msg)};
        let rawData: cryptoFramework.DataBlob = {data: new Uint8Array(secp256k1.demo_sig)};
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(secp256k1.secp256k1_pub, null);
        let ret: boolean = await secp256k1.doVerifyPromise(verifyAlgName, keyPair, msg, rawData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });


  });
}