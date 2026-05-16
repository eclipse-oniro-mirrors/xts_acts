'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Component,
  Column,
  ColumnOptions,
  Text,
  Builder,
  TextAlign,
  ResponseType,
  ResourceStr,
  Menu,
  MenuItem,
  MenuItemOptions,
  $r,
  Image,
  Button
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  private iconStr: ResourceStr = $r('app.media.startIcon');
  @State isShown: boolean = false;
  @State isBindContextMenu: boolean = true;

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions).id('menuItem')
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions)
    }
  }

  @Builder
  MyPreview() {
    Column() {
      Text('bindContextMenu')
        .id('Text_bindContextMenu')
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
    }
  }

  build() {
    Column({ space: 50 } as ColumnOptions) {
      Column() {
        Column() {
          Text('preview-builder')
            .width(200)
            .height(100)
            .textAlign(TextAlign.Center)
            .margin(100)
            .fontSize(30)
            .bindContextMenu(this.isShown, this.isBindContextMenu ? undefined : this.MyMenu,
              {
                preview: this.MyPreview,
                aboutToDisappear: ()=>{
                  this.isShown = false;
                }
              })
          Button('show')
            .id('Btn_show_Click')
            .onClick(()=>{
              this.isShown = true;
            })
          Button('btnBindContextMenu : ' + this.isBindContextMenu)
            .id('Btn_bindContextMenu')
            .onClick(() => {
              this.isBindContextMenu = !this.isBindContextMenu
            })
        }
      }.width('100%')
    }
  }
}