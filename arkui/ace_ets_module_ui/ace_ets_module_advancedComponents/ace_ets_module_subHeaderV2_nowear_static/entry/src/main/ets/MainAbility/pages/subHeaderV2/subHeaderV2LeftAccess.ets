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

import { Entry, ComponentV2, $r, Column, Divider, Color, ResourceStr, Local } from '@kit.ArkUI';
import {
  SubHeaderV2OperationType, SubHeaderV2, SubHeaderV2Title, SubHeaderV2OperationItem, SubHeaderV2Select
} from '@ohos.arkui.advanced.SubHeaderV2';

@Entry
@ComponentV2
struct SubHeaderExample {
  @Local index: number = 1;
  @Local primaryTitle: ResourceStr = '一级标题';
  @Local secondaryTitle: ResourceStr = '二级标题';
  // 系统邮件图片资源
  @Local subHeaderIcon: ResourceStr | undefined = $r('sys.media.ohos_ic_public_email');
  @Local title: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题' });
  @Local title2: SubHeaderV2Title = new SubHeaderV2Title({ primaryTitle: '一级标题', secondaryTitle: '二级标题' });
  @Local subHeaderOperationType: SubHeaderV2OperationType = SubHeaderV2OperationType.BUTTON;
  @Local subHeaderOperationType2: SubHeaderV2OperationType = SubHeaderV2OperationType.TEXT_ARROW;
  @Local subHeaderOperationType3: SubHeaderV2OperationType = SubHeaderV2OperationType.ICON_GROUP;
  @Local operationItems: SubHeaderV2OperationItem[] = [];
  @Local selectedValue: string | undefined = 'selectDemo';
  @Local selectedIndex: int = 0;
  @Local select: SubHeaderV2Select =
    new SubHeaderV2Select({ options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }] });

  aboutToAppear(): void {
    this.select = new SubHeaderV2Select({ options: [] });
    this.title = new SubHeaderV2Title({
      primaryTitle: this.primaryTitle,
      secondaryTitle: this.secondaryTitle,
      titleAccessibilityText: 'SubHeaderV2Title AccessibilityText'
    });
    this.operationItems = [new SubHeaderV2OperationItem({
      content: '操作',
      action: () => {
        this.getUIContext().getPromptAction().showToast({ message: 'demo2' })
      }
    })]
  }

  build() {
    Column() {
      Column() {
        SubHeaderV2({
          icon: this.subHeaderIcon,
          title: this.title,
          select: this.select,
          operationType: this.subHeaderOperationType,
          operationItems: this.operationItems,
        });
        Divider().color('grey').width('100%').height('2vp')
        SubHeaderV2({
          title: this.title2,
          select: this.select,
          operationType: this.subHeaderOperationType2,
          operationItems: this.operationItems
        });
        Divider().color('grey').width('100%').height('2vp')
        SubHeaderV2({
          select: new SubHeaderV2Select({
            options: [{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }],
            selectedIndex: this.selectedIndex,
            selectedContent: this.selectedValue,
            onSelect: (index: int, value?: string) => {
              this.selectedIndex = index;
              this.selectedValue = value;
              this.getUIContext().getPromptAction().showToast({ message: this.selectedValue as string })
            }
          }),
          operationType: this.subHeaderOperationType3,
          operationItems: [new SubHeaderV2OperationItem({
            // 系统邮件图片资源
            content: $r('sys.media.ohos_ic_public_email'),
            accessibilityText: '图标1',
            accessibilityLevel: 'yes',
          }), new SubHeaderV2OperationItem({
            // 系统邮件图片资源
            content: $r('sys.media.ohos_ic_public_email'),
            accessibilityText: '图标2',
            accessibilityLevel: 'no',
          }), new SubHeaderV2OperationItem({
            // 系统邮件图片资源
            content: $r('sys.media.ohos_ic_public_email'),
            accessibilityText: '图标3',
            accessibilityDescription: '点击操作图标3',
          })]
        });
      }
      Divider().color('grey').width('100%').height('2vp')
    }
  }
}