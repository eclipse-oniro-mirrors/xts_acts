/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
import { ComposeTitleBar, ComposeTitleBarMenuItem } from '@ohos.arkui.advanced.ComposeTitleBar';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ComposeTitleBarPage {
  private menuItems: Array<ComposeTitleBarMenuItem> = [
    {
      value: $r('sys.media.ohos_ic_public_copy'),
      label: 'copy',
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'show toast index 0' }),
    },
    {
      value: $r('sys.media.ohos_ic_public_copy'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'show toast index 1' }),
    },
    {
      value: $r('sys.media.ohos_ic_public_copy'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'show toast index 2' }),
    },
    {
      value: $r('sys.media.ohos_ic_public_copy'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'show toast index 3' }),
    },
  ]

  build() {
    Row() {
      Column() {
        Divider().height(2).color(0xCCCCCC)
        ComposeTitleBar({
          title: 'Title',
          subtitle: 'SubTitle',
          menuItems: this.menuItems.slice(0, 1),
        })
        Divider().height(2).color(0xCCCCCC)
        ComposeTitleBar({
          title: 'Title1',
          subtitle: 'SubTitle1',
          menuItems: this.menuItems.slice(0, 2),
        })
        Divider().height(2).color(0xCCCCCC)
        ComposeTitleBar({
          title: 'Title2',
          subtitle: 'SubTitle2',
          menuItems: this.menuItems,
        })
        Divider().height(2).color(0xCCCCCC)
        ComposeTitleBar({
          menuItems: [{ isEnabled: true, value: $r('sys.media.ohos_ic_public_copy'),
            action: () => promptAction.showToast({ message: 'show toast index 1' }),
          }],
          title: 'Title3',
          subtitle: 'SubTitle3',
          item: { isEnabled: true, value: $r('sys.media.ohos_ic_public_copy') },
        })
        Divider().height(2).color(0xCCCCCC)
      }
    }.height('100%')
  }
}