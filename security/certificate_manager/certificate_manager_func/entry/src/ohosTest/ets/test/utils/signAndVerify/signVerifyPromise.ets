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

async function signVerifyNormalProcess(authUri: string, srcData: Uint8Array, signSpec: certManager.CMSignatureSpec,
                                       verifySpec: certManager.CMSignatureSpec): Promise<certManager.CMResult> {
  try {
    let signHandle: certManager.CMHandle = await certManager.init(authUri, signSpec);
    await certManager.update(signHandle.handle, srcData);
    let signResult: certManager.CMResult = await certManager.finish(signHandle.handle);
    let verifyHandle: certManager.CMHandle = await certManager.init(authUri, verifySpec);
    await certManager.update(verifyHandle.handle, srcData);
    let verifyResult: certManager.CMResult = await certManager.finish(verifyHandle.handle, signResult.outData);
    return verifyResult;
  } catch (err) {
    console.error("[Promise]signVerifyNormalProcess catch err: " + err);
    throw err as Error;
  }
}

async function verifyAbortProcess(authUri: string, srcData: Uint8Array, flag: string): Promise<void> {
  let signSpec: certManager.CMSignatureSpec = {
    purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
  };
  let verifySpec: certManager.CMSignatureSpec = {
    purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
  };
  try {
    let signHandle: certManager.CMHandle = await certManager.init(authUri, signSpec);
    await certManager.update(signHandle.handle, srcData);
    let signResult: certManager.CMResult = await certManager.finish(signHandle.handle);
    let verifyHandle: certManager.CMHandle = await certManager.init(authUri, verifySpec);
    switch (flag) {
      case "after_verify_init":
        await certManager.abort(verifyHandle.handle);
        break;
      case "after_verify_update":
        await certManager.update(verifyHandle.handle, srcData);
        await certManager.abort(verifyHandle.handle);
        break;
      case "after_verify_finish":
        await certManager.update(verifyHandle.handle, srcData);
        await certManager.finish(verifyHandle.handle, signResult.outData)
        await certManager.abort(verifyHandle.handle);
        break;
      default:
        throw new Error("wrong parameter");
    }
  } catch (err) {
    console.error("[Promise]verifyAbortProcess catch err: " + err);
    throw err as Error;
  }
}

async function signAbortProcess(authUri: string, srcData: Uint8Array, flag: string): Promise<void> {
  let signSpec: certManager.CMSignatureSpec = {
    purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
  };
  try {
    let signHandle: certManager.CMHandle = await certManager.init(authUri, signSpec);
    switch (flag) {
      case "after_init":
        await certManager.abort(signHandle.handle);
        break;
      case "after_update":
        await certManager.update(signHandle.handle, srcData);
        await certManager.abort(signHandle.handle);
        break;
      case "after_finish":
        await certManager.update(signHandle.handle, srcData);
        await certManager.finish(signHandle.handle);
        await certManager.abort(signHandle.handle);
        break;
      default:
        throw new Error("wrong parameter");
    }
  } catch (err) {
    console.error("[Promise]signAbortProcess catch err: " + err);
    throw err as Error;
  }
}

export { signVerifyNormalProcess, signAbortProcess, verifyAbortProcess }