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
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import ChildProcess from '@ohos.app.ability.ChildProcess';
import hilog from '@ohos.hilog'
import abilityManager from '@ohos.app.ability.abilityManager';
import bundleManager from '@ohos.bundle.bundleManager';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

export default class StaticDemoProcess extends ChildProcess {
  onStart(args?: ChildProcessArgs): void {
    console.info(`testTag StaticDemoProcess OnStart() called.`);
  }
}