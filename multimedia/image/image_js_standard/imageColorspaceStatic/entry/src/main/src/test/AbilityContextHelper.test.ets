/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Hypium } from '../../../hypium/index';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'contextHelper'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let isInitialized = false; // 标记是否已经初始化

export async function initialize():Promise<void> {
  if (isInitialized) {
    hilog.info(domain, tag, '%{public}s', 'Already initialized');
    return;
  }

  hilog.info(domain, tag, '%{public}s', 'initialize start');
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  abilityDelegator.addAbilityMonitor({
    abilityName: "EntryAbility",
    moduleName: "entry",
    onAbilityCreate: (ability: UIAbility): void => {
      let testAbilityContext:common.UIAbilityContext = ability.context;
      let filesDir = testAbilityContext.filesDir;
      let cacheDir = testAbilityContext.cacheDir;
      Hypium.set('filesDir', filesDir);
      Hypium.set('cacheDir', cacheDir);
      Hypium.set('context', testAbilityContext);
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
    },
  }, (err: BusinessError | null): void => {
    if (err != null) {
      hilog.info(domain, tag, '%{public}s', '-----' + err!.code);
    }
    hilog.info(domain, tag, '%{public}s', 'BusinessError end');
  });

  await Utils.msSleep(2000);
  abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.multimedia.image.Colorspace.Static");
  await Utils.msSleep(2000);
  hilog.info(domain, tag, '%{public}s', 'initialize end');

  isInitialized = true; // 标记为已初始化
}