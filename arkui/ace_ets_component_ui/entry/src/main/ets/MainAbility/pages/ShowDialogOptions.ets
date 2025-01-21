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

import promptAction from '@ohos.promptAction'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct PromptActionOptions {

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('PromptActionDialog')
	    .key('ShowDialog')
        .onClick(() => {
          promptAction.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            alignment: DialogAlignment.TopStart,
            offset: { dx: 10, dy: 100 },
            maskRect: { x: 0, y: 100, width: '100%', height: '80%'  },
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
          })
            .then(data=>{
             console.info('showDialog success,click button:'+ data.index);
          }).catch((error: BusinessError) => {
             console.info('showDialog error:'+ error);
          })
        })
    }.width('100%')
  }
}