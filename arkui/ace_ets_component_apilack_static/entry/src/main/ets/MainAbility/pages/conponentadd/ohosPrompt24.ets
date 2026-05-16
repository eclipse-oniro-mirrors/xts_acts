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
import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import events_emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import { BusinessError } from '@ohos.base';
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  Navigation,
  NavigationTitleMode,
  RepeatMode,
  Row,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { Environment } from 'arkui.stateManagement.storage.environment';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../../src/test/Utils.test'
import { PromptAction, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct promptExample {
  @State text: string = 'item1'
  @State color: string = '#000000'

  build() {
    Column() {
      Button('showActionMenu')
        .key('button1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext()
          let PromptAction: PromptAction = uiContext.getPromptAction()
          PromptAction.showActionMenu({
            title: 'Title Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              }
            ] as [promptAction.Button],
          })
            .then((data: promptAction.ActionMenuSuccessResponse) => {
              console.log('dialog success callback，click button : ' + data.index);
            })
            .catch((err: Error) => {
              console.log('dialog fail callback' + err);
            })
        })
      Button('showDialog')
        .key('button2')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext()
          let PromptAction: PromptAction = uiContext.getPromptAction()
          PromptAction.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              },
            ] as Array<promptAction.Button> | undefined,
          });
        })
      Button('showActionMenu1')
        .key('button3')
        .backgroundColor('#ffe20b48')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext()
          let PromptAction: PromptAction = uiContext.getPromptAction()
          PromptAction.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000',
              },
              {
                text: 'button2',
                color: '#000000',
              }
            ] as Array<promptAction.Button> | undefined,
          })
            .then((data: promptAction.ShowDialogSuccessResponse) => {
              // Utils.emitEvent('sucessful', 422)
              console.info('showDialog success, click button: ' + data.index);
            })
            .catch((err: Error) => {
              console.info('showDialog error: ' + err);
            })
        })
      Button('showActionMenu2')
        .key('button6')
        .backgroundColor('#ffe20b48')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext()
          let PromptAction: PromptAction = uiContext.getPromptAction()
          PromptAction.showActionMenu({
            title: 'showActionMenu Title Info',
            buttons: [
              {
                text: 'item1',
                color: '#666666',
              } as promptAction.Button,
              {
                text: 'item2',
                color: '#000000',
              } as promptAction.Button,
            ] as [promptAction.Button, promptAction.Button | undefined]
          })
            .then((data: promptAction.ActionMenuSuccessResponse) => {
              // Utils.emitEvent(this.text, 404)
              console.info('showActionMenu success, click button: ' + data.index);
            })
            .catch((err: Error) => {
              console.info('showActionMenu error: ' + err);
            })
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext()
          let PromptAction: PromptAction = uiContext.getPromptAction()
          PromptAction.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              },
            ] as Array<promptAction.Button> | undefined,
          })
            .then((data: promptAction.ShowDialogSuccessResponse) => {
              console.info('showDialog success, click button: ' + data.index);
              // Utils.emitEvent('sucessful', 422)
            })
            .catch((data: Error) => {
              console.info('showDialog error: ' + data);
            });
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let uiContext: UIContext = this.getUIContext()
            let PromptAction: PromptAction = uiContext.getPromptAction()
            PromptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000',
                },
                {
                  text: 'button2',
                  color: '#000000',
                }
              ] as Array<promptAction.Button> | undefined
            }, (err, data) => {
              if (err) {
                console.info('showDialog err: ' + err);
                return;
              }
              console.info('showDialog success callback, click button: ' + data?.index);
            });
          } catch (error: Error) {
            console.error(`showDialog args error code is ${(error as Error)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let uiContext: UIContext = this.getUIContext()
            let PromptAction: PromptAction = uiContext.getPromptAction()
            PromptAction.showActionMenu({
              title: 'showActionMenu Title Info',
              buttons: [
                {
                  text: 'item1',
                  color: '#666666',
                } as promptAction.Button,
                {
                  text: 'item2',
                  color: '#000000',
                } as promptAction.Button,
              ] as [promptAction.Button, promptAction.Button | undefined]
            })
              .then((data: promptAction.ActionMenuSuccessResponse) => {
                console.info('showActionMenu success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showActionMenu error: ' + err);
              })
          } catch (error: Error) {
            console.error(`showActionMenu args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;

        })

      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            let uiContext: UIContext = this.getUIContext()
            let PromptAction: PromptAction = uiContext.getPromptAction()
            PromptAction.showActionMenu({
              title: 'showActionMenu Title Info',
              buttons: [
                {
                  text: 'item1',
                  color: '#666666',
                },
                {
                  text: 'item2',
                  color: '#000000',
                },
              ] as [promptAction.Button, promptAction.Button | undefined]
            })
              .then((data: promptAction.ActionMenuSuccessResponse) => {
                console.info('showActionMenu success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showActionMenu error: ' + err);
              })
          } catch (error: Error) {
            console.error(`showActionMenu args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        })
    }
  }
}