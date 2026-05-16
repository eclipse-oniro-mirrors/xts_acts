/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import hilog  from '@ohos.hilog'

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
export const domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
export const tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Utils{

  static async msSleep(count: number)  {
    return new Promise<number>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    hilog.info(domain, tag, `%{public}s`, `UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    hilog.info(domain, tag, `%{public}s`, `UiTestCase, start abilityFinished error, ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    hilog.info(domain, tag, `%{public}s`, `UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    hilog.info(domain, tag, `%{public}s`, `UiTestCase, stop application finished error, ${JSON.stringify(error)}`);
    return false;
  }
}


export {
  Utils,
  startAbility,
  stopApplication,
}