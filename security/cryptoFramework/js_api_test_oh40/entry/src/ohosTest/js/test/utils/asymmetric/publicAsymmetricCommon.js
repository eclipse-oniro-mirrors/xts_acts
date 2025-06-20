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
import cryptoFramework from "@ohos.security.cryptoFramework";

function createAsyKeyGenerator(asyAlgoName) {
    try {
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
        console.log("rsaGenerator algName: " + rsaGenerator.algName);
        return rsaGenerator;
    } catch (err) {
        console.error("rsaGenerator error:" + err);
        throw err;
    }
}

function createAsyKeyGeneratorBySpec(asyKeySpec) {
    try {
        let rsaGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(asyKeySpec);
        console.log("rsaGenerator algName: " + rsaGenerator.algName);
        return rsaGenerator;
    } catch (err) {
        console.error("rsaGenerator error:" + err);
        throw err;
    }
}

function createAsyCipher(cipherAlgoName) {
    try {
        let cipherGenerator = cryptoFramework.createCipher(cipherAlgoName);
        console.log("cipherGenerator algName: " + cipherGenerator.algName);
        return cipherGenerator;
    } catch (err) {
        console.error("cipherGenerator error:" + err);
        throw err;
    }
}

function createAsySign(signAlgoName) {
    try {
        let signGenerator = cryptoFramework.createSign(signAlgoName);
        console.log("signGenerator algName: " + signGenerator.algName);
        return signGenerator;
    } catch (err) {
        console.error("signGenerator error:" + err);
        throw err;
    }
}

function createAsyVerify(verifyAlgoName) {
    try {
        let verifyGenerator = cryptoFramework.createVerify(verifyAlgoName);
        console.log("verifyGenerator algName: " + verifyGenerator.algName);
        return verifyGenerator;
    } catch (err) {
        console.error("verifyGenerator error:" + err);
        throw err;
    }
}

function createAsyKeyAgreement(ECDHAlgoName) {
    try {
        let generator = cryptoFramework.createKeyAgreement(ECDHAlgoName);
        console.log("createKeyAgreement algName: " + generator.algName);
        return generator;
    } catch (err) {
        console.error("createKeyAgreement error:" + err);
        throw err;
    }
}

function createSymKeyGenerator(symAlgoName) {
    try {
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
        console.log("symKeyGenerator algName: " + symKeyGenerator.algName);
        return symKeyGenerator;
    } catch (err) {
        console.error("symKeyGenerator error:" + err);
        throw err;
    }
}

export {
    createAsyKeyGenerator,
    createAsyKeyGeneratorBySpec,
    createAsyCipher,
    createAsySign,
    createAsyVerify,
    createAsyKeyAgreement,
    createSymKeyGenerator,
};
