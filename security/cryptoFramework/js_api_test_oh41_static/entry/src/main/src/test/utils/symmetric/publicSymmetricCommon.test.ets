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
import crypto from "@ohos.security.cryptoFramework";

function createSymKeyGenerator(symAlgoName: string): crypto.SymKeyGenerator {
  try {
    let symKeyGenerator: crypto.SymKeyGenerator = crypto.createSymKeyGenerator(symAlgoName);
    console.log("symKeyGenerator algName: " + symKeyGenerator.algName);
    return symKeyGenerator;
  } catch (err) {
    console.error("symKeyGenerator error:" + err);
    throw err as Error;
  }
}

function createSymCipher(cipherAlgoName: string): crypto.Cipher {
  try {
    let cipherGenerator: crypto.Cipher = crypto.createCipher(cipherAlgoName);
    console.log("cipherGenerator algName: " + cipherGenerator.algName);
    return cipherGenerator;
  } catch (err) {
    console.error("cipherGenerator error:" + err);
    throw err as Error;
  }
}

export { createSymKeyGenerator, createSymCipher };
