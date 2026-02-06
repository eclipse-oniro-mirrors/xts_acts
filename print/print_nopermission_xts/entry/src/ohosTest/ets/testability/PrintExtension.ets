/*
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

import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want'
import PrintExtensionAbility from '@ohos.app.ability.PrintExtensionAbility';

const DOMAIN: number = 0x0023
const TAG: string = 'printExtension';

export default class PrintExtension extends PrintExtensionAbility {
  onCreate(want: Want): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onCreate');
  }

  onStartDiscoverPrinter(): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onStartDiscoverPrinter');
  }

  onStopDiscoverPrinter(): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onStopDiscoverPrinter');
  }

  onConnectPrinter(): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onConnectPrinter');
  }

  onDisconnectPrinter(): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onDisconnectPrinter');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'PrintExtension onDestroy');
  }
}