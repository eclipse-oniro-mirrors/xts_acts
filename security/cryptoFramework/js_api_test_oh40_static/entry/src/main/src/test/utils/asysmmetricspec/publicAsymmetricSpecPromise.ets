/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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

async function generateSpecCommonAsyKeyPair(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  type: string): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    asyKeySpec
      .generateKeyPair()
      .then((asyKeyPair: cryptoFramework.KeyPair) => {
        console.log(
          "Security_CryptoFramework generateSpecCommonAsyKeyPair type " + type
        );
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
          let Sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_SK_BN
          );
          console.log("Security_CryptoFramework DSACommon Sk:" + Sk);
          let Pk: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_PK_BN
          );
          console.log("Security_CryptoFramework DSACommon Pk:" + Pk);
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
        resolve(asyKeyPair);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generateSpecAsyKeyPair failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generatePubKeyBySpec(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  type: string): Promise<cryptoFramework.PubKey> {
  return new Promise<cryptoFramework.PubKey>((resolve, reject) => {
    asyKeySpec
      .generatePubKey()
      .then((asyKeyPair: cryptoFramework.PubKey) => {
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
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatePriKeyByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generatePriKeyBySpec(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  type: string): Promise<cryptoFramework.PriKey> {
  return new Promise<cryptoFramework.PriKey>((resolve, reject) => {
    asyKeySpec
      .generatePriKey()
      .then((asyKeyPair: cryptoFramework.PriKey) => {
        if (type == "ECC") {
          let sk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
        } else if (type == "DSA") {
          let p: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_P_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey p:" + p);
        } else {
          let sk: bigint | string | int = asyKeyPair.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
          );
          console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
        }
        console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(asyKeyPair);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generateSpecAsyKeyPair failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateSpecKeyPair(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  type?: string): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    asyKeySpec
      .generateKeyPair()
      .then((asyKeyPair: cryptoFramework.KeyPair) => {
        if (type == "ECC") {
          let sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
          );
          console.log("Security_CryptoFramework ECCKeyPair sk:" + sk);
          let pkX: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
          );
          console.log("Security_CryptoFramework ECCKeyPair pkX:" + pkX);
          let pkY: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
          );
          console.log("Security_CryptoFramework ECCKeyPair pkY:" + pkY);
        } else if (type == "DSA") {
          let Sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_SK_BN
          );
          console.log("Security_CryptoFramework DSAKeyPair Sk:" + Sk);
          let PK: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_PK_BN
          );
          console.log("Security_CryptoFramework DSAKeyPair PK:" + PK);
        } else {
          let sk: bigint | string | int = asyKeyPair.priKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
          );
          console.log("Security_CryptoFramework RSAKeyPair sk:" + sk);
          let pk: bigint | string | int = asyKeyPair.pubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_PK_BN
          );
          console.log("Security_CryptoFramework RSAKeyPair pk:" + pk);
        }
        console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(asyKeyPair);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generateSpecAsyKeyPair failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateByPubKeyPair(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec,
  state: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    asyKeySpec
      .generatePubKey()
      .then((PubKey: cryptoFramework.PubKey) => {
        if (state == "ECC") {
          let pkX: bigint | string | int = PubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
          );
          console.log("generateByPubKeySpec ECCCommonPub pkX:" + pkX);
          let pkY: bigint | string | int = PubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
          );
          console.log("generateByPubKeySpec ECCCommonPub pkY:" + pkY);
        } else if (state == "DSA") {
          let pk: bigint | string | int = PubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.DSA_PK_BN
          );
          console.log("generateByPubKeySpec DSACommonPub pk:" + pk);
        } else {
          let pk: bigint | string | int = PubKey.getAsyKeySpec(
            cryptoFramework.AsyKeySpecItem.RSA_PK_BN
          );
          console.log("generateByPubKeySpec RSAommonPub pk:" + pk);
        }
        console.log("generateByPubKeySpec PubKey = " + PubKey);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error("[Promise] generateByPubKeySpec failed. error is " + err);
        reject(err);
      });
  });
}

