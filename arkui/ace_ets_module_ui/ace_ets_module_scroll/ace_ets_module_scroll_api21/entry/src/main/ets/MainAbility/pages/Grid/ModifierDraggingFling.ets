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
import { GridItemModifier ,GridModifier} from '@ohos.arkui.modifier';
class CustomModifier extends GridModifier {
  applyNormalAttribute(instance: GridAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct GridModifierDraggingFling {
  @State numbers: string[] = []
  @State isSelectable: boolean = true;
  @State isSelected: boolean = false;
  @State startDragging: string = 'start'
  @State stopDragging: string = 'start'
  @State startFling: string = 'start'
  @State stopFling: string = 'start'
  @State modifier:GridModifier = new CustomModifier()
    .edgeEffect(EdgeEffect.Spring)
    .onWillStopDragging((velocity: number)=>{
      console.log('hslog callback onWillStopDragging velocity = ' + velocity)
    })
    .onWillStartDragging( ()=>{
      this.startDragging = 'onWillStartDragging'
      console.log('hslog callback1 onWillStartDragging')
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

  aboutToAppear() {
    for (let i = 1; i <= 50; i++) {
      this.numbers.push(i.toString())
    }
  }

  build() {
    Column({ space: 5 }){
      Text(this.startDragging).key('grid_modifier_startDragging')
      Text(this.stopDragging).key('grid_modifier_stopDragging')
      Row(){
        Text(this.startFling).key('grid_modifier_startFling').margin({right:5})
        Text(this.stopFling).key('grid_modifier_stopFling')
      }
      Button('reset')
        .id('grid_modifier_dragging_reset')
        .onClick(() => {
          this.startDragging = 'start'
          this.stopDragging = 'start'
          this.startFling = 'start'
          this.stopFling = 'start'
        })
      Grid() {
        ForEach(this.numbers, (day: string) => {
          GridItem({style:GridItemStyle.PLAIN}) {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height('40%')
              .textAlign(TextAlign.Center)
              .focusable(true)
          }
          .selectable(this.isSelectable)
          .selected(this.isSelected)
          .backgroundColor(0xF9CF93)
        }, (day: string) => day)
      }
      .id('grid_dragging_modifier')
      .attributeModifier(this.modifier as CustomModifier)
      .columnsTemplate('1fr 1fr 1fr')
      .backgroundColor(0xFAEEE0)
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .borderRadius(10)
      .border({ width:1})

    }.width('100%')
    .margin({ top: 5 })
  }
}