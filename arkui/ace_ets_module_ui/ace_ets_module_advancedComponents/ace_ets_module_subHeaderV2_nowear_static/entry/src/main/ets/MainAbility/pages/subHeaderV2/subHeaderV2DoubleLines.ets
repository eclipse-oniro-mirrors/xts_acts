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

import { Entry, ComponentV2, $r, Column, Color, Local } from '@kit.ArkUI';
import { SymbolGlyphModifier, TextModifier } from '@ohos.arkui.modifier';
import {
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题', secondaryTitle: '二级标题' });
  @Local primaryModifier: TextModifier = new TextModifier().fontColor(Color.Red);
  @Local secondaryModifier: TextModifier = new TextModifier().fontColor(Color.Red);
  @Local subHeaderOperationType: SubHeaderV2OperationType = SubHeaderV2OperationType.TEXT_ARROW;
  @Local operationItems: SubHeaderV2OperationItem[] = [];

  aboutToAppear(): void {
    this.title = new SubHeaderV2Title({
      primaryTitle: '一级标题',
      id: 'SubHeaderV2TitleId',
      titleAccessibilityText: 'subHeader titlt Text',
      secondaryTitle: '二级标题'
    });
    this.operationItems = [new SubHeaderV2OperationItem({
      content: '更多',
      action: () => {
        this.getUIContext().getPromptAction().showToast({ message: 'demo2' })
      }
    })]
  }

  build() {
    Column() {
      SubHeaderV2({
        title: this.title,
        operationType: this.subHeaderOperationType,
        operationItems: this.operationItems
      });
    }
  }
}