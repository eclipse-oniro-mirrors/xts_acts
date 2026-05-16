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

import { TabTitleBar, promptAction, TabTitleBarTabItem, TabTitleBarMenuItem } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @Builder
  //定义页签列表关联的页面
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

  //定义几个左侧的页签项目
  private readonly tabItems: Array<TabTitleBarTabItem> =
    [
      { title: '页签1' },
      { title: '页签2' },
      { title: '页签3' },
      { title: 'icon', icon: $r('sys.media.ohos_app_icon') },
      { title: '页签4' },
    ]
  //定义几个右侧的菜单项目
  private readonly menuItems: Array<TabTitleBarMenuItem> = [
    {
      value: $r('sys.media.ohos_save_button_filled'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 0' }),
      accessibilityText: '保存',
      //此处为no，屏幕朗读不聚焦
      accessibilityLevel: 'no',
      accessibilityDescription: '点击操作保存图标'
    },
    {
      value: $r('sys.media.ohos_ic_public_copy'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 1' }),
      accessibilityText: '复制',
      accessibilityLevel: 'yes',
      accessibilityDescription: '点击操作复制图标'
    },
    {
      value: $r('sys.media.ohos_ic_public_edit'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: 'on item click! index 2' }),
      //屏幕朗读播报文本，优先级比label高
      accessibilityText: '编辑',
      //屏幕朗读是否可以聚焦到
      accessibilityLevel: 'yes',
      //屏幕朗读最后播报的描述文本
      accessibilityDescription: '点击操作编辑图标'
    },
  ]

  //TabTitleBar效果展示
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