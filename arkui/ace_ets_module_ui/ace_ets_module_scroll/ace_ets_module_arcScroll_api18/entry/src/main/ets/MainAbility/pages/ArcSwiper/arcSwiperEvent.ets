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

@Entry
@Component
struct arcSwiperEventTest1 {
  @State itemSimpleColor: Color | number | string = ''
  @State selectedItemSimpleColor: Color | number | string = ''
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  @State arr: string[] = []
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State isIndicatorSelected?: boolean | null = true
  @State maskColor?: LinearGradient | null = new LinearGradient([
    { color: $r('app.color.color_yellow'), offset: 0.5 },
    { color: '#FF00FF00', offset: 1.0 }])
  @State itemColor?: ResourceColor | null = ''
  @State index?: number | null = 0
  @State arcDirection?: ArcDirection | null = ArcDirection.SIX_CLOCK_DIRECTION
  @State backplaneColor?: ResourceColor | null = '#7F7F7F7F'
  @State selectedItemColor?: ResourceColor | null = $r('app.color.color_red')
  @State disableSwipe1: boolean = true
  @State onChangeIndex1: number = -1
  @State onAnimationStartIndex1: number = -1
  @State onAnimationEndIndex1: number = -1
  @State finishText1: number = 0
  @State message1: string = '111'

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column() {
      Text(this.message1).id('arcSwiper_onGestureSwipe')
        .margin({top:10})
      Text('onChange: ' + this.onChangeIndex1).id('arcSwiper_onChange')
      Text('onAnimationStart: ' + this.onAnimationStartIndex1).id('arcSwiper_onAnimationStart')
      Text('onAnimationEnd: ' + this.onAnimationEndIndex1).id('arcSwiper_onAnimationEnd')
      Text('finishText: ' + this.finishText1).id('arcSwiper_finishAnimation')
      Button('disableSwipe').id('arcSwiper_disableSwipe')
        .onClick(() => {
          this.disableSwipe1 = false
        })
      ArcSwiper(this.arcSwiperController) {
        ForEach(this.arr, (item: string, index: number) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .backgroundColor(this.backgroundColors[index%6])
            .textAlign(TextAlign.Center)
            .fontSize(30)
        })
      }.id('arcSwiper_eventChange')
      .width(233)
      .height(233)
      .index(this.index)
      .duration(400)
      .vertical(false)
      .effectMode(EdgeEffect.Spring)
      .disableSwipe(this.disableSwipe1)
      .disableTransitionAnimation(false)
      .digitalCrownSensitivity(CrownSensitivity.HIGH)
      .indicator(this.isIndicatorSelected == true ?
        (this.arcDotIndicator
          .arcDirection(this.arcDirection)
          .itemColor(this.itemColor)
          .backgroundColor(this.backplaneColor)
          .maskColor(this.maskColor)
          .selectedItemColor(this.selectedItemColor)) : this.isIndicatorSelected
      )
      .onChange((index: number) => {
        this.onChangeIndex1 = index
        console.info('onChange:' + index.toString())
      })
      .onGestureSwipe((index: number, event: SwiperAnimationEvent) => {
        this.message1 = 'onGestureSwipe success'
        console.info('GestureSwipe index: ' + index)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .onAnimationStart((index: number, targetIndex: number, event: SwiperAnimationEvent) => {
        this.onAnimationStartIndex1 = index

        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .onAnimationEnd((index: number, event: SwiperAnimationEvent) => {
        this.onAnimationEndIndex1 = index
        this.arcSwiperController.finishAnimation(()=>{
          console.log('onAnimationEnd finishAnimation')
          this.finishText1 ++
        })
        console.info('index: ' + index)
        console.info('current offset: ' + event.currentOffset)
      })

    }
    .width('90%')
    .height('100%')
  }
}