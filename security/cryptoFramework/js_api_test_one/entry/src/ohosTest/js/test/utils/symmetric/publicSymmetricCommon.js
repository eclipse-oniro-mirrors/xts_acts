/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

function createSymKeyGenerator(symAlgoName) {
  try {
    let symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    console.log("symKeyGenerator algName: " + symKeyGenerator.algName);
    return symKeyGenerator;
  } catch (err) {
    console.error("symKeyGenerator error:" + err);
    return err;
  }
}

function createSymCipher(cipherAlgoName) {
  try {
    let cipherGenerator = cryptoFramework.createCipher(cipherAlgoName);
    console.log("cipherGenerator algName: " + cipherGenerator.algName);
    return cipherGenerator;
  } catch (err) {
    console.error("cipherGenerator error:" + err);
    return err;
  }
}

export { createSymKeyGenerator, createSymCipher };
