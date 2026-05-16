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
import type { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

async function installPrivateCertificateAbnormal(keystore: Uint8Array, keystorePwd: string,
                                                 certAlias: string): Promise<certManager.CMResult> {
  return new Promise<certManager.CMResult>((resolve, reject) => {
    certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err : BusinessError<void> | null, cmResult:certManager.CMResult |undefined) => {
      if (err != null && err?.code != 0) {
        hilog.error(domain, tag, '%{public}s', "[Callback]installPrivateCertificate err: " + err?.code);
        reject(err as Error);
      } else {
        resolve(cmResult as certManager.CMResult);
      }
    })
  });
}


async function uninstallPrivateCertificateAbnormal(keyUri: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    certManager.uninstallPrivateCertificate(keyUri, (err: BusinessError<void> | null) => {
      if (err != null && err?.code != 0) {
        hilog.error(domain, tag, '%{public}s', "[Callback]uninstallPrivateCertificate err: " + err?.code);
        reject(err as Error);
      } else {
        resolve(undefined);
      }
    })
  });
}

async function initAbnormal(authUri: string, spec: certManager.CMSignatureSpec): Promise<certManager.CMHandle> {
  return new Promise<certManager.CMHandle>((resolve, reject) => {
    certManager.init(authUri, spec, (err : BusinessError<void> | null, CMHandle:certManager.CMHandle |undefined) => {
      if (err != null && err?.code != 0) {
        hilog.error(domain, tag, '%{public}s', "[Callback]initAbnormal err: " + err?.code);
        reject(err as Error);
      } else {
        resolve(CMHandle as certManager.CMHandle);
      }
    })
  });
}

async function updateAbnormal(handle: Uint8Array, data: Uint8Array): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    certManager.update(handle, data, (err : BusinessError<void> | null) => {
      if (err != null && err?.code != 0) {
        hilog.error(domain, tag, '%{public}s', "[Callback]updateAbnormal err: " + err?.code);
        reject(err as Error);
      } else {
        resolve(undefined);
      }
    })
  });
}

async function finishAbnormal(handle: Uint8Array, signature?: Uint8Array): Promise<certManager.CMResult> {
  return new Promise<certManager.CMResult>((resolve, reject) => {
    if (signature != null && signature != undefined) {
      certManager.finish(handle, signature, (err : BusinessError<void> | null, CMResult:certManager.CMResult |undefined) => {
        if (err != null && err?.code != 0) {
          hilog.error(domain, tag, '%{public}s', "[Callback]finishAbnormal err1: " + err?.code);
          reject(err as Error);
        } else {
          resolve(CMResult as certManager.CMResult);
        }
      })
    } else {
      certManager.finish(handle, (err, CMResult) => {
        if (err != null && err?.code != 0) {
          hilog.error(domain, tag, '%{public}s', "[Callback]finishAbnormal err2: " + err?.code);
          reject(err as Error);
        } else {
          resolve(CMResult as certManager.CMResult);
        }
      })
    }
  });
}

async function abortAbnormal(handle: Uint8Array): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    certManager.abort(handle, (err : BusinessError<void> | null) => {
      if (err != null && err?.code != 0) {
        hilog.error(domain, tag, '%{public}s', "[Callback]abortAbnormal err: " + err?.code);
        reject(err as Error);
      } else {
        resolve(undefined);
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

