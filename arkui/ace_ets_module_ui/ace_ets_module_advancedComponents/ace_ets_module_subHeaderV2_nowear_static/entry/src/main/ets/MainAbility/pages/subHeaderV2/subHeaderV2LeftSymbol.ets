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

import { Entry, ComponentV2, $r, Column, SymbolEffectStrategy, Local } from '@kit.ArkUI';
import { SymbolGlyphModifier, TextModifier } from '@ohos.arkui.modifier';
import {
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  // 系统WiFi符号资源
  @Local icon: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));

  aboutToAppear(): void {
    // 系统WiFi符号资源
    this.icon = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontSize(24);
    this.icon.effectStrategy(SymbolEffectStrategy.HIERARCHICAL)
  }

  build() {
    Column() {
      SubHeaderV2({
        icon: this.icon,
        title: new SubHeaderV2Title({ secondaryTitle: '标题' }),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: [new SubHeaderV2OperationItem({
          content: '操作',
          action: () => {
            this.getUIContext().getPromptAction().showToast({ message: 'demo' })
          }
        })]
      })
    }
  }
}