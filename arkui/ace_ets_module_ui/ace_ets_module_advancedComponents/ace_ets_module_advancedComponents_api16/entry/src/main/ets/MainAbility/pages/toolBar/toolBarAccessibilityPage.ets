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

import { ToolBar, ToolBarOptions, ItemState } from '@ohos.arkui.advanced.ToolBar';

@Entry
@Component
struct Index {
  @State toolbarList: ToolBarOptions = new ToolBarOptions()

  aboutToAppear() {
    this.toolbarList.push({
      content: '剪贴我是超超超超超超超超超长样式',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
      accessibilityText: '剪贴', //该项屏幕朗读播报文本为‘剪贴’
      accessibilityDescription: '单指双击即可剪贴', //该项屏幕朗读播报描述为'单指双击即可剪贴'
      accessibilityLevel: 'yes'  //该项可被无障碍屏幕朗读聚焦
    })
    this.toolbarList.push({
      content: '拷贝',
      icon: $r('sys.media.ohos_ic_public_copy'),
      action: () => {
      },
      state: ItemState.DISABLE,
      accessibilityLevel: 'no'  //该项将无法被屏幕朗读服务所识别，屏幕朗读不可聚焦
    })
    this.toolbarList.push({
      content: '粘贴',
      icon: $r('sys.media.ohos_ic_public_paste'),
      action: () => {
      },
      state: ItemState.ACTIVATE
    })
    this.toolbarList.push({
      content: '全选',
      icon: $r('sys.media.ohos_ic_public_select_all'),
      action: () => {
      },
    })
    this.toolbarList.push({
      content: '分享',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
    })
    this.toolbarList.push({
      content: '分享',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
    })
  }

  build() {
    Row() {
      Stack() {
        Column() {
          ToolBar({
            toolBarList: this.toolbarList,
          })
        }
      }.align(Alignment.Bottom)
      .width('100%').height('100%')
    }
  }
}