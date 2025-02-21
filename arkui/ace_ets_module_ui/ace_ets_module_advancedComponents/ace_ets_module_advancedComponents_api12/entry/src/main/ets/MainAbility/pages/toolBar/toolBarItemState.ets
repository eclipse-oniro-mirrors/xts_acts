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

import { ToolBar, ToolBarOptions } from '@ohos.arkui.advanced.ToolBar';

enum ItemState {
  ENABLE = 1,
  DISABLE = 2,
  ACTIVATE = 3,
}

@Entry
@Component
struct ToolBarItemState {
  @State toolbarList: ToolBarOptions = new ToolBarOptions()
  aboutToAppear() {
    this.toolbarList.push({
      content: 'ENABLE',
      icon: $r('sys.media.ohos_ic_public_copy'),
      action: () => {
      },
      state:ItemState.ENABLE,
    })
    this.toolbarList.push({
      content: 'DISABLE',
      icon: $r('sys.media.ohos_ic_public_paste'),
      action: () => {
      },
      state:ItemState.DISABLE,
    })
    this.toolbarList.push({
      content: 'ACTIVATE',
      icon: $r('sys.media.ohos_ic_public_select_all'),
      action: () => {
      },
      state:ItemState.ACTIVATE,
    })
  }
  build() {
    Row() {
      Stack() {
        Column() {
          ToolBar({
            activateIndex: 2,
            toolBarList: this.toolbarList,
          })
        }
      }
      .align(Alignment.Bottom)
      .width('100%')
      .height('100%')
    }
  }
}