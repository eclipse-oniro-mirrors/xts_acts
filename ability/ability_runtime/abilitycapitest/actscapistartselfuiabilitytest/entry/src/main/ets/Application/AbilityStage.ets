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

import { AbilityStage, AbilityConstant, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default class MyAbilityStage extends AbilityStage {
  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    // 根据系统可用内存的变化情况，释放不必要的内存
  }
  onCreate(): void {
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    return 'MyAbilityStage';
  }
  onNewProcessRequest(want: Want): string {
    return 'AbilityStageProcess'
  }
  onPrepareTermination(): AbilityConstant.PrepareTermination{
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onPrepareTermination');
    return AbilityConstant.PrepareTermination.TERMINATE_IMMEDIATELY
  }
  async onPrepareTerminationSync(): Promise<AbilityConstant.PrepareTermination>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onPrepareTerminationSync');
    return AbilityConstant.PrepareTermination.CANCEL
  }
}