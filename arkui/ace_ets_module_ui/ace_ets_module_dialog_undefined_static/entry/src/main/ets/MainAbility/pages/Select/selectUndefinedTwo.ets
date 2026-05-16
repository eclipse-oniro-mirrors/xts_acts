'use static';
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
  Builder,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Menu,
  MenuItem,
  MenuItemOptions,
  MenuItemGroup,
  ArrowPosition,
  Select,
  Divider,
  $r,
  ContentModifier,
  MenuItemConfiguration,
  WrappedBuilder,
  CustomBuilderT,
  wrapBuilder,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

type MenuItemBuilder = @Builder (config: MenuItemConfiguration) => void;

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  public modifierText: string = '123';

  constructor(text: string) {
    this.modifierText = text;
  }

  applyContent(): WrappedBuilder<MenuItemBuilder> {
    return wrapBuilder(menuItemBuilder);
  }
}

@Builder
function menuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text('Select XTS')
      .id('Text')
  }
}

@Entry
@Component
struct SelectExample {
  @State isMenuItemContentModifier: boolean = true;

  build() {
    Column() {
      Select([{ value: 'aaa'}])
        .id('Select')
        .menuItemContentModifier(this.isMenuItemContentModifier ? new MyMenuItemContentModifier('Select XTS') :
          undefined)
      Divider()
      Button('isMenuItemContentModifier = ' + this.isMenuItemContentModifier)
        .id('Select_menuItemContentModifier')
        .onClick(() => {
          this.isMenuItemContentModifier = !this.isMenuItemContentModifier
        })
    }.width('100%')
  }
}