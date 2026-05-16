/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle';
import resourceManager from '@ohos.resourceManager';

export default {
  onCreate() {
    console.info('Application onCreate')

    // 使用applicationInfo中的资源ID
    Promise.all([
      resourceManager.getResourceManager(),
      bundle.getApplicationInfo("com.example.fa_app", 0)
    ]).then(results => {
      return results[0].getString(Number(results[1].labelId))
    }).then(str => {
      console.info("fa_app ApplicationInfo label: " + str)
    }).catch(e => {
      console.info("fa_app ApplicationInfo error: " + e)
    })

    // 使用abilityInfo中的资源ID
    Promise.all([
      resourceManager.getResourceManager(),
      bundle.getAbilityInfo("com.example.fa_app", "com.example.entry.MainAbility")
    ]).then(results => {
      return results[0].getString(Number(results[1].labelId))
    }).then(str => {
      console.info("fa_app AbilityInfo label: " + str)
    }).catch(e => {
      console.info("fa_app AbilityInfo error: " + e)
    })
  },
  onDestroy() {
    console.info('Application onDestroy')
  },
}