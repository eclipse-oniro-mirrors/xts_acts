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
import { huks } from '@kit.UniversalKeystoreKit';


export async function generateKey(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.generateKey(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function deleteKey(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.deleteKey(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function importKey(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.importKey(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function exportKey(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.exportKey(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function getKeyProperties(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.getKeyProperties(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function isKeyExist(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<boolean> {
  return new Promise((resolve, reject) => {
    huks.isKeyExist(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function init(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksHandle> {
  return new Promise((resolve, reject) => {
    huks.init(keyAlias, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function update(handle: number | null | undefined, token: Uint8Array | null | undefined,
  options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.update(handle, token, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function finish(handle: number | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.finish(handle, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

export async function abort(handle: number | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksResult> {
  return new Promise((resolve, reject) => {
    huks.abort(handle, options, (err, data) => {
      if (err.code != 0) {
        reject(err);
      }
      resolve(data);
    })
  })
}