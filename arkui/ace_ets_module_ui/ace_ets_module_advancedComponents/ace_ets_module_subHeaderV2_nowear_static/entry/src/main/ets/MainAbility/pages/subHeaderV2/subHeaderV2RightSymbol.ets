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

import {
  Entry, ComponentV2, $r, Column, SymbolEffectStrategy, SymbolRenderingStrategy, FontWeight,
  Color, Local
} from '@kit.ArkUI';
import { SymbolGlyphModifier, TextModifier } from '@ohos.arkui.modifier';
import {
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem, SubHeaderV2Select
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  // 系统WiFi符号资源
  @Local icon: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @Local selectedValue: string = 'aaa';
  @Local selectedIndex: int = 2;
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题', secondaryTitle: '二级标题' });
  @Local operationItem: SubHeaderV2OperationItem[] = [];
  @Local select: SubHeaderV2Select =
    new SubHeaderV2Select({ options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] });

  aboutToAppear(): void {
    // 系统WiFi符号资源
    this.icon = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
    this.icon.effectStrategy(SymbolEffectStrategy.HIERARCHICAL);

    this.selectedValue = 'selectDemo';
    this.selectedIndex = 2;
    this.title = new SubHeaderV2Title({
      primaryTitle: '一级标题',
      secondaryTitle: '二级标题'
    });
    this.select = new SubHeaderV2Select({
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }],
      selectedContent: this.selectedValue,
      selectedIndex: this.selectedIndex,
      onSelect: (index: int, value?: string) => {
        this.getUIContext().getPromptAction().showToast({ message: 'demo' })
      }
    })

    this.operationItem = [
      new SubHeaderV2OperationItem({
        // 系统肺符号资源
        content: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs')).fontWeight(FontWeight.Lighter),
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo1' })
        }
      }),
      new SubHeaderV2OperationItem({
        // 系统肺符号资源
        content: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs'))
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
          .fontColor([Color.Blue, Color.Grey, Color.Green])
      ,
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo2' })
        }
      }),
      new SubHeaderV2OperationItem({
        // 系统肺符号资源
        content: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs'))
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)
          .fontColor([Color.Blue, Color.Grey, Color.Green])
      ,
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo3' })
        }
      })]
  }

  build() {
    Column() {
      SubHeaderV2({
        select: this.select,
        operationType: SubHeaderV2OperationType.ICON_GROUP,
        operationItems: this.operationItem
      })
    }
  }
}