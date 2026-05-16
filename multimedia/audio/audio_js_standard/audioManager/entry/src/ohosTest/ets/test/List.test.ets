/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import audioFramework from './AudioFramework.test';
import AudioManagerApi9 from './AudioManagerApi9.test';
import audioRoutingManager from './AudioRoutingManager.test';
import audioSessionManagerTest from './AudioSessionManager.test';
import getAudioSceneApi12 from './GetAudioScene.test';
import audioSpatializationManager from './AudioSpatializationManager.test';
import audioLoopBack from './AudioLoopBack.test';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';

function getPermission() {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let testContext:ESObject = AppStorage.get('testContext');
  let permissions: Array<Permissions> =
    ["ohos.permission.MANAGE_AUDIO_CONFIG", "ohos.permission.MICROPHONE"];
  atManager.requestPermissionsFromUser(testContext, permissions,
    (err: BusinessError, data: PermissionRequestResult) => {
      console.info("request success permissions" + JSON.stringify(data));
      console.info("getPermissionRequestResult err", JSON.stringify(err));
    })
}
export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

async function driveFn() {
  console.info(`come in driveFn`);
  let driver = await Driver.create();
  console.info(`driver is ${JSON.stringify(driver)}`);
  await sleep(100);
  console.info(`UiDriver start`);
  let button = await driver.waitForComponent(ON.text('允许'), 5000);
  if (button == null) {
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let cmd = "hidumper -s WindowManagerService -a'-a'"
    await delegator.executeShellCommand(cmd);
  }
  console.info(`button is ${JSON.stringify(button)}`);
  await sleep(500);
  await button.click();
}

export default function testsuite() {
  getPermission();
  driveFn();
  audioSessionManagerTest();
  audioFramework();
  AudioManagerApi9();
  audioRoutingManager();
  getAudioSceneApi12();
  audioSpatializationManager();
  audioLoopBack();
}