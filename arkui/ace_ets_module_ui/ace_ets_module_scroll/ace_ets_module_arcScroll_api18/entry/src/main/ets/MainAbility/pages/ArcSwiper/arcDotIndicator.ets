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

import {
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@kit.ArkUI'

class MyDataSource implements IDataSource {
  private list: Color[] = []

  constructor(list: Color[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): Color {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct arcDirectionSwiperTest {
  @State itemSimpleColor: Color | number | string = Color.Gray
  @State selectedItemSimpleColor: Color | number | string = Color.Green
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  private data: MyDataSource = new MyDataSource([])
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Orange, Color.Transparent]
  @State arcDirction?: ArcDirection | null = ArcDirection.SIX_CLOCK_DIRECTION //6点钟方向

  aboutToAppear(): void {
    let list: Color[] = []
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(this.backgroundColors)
  }

  build() {
    Column() {
      Row() {
        Button('ArcDirection3').id('arcs_arcDirection_3')
          .height('8%')
          .onClick(() => {
            this.arcDirction = ArcDirection.THREE_CLOCK_DIRECTION  //3点钟方向
            this.itemSimpleColor = 0xFF0000FF
            this.selectedItemSimpleColor = 0xFFFF00
          })
        Button('ArcDirection9').id('arcs_arcDirection_9')
          .height('8%')
          .onClick(() => {
            this.arcDirction = ArcDirection.NINE_CLOCK_DIRECTION  //9点钟方向
            this.itemSimpleColor = '#FFEC8B'
            this.selectedItemSimpleColor = '#FFFF0000'
          })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)

      ArcSwiper(this.wearableSwiperController) {
        LazyForEach(this.data, (backgroundColor: Color, index: number) => {
          Text(index.toString())
            .width(233)
            .height(233)
            .backgroundColor(backgroundColor)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        })
      }.id('arcs_arcDirection')
      .clip(new Circle({ width: 233, height: 233 }))
      .effectMode(EdgeEffect.None)
      .backgroundColor(Color.Transparent)
      .index(0)
      .duration(400)
      .vertical(false)
      .indicator(this.arcDotIndicator
        .arcDirection(this.arcDirction) //弧形方向
        .itemColor(this.itemSimpleColor)
        .selectedItemColor(this.selectedItemSimpleColor)
        .backgroundColor(Color.Gray)
        .maskColor(new LinearGradient([{ color: '#FF67F9D4', offset: 0 }, { color: '#FFFF9554', offset: 1 }]))
      )
      .disableSwipe(false)
      .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
      .disableTransitionAnimation(false)
      .onChange((index: number) => {
        console.info('onChange:' + index.toString())
      })
      .onAnimationStart((index: number, targetIndex: number, event: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .onAnimationEnd((index: number, event: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })

    }.height('100%')
  }
}