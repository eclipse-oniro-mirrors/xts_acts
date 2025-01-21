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
import { WaterFlowDataSource } from './WaterFlowDataSource'

@Entry
@Component
struct WaterflowDemo {
  @State minSize: number = 50
  @State maxSize: number = 100
  @State fontSize: number = 24
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller();
  datasource: WaterFlowDataSource = new WaterFlowDataSource();

  // 计算flow item宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  @Builder itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  build() {
    Column({ space: 2 }) {
      WaterFlow({ footer: this.itemFoot, scroller: this.scroller }) {
        LazyForEach(this.datasource, (item: number) => {
          FlowItem() {
            Column() {
              Text("N" + item).fontSize(12).height('16')
              Image('res/waterFlowTest(' + item % 5 + ').jpg')
                .objectFit(ImageFit.Fill)
            }
          }
          .width(this.getSize())
          .height(this.getSize())
          .backgroundColor(this.colors[item % 5])

        }, item => item)
      }
      .columnsTemplate("1fr 1fr 1fr 1fr")
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .key('waterFlow')
      .columnsGap(10)
      .rowsGap(5)
      .onReachStart(() => {
        console.info("onReachStart")
      })
      .onReachEnd(() => {
        console.info("onReachEnd")
      })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('80%')
      .layoutDirection(FlexDirection.Column)
    }
  }
}
