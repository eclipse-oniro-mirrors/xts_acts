/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct showDialogFalseExample {
  build() {
    Column({ space: 5 }) {
      Button('showDialogFalse')
        .margin(100)
        .id("showDialogFalse")
        .onClick(() => {
          promptAction.showDialog({
            title: 'showDialog Title Info',
            message: 'Message Info',
            isModal: true,
            showInSubWindow: false,
            buttons: [
              {
                text: 'button1',
                color: '#000000'
              },
              {
                text: 'button2',
                color: '#000000'
              }
            ]
          }, (err, data) => {
            if (err) {
              console.info('showDialog err: ' + err);
              return;
            }
            console.info('showDialog success callback, click button: ' + data.index);
          });
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}