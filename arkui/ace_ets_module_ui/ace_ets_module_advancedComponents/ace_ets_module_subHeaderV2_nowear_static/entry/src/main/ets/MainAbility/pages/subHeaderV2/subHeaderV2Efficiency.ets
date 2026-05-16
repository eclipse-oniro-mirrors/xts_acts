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

import { Entry, ComponentV2, $r, Column, ResourceStr, Resource, Color, Local } from '@kit.ArkUI';
import { SymbolGlyphModifier, TextModifier } from '@ohos.arkui.modifier';
import { 
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem, SubHeaderV2TitleOptions
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  @Local selectText: string = 'TTTTT'
  @Local selectIndex: number = 2
  @Local flag: boolean = true;
  @Local index: number = 1;
  @Local primaryTitle: ResourceStr = '一级标题';
  @Local secondaryTitle: ResourceStr = '二级标题';
  // 系统邮件图片资源
  @Local subHeaderIcon: Resource = $r('sys.media.ohos_ic_public_email');
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题' });
  @Local primaryModifier: TextModifier = new TextModifier().fontColor(Color.Red);
  @Local secondaryModifier: TextModifier = new TextModifier().fontColor(Color.Red);
  @Local subHeaderOperationType: SubHeaderV2OperationType = SubHeaderV2OperationType.BUTTON;
  @Local operationItems: SubHeaderV2OperationItem[] = [];
  @Local subHeaderV2TitleOptions: SubHeaderV2TitleOptions = {
      primaryTitle: this.primaryTitle,
      id: 'subHeaderV2TitleOptionsId',
      secondaryTitle: this.secondaryTitle,
  };

  aboutToAppear(): void {
    this.title = new SubHeaderV2Title(this.subHeaderV2TitleOptions);
    this.operationItems = [new SubHeaderV2OperationItem({
      content: '操作',
      action: () => {
        this.getUIContext().getPromptAction().showToast({ message: 'demo2' })
      }
    })]
  }

  build() {
    Column() {
      SubHeaderV2({
        icon: this.subHeaderIcon,
        title: this.title,
        operationType: this.subHeaderOperationType,
        operationItems: this.operationItems
      });
    }
  }
}