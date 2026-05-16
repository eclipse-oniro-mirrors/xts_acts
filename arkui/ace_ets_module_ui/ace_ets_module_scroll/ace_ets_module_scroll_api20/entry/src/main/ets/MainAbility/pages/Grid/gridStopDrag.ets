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
struct GridStopDragExample {
  @State numbers: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  scroller: Scroller = new Scroller()
  @State onText: string = 'Grid: '
  @State flag: boolean = false
  @State testVel: number = 0

  build() {
    Column({ space: 5 }) {
      Button('Grid竖向')
        .id('grid_stopDrag_change')
        .onClick(()=>{
          this.flag = true
        })
      Text('' + this.testVel)
        .id('grid_stopDrag_velocity')
      if (this.flag) {
        Grid(this.scroller) {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('90%')
                .height('28%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }
        .id('grid_stopDrag_ver')
        .width('90%')
        .height('50%')
        .columnsTemplate('1fr 1fr')
        .columnsGap('2%')
        .rowsGap('2%')
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        .backgroundColor(0xFAEEE0)
        .onWillStopDragging((velocity: number) => {
          this.testVel = velocity
          console.log('on will stop dragging velocity :' + velocity)
          this.scroller.scrollTo({ xOffset: 0, yOffset: 100, animation: true })
        })
      } else {
        Grid(this.scroller) {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('28%')
                .height('90%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }
        .id('grid_stopDrag_hor')
        .width('90%')
        .height('50%')
        .rowsTemplate('1fr 1fr')
        .columnsGap('2%')
        .rowsGap('2%')
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        .backgroundColor(0xFAEEE0)
        .onWillStopDragging((velocity: number) => {
          this.testVel = velocity
          console.log('on will stop dragging velocity :' + velocity)
          this.scroller.scrollTo({ xOffset: 100, yOffset: 0, animation: true })
        })
      }
    }.width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}