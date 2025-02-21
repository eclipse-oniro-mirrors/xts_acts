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

import bundleManager from '@ohos.bundle.bundleManager';
import * as commonParameter from './common_parameter';
import certManager from '@ohos.security.certManager';
import deviceInfo from '@ohos.deviceInfo';

async function getClientAppUid(): Promise<string> {
  try {
    let bundleInfo: bundleManager.BundleInfo;
    bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    console.warn("grant --->get bundleInfo is " + JSON.stringify(bundleInfo));
    let clientAppUid = bundleInfo.appInfo.uid;
    console.warn("get clientAppUid: " + clientAppUid.toString());
    return clientAppUid.toString();
  } catch (err) {
    console.error("getClientAppUid error: " + err);
    throw err as Error;
  }
}

async function installPrivateCertificates(): Promise<void> {
  let keystore1: Uint8Array = commonParameter.priRsaCredData;
  let keystore2: Uint8Array = commonParameter.priEccCredData;
  let keystorePwd: string = "123456";

  try {
    await certManager.installPrivateCertificate(keystore1, keystorePwd, "testPriCredential001");
    await certManager.installPrivateCertificate(keystore2, keystorePwd, "testPriCredential002");
  } catch (err) {
    console.error("installPrivateCertificates err: " + err.code);
    throw err as Error;
  }
}

function isOpenHarmonyDevice(): Boolean {
  let displayVersion: string = deviceInfo.displayVersion.toLowerCase();
  console.warn(`device info displayVersion is : ${displayVersion}`);
  if (displayVersion.indexOf("openharmony") !== -1) {
    return true;
  } else {
    return false;
  }
}


export { getClientAppUid, installPrivateCertificates, isOpenHarmonyDevice }