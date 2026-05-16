'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import promptAction from '@ohos.promptAction';
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
  FlexDirection,
  FlexAlign,
  ItemAlign,
  TextAlign,
  TextOverflow,
  Alignment,
  Divider
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct stagePrompt {
  build() {
    Row() {
      Column() {
        Text("promptAction-showToast")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("showToastText")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.getPromptAction().showToast({
                message: 'Message Info',
                duration: 2000,
              });
              let backData: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent: emitter.InnerEvent = {
                eventId: 60220,
                priority: emitter.EventPriority.LOW
              }
              console.info("showDialog start to emit action state")
              emitter.emit(backEvent, backData)
            } catch (error) {
              console.error("showToast emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })

        Text("promptAction-showDialog")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("showDialogText")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.getPromptAction()
                .showDialog({
                  title: 'Title Info',
                  message: 'Message Info',
                  buttons: [
                    {
                      text: 'button1',
                      color: '#000000',
                    } as promptAction.Button,
                    {
                      text: 'button2',
                      color: '#000000',
                    } as promptAction.Button
                  ],
                } as promptAction.ShowDialogOptions,  (err, data) => {
                  if (err) {
                    console.info('showDialog err: ' + err);
                    return;
                  }
                  console.info('showDialog success , click button: ' + data?.index);
                })
              //   .then((data) => {
              //     console.info('showDialog success, click button: ' + data.index);
              //   })
              //   .catch((err: Error) => {
              //     console.info('showDialog error: ' + err);
              //   })
              let backData1: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent1: emitter.InnerEvent = {
                eventId: 60221,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent1, backData1)
            } catch (error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })

        Text("promptAction-showActionMenu")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("showActionMenuText")
          .onClick((e: ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')!.getPromptAction()
                .showActionMenu({
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
                  ]  as promptAction.PromptActionDoubleButtons
                } as promptAction.ActionMenuOptions,  (err, data) => {
                  if (err) {
                    console.info('showActionMenu err: ' + err);
                    return;
                  }
                  console.info('showActionMenu success , click button: ' + data?.index);
                })
                // .then((data) => {
                //   console.info('showActionMenu success, click button: ' + data.index);
                // })
                // .catch((err: Error) => {
                //   console.info('showActionMenu error: ' + err);
                // })
              let backData2: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent2: emitter.InnerEvent = {
                eventId: 60222,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent2, backData2)
            } catch (error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            }
            ;
          })
        Text("promptAction-showDialogTwo")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("showDialogTextTwo")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.getPromptAction().showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000',
                  } as promptAction.Button,
                  {
                    text: 'button2',
                    color: '#000000',
                  } as promptAction.Button
                ]
              } as promptAction.ShowDialogOptions, (err: BusinessError<void>|null, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data?.index);
              });
              let backData3: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent3: emitter.InnerEvent = {
                eventId: 60223,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent3, backData3)
            } catch (error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })
        Text("promptAction-showActionMenuTwo")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("showActionMenuTextTwo")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.getPromptAction().showActionMenu({
                title: 'Title Info',
                buttons: [
                  {
                    text: 'item1',
                    color: '#666666',
                  } as promptAction.Button,
                  {
                    text: 'item2',
                    color: '#000000',
                  } as promptAction.Button,
                ] as promptAction.PromptActionDoubleButtons
              } as promptAction.ActionMenuOptions, (err:  BusinessError<void>|null, data) => {
                if (err) {
                  console.info('showActionMenu err: ' + err);
                  return;
                }
                console.info('showActionMenu success callback, click button: ' + data?.index);
              })
              let backData4: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent4: emitter.InnerEvent = {
                eventId: 60224,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent4, backData4)
            } catch (error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            }
            ;
          })
      }
      .height('100%')
    }
  }
}