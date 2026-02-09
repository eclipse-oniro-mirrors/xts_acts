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
struct GridDraggingFling {
  @State arr: string[] = []
  scroller: Scroller = new Scroller()
  @State startDragging: string = 'start'
  @State stopDragging: string = 'start'
  @State startFling: string = 'start'
  @State stopFling: string = 'start'

  aboutToAppear(): void {
    for (let i = 1; i <= 50; i++) {
      this.arr.push(i.toString());
    }
  }
  build() {
    Column({ space: 5 }) {
      Text(this.startDragging).key('grid_startDragging')
        .margin({top: 5})
      Text(this.stopDragging).key('grid_stopDragging')
      Row(){
        Text(this.startFling).key('grid_startFling').margin({right:5})
        Text(this.stopFling).key('grid_stopFling')
      }
      Button('reset')
        .id('grid_dragging_reset')
        .onClick(() => {
          this.startDragging = 'start'
          this.stopDragging = 'start'
          this.startFling = 'start'
          this.stopFling = 'start'
        })
      Grid(this.scroller) {
        ForEach(this.arr, (item: string,index:number) => {
          GridItem({style:GridItemStyle.PLAIN}) {
            Text('' + item)
              .width('100%')
              .height('40%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('grid_dragging_fling')
      .columnsTemplate('1fr 1fr 1fr')
      .friction(0.6)
      .width('90%')
      .height('40%')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
      .borderRadius(10)
      .border({ width:1})
      .onWillStartDragging(()=>{
        this.startDragging = 'onWillStartDragging'
        console.log('hslog callback onWillStartDragging')
      })
      .onWillStopDragging((velocity: number)=>{
        console.log('hslog callback1 onWillStopDragging velocity = ' + velocity)
      })
      .onDidStopDragging((willFling : boolean)=>{
        this.stopDragging = 'onDidStopDragging willFling: ' + willFling
        console.log('hslog callback2 onDidStopDragging willFling = ' + willFling)
      })
      .onWillStartFling(()=>{
        this.startFling = 'onWillStartFling'
        console.log('hslog callback3 onWillStartFling')
      })
      .onDidStopFling(()=>{
        this.stopFling = 'onDidStopFling'
        console.log('hslog callback4 onDidStopFling')
      })

    }.width('100%')
    .margin({ top: 5 })
  }
}