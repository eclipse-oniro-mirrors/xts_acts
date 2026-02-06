/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { cert } from "@kit.DeviceCertificateKit";
import { BusinessError } from '@ohos.base';

export function stringToUint8Array(str: string): Uint8Array {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; i++) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

export async function createX509CertPem(input: string): Promise<cert.X509Cert> {
  try {
    let EncodingBlob: cert.EncodingBlob = {
      data: stringToUint8Array(input),
      encodingFormat: cert.EncodingFormat.FORMAT_PEM
    }
    let x509Cert: cert.X509Cert = await cert.createX509Cert(EncodingBlob);

    return x509Cert;
  } catch (error) {
    console.error(`[XTS] createX509CertPem ${error}, error code: ${error.code}`);
    throw error as Error;
  }
}

export async function sleep(timeout: int): Promise<int> {
  let st = 0;
  return new Promise<int>((resolve, reject) => {
    st = setTimeout(() => {
      resolve(0);
      clearTimeout(st);
    }, timeout);
  });
}