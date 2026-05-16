'use static';
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

import { OperationType, SubHeader } from '@ohos.arkui.advanced.SubHeader';
import promptAction from '@ohos.promptAction';
import { Entry, Component, Column,Text, Margin, FlexAlign, $r, SymbolEffectStrategy } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SubHeaderExample {
  private uiContext: UIContext = this.getUIContext();
  build() {
    Column() {
      SubHeader({
        // 设置icon为symbol图标
        icon: $r('sys.symbol.ohos_wifi'),
        iconSymbolOptions: {
          effectStrategy: SymbolEffectStrategy.HIERARCHICAL,
        },
        secondaryTitle: '二级标题',
        operationType: OperationType.BUTTON,
        operationItem: [{
          value: '操作',
          action: () => {
            this.uiContext.getPromptAction().showToast({ message: 'demo' })
          },
          defaultFocus: false,
        }]
      })
    }
  }
}