'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog'

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: Int = 0x0000;
let tag: string = 'ActsAceEtsModuleImageTextNowearApi12StaticTest';

class UtilsTest{
  static isloadAndSetUpUiTest = false;
  static isStartedAbility = false;


  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async startAbility(bundleName: string, abilityName: string): Promise<boolean> {
    try {
      if (!UtilsTest.isStartedAbility) {
        await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
        hilog.info(domain, tag, ` success`);
        UtilsTest.isStartedAbility = true;
        await UtilsTest.msSleep(4000)
      }
      return true;
    } catch(error) {
      console.error(`UiTestCase, start abilityFailed: ${error}`);
      hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
      return false;
    }
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    hilog.info(domain, tag, `UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

export {
  UtilsTest,
  startAbility,
  stopApplication
}