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
  SubHeaderV2,
  SubHeaderV2OperationType,
  SubHeaderV2OperationItem,
  SubHeaderV2Title,
  SubHeaderV2Select,
  Prompt
} from '@kit.ArkUI';

import {
  SubHeaderV2TitleOptions,
  SubHeaderV2SelectOptions,
  SubHeaderV2OperationItemOptions
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  @Local selectedValue: ResourceStr = $r('app.string.download');
  @Local selectedIndex: number = 0;
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({id: 'subHeaderV2Title', primaryTitle: '一级标题', secondaryTitle: '二级标题', titleAccessibilityText: '自定义内容'});
  @Local operationItems: SubHeaderV2OperationItem[] = [];
  @Local select: SubHeaderV2Select =
    new SubHeaderV2Select({ id: 'selectOptionsId', options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] });
  @Local select2: SubHeaderV2Select =
    new SubHeaderV2Select({ id: 'selectOptionsId', options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] });

  @Local subHeaderV2TitleOptions: SubHeaderV2TitleOptions ={
    id: 'subHeaderV2TitleOptionsId', primaryTitle: '一级标题', secondaryTitle: '二级标题', titleAccessibilityText: '自定义内容'};
  @Local subHeaderV2SelectOptions: SubHeaderV2SelectOptions = {
    id: 'subHeaderV2SelectOptionsId',
    options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }],
    selectedContent: '下载2',
    selectedIndex: 0,
    onSelect: (index: number, value?: string) => {
      Prompt.showToast({ message: 'selectdemo' })
    }
  };
  @Local subHeaderV2OperationItemOptions: SubHeaderV2OperationItemOptions = {
    id: 'subHeaderV2OperationItemOptions03',
    content: $r('sys.media.ohos_ic_public_email'),
    action: () => {
      Prompt.showToast({ message: 'demo' })
    },
    accessibilityText: 'access text',
    accessibilityLevel: 'auto',
    accessibilityDescription: '',
    defaultFocus: false
  }


  aboutToAppear(): void {

    this.title = new SubHeaderV2Title(this.subHeaderV2TitleOptions);

    this.select = new SubHeaderV2Select({
      id: 'selectOptionsId',
      selectedContent: this.selectedValue,
      selectedIndex: this.selectedIndex,
      options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] 
    })

    this.select2 = new SubHeaderV2Select(this.subHeaderV2SelectOptions)

    this.operationItems = [
      new SubHeaderV2OperationItem({
        id: 'subHeaderV2OperationItem01',
        content: $r('sys.media.ohos_ic_public_email'),
        action: () => {
          Prompt.showToast({ message: 'demo' })
        }
      }),
      new SubHeaderV2OperationItem({
        id: 'subHeaderV2OperationItem02',
        content: $r('sys.media.ohos_ic_public_email'),
        action: () => {
          Prompt.showToast({ message: 'demo' })
        }
      }),
      new SubHeaderV2OperationItem(this.subHeaderV2OperationItemOptions)
    ]
  }

  build() {
    Column() {
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
        SubHeaderV2({
          title: this.title,
          operationType: SubHeaderV2OperationType.ICON_GROUP,
          operationItems: this.operationItems
        })
      }
    }
  }
}