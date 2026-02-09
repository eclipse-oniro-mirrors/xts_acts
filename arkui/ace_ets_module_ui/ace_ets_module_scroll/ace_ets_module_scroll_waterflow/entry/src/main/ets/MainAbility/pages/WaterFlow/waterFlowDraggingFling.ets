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
struct WaterFlowDraggingFling {
  @State arr: number[] = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  scroller: Scroller = new Scroller()
  @State startDragging: string = 'start'
  @State stopDragging: string = 'start'
  @State startFling: string = 'start'
  @State stopFling: string = 'start'

  aboutToAppear(): void {
    for (let i = 1; i <= 50; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Column({ space: 5 }) {
      Text(this.startDragging).key('waterFlow_startDragging')
        .margin({top: 5})
      Text(this.stopDragging).key('waterFlow_stopDragging')
      Row(){
        Text(this.startFling).key('waterFlow_startFling').margin({right:5})
        Text(this.stopFling).key('waterFlow_stopFling')
      }
      Button('reset')
        .id('waterFlow_dragging_reset')
        .onClick(() => {
          this.startDragging = 'start'
          this.stopDragging = 'start'
          this.startFling = 'start'
          this.stopFling = 'start'
        })
      WaterFlow() {
        ForEach(this.arr, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .width('100%')
                .height('40%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
            }
          }.margin(10)
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item.toString())
      }
      .id('waterFlow_dragging_fling')
      .width('90%')
      .height('40%')
      .columnsTemplate('1fr 1fr 1fr')
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
