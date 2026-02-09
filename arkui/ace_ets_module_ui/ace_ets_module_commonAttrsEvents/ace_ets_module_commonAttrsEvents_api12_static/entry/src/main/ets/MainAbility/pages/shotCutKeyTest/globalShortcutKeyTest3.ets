'use static';
/*
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
import { Callback, Message, MessageManager } from '../../../MainAbility/common/MessageManager';
import { CustomColors, CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  $r,
  Alignment,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomDialogController,
  CustomPopupOptions,
  DialogAlignment,
  Divider,
  DragEvent,
  Entry,
  FlexAlign,
  FocusPriority,
  FolderStack,
  FoldStatus,
  FontWeight,
  FunctionKey,
  HitTestMode,
  KeyEvent,
  Margin,
  Menu,
  MenuItem,
  ModifierKey,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  OnFoldStatusChangeInfo,
  Padding,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  ResourceColor,
  Row,
  RowOptions,
  SafeAreaEdge,
  Scroll,
  Text,
  TextAlign,
  TextInput,
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'


@Entry
@Component
struct FunctionKeyTest3 {
  @State message: string = 'Hello World'
  functionkey: FunctionKey[] = new Array<FunctionKey>(FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
  FunctionKey.F3, FunctionKey.F3,
  FunctionKey.F4, FunctionKey.F5,
  FunctionKey.F6, FunctionKey.F7,
  FunctionKey.F8, FunctionKey.F9,
  FunctionKey.F10, FunctionKey.F12,
  FunctionKey.TAB, FunctionKey.DPAD_UP,
  FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
  FunctionKey.DPAD_RIGHT)
  messageManager: MessageManager<string | FunctionKey> = new MessageManager<string | FunctionKey>();
  @State changeChar: string | FunctionKey = "3";

  onPageShow(): void {
    console.info("FunctionKeyTest onPageShow");
    AppStorage.setOrCreate<MessageManager<string | FunctionKey>>('messageManager', this.messageManager);
    let callback: Callback<string | FunctionKey> = (message: Message<string | FunctionKey>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeChar') {
        this.changeChar = message.value
      }

    }
    this.messageManager.registerCallback(callback)
  }

  build() {
      Column({ space: 5 } as ColumnOptions) {
        Text(this.message).key("keyTest").margin({ top: 15 } as Margin)
        Button("Test short cut 1").onClick((event: ClickEvent) => {
          this.message = "I clicked Button " + this.changeChar;
        }).keyboardShortcut(this.changeChar, [ModifierKey.CTRL])
          .onKeyEvent((event: KeyEvent): boolean => {
            console.info("event.keyCode: " + JSON.stringify(event));
            return true
          })
      }
      .width('100%').height('100%')

  }
}