/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import TestNativeAopAdd from "./TestNativeAopAdd"
import { addBefore, addAfter, replace } from "libentry.so"
import cameraPicker from '@ohos.multimedia.cameraPicker';
import { camera } from "@kit.CameraKit";
import ble from "@ohos.bluetooth.ble"
import relationalStore from "@ohos.data.relationalStore"

export let addBeforeArgA = 0;
export let addBeforeArgB = 0;
export function testAddBeforeInit() {
  addBefore(TestNativeAopAdd, 'addForAddBefore', (a, b) => {
    addBeforeArgA = a;
    addBeforeArgB = b;
  });
}

export let addAfterArgA = 0;
export let addAfterArgB = 0;
export let addAfterOriRet = 0;
export function testAddAfterInit() {
  addAfter(TestNativeAopAdd, 'addForAddAfter', (that, ret, a, b) => {
    addAfterOriRet = ret;
    addAfterArgA = a;
    addAfterArgB = b;
    return ret + 1;
  });
}

export let replaceArgA = 0;
export let replaceArgB = 0;
export function testReplaceInit() {
  replace(TestNativeAopAdd, 'addForReplace', (a, b) => {
    replaceArgA = a;
    replaceArgB = b;
    return a * b;
  });
}


export function testReplaceKitUseDeclareNapiStaticFunction() {
  replace(cameraPicker, 'pick', (context, mediaTypes, pickerProfile) => {
    return `args native: mediaTypes:${JSON.stringify(mediaTypes)},pickerProfile:${JSON.stringify(pickerProfile)}`
  });
}
export function testUseCameraPicker() {
  return cameraPicker.pick(null, [cameraPicker.PickerMediaType.PHOTO, cameraPicker.PickerMediaType.VIDEO], {
    cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
  });
}

export let startBLEScanCalled = false;
export function testReplaceKitUseDeclareNapiFunction() {
  replace(ble, 'startBLEScan', (filters: Array<ble.ScanFilter>, options?: ble.ScanOptions) => {
    startBLEScanCalled = true;
  });
}
export function testUseBle() {
  ble.startBLEScan([])
}

export let getRdbStoreArgs = "";
export function testReplaceKitUseDeclareNapiFunctionWithData() {
  replace(relationalStore, 'getRdbStore', (context, config, callback) => {
    getRdbStoreArgs = `args native: config:${JSON.stringify(config)}}`
  });
}
export function testUseRelationalStore() {
  relationalStore.getRdbStore(null, {
    name: "RdbTest.db",
    securityLevel: relationalStore.SecurityLevel.S3
  }, async () => {});
}