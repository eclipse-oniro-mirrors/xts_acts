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

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PathNew {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PathNew start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PathNew end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("path-New")
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
        .key("neText")

      Path().width("100px").height("100px").commands('M150 0 L300 300 L0 300 Z')
        .key("Path")

      Image($rawfile('test.png'))
        .mask(new Path({ width: '150px', height: '150px' }).fill(Color.Gray))
        .width('500px').height('280px')

    }.width("100%").height("100%")
  }
}

