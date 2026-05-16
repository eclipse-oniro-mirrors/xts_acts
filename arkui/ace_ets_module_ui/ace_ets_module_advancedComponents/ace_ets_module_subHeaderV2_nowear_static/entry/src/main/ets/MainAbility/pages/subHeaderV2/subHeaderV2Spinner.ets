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

import { Entry, ComponentV2, $r, Column, Local } from '@kit.ArkUI';
import { SymbolGlyphModifier, TextModifier } from '@ohos.arkui.modifier';
import {
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem, SubHeaderV2OperationItemOptions, 
  SubHeaderV2Select, SubHeaderV2SelectOptions
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  @Local selectedValue: string = 'aaa';
  @Local selectedIndex: int = 0;
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题', secondaryTitle: '二级标题' });
  @Local operationItems: SubHeaderV2OperationItem[] = [];
  @Local select: SubHeaderV2Select =
    new SubHeaderV2Select({
      id: 'subHeaderV2SelectId',
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] 
    });
  @Local select2: SubHeaderV2Select =
    new SubHeaderV2Select({
      id: '',
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] 
    });

  @Local subHeaderV2SelectOptions: SubHeaderV2SelectOptions = {
      id: 'subHeaderV2SelectOptionsId',
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }],
      selectedContent: 'selectDemo2',
      selectedIndex: 0,
      onSelect: (index: int, value?: string) => {
        this.getUIContext().getPromptAction().showToast({ message: 'selectdemo' })
      }
    };
  @Local subHeaderV2OperationItemOptions: SubHeaderV2OperationItemOptions = {
        // 系统邮件图片资源,
        id: 'subHeaderV2OperationItemId3',
        content: $r('sys.media.ohos_ic_public_email'),
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo' })
        }
      };

  aboutToAppear(): void {

    this.title = new SubHeaderV2Title({
      primaryTitle: '一级标题',
      secondaryTitle: '二级标题'
    });

    this.selectedValue = 'selectDemo';
    this.select = new SubHeaderV2Select({
      id: 'subHeaderV2SelectOptionsId',
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }],
      selectedContent: this.selectedValue,
      selectedIndex: this.selectedIndex,
      onSelect: (index: int, value?: string) => {
        this.getUIContext().getPromptAction().showToast({ message: 'selectdemo' })
      }
    })

    this.select2 = new SubHeaderV2Select(this.subHeaderV2SelectOptions)

    this.operationItems = [
      new SubHeaderV2OperationItem({
        // 系统邮件图片资源
        id: 'subHeaderV2OperationItemId1',
        content: $r('sys.media.ohos_ic_public_email'),
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo' })
        }
      }),
      new SubHeaderV2OperationItem({
        // 系统邮件图片资源
        id: 'subHeaderV2OperationItemId2',
        content: $r('sys.media.ohos_ic_public_email'),
        action: () => {
          this.getUIContext().getPromptAction().showToast({ message: 'demo' })
        }
      }),
      new SubHeaderV2OperationItem(this.subHeaderV2OperationItemOptions)
    ]
  }

  build() {
    Column() {
      SubHeaderV2({
        select: this.select,
        operationType: SubHeaderV2OperationType.ICON_GROUP,
        operationItems: this.operationItems
      })
      SubHeaderV2({
        select: this.select2,
        operationType: SubHeaderV2OperationType.ICON_GROUP,
        operationItems: this.operationItems
      })
    }
  }
}