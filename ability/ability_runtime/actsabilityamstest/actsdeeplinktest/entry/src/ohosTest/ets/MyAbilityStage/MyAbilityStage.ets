/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    console.log('start onNewProcessRequest1');
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
  }
  onNewProcessRequest(want: Want): string {
    console.log('start onNewProcessRequest12');
    if (want?.parameters?.processKey == 'sub1') {
      console.log('Process state5:', want.parameters.processKey);
      return 'sub1'

    }

    if (want?.parameters?.processKey == 'sub2') {
      console.log('Process state5:', want.parameters.processKey);
      return 'sub2'
    }
    if(want?.parameters?.processKey=='sub'){
      console.log('Process state5:', want.parameters.processKey);
      return 'sub'
  }

    return 'wuwuwu'
  }
}


