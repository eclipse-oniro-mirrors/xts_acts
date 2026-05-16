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

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct RadioGroup {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear RadioGroup start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear RadioGroup end`);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("radio-Group")
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
        .key("groupText")

      Radio({ value: 'Radio1', group: 'radioGroup' })
        .checked(true)
        .key("RadioOne")
        .height(50)
        .width(50)
        .onChange((value: boolean) => {
          console.log('Radio1 status is ' + value)
        })
      Radio({ value: 'Radio2', group: 'radioGroup' })
        .checked(false)
        .key("RadioTwo")
        .height(50)
        .width(50)
        .onChange((value: boolean) => {
          console.log('Radio2 status is ' + value)
        })
    }
    .width("100%")
    .height("100%")
  }
}

