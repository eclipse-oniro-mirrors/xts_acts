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
import { cryptoFramework } from '@kit.CryptoArchitectureKit'
import { convertToUint8Array } from '../common/commonUtils';
import { BusinessError } from '@ohos.base';


export let digestSpec: string[] = [
  "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"
];

export function JsX963Spec(key: string, info: string, keySize: int,
  isString: boolean = false): cryptoFramework.X963KdfSpec {
  try {
    let spec: cryptoFramework.X963KdfSpec = {
      algName: "X963KDF",
      key: isString ? key : new Uint8Array(convertToUint8Array(key)),
      info: new Uint8Array(convertToUint8Array(info)),
      keySize: keySize
    };

    return spec;
  } catch (error: BusinessError) {
    console.error(`“${error}“, spec error code: ${error.code}`);
    throw error as Error;
  }
}

export function JsX963KdfSync(digestAlgName: string, spec: cryptoFramework.X963KdfSpec): cryptoFramework.DataBlob {
  try {
    let kdfAlgName: string = "X963KDF";
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
    let secret: cryptoFramework.DataBlob = kdf.generateSecretSync(spec);

    return secret;
  } catch (error: BusinessError) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function JsX963KdfPromise(digestAlgName: string,
  spec: cryptoFramework.X963KdfSpec): Promise<cryptoFramework.DataBlob> {
  try {
    let kdfAlgName: string = "X963KDF";
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
    let secret: cryptoFramework.DataBlob = await kdf.generateSecret(spec);

    return secret;
  } catch (error: BusinessError) {
    console.error('promise error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function JsX963KdfCallback(digestAlgName: string,
  spec: cryptoFramework.X963KdfSpec): Promise<cryptoFramework.DataBlob> {
  try {
    let kdfAlgName: string = "X963KDF";
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
    return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
      kdf.generateSecret(spec, (err, secret) => {
        if (err || secret === undefined) {
          reject(err as Error);
        } else {
          resolve(secret);
        }
      });
    });
  } catch (error: BusinessError) {
    console.error('callback error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}