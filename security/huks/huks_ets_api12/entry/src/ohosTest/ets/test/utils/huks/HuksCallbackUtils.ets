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


export async function generateKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.generateKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function deleteKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.deleteKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function importKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.importKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function importWrappedKeyItem(keyAlias: string | null | undefined, wrappingKeyAlias: string | null | undefined,
  options: huks.HuksOptions | null | undefined): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.importWrappedKeyItem(keyAlias, wrappingKeyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function exportKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.exportKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function getKeyItemProperties(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.getKeyItemProperties(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function isKeyItemExist(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<boolean> {
  return new Promise((resolve, reject) => {
    huks.isKeyItemExist(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function hasKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<boolean> {
  return new Promise((resolve, reject) => {
    huks.hasKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function initSession(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksSessionHandle> {
  return new Promise((resolve, reject) => {
    huks.initSession(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function updateSession(handle: number | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.updateSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function finishSession(handle: number | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.finishSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function abortSession(handle: number | null | undefined, options: huks.HuksOptions | null | undefined): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.abortSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function anonAttestKeyItem(keyAlias: string | null | undefined, options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.anonAttestKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function update(handle: number | null | undefined, token: Uint8Array | null | undefined,
  options: huks.HuksOptions | null | undefined): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.update(handle, token, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}