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
@Entry
@Component
struct ScrollDraggingFling {
  @State arr: string[] = []
  scroller: Scroller = new Scroller()
  @State startDragging: string = 'start'
  @State stopDragging: string = 'start'
  @State startFling: string = 'start'
  @State stopFling: string = 'start'

  aboutToAppear(): void {
    for (let i = 1; i <= 30; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column({ space: 5 }) {
      Text(this.startDragging).key('scroll_startDragging')
        .margin({top: 5})
      Text(this.stopDragging).key('scroll_stopDragging')
      Row(){
        Text(this.startFling).key('scroll_startFling').margin({right:5})
        Text(this.stopFling).key('scroll_stopFling')
      }
      Button('reset')
        .id('scroll_dragging_reset')
        .onClick(() => {
          this.startDragging = 'start'
          this.stopDragging = 'start'
          this.startFling = 'start'
          this.stopFling = 'start'
        })

      Scroll() {
        Column() {
          ForEach(this.arr, (item: string) => {
            Text('' + item)
              .width('100%')
              .height('40%')
              .fontSize(16)
              .margin(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
      }
      .id('scroll_dragging_fling')
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
      .borderRadius(10)
      .border({ width:1})
      .onWillStartDragging(()=>{
        this.startDragging = 'onWillStartDragging'
        console.log('Scroll callback onWillStartDragging')
      })
      .onWillStopDragging((velocity: number)=>{
        console.log('Scroll callback1 onWillStopDragging velocity = ' + velocity)
      })
      .onDidStopDragging((willFling : boolean)=>{
        this.stopDragging = 'onDidStopDragging willFling: ' + willFling
        console.log('Scroll callback2 onDidStopDragging willFling = ' + willFling)
      })
      .onWillStartFling(()=>{
        this.startFling = 'onWillStartFling'
        console.log('Scroll callback3 onWillStartFling')
      })
      .onDidStopFling(()=>{
        this.stopFling = 'onDidStopFling'
        console.log('Scroll callback4 onDidStopFling')
      })

    }.width('100%')
    .margin({ top: 5 })
  }
}