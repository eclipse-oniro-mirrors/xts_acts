/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct ScrollFlingCallback {
  private scroller: Scroller = new Scroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
  @State scroller_fling_1: string = ''
  @State scroller_fling_2: string = ''
  build(){
    Column({ space: 5 }) {
      Text('Scroller组件绑定至Scroll容器组件').fontColor(0x000000)
        .fontSize(16).width('90%')
      Button('更换速度 1000')
        .id('btn_scroll_fling_01')
        .onClick(() => { // 这里
          this.scroller.fling(1000)
          console.info('ScrollFlingCallback_0100 start to emit action state')
          this.scroller_fling_1 = '1000'
        })
        .width('100%')
      Text('' + this.scroller_fling_1).fontColor(0x000000)
        .fontSize(16).width('90%').key('key_scroll_fling_text1')
      Text('' + this.scroller_fling_2).fontColor(0x000000)
        .fontSize(16).width('90%').key('key_scroll_fling_text2')
      Button('更换速度 -1000')
        .id('btn_scroll_fling_02')
        .onClick(() => { // 这里
          this.scroller.fling(-1000)
          console.info('ScrollFlingCallback_0200 start to emit action state')
          this.scroller_fling_2 = '-1000'
        })
        .width('100%')
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(75)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .friction(0.6)
      .height('70%')
      .edgeEffect(EdgeEffect.None)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}