/*
 * Copyright (C) 2022-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import cryptoFramework from "@ohos.security.cryptoFramework";
import { createAsyKeyGeneratorBySpec } from "./publicAsymmetricSpecCommon";

async function generateSpecCommonAsyKeyPair(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec, type: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    asyKeySpec.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback] generateSpecCommonAsyKeyPair failed. error is " + err
        );
        reject(err as Error);
      } else {
        console.log("Security_CryptoFramework type " + type);
        let asyKeyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        if (type == "ECC") {
          let sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommon sk:" + sk);
          let pkX: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
          );
          console.log("Security_CryptoFramework ECCCommon pkX:" + pkX);
          let pkY: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
          );
          console.log("Security_CryptoFramework ECCCommon pkY:" + pkY);
        } else if (type == "DSA") {
          let p: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_P_BN
          );
          console.log("Security_CryptoFramework DSACommon p:" + p);
          let q: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_Q_BN
          );
          console.log("Security_CryptoFramework DSACommon q:" + q);
        } else {
          let sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
          );
          console.log("Security_CryptoFramework RSACommon sk:" + sk);
          let pk: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_PK_BN
          );
          console.log("Security_CryptoFramework RSACommon pk:" + pk);
        }
        console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(undefined);
      }
    });
  });
}

async function generatePubKeyByCommonSpec(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  type: string): Promise<cryptoFramework.PubKey> {
  return new Promise<cryptoFramework.PubKey>((resolve, reject) => {
    asyKeySpec.generatePubKey((err: BusinessError<void>|null, tmp: cryptoFramework.PubKey|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback] generatePriKeyByCommonSpec failed. error is " + err
        );
        reject(err as Error);
      } else {
        let asyKeyPair: cryptoFramework.PubKey = tmp as cryptoFramework.PubKey;
        if (type == "ECC") {
          let pkX: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
          );
          console.log("Security_CryptoFramework ECCCommonPub pkX:" + pkX);
          let pkY: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
          );
          console.log("Security_CryptoFramework ECCCommonPub pkY:" + pkY);
        } else if (type == "DSA") {
          let pk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_PK_BN
          );
          console.log("Security_CryptoFramework DSACommonPub pk:" + pk);
        } else {
          let pk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_PK_BN
          );
          console.log("Security_CryptoFramework RSAommonPub pk:" + pk);
        }
        console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(asyKeyPair);
      }
    });
  });
}

async function generatePriKeyByCommonSpec(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec, type: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    asyKeySpec
      .generatePriKey()
      .then((asyKeyPair: cryptoFramework.PriKey) => {
        if (type == "ECC") {
          let sk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
        } else if (type == "DSA") {
          let sk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
        } else {
          let sk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
        }
        console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] generatePriKeyByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateByCommonSpec(asyKeySpec: cryptoFramework.AsyKeySpec, state: string): Promise<boolean> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<boolean>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    generateSpecCommonAsyKeyPair(asyKeyPairSpec!, state)
      .then(() => {
        console.log(
          "[Callback] generatorByCommonSpec asyKeyPair "
        );
        resolve(true);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateByKeyPairSpec(asyKeySpec: cryptoFramework.AsyKeySpec, state: string): Promise<void> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<void>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    generateSpecCommonAsyKeyPair(asyKeyPairSpec!, state)
      .then(() => {
        console.log(
          "[Callback] generateByKeyPairSpec asyKeyPair "
        );
        return generatePriKeyByCommonSpec(asyKeyPairSpec!, state);
      })
      .then((priKey) => {
        console.log("[Callback] generateByKeyPairSpec priKey " + priKey);
        return generatePubKeyByCommonSpec(asyKeyPairSpec!, state);
      })
      .then((pubKey) => {
        console.log("[Callback] generateByKeyPairSpec pubKey " + pubKey);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Callback] generateByKeyPairSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateByPriKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec, state: string): Promise<boolean> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<boolean>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    asyKeyPairSpec!.generatePriKey((err: BusinessError<void>|null, tmp: cryptoFramework.PriKey|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback] generateByPriKeySpec failed. error is " + err
        );
        reject(err as Error);
      } else {
        let PriKey: cryptoFramework.PriKey = tmp as cryptoFramework.PriKey;
        if (state == "ECC") {
          let sk: bigint | string | int = PriKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
          );
          console.log("generateByPriKeySpec ECCCommonPriKey sk:" + sk);
        } else if (state == "DSA") {
          let sk: bigint | string | int = PriKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_SK_BN
          );
          console.log("generateByPriKeySpec ECCCommonPriKey sk:" + sk);
        } else {
          let sk: bigint | string | int = PriKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
          );
          console.log("generateByPriKeySpec ECCCommonPriKey sk:" + sk);
        }
        resolve(true);
      }
    });
  });
}

async function rsaPubGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<void>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    asyKeyPairSpec!.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback] rsaPubGetAsyKeySpec failed. error is " + err);
        reject(err as Error);
      } else {
        let keyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        let pk: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.RSA_PK_BN
        );
        console.log("Security_CryptoFramework RSAPUB PK:" + pk);
        let n: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.RSA_N_BN
        );
        console.log("Security_CryptoFramework RSAPUB n:" + n);
        resolve(undefined);
      }
    });
  });
}

async function eccPubGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<void>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    asyKeyPairSpec!.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback] eccPubGetAsyKeySpec failed. error is " + err);
        reject(err as Error);
      } else {
        let keyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        let pkx: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
        );
        console.log("Security_CryptoFramework ECCPUB pkx:" + pkx);
        let pky: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
        );
        console.log("Security_CryptoFramework ECCPUB pky:" + pky);
        let p: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
        );
        console.log("Security_CryptoFramework ECCPUB p:" + p);
        let a: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_A_BN
        );
        console.log("Security_CryptoFramework ECCPUB a:" + a);
        let b: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_B_BN
        );
        console.log("Security_CryptoFramework ECCPUB b:" + b);
        let gx: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
        );
        console.log("Security_CryptoFramework ECCPUB gx:" + gx);
        let gy: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
        );
        console.log("Security_CryptoFramework ECCPUB gx:" + gy);
        let n: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_N_BN
        );
        console.log("Security_CryptoFramework ECCPUB n:" + n);
        let h: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_H_NUM
        );
        console.log("Security_CryptoFramework ECCPUB h:" + h);
        let fieldType: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
        );
        console.log("Security_CryptoFramework ECCPUB fieldType :" + fieldType);
        let fieldSize: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
        );
        console.log("Security_CryptoFramework ECCPUB fieldSize :" + fieldSize);
        resolve(undefined);
      }
    });
  });
}

async function dsaPriGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<void>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    asyKeyPairSpec!.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback] dsaPriGetAsyKeySpec failed. error is " + err);
        reject(err as Error);
      } else {
        let keyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_SK_BN
        );
        console.log("Security_CryptoFramework DSAPRI pk:" + sk);
        let p: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_P_BN
        );
        console.log("Security_CryptoFramework DSAPRI p:" + p);
        let q: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_Q_BN
        );
        console.log("Security_CryptoFramework DSAPRI q:" + q);
        let g: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_G_BN
        );
        console.log("Security_CryptoFramework DSAPRI g:" + g);
        resolve(undefined);
      }
    });
  });
}

async function clearMemGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec | undefined;
  return new Promise<void>((resolve, reject) => {
    try {
      asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    } catch (err) {
      reject(err as Error);
    }
    asyKeyPairSpec!.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback] clearMemGetAsyKeySpec failed. error is " + err
        );
        reject(err as Error);
      } else {
        let keyPair: cryptoFramework.KeyPair = tmp as cryptoFramework.KeyPair;
        keyPair.priKey.clearMem();
        resolve(undefined);
      }
    });
  });
}

export {
  generateByCommonSpec,
  generateByKeyPairSpec,
  generateByPriKeySpec,
  rsaPubGetAsyKeySpec,
  eccPubGetAsyKeySpec,
  dsaPriGetAsyKeySpec,
  clearMemGetAsyKeySpec,
};
