/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

let stressTimeout: number = 1000 * 1;
let intervalTime: number = 1000;

enum CallbackType {
  TYPE_IS_SYNC = 0,
  TYPE_IS_PROMISE = 1,
  TYPE_IS_CALLBACK = 2,
}

async function enableHardwareEntropyRandom(length: number, type: CallbackType): Promise<boolean> {
  let ret: boolean = true;
  let secret: cryptoFramework.DataBlob = {data: new Uint8Array()};
  try {
    let random: cryptoFramework.Random = cryptoFramework.createRandom();
    random.enableHardwareEntropy();
    switch (type) {
      case CallbackType.TYPE_IS_PROMISE:
        secret = await random.generateRandom(length);
      case CallbackType.TYPE_IS_CALLBACK:
        secret = await new Promise((resolve, reject) => {
          random.generateRandom(length, (err, secret) => {
            if (err) {
              reject(err);
            } else {
              resolve(secret);
            }
          });
        })
      default:
        secret = random.generateRandomSync(length);
    }
    if (secret.data.length !== length) {
      console.info("################ :" + length + ":" + secret.data.length)
      return false;
    }
    console.log("############### :" + secret.data)
  } catch (error) {
    console.error(`getRandom “${error}“, error code: ${error.code}`);
    return false;
  }
  return ret;
}

export {
  stressTimeout,
  intervalTime,
  CallbackType,
  enableHardwareEntropyRandom
}