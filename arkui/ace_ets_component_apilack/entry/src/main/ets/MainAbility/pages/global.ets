/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct GlobalLack {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GlobalLack start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GlobalLack end`)
  }

  build() {
    Column() {
      Button("Click2").fontSize(50)
        .onClick(() => {
          console.info("Click2" + JSON.stringify(sendEventByKey("Del", 10, "")));
        }).key("Click2")
      List({ space: 10 }) {
        ListItem() {
          Text("Hello world") {
          }
          .width('100%')
          .height(100)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }
        .key("ListItem")
        .sticky(Sticky.None)
        .selectable(false)
        .editable(true)
      }
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}