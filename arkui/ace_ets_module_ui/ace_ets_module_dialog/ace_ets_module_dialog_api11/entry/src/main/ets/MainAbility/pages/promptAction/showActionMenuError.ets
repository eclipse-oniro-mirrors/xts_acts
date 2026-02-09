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
import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct promptExample {
  @State text: string = 'item1'
  @State color: string = '#000000'
  @State errCode: string = ''

  build() {
    Column() {
      Text(this.errCode).key('errorCode')
      Button('showActionMenuError').onClick(() => {
        try {
          promptAction.showActionMenu(undefined)
        } catch (error) {
          let code = (error as BusinessError).code;
          this.errCode = code.toString()
        }

      }).id('showActionMenuError')
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          try {
            promptAction.showActionMenu({
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
          } catch (error) {
            console.error(`showActionMenu args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
        })
    }
  }
}