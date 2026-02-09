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
import promptAction from '@ohos.promptAction'
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction } from '@ohos.arkui.UIContext';
import {
  Entry, Component,
  Column, ColumnOptions, Color,
  Text, Button, ClickEvent, Margin, Row, BlurStyle,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct showDialogTest {
  promptAction: PromptAction = this.getUIContext().getPromptAction();
  build() {
    Column() {
      Row() {
        Button('Dialog7')
          .height('8%')
          .id('click7')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.NONE,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog8')
          .height('8%')
          .id('click8')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })

        Button('Dialog9')
          .height('8%')
          .id('click9')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog10')
          .height('8%')
          .id('click10')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })

        Button('Dialog11')
          .height('8%')
          .id('click11')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })
      }
      Row() {
        Button('Dialog12')
          .height('8%')
          .id('click12')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })

        Button('Dialog13')
          .height('8%')
          .id('click13')
          .onClick((e:ClickEvent) => {
            try {
              this.promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: undefined,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data!.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}