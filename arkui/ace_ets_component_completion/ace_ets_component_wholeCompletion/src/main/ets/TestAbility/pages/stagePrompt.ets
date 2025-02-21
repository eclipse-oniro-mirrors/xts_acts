/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
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
          .onClick(() => {
            try {
              globalThis.uiContent.getPromptAction().showToast({
                message: 'Message Info',
                duration: 2000,
              });
              var backData = {
                data: {
                  "STATUS": true
                }
              }
              let backEvent = {
                eventId: 60220,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showDialog start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (error) {
              console.error("showToast emit action state err:" + JSON.stringify(error.message));
            };
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
          .onClick(() => {
            try {
              globalThis.uiContent.getPromptAction().showDialog({
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
                ],
              })
                .then(data => {
                  console.info('showDialog success, click button: ' + data.index);
                })
                .catch(err => {
                  console.info('showDialog error: ' + err);
                })
              var backData1 = {
                data: {
                  "STATUS": true
                }
              }
              let backEvent1 = {
                eventId: 60221,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent1, backData1)
            } catch (error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            };
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
          .onClick(() => {
            try {
              globalThis.uiContent.getPromptAction().showActionMenu({
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
                ]
              })
                .then(data => {
                  console.info('showActionMenu success, click button: ' + data.index);
                })
                .catch(err => {
                  console.info('showActionMenu error: ' + err);
                })
              var backData2 = {
                data: {
                  "STATUS": true
                }
              }
              let backEvent2 = {
                eventId: 60222,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent2, backData2)
            } catch (error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            };
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
          .onClick(() => {
            try {
              globalThis.uiContent.getPromptAction().showDialog({
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
                ]
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
              var backData3 = {
                data: {
                  "STATUS": true
                }
              }
              let backEvent3 = {
                eventId: 60223,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent3, backData3)
            } catch (error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            };
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
          .onClick(() => {
            try {
              globalThis.uiContent.getPromptAction().showActionMenu({
                title: 'Title Info',
                buttons: [
                  {
                    text: 'item1',
                    color: '#666666',
                  },
                  {
                    text: 'item2',
                    color: '#000000',
                  },
                ]
              }, (err, data) => {
                if (err) {
                  console.info('showActionMenu err: ' + err);
                  return;
                }
                console.info('showActionMenu success callback, click button: ' + data.index);
              })
              var backData4 = {
                data: {
                  "STATUS": true
                }
              }
              let backEvent4 = {
                eventId: 60224,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent4, backData4)
            } catch (error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            };
          })
      }
      .height('100%')
    }
  }
}