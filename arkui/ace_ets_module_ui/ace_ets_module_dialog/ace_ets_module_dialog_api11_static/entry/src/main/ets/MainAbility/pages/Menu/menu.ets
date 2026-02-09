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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Menu,
  MenuItem,
  ResourceStr,
  Builder,
  MenuItemOptions,
  CustomBuilder,
  TextAlign,
  ResponseType,
  MenuPreviewMode,
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

@Entry
@Component
struct Index1 {
  private iconStr: ResourceStr = $r("app.media.icon")
  @State preview: string = ''
  @State start: number = 0.1
  @State end: number = 0.8

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions | CustomBuilder)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions | CustomBuilder)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions | CustomBuilder)
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions,) {
      Text('' + this.start).id('preview_start')
      Text('' + this.end).id('preview_end')
      Text('preview-image')
        .textAlign(TextAlign.Center)
        .id('preview-image')
        .bindContextMenu(this.MyMenu, ResponseType.LongPress,
          {
            preview: MenuPreviewMode.IMAGE,
            previewAnimationOptions: { scale: [this.start, this.end] },
          })
        .backgroundColor("#ff3df2f5")

      Button('change开始').onClick((e: ClickEvent) => {
        this.start = 10
      }).id('button_start_preview')

      Button('change结束').onClick((e: ClickEvent) => {
        this.end = 20
      }).id('button_end_preview')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}