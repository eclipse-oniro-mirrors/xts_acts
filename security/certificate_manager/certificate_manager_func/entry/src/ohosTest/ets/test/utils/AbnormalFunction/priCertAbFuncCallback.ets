/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import certManager from '@ohos.security.certManager';

async function installPrivateCertificateAbnormal(keystore: Uint8Array, keystorePwd: string,
                                                 certAlias: string): Promise<certManager.CMResult> {
  return new Promise((resolve, reject) => {
    certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err, cmResult) => {
      if (err) {
        console.error("[Callback]installPrivateCertificate err: " + err.code);
        reject(err);
      } else {
        resolve(cmResult);
      }
    })
  });
}


async function uninstallPrivateCertificateAbnormal(keyUri: string): Promise<void> {
  return new Promise((resolve, reject) => {
    certManager.uninstallPrivateCertificate(keyUri, (err,) => {
      if (err) {
        console.error("[Callback]uninstallPrivateCertificate err: " + err.code);
        reject(err);
      } else {
        resolve();
      }
    })
  });
}

async function initAbnormal(authUri: string, spec: certManager.CMSignatureSpec): Promise<certManager.CMHandle> {
  return new Promise((resolve, reject) => {
    certManager.init(authUri, spec, (err, CMHandle) => {
      if (err) {
        console.error("[Callback]initAbnormal err: " + err.code);
        reject(err);
      } else {
        resolve(CMHandle);
      }
    })
  });
}

async function updateAbnormal(handle: Uint8Array, data: Uint8Array): Promise<void> {
  return new Promise((resolve, reject) => {
    certManager.update(handle, data, (err,) => {
      if (err) {
        console.error("[Callback]updateAbnormal err: " + err.code);
        reject(err);
      } else {
        resolve();
      }
    })
  });
}

async function finishAbnormal(handle: Uint8Array, signature?: Uint8Array): Promise<certManager.CMResult> {
  return new Promise((resolve, reject) => {
    if (signature != null && signature != undefined) {
      certManager.finish(handle, signature, (err, CMResult) => {
        if (err) {
          console.error("[Callback]finishAbnormal err1: " + err.code);
          reject(err);
        } else {
          resolve(CMResult);
        }
      })
    } else {
      certManager.finish(handle, (err, CMResult) => {
        if (err) {
          console.error("[Callback]finishAbnormal err2: " + err.code);
          reject(err);
        } else {
          resolve(CMResult);
        }
      })
    }
  });
}

async function abortAbnormal(handle: Uint8Array): Promise<void> {
  return new Promise((resolve, reject) => {
    certManager.abort(handle, (err, status) => {
      if (err) {
        console.error("[Callback]abortAbnormal err: " + err.code);
        reject(err);
      } else {
        resolve(status);
      }
    })
  });
}

export {
  installPrivateCertificateAbnormal,
  uninstallPrivateCertificateAbnormal,
  initAbnormal,
  updateAbnormal,
  finishAbnormal,
  abortAbnormal
}

