/*
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
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'testTag'; 

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    hilog.info(domain, tag, '%{public}s', `[picker] start abilityFinished: ${result}`)
  }).catch((err: Error) => {
    hilog.error(domain, tag, '%{public}s', `[picker] start abilityFailed: ${err}`)
  })
}

export async function stopAbility(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName}`).then(result => {
    hilog.info(domain, tag, '%{public}s', `[picker] stop abilityFinished: ${result}`)
  }).catch((err: Error) => {
    hilog.error(domain, tag, '%{public}s', `[picker] stop abilityFailed: ${err}`)
  })
}

export async function sleep(times: int) : Promise<int> {
  if (!times) {
    times = 10;
  }
  return new Promise<int>((resolve, reject) => { 
    setTimeout(() => {
        resolve(0)
    }, times)
  })
}

