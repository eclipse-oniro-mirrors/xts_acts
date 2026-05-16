'use static';
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

import {
  Entry,
  Component,
  Text,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
} from '@ohos.arkui.component';
import { AppStorage, UIUtils } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct StateMgmtProbe {
  /** 探测页仅展示静态文案，避免部分工具链未导出 State 装饰器类型。 */
  private label: string = 'state-probe';

  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('state_mgmt_probe_page_loaded', '1');
    AppStorage.setOrCreate<string>('state_mgmt_probe_label', this.label);
    let plain: Record<string, Object> = {};
    let r = UIUtils.canBeObserved(plain);
    AppStorage.setOrCreate<string>('state_utils_probe_can_observed_ran', '1');
    AppStorage.setOrCreate<string>('state_utils_probe_can_observed_is', r.isObserved ? '1' : '0');
    AppStorage.setOrCreate<string>('state_utils_probe_can_observed_reason', r.reason);
    let lc = UIUtils.getLifecycle(this);
    lc.getCurrentState();
    AppStorage.setOrCreate<string>('state_utils_probe_lifecycle', '1');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.label)
        .fontSize(36)
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .height('100%')
  }
}
