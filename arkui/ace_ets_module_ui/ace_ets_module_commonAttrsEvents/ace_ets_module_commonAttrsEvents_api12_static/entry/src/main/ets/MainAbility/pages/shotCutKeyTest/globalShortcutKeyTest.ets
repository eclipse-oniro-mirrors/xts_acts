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
struct FunctionKeyTest {
  @State message2: string = 'single key test'
  @State message3: string = 'three key test'
  @State message4: string = ''
  @State message5: string = ''
  @State message6: string = ''
  @State message7: string = ''
  @State message8: string = ''
  functionkey: FunctionKey[] = new Array<FunctionKey>(FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
    FunctionKey.F3, FunctionKey.F3,
    FunctionKey.F4, FunctionKey.F5,
    FunctionKey.F6, FunctionKey.F7,
    FunctionKey.F8, FunctionKey.F9,
    FunctionKey.F10, FunctionKey.F12,
    FunctionKey.TAB, FunctionKey.DPAD_UP,
    FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
    FunctionKey.DPAD_RIGHT)
  messageManager: MessageManager<string | FunctionKey | Array<ModifierKey>> = new MessageManager<string | FunctionKey | Array<ModifierKey>>();
  @State changeChar2: string | FunctionKey = "";
  @State keys: Array<ModifierKey> = new Array<ModifierKey>();
  @State changeChar3: string | FunctionKey = "";
  @State changeChar4: string | FunctionKey | Array<ModifierKey> = "1";

  onPageShow(): void {
    console.info("FunctionKeyTest onPageShow");
    AppStorage.setOrCreate<MessageManager<string | FunctionKey| Array<ModifierKey>>>('messageManager', this.messageManager);

    let callback: Callback<string | FunctionKey | Array<ModifierKey>> = (message: Message<string | FunctionKey | Array<ModifierKey>>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeChar2') {
        this.changeChar2 = (message as Message<string | FunctionKey >).value
      }
      if (message.name == 'changeChar3') {
        this.changeChar3 = (message as Message<string | FunctionKey >).value
      }
      if (message.name == 'changeChar4') {
        this.changeChar4 = message.value
      }
      if (message.name == 'keys') {
        this.keys = (message as Message<Array<ModifierKey>>).value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
      Column({ space: 5 } as ColumnOptions) {
        Text(this.message2).key("keyTest2")
        Button("Test short cut 2").onClick((event: ClickEvent) => {
          this.message2 = "I clicked Button2 " + this.changeChar2;
          console.info("I clicked 2");
        })
          .keyboardShortcut(this.changeChar2, new Array<ModifierKey>())
          .onKeyEvent((event: KeyEvent): boolean => {
            console.info("event.keyCode: " + JSON.stringify(event));
            this.message2 = "the key Button " + this.changeChar2;
            return true
          })
        Text(this.message3).key("keyTest3")
        Button("Test short cut 3").onClick((event: ClickEvent) => {
          this.message3 = "I clicked Button3 " + this.changeChar3;
          console.info("I clicked 3");
        })
          .keyboardShortcut(this.changeChar3, this.keys)
        Text(this.message5).key("keyTest5")
        Button("Test short cut 5").onClick((event: ClickEvent) => {
          this.message5 = "I clicked Button 5";
          console.info("I clicked 5");
        })
          .keyboardShortcut("M", [ModifierKey.CTRL], undefined)
          .focusable(false)
        Text(this.message7).key("keyTest7")
        Button("Test short cut 7").onClick((event: ClickEvent) => {
          this.message7 = "I clicked Button 7";
          console.info("I clicked 7");
        })
          .keyboardShortcut("I", [ModifierKey.CTRL]).visibility(Visibility.Hidden)

        Text(this.message8).key("keyTest8")
        Button("Test short cut 8").onClick((event: ClickEvent) => {
          this.message8 = "I clicked Button 8";
          console.info("I clicked 8");
        }).keyboardShortcut(FunctionKey.DPAD_RIGHT, [ModifierKey.SHIFT])
        Text("Test short cut 8").onClick((event: ClickEvent) => {
          this.message8 = "I clicked text 8";
          console.info("I clicked text 8");
        }).keyboardShortcut(FunctionKey.DPAD_RIGHT, [ModifierKey.SHIFT])

        Text(this.message6).key("keyTest6")
        Button("Test short cut 6").onClick((event: ClickEvent) => {
          this.message6 = "I clicked Button 6";
          console.info("I clicked 6");
        }).keyboardShortcut(FunctionKey.DPAD_LEFT, [ModifierKey.CTRL, ModifierKey.SHIFT]).enabled(false)
      }
      .width('100%').height('100%')
  }
}