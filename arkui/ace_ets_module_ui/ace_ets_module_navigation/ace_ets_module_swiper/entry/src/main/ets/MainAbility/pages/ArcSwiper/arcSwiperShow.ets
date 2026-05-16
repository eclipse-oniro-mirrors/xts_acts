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
struct arcSwiperTestShow {
  @State itemSimpleColor: Color | number | string = ''
  @State selectedItemSimpleColor: Color | number | string = ''
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  @State arr: string[] = []
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State isIndicatorSelected?: boolean | null = true
  @State maskColor?: LinearGradient | null = new LinearGradient([{ color: 0XFF67F9D4, offset: 0.5 },
    { color: 0XFFFFFF00, offset: 1.0 }])
  @State itemColor?: ResourceColor | null = $r('app.color.color_red')
  @State index?: number | null = 1
  @State arcDirection?: ArcDirection | null = ArcDirection.SIX_CLOCK_DIRECTION
  @State backplaneColor?: ResourceColor | null = '#7F7F7F7F'
  @State selectedItemColor?: ResourceColor | null = ''
  @State onAnimationStartIndex2: number = -1
  @State onAnimationEndIndex2: number = -1
  @State onChangeIndex2: number = -1
  @State finishText2: number = 0

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column() {
      Text('onChange: ' + this.onChangeIndex2).id('arcSwiper_show_onChange')
        .margin({top:10})
      Text('finishText: ' + this.finishText2).id('arcSwiper_show_finishAnimation')
      Text('onAnimationStart: ' + this.onAnimationStartIndex2).id('arcSwiper_show_onAnimationStart')
      Text('onAnimationEnd: ' + this.onAnimationEndIndex2).id('arcSwiper_show_onAnimationEnd')
      Row(){
        Button('showPrevious').id('arcSwiper_showPrevious')
          .height('8%')
          .onClick(() => {
            this.arcSwiperController.showPrevious()
          })
        Button('showNext').id('arcSwiper_showNext')
          .height('8%')
          .onClick(() => {
            this.arcSwiperController.showNext()
          })
      }

      ArcSwiper(this.arcSwiperController) {
        ForEach(this.arr, (item: string, index: number) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .backgroundColor(this.backgroundColors[index%6])
            .textAlign(TextAlign.Center)
            .fontSize(30)
        })
      }
      .width(233)
      .height(233)
      .index(this.index)
      .duration(400)
      .vertical(false)
      .effectMode(EdgeEffect.Fade)
      .indicator(this.isIndicatorSelected == true ?
        (this.arcDotIndicator
          .arcDirection(this.arcDirection)
          .itemColor(this.itemColor)
          .backgroundColor(this.backplaneColor)
          .maskColor(this.maskColor)
          .selectedItemColor(this.selectedItemColor)) : this.isIndicatorSelected
      )
      .disableSwipe(false)
      .disableTransitionAnimation(false)
      .digitalCrownSensitivity(CrownSensitivity.LOW)
      .onChange((index: number) => {
        this.onChangeIndex2 = index
        console.info('onChange:' + index.toString())
      })
      .onAnimationStart((index: number, targetIndex: number, event: SwiperAnimationEvent) => {
        this.onAnimationStartIndex2 = index

        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .onAnimationEnd((index: number, event: SwiperAnimationEvent) => {
        this.onAnimationEndIndex2 = index
        this.arcSwiperController.finishAnimation(()=>{
          console.log('onAnimationEnd finishAnimation')
          this.finishText2 ++
        })
        console.info('index: ' + index)
        console.info('current offset: ' + event.currentOffset)
      })

    }
    .width('90%')
    .height('100%')
  }
}