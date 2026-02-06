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

import { TabTitleBar } from '@ohos.arkui.advanced.TabTitleBar';
import {
  $r,
  Builder,
  Column,
  Component,
  Divider,
  Entry,
  FontWeight,
  ResourceStr,
  Row,
  Text,
  TextAlign
} from '@ohos.arkui.component';
import { TabTitleBarTabItem } from '@ohos.arkui.advanced.TabTitleBar'
import { TabTitleBarMenuItem } from '@ohos.arkui.advanced.TabTitleBar'

class TabItem {
  public title: ResourceStr;
  public icon?: ResourceStr;

  constructor(title: ResourceStr, icon?: ResourceStr) {
    this.title = title;
    this.icon = icon;
  }
}

interface MenuItem {
  value: ResourceStr;
  isEnabled?: boolean;
  action?: () => void;
  label?: ResourceStr;
}

@Entry
@Component
struct TabTitleBarLabelTest {
  private readonly tabItems: Array<TabTitleBarTabItem> =
    [{title:'tab1'},{title:'tab2'},{title:'tab3'},{title:'Happy'},{title:'tab4'}];
  private readonly menuItems: Array<TabTitleBarMenuItem> = [
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => this.getUIContext().getPromptAction().showToast({ message: 'on item click! index 0' }),
      label: 'Menu1',
    } as TabTitleBarMenuItem,
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => this.getUIContext().getPromptAction().showToast({ message: 'on item click! index 1' }),
      label: 'Menu2',
    } as TabTitleBarMenuItem,
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => this.getUIContext().getPromptAction().showToast({ message: 'on item click! index 2' }),
    } as TabTitleBarMenuItem,
  ];

  @Builder
  componentBuilder() {
    Text('#1ABC9C\nTURQUOISE')
      .fontWeight(FontWeight.Bold)
      .fontSize(14)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontColor('#CCFFFFFF')
      .backgroundColor('#1ABC9C')
    Text('#16A085\nGREEN SEA')
      .fontWeight(FontWeight.Bold)
      .fontSize(14)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontColor('#CCFFFFFF')
      .backgroundColor('#16A085')
    Text('#2ECC71\nEMERALD')
      .fontWeight(FontWeight.Bold)
      .fontSize(14)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontColor('#CCFFFFFF')
      .backgroundColor('#2ECC71')
    Text('#27AE60\nNEPHRITIS')
      .fontWeight(FontWeight.Bold)
      .fontSize(14)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontColor('#CCFFFFFF')
      .backgroundColor('#27AE60')
    Text('#3498DB\nPETER RIVER')
      .fontWeight(FontWeight.Bold)
      .fontSize(14)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontColor('#CCFFFFFF')
      .backgroundColor('#3498DB')
  }

  build() {
    Row() {
      Column() {
        TabTitleBar({
          swiperContent: this.componentBuilder,
          tabItems: this.tabItems,
          menuItems: this.menuItems,
        })
      }.width('100%')
    }.height('100%')
  }
}