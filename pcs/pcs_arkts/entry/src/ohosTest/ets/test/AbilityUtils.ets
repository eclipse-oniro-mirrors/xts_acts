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
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';

export default class AbilityUtils {
  static ERROR_CODE_ABILITY_IS_STARTING = 16000082
  static async startAbility(bundleName: string, abilityName: string, context: common.UIAbilityContext) {
    let want: Want = {
      bundleName: bundleName,
      abilityName: abilityName
    }
    let res = true
    await context.startAbilityForResult(want, (err, data) => {
      if (err.code && err.code != AbilityUtils.ERROR_CODE_ABILITY_IS_STARTING) {
        console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
        res = false
      } else {
        console.info('startAbilityForResult succeed');
      }
    })
    return res
  }

  static async startAbilityImplicitly(wantInfo: Want, context: common.UIAbilityContext) {
    let res = true
    try {
      await context.startAbility(wantInfo);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to startAbilityImplicitly. code is ${err.code}, message is ${err.message}`)
      if (err.code != AbilityUtils.ERROR_CODE_ABILITY_IS_STARTING) {
        res = false
      }
    }
    return res
  }

}