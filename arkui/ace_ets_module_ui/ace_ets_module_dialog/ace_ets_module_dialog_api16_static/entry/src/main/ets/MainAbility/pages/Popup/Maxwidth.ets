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
import router from '@ohos.router';
import {
  Entry,
  Column,
  Resource,
  MenuItemGroup,
  Component,
  Button,
  ClickEvent,
  Text,
  FlexDirection,
  ItemAlign,
  Divider,
  $r,
  $$,
  MenuItem,
  BlurStyleActivePolicy,
  AdaptiveColor,
  ThemeColorMode,
  MenuElement,
  Row,
  AlertDialogParamWithButtons,
  FlexOptions,
  ColumnOptions,
  RowOptions,
  Flex,
  Builder,
  MenuItemOptions,
  ResourceStr,
  Menu,
  BackgroundBlurStyleOptions,
  BlurStyle,
  Scroll,
  FontWeight,
  TextAlign,
  ForEach,
  ListItem,
  LocalizedBorderRadiuses,
  $$,
  SheetOptions,
  FlexAlign,
  CustomDialogController,
  TextInput,
  CustomDialogControllerOptions,
  ButtonType,
  Scroller,
  Color,
  Rectangle,
  ActionSheetOptions,
  ControlSize,
  DialogAlignment,
  TextInputController,
  Margin
} from '@ohos.arkui.component'
import { State, Link, PropRef, Observed, ObjectLink, } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { Popup, PopupOptions, PopupButtonOptions, PopupIconOptions, PopupTextOptions } from '@ohos.arkui.advanced.Popup'

@Entry
@Component
struct PopupExample {
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column({ space: 10 } as ColumnOptions) {
        Popup({
          maxWidth: '300vp',
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          } as PopupButtonOptions,
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            } as PopupButtonOptions]
        } as PopupOptions)
        Button('getInspectorTree').onClick((e: ClickEvent) => {
          this.text1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray('$children')[0]
            .getArray('$children')[0]
            .getArray('$children')[0]
            .getElement('$attrs')
            .getElement('constraintSize')
            .getString('maxWidth')
        }).id('PopupApi1_btn1')
        Text(this.text1).id('PopupApi1_text1')
      }

      Column({ space: 10 } as ColumnOptions) {
        Popup({
          maxWidth: -9.9,
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          } as PopupButtonOptions,
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            } as PopupButtonOptions]
        } as PopupOptions)
        Button('getInspectorTree').onClick((e: ClickEvent) => {
          this.text2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray('$children')[0]
            .getArray('$children')[1]
            .getArray('$children')[0]
            .getElement('$attrs')
            .getElement('constraintSize')
            .getString('maxWidth')
        }).id('PopupApi1_btn2')
        Text(this.text2).id('PopupApi1_text2')
      }

      Column({ space: 10 } as ColumnOptions) {
        Popup({
          maxWidth: undefined,
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          } as PopupButtonOptions,
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            } as PopupButtonOptions]
        } as PopupOptions)
        Button('getInspectorTree').onClick((e: ClickEvent) => {
          this.text3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray('$children')[0]
            .getArray('$children')[2]
            .getArray('$children')[0]
            .getElement('$attrs')
            .getElement('constraintSize')
            .getString('maxWidth')
        }).id('PopupApi1_btn3')
        Text(this.text3).id('PopupApi1_text3')
      }
    }
  }
}