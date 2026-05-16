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
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

namespace signVerifyCallback {
  async function initProcess(authUri: string, spec: certManager.CMSignatureSpec): Promise<certManager.CMHandle> {
    return new Promise<certManager.CMHandle>((resolve, reject) => {
      certManager.init(authUri, spec, (err: BusinessError<void> | null, CMHandle:certManager.CMHandle |undefined) => {
        if (err != null && err?.code != 0) {
          hilog.error(domain, tag, '%{public}s', "[Callback] initProcess get err: " + err?.code);
          reject(err as Error);
        } else {
          resolve(CMHandle as certManager.CMHandle);
        }
      })
    })
  }

  export async function updateProcess(handle: Uint8Array, data: Uint8Array): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      certManager.update(handle, data, (err: BusinessError<void> | null) => {
        if (err != null && err?.code != 0) {
          hilog.error(domain, tag, '%{public}s', "[Callback] updateProcess get err: " + err?.code);
          reject(err as Error);
        } else {
          resolve(undefined);
        }
      })
    })
  }

  export async function finishProcess(handle: Uint8Array, signature?: Uint8Array): Promise<certManager.CMResult> {
    return new Promise<certManager.CMResult>((resolve, reject) => {
      if (signature) {
        certManager.finish(handle, signature, (err: BusinessError<void> | null, CMResult: certManager.CMResult |undefined) => {
          if (err != null && err?.code != 0) {
            hilog.error(domain, tag, '%{public}s', "[Callback] verify finishProcess get err: " + err?.code);
            reject(err as Error);
          } else {
            hilog.info(domain, tag, '%{public}s', "[Callback] verify finishProcess get CMResult: " + CMResult);
            resolve(CMResult as certManager.CMResult);
          }
        })
      } else {
        certManager.finish(handle, (err: BusinessError<void> | null, CMResult: certManager.CMResult |undefined) => {
          if (err != null && err?.code != 0) {
            hilog.error(domain, tag, '%{public}s', "[Callback] signature finishProcess get err: " + err?.code);
            reject(err as Error);
          } else {
            hilog.info(domain, tag, '%{public}s', "[Callback] signature finishProcess get CMResult: " + CMResult);
            resolve(CMResult as certManager.CMResult);
          }
        })
      }
    })
  }

  export async function abortProcess(handle: Uint8Array): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      certManager.abort(handle, (err: BusinessError<void> | null) => {
        if (err != null && err?.code != 0) {
          hilog.error(domain, tag, '%{public}s', "[Callback] abortProcess get err: " + err?.code);
          reject(err as Error);
        } else {
          resolve(undefined);
        }
      })
    })
  }

  export async function signVerifyNormalProcess(authUri: string, srcData: Uint8Array, signSpec: certManager.CMSignatureSpec,
                                        verifySpec: certManager.CMSignatureSpec): Promise<certManager.CMResult> {
    try {
      let signHandle: certManager.CMHandle = await initProcess(authUri, signSpec);
      await updateProcess(signHandle.handle, srcData);
      let signResult: certManager.CMResult = await finishProcess(signHandle.handle);
      let verifyHandle: certManager.CMHandle = await initProcess(authUri, verifySpec);
      await updateProcess(verifyHandle.handle, srcData);
      let verifyResult: certManager.CMResult = await finishProcess(verifyHandle.handle, signResult.outData);
      return verifyResult;
    } catch (err) {
      err = err as BusinessError;
      hilog.error(domain, tag, '%{public}s', "[Callback]signVerifyNormalProcess catch err: " + err);
      throw err as Error;
    }
  }

  export async function verifyAbortProcess(authUri: string, srcData: Uint8Array, flag: string): Promise<void> {
    let signSpec: certManager.CMSignatureSpec = {
      purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
    };
    let verifySpec: certManager.CMSignatureSpec = {
      purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
    };
    try {
      let signHandle: certManager.CMHandle = await initProcess(authUri, signSpec);
      await updateProcess(signHandle.handle, srcData);
      let signResult: certManager.CMResult = await finishProcess(signHandle.handle);
      let verifyHandle: certManager.CMHandle = await initProcess(authUri, verifySpec);
      switch (flag) {
        case "after_verify_init":
          await abortProcess(verifyHandle.handle);
          break;
        case "after_verify_update":
          await updateProcess(verifyHandle.handle, srcData);
          await abortProcess(verifyHandle.handle);
          break;
        case "after_verify_finish":
          await updateProcess(verifyHandle.handle, srcData);
          await finishProcess(verifyHandle.handle, signResult.outData)
          await abortProcess(verifyHandle.handle);
          break;
        default:
          throw new Error("wrong parameter");
      }
    } catch (err) {
      err = err as BusinessError;
      hilog.error(domain, tag, '%{public}s', "[Callback]verifyAbortProcess catch err: " + err);
      throw err as Error;
    }
  }

  export async function signAbortProcess(authUri: string, srcData: Uint8Array, flag: string): Promise<void> {
    let signSpec: certManager.CMSignatureSpec = {
      purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
    };
    try {
      let signHandle: certManager.CMHandle = await initProcess(authUri, signSpec);
      switch (flag) {
        case "after_init":
          await abortProcess(signHandle.handle);
          break;
        case "after_update":
          await updateProcess(signHandle.handle, srcData);
          await abortProcess(signHandle.handle);
          break;
        case "after_finish":
          await updateProcess(signHandle.handle, srcData);
          await finishProcess(signHandle.handle);
          await abortProcess(signHandle.handle);
          break;
        default:
          throw new Error("wrong parameter");
      }
    } catch (err) {
      err = err as BusinessError;
      hilog.error(domain, tag, '%{public}s', "[Callback]signAbortProcess catch err: " + err);
      throw err as Error;
    }
  }
}

export default signVerifyCallback;