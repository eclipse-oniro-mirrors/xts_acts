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
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct GridScrollEdgeCallback {
  @State numbers: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  scroller: Scroller = new Scroller()
  @State text1: string = ''
  build(){
    Column({ space: 5 }) {
      Text('Scroller组件绑定至平铺的Grid容器组件').fontColor(0x000000)
        .fontSize(16).width('90%')
      Grid(this.scroller) {
        ForEach(this.numbers, (val: string) => {
          ForEach(this.numbers, (val: string) => {
            GridItem() {
              Text(val)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(200)
                .textAlign(TextAlign.Center)
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Fade)
      .scrollBar(BarState.On)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('70%')
      Text(this.text1).id('GridTextByScrollEdge01')
      Button('点我滚动')
        .id('GridScrollEdgeCallback01')
        .onClick(() => { // 这里
          this.scroller.scrollEdge(Edge.Bottom, { velocity: 0 })
          this.text1 = 'ScrollEdgeSuccess'
        })
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
