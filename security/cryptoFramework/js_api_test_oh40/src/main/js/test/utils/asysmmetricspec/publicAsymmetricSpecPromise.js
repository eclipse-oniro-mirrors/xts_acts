/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import cryptoFramework from "@ohos.security.cryptoFramework";
import { createAsyKeyGeneratorBySpec } from "./publicAsymmetricSpecCommon";

async function generateSpecCommonAsyKeyPair(asyKeySpec, type) {
    var type = type;
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generateKeyPair()
            .then((asyKeyPair) => {
                console.log(
                    "Security_CryptoFramework generateSpecCommonAsyKeyPair type " + type
                );
                if (type == "ECC") {
                    let sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_SK_BN
                    );
                    console.log("Security_CryptoFramework ECCCommon sk:" + sk);
                    let pkX = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
                    );
                    console.log("Security_CryptoFramework ECCCommon pkX:" + pkX);
                    let pkY = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
                    );
                    console.log("Security_CryptoFramework ECCCommon pkY:" + pkY);
                } else if (type == "DSA") {
                    let Sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                    );
                    console.log("Security_CryptoFramework DSACommon Sk:" + Sk);
                    let Pk = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                    );
                    console.log("Security_CryptoFramework DSACommon Pk:" + Pk);
                } else {
                    let sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_SK_BN
                    );
                    console.log("Security_CryptoFramework RSACommon sk:" + sk);
                    let pk = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_PK_BN
                    );
                    console.log("Security_CryptoFramework RSACommon pk:" + pk);
                }
                console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
                resolve(asyKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generateSpecAsyKeyPair failed. error is " + err
                );
                reject(err);
            });
    });
}

async function generatePubKeyBySpec(asyKeySpec, type) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generatePubKey()
            .then((asyKeyPair) => {
                if (type == "ECC") {
                    let pkX = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
                    );
                    console.log("Security_CryptoFramework ECCCommonPub pkX:" + pkX);
                    let pkY = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
                    );
                    console.log("Security_CryptoFramework ECCCommonPub pkY:" + pkY);
                } else if (type == "DSA") {
                    let pk = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                    );
                    console.log("Security_CryptoFramework DSACommonPub pk:" + pk);
                } else {
                    let pk = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_PK_BN
                    );
                    console.log("Security_CryptoFramework RSAommonPub pk:" + pk);
                }
                console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
                resolve(asyKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatePriKeyByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function generatePriKeyBySpec(asyKeySpec, type) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generatePriKey()
            .then((asyKeyPair) => {
                if (type == "ECC") {
                    let sk = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_SK_BN
                    );
                    console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
                } else if (type == "DSA") {
                    let p = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_P_BN
                    );
                    console.log("Security_CryptoFramework ECCCommonPriKey p:" + p);
                } else {
                    let sk = asyKeyPair.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_SK_BN
                    );
                    console.log("Security_CryptoFramework ECCCommonPriKey sk:" + sk);
                }
                console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
                resolve(asyKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generateSpecAsyKeyPair failed. error is " + err
                );
                reject(err);
            });
    });
}

async function generateSpecKeyPair(asyKeySpec, type) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generateKeyPair()
            .then((asyKeyPair) => {
                if (type == "ECC") {
                    let sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_SK_BN
                    );
                    console.log("Security_CryptoFramework ECCKeyPair sk:" + sk);
                    let pkX = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
                    );
                    console.log("Security_CryptoFramework ECCKeyPair pkX:" + pkX);
                    let pkY = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
                    );
                    console.log("Security_CryptoFramework ECCKeyPair pkY:" + pkY);
                } else if (type == "DSA") {
                    let Sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                    );
                    console.log("Security_CryptoFramework DSAKeyPair Sk:" + Sk);
                    let PK = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                    );
                    console.log("Security_CryptoFramework DSAKeyPair PK:" + PK);
                } else {
                    let sk = asyKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_SK_BN
                    );
                    console.log("Security_CryptoFramework RSAKeyPair sk:" + sk);
                    let pk = asyKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_PK_BN
                    );
                    console.log("Security_CryptoFramework RSAKeyPair pk:" + pk);
                }
                console.log("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
                resolve(asyKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generateSpecAsyKeyPair failed. error is " + err
                );
                reject(err);
            });
    });
}

async function generateByPubKeyPair(asyKeySpec, state) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generatePubKey()
            .then((PubKey) => {
                if (state == "ECC") {
                    let pkX = PubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
                    );
                    console.log("generateByPubKeySpec ECCCommonPub pkX:" + pkX);
                    let pkY = PubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
                    );
                    console.log("generateByPubKeySpec ECCCommonPub pkY:" + pkY);
                } else if (state == "DSA") {
                    let pk = PubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                    );
                    console.log("generateByPubKeySpec DSACommonPub pk:" + pk);
                } else {
                    let pk = PubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_PK_BN
                    );
                    console.log("generateByPubKeySpec RSAommonPub pk:" + pk);
                }
                console.log("generateByPubKeySpec PubKey = " + PubKey);
                resolve();
            })
            .catch((err) => {
                console.error("[Promise] generateByPubKeySpec failed. error is " + err);
                reject(err);
            });
    });
}

