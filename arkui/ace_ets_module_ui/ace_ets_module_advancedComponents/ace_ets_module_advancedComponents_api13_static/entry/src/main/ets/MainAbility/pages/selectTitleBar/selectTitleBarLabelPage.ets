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

import { SelectTitleBar,SelectTitleBarMenuItem } from '@ohos.arkui.advanced.SelectTitleBar';
import { $r, Column, Component, Divider, Entry, Resource, ResourceStr, Row } from '@ohos.arkui.component';

interface menuItems {
  value: Resource;
  isEnabled?: boolean;
  action?: () => void;
  label?: ResourceStr;
}

@Entry
@Component
struct Index {
  private menuItems: Array<SelectTitleBarMenuItem> =
    [
      {
        value: $r('sys.media.ohos_save_button_line'),
        isEnabled: true,
        action: () => this.getUIContext().getPromptAction().showToast({ message: 'show toast index 1' }),
        label: 'Item1',
      } as SelectTitleBarMenuItem,
      {
        value: $r('sys.media.ohos_ic_public_clock'),
        isEnabled: true,
        action: () => this.getUIContext().getPromptAction().showToast({ message: 'show toast index 2' }),
        label: 'Item2',
      } as SelectTitleBarMenuItem,
      {
        value: $r('sys.media.ohos_ic_public_edit'),
        isEnabled: true,
        action: () => this.getUIContext().getPromptAction().showToast({ message: 'show toast index 3' }),
        label: 'Item3',
      } as SelectTitleBarMenuItem,
      {
        value: $r('sys.media.ohos_ic_public_clock'),
        isEnabled: true,
        action: () => this.getUIContext().getPromptAction().showToast({ message: 'show toast index 4' }),
        label: 'Item4',
      } as SelectTitleBarMenuItem,
    ];

  build() {
    Row() {
      Column() {
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index:int) => this.getUIContext().getPromptAction().showToast({ message: 'page index ' + index }),
          hidesBackButton: true,
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index:int) => this.getUIContext().getPromptAction().showToast({ message: 'page index ' + index }),
          hidesBackButton: false,
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 1,
          onSelected: (index:int) => this.getUIContext().getPromptAction().showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 1,
          onSelected: (index:int) => this.getUIContext().getPromptAction().showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
          menuItems: [{ isEnabled: true, value: $r('sys.media.ohos_save_button_line'),
            action: () => this.getUIContext().getPromptAction().showToast({ message: 'show toast index 1' }),
            label: 'index1',
          }],
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index:int) => this.getUIContext().getPromptAction().showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
          menuItems: this.menuItems,
          badgeValue: 99,
          hidesBackButton: true,
        })
        Divider().height(2).color(0xCCCCCC)
      }.width('100%')
    }.height('100%')
  }
}