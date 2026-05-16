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

import { TabTitleBar } from '@ohos.arkui.advanced.TabTitleBar';
import promptAction from '@ohos.promptAction';

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
}

@Entry
@Component
struct TabTitleBarPageTest {
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

  private readonly tabItems: Array<TabItem> = [new TabItem('tab1'), new TabItem('tab2'), new TabItem('tab3'), new TabItem('Happy'), new TabItem('tab4')];
  private readonly menuItems: Array<MenuItem> = [
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 0' }),
    },
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 1' }),
    },
    {
      value: $r('app.media.icon'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 2' }),
    },
  ];

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