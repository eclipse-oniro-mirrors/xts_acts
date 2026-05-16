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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import type Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用的HAP在首次加载的时，为该Module初始化操作
  }

  onAcceptWant(want: Want): string {
    // 在被调用方的AbilityStage中，针对启动模式为specified的UIAbility返回一个UIAbility实例对应的一个Key值
    // 当前示例指的是module1 Module的SpecifiedAbility
    if (want.abilityName === 'EntryAbility' || 'TestAbility' || 'StartTestAbility2') {
      // 返回的字符串Key标识为自定义拼接的字符串内容
      if (want.parameters) {
        let flag = `${want.parameters.instanceKey}` + 'aaa';
        console.log(`the flag = ${flag}`)
        return flag;
      }
    }
    return '';
  }
}