async function generateByCommonSpec(asyKeySpec: cryptoFramework.AsyKeySpec,
  state: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateSpecCommonAsyKeyPair(asyKeyPairSpec, state)
      .then((asyKeyPair: cryptoFramework.KeyPair) => {
        console.log("[Promise] generatorByCommonSpec asyKeyPair " + asyKeyPair);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function generateByKeyPairSpec(asyKeySpec: cryptoFramework.AsyKeySpec, state: string): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateSpecKeyPair(asyKeyPairSpec, state)
      .then<cryptoFramework.PriKey>((asyKeyPair: cryptoFramework.KeyPair) => {
        console.log(
          "Security_CryptoFramework generatorByCommonSpec asyKeyPair " +
            asyKeyPair
        );
        return generatePriKeyBySpec(asyKeyPairSpec, state);
      })
      .then<cryptoFramework.PubKey>((priKey: cryptoFramework.PriKey) => {
        console.log(
          "Security_CryptoFramework generatorByCommonSpec priKey " + priKey
        );
        return generatePubKeyBySpec(asyKeyPairSpec, state);
      })
      .then(() => {
        resolve(true);
      })
      .catch((err: Error) => {
        console.error(
          "Security_CryptoFramework generatorByCommonSpec failed. error is " +
            err
        );
        reject(err);
      });
  });
}

async function generateByPubKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec, state: string): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateByPubKeyPair(asyKeyPairSpec, state)
      .then(() => {
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[Promise] generateByPubKeySpec failed. error is " + err);
        reject(err);
      });
  });
}

async function generateBySpecKeyPair(asyKeySpec: cryptoFramework.AsyKeyGeneratorBySpec): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    asyKeySpec
      .generateKeyPair()
      .then((keyPair: cryptoFramework.KeyPair) => {
        let globalKeyPair: cryptoFramework.KeyPair = keyPair;
        resolve(globalKeyPair);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function rsaPriGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateBySpecKeyPair(asyKeyPairSpec)
      .then((keyPair: cryptoFramework.KeyPair) => {
        let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.RSA_SK_BN
        );
        console.log("Security_CryptoFramework RSAPUB sk:" + sk);
        let n: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.RSA_N_BN
        );
        console.log("Security_CryptoFramework RSAPUB n:" + n);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function dsaPubGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateBySpecKeyPair(asyKeyPairSpec)
      .then((keyPair: cryptoFramework.KeyPair) => {
        let pk: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_PK_BN
        );
        console.log("Security_CryptoFramework DSAPUB pk:" + pk);
        let p: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_P_BN
        );
        console.log("Security_CryptoFramework DSAPUB p:" + p);
        let q: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_Q_BN
        );
        console.log("Security_CryptoFramework DSAPUB q:" + q);
        let g: bigint | string | int = keyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_G_BN
        );
        console.log("Security_CryptoFramework DSAPUB g:" + g);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function eccPriGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateBySpecKeyPair(asyKeyPairSpec)
      .then((keyPair: cryptoFramework.KeyPair) => {
        let sk: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_SK_BN
        );
        console.log("Security_CryptoFramework ECCPUB pkx:" + sk);
        let p: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
        );
        console.log("Security_CryptoFramework ECCPUB p:" + p);
        let a: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_A_BN
        );
        console.log("Security_CryptoFramework ECCPUB a:" + a);
        let b: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_B_BN
        );
        console.log("Security_CryptoFramework ECCPUB b:" + b);
        let gx: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
        );
        console.log("Security_CryptoFramework ECCPUB gx:" + gx);
        let gy: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
        );
        console.log("Security_CryptoFramework ECCPUB gx:" + gy);
        let n: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_N_BN
        );
        console.log("Security_CryptoFramework ECCPUB n:" + n);
        let h: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_H_NUM
        );
        console.log("Security_CryptoFramework ECCPUB n:" + h);
        let fieldType: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
        );
        console.log("Security_CryptoFramework ECCPUB fieldSize :" + fieldType);
        let fieldSize: bigint | string | int = keyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
        );
        console.log("Security_CryptoFramework ECCPUB fieldSize :" + fieldSize);
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generatorByCommonSpec failed. error is " + err
        );
        reject(err);
      });
  });
}

async function clearMemGetAsyKeySpec(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<boolean> {
  let gloablPriKey: cryptoFramework.PriKey;
  return new Promise<boolean>((resolve, reject) => {
    let asyKeyPairSpec: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    generateSpecKeyPair(asyKeyPairSpec)
      .then((keyPair: cryptoFramework.KeyPair) => {
        gloablPriKey = keyPair.priKey;
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

export {
  generateByCommonSpec,
  generateByKeyPairSpec,
  generateByPubKeySpec,
  rsaPriGetAsyKeySpec,
  dsaPubGetAsyKeySpec,
  eccPriGetAsyKeySpec,
  clearMemGetAsyKeySpec,
};
