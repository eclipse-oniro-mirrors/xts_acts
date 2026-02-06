/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { componentSnapshot } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'

@Entry
@Component
struct OffscreenSnapshotExample {
  @State pixmap: image.PixelMap | undefined = undefined
  @State time: (number | null | undefined)[] = [0, -1]
  @State timeIndex: number = 0

  @Builder
  RandomBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Test menu item 1')
        .width('50%')
        .height('50%')
        .textAlign(TextAlign.Center)
      Divider().height('1%')
      Text('Test menu item 2')
        .width('50%')
        .height('50%')
        .textAlign(TextAlign.Center)
    }
    .width('50%')
    .height('50%')
    .id("builder")
  }

  build() {
    Column() {
      Button("click to generate offscreen UI snapshot")
        .onClick(() => {
          this.getUIContext().getComponentSnapshot().createFromBuilder(() => {
            this.RandomBuilder()
          }, this.time[this.timeIndex], true, { scale: 2, waitUntilRenderFinished: true })
            .then((pixmap: image.PixelMap) => {
              AppStorage.setOrCreate('width', 1)
              this.pixmap = pixmap
              let info = this.getUIContext().getComponentUtils().getRectangleById("builder")
              console.info(info.size.width + ' ' + info.size.height + ' ' + info.localOffset.x + ' ' +
              info.localOffset.y + ' ' + info.windowOffset.x + ' ' + info.windowOffset.y)
            }).catch((err: Error) => {
            AppStorage.setOrCreate('width', 1)
            console.error("error: " + err)
          })
        }).height('5%')
        .width('80%')
        .id('createFromBuilder')
      Image(this.pixmap)
        .margin(10)
        .height('50%')
        .width('50%')
        .border({ color: Color.Black, width: 2 })
      Button('time: ' + this.time[this.timeIndex])
        .id('time1')
        .width('60%')
        .height('5%')
        .margin('2%')
        .onClick(() => {
          this.timeIndex++
          if (this.timeIndex > 1) {
            this.timeIndex = 0
          }
        })
    }.width('100%').margin({ left: 10, top: 5, bottom: 5 }).height('90%')
  }
}


