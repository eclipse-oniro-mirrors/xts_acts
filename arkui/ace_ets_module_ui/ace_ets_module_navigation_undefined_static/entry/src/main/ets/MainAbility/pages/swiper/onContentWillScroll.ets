'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Margin,
  Color,
  $r,
  Swiper,
  SwiperController,
  DotIndicator,
  ScrollState,
  SwiperAnimationEvent,
  TextAlign,
  Curve,
  SwiperContentWillScrollResult,
  SwiperAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SwiperExample {
  @State isUndefined: Boolean = false
  private swiperControllerSwitched: SwiperController = new SwiperController();
  @State testIndex :string = 'swiperIndex'

  build() {
    Scroll() {
      Column(undefined) {
        Text(this.testIndex).id('testText')
        // Switched
        Swiper(this.swiperControllerSwitched) {
          Text('00000')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('111111')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('222222')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }
        .curve(Curve.Linear)
        .onContentWillScroll(this.isUndefined ? undefined :
          (result: SwiperContentWillScrollResult) => {
            // 触发该事件的场景仅限于手势操作
            this.testIndex = 'swiperIndex2'
            return true
          })
        .id('testSwiper')

        Row(undefined) {
          Button('isUndefined')
            .onClick(() => {
              this.isUndefined = !this.isUndefined;
              this.swiperControllerSwitched.changeIndex(0, true);
              this.testIndex = 'isUndefined'
            }).id('undefinedBtn')
        }.margin(10)
      }.width('100%')
      .margin({ top: 5 } as Margin)
    }
  }
}