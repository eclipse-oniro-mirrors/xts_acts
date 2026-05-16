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
struct showActionMenuTrueExample {
  build() {
    Column({ space: 5 }) {
      Button('showActionMenuTrue')
        .margin(100)
        .id("showActionMenuTrue")
        .onClick(() => {
          promptAction.showActionMenu({
            title: 'Title Info',
            showInSubWindow: true,
            buttons: [
              {
                text: 'item1',
                color: '#666666'
              },
              {
                text: 'item2',
                color: '#000000'
              },
            ]
          }, (err, data) => {
            if (err) {
              console.info('showActionMenu err: ' + err);
              return;
            }
            console.info('showActionMenu success callback, click button: ' + data.index);
          })
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}