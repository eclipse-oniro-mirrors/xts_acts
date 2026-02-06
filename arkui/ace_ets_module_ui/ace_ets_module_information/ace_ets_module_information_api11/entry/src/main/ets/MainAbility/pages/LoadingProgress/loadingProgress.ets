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
struct LoadingProgressCircular {
  @State circular: LoadingProgressStyle = LoadingProgressStyle.Circular;
  @State orbital: LoadingProgressStyle = LoadingProgressStyle.Orbital;

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear LoadingProgressCircular start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear LoadingProgressCircular end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("loadingProgress-Circular")
        .width(100)
        .height(70)
        .margin(5)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("CircularText")

      Text("loadingProgress-Orbital")
        .width(100)
        .height(70)
        .margin(5)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("OrbitalText")

      Text('Orbital LoadingProgress ')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('100%')
        .margin(5)
      LoadingProgress()
        .color(Color.Blue)
    }
    .width("100%")
    .height("100%")
  }
}


