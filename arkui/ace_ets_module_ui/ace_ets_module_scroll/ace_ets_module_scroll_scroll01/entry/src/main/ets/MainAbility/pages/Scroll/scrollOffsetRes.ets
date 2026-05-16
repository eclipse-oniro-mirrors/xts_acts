/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 import { LengthMetrics } from '@ohos.arkui.node';
@Entry
@Component
struct ScrollContentOffsetRes {
  scroller: Scroller = new Scroller()
  @State arr: number[] = []

  aboutToAppear() {
    for (let i = 0;i <= 9; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('20%')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Orange)
          }, (item: string) => item)
        }
      }
      .id('scroll_contentOffset_res')
      .contentStartOffset($r('app.float.offset'))
      .contentEndOffset($r('app.float.offset'))
      .scrollBar(BarState.On)
      .scrollBarMargin({ start: LengthMetrics.vp(20), end: LengthMetrics.vp(20) })
      .width('80%')
      .height('50%')
      .backgroundColor(Color.Green)
    }
    .width('100%')
    .height('100%')
    .padding({ top: 5 })
  }
}