/*
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

import prompt from '@ohos.prompt'
import { BusinessError } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PromptShowDialog {
  @State color: string = '#fffc0909'
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Button('showActionMenu')
        .key('button1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          prompt.showActionMenu({
            title: 'Title Info',
            buttons: [
              { text: 'item1', color: this.color },
              { text: 'item2', color: '#000000' }
            ]
          })
            .then(data => {
              console.info('showActionMenu success, click button: ' + data.index);
            })
            .catch((err:Error) => {
              console.info('showActionMenu error: ' + err);
            })
        })
        Text(this.color).id('color')

    }.width("100%").height("100%")
  }
}