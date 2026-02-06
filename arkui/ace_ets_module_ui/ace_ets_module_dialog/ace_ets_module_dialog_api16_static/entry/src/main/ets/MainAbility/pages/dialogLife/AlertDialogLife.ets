'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import {
  Entry,Column,Component,Button,ClickEvent,ShadowStyle,
  SheetKeyboardAvoidMode,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,
  MenuItem,BlurStyleActivePolicy,AdaptiveColor,
  ThemeColorMode,MenuElement,SheetMode,SheetSize,Placement,
  Row,AlertDialogParamWithButtons,FlexOptions,
  ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,
  Menu,BackgroundBlurStyleOptions,BlurStyle,SheetType,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,
  LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,
  CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,
  ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct AlertDialogExampleA {
  @State alertDialogFlag1: string = 'false';
  @State alertDialogFlag2: string = 'false';
  @State alertDialogFlag3: string = 'false';
  @State alertDialogFlag4: string = 'false';
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
      Button('AlertDialog生命周期').key('AlertDialog')
        .onClick((e: ClickEvent) => {
          this.getUIContext().showAlertDialog({
            title:    'AlertDialog生命周期',
            message:  'AlertDialog生命周期',
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -20 },
            primaryButton: {
              value: 'button',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',

              action: () => {
                console.info('AlertDialog Button-clicking callback')
              }
            },
            secondaryButton: {
              value: 'cancel',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {

              }
            },
            cancel: () => {
              console.info('AlertDialog Closed callbacks')
            },
            onDidAppear: () => {
              this.alertDialogFlag2 = 'true';
              console.info('AlertDialog,is onDidAppear!')
            },
            onDidDisappear: () => {
              this.alertDialogFlag4 = 'true';
              console.info('AlertDialog,is onDidDisappear!')
            },
            onWillAppear: () => {
              this.alertDialogFlag1 = 'true';
              console.info('AlertDialog,is onWillAppear!')
            },
            onWillDisappear: () => {
              this.alertDialogFlag3 = 'true';
              console.info('AlertDialog,is onWillDisappear!')
            }
          } as AlertDialogParamWithButtons)
        })
      Text(this.alertDialogFlag1).id('alertDialogFlag1')
      Text(this.alertDialogFlag2).id('alertDialogFlag2')
      Text(this.alertDialogFlag3).id('alertDialogFlag3')
      Text(this.alertDialogFlag4).id('alertDialogFlag4')
    }.width('100%')
    .height('100%')
  }
}