async function generateByCommonSpec(asyKeySpec, state) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateSpecCommonAsyKeyPair(asyKeyPairSpec, state)
            .then((asyKeyPair) => {
                console.log("[Promise] generatorByCommonSpec asyKeyPair " + asyKeyPair);
                resolve();
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatorByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function generateByKeyPairSpec(asyKeySpec, state) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateSpecKeyPair(asyKeyPairSpec, state)
            .then((asyKeyPair) => {
                console.log(
                    "Security_CryptoFramework generatorByCommonSpec asyKeyPair " +
                    asyKeyPair
                );
                return generatePriKeyBySpec(asyKeyPairSpec, state);
            })
            .then((priKey) => {
                console.log(
                    "Security_CryptoFramework generatorByCommonSpec priKey " + priKey
                );
                return generatePubKeyBySpec(asyKeyPairSpec, state);
            })
            .then(() => {
                resolve(true);
            })
            .catch((err) => {
                console.error(
                    "Security_CryptoFramework generatorByCommonSpec failed. error is " +
                    err
                );
                reject(err);
            });
    });
}

async function generateByPubKeySpec(asyKeySpec, state) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateByPubKeyPair(asyKeyPairSpec, state)
            .then(() => {
                resolve(true);
            })
            .catch((err) => {
                console.error("[Promise] generateByPubKeySpec failed. error is " + err);
                reject(err);
            });
    });
}

async function generateBySpecKeyPair(asyKeySpec) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generateKeyPair()
            .then((keyPair) => {
                let globalKeyPair = keyPair;
                resolve(globalKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatorByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function rsaPriGetAsyKeySpec(asyKeySpec) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateBySpecKeyPair(asyKeyPairSpec)
            .then((keyPair) => {
                let sk = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.RSA_SK_BN
                );
                console.log("Security_CryptoFramework RSAPUB sk:" + sk);
                let n = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.RSA_N_BN
                );
                console.log("Security_CryptoFramework RSAPUB n:" + n);
                resolve();
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatorByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function dsaPubGetAsyKeySpec(asyKeySpec) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateBySpecKeyPair(asyKeyPairSpec)
            .then((keyPair) => {
                let pk = keyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                );
                console.log("Security_CryptoFramework DSAPUB pk:" + pk);
                let p = keyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_P_BN
                );
                console.log("Security_CryptoFramework DSAPUB p:" + p);
                let q = keyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_Q_BN
                );
                console.log("Security_CryptoFramework DSAPUB q:" + q);
                let g = keyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_G_BN
                );
                console.log("Security_CryptoFramework DSAPUB g:" + g);
                resolve();
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatorByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function eccPriGetAsyKeySpec(asyKeySpec) {
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateBySpecKeyPair(asyKeyPairSpec)
            .then((keyPair) => {
                let sk = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_SK_BN
                );
                console.log("Security_CryptoFramework ECCPUB pkx:" + sk);
                let p = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
                );
                console.log("Security_CryptoFramework ECCPUB p:" + p);
                let a = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_A_BN
                );
                console.log("Security_CryptoFramework ECCPUB a:" + a);
                let b = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_B_BN
                );
                console.log("Security_CryptoFramework ECCPUB b:" + b);
                let gx = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
                );
                console.log("Security_CryptoFramework ECCPUB gx:" + gx);
                let gy = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
                );
                console.log("Security_CryptoFramework ECCPUB gx:" + gy);
                let n = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_N_BN
                );
                console.log("Security_CryptoFramework ECCPUB n:" + n);
                let h = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_H_NUM
                );
                console.log("Security_CryptoFramework ECCPUB n:" + h);
                let fieldType = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
                );
                console.log("Security_CryptoFramework ECCPUB fieldSize :" + fieldType);
                let fieldSize = keyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
                );
                console.log("Security_CryptoFramework ECCPUB fieldSize :" + fieldSize);
                resolve();
            })
            .catch((err) => {
                console.error(
                    "[Promise] generatorByCommonSpec failed. error is " + err
                );
                reject(err);
            });
    });
}

async function clearMemGetAsyKeySpec(asyKeySpec) {
    var gloablPriKey;
    return new Promise((resolve, reject) => {
        let asyKeyPairSpec = createAsyKeyGeneratorBySpec(asyKeySpec);
        generateSpecKeyPair(asyKeyPairSpec)
            .then((keyPair) => {
                gloablPriKey = keyPair.priKey;
            })
            .catch((err) => {
                reject(err);
            });
        try {
            gloablPriKey.clearMem();
            resolve(false);
        } catch (err) {
            console.error("[Promise] generatorByCommonSpec failed. error is " + err);
            reject(err);
        }
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
