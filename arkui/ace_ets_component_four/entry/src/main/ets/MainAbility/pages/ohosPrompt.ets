/**
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
import prompt from '@ohos.prompt';

@Entry
@Component
struct OhosPrompt {
  @State onClickValue: boolean = false;

  build() {
    Column() {
      Button("get Point").padding(40)
        .onClick(() => {
          prompt.showToast({ message: "sucessful", duration: 200 })
          this.onClickValue = true;
          try {
            let backData: events_emitter.EventData = {
              data: {
                "matrix1": "[100, 10]",
                "ACTION": this.onClickValue
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 142,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("click action state err: " + JSON.stringify(err.message))
          }
          prompt.showActionMenu({
            title: 'Title Info',
            buttons: [
              {
                text: 'item1',
                color: '#666666',
              }
            ]
          })
          prompt.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'showDialog',
                color: '#666666',
              },
            ]
          });
        }).backgroundColor(0x2788D9).key('rotate5')
    }
    .width('100%')
    .height('100%')
  }
}