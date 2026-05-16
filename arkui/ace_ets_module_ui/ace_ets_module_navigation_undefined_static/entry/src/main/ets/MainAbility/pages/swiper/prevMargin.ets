'use static'
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Scroll, Margin, Color, $r, IDataSource,
  DataChangeListener, Swiper, SwiperController, DotIndicator, ScrollState, SwiperAnimationEvent, LazyForEach,
  TextAlign, SwiperAttribute, ArrowStyle, Curve, TabsController, AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SwiperExample {
  @State isUndefinedPrevMargin: Boolean = false

  private swiperController: SwiperController = new SwiperController();
  private swiperNormalController: SwiperController = new SwiperController();
  private swiperUndefinedController: SwiperController = new SwiperController();
  private swiperNULLController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Button('动态切换 prevMargin: ' + JSON.stringify(this.isUndefinedPrevMargin))
          .id('changeButton')
          .margin(10)
          .onClick(() => {
            this.isUndefinedPrevMargin = !this.isUndefinedPrevMargin
          })
        Swiper(this.swiperController) {
          Text('a')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('b')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('c')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('d')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('e')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }
        .height(200)
        .itemSpace(5)
        .prevMargin(this.isUndefinedPrevMargin ?  undefined : '35.00vp')
        .nextMargin(35)
        .curve(Curve.Linear)
        .id('swiper_prevMargin')
        Row(undefined) {
          Button('showPrevious')
            .margin(10)
            .onClick(() => {
              this.swiperController.showPrevious();
            })
          Button('showNext')
            .margin(10)
            .onClick(() => {
              this.swiperController.showNext();
            })
        }
      }.width('100%')
      .margin({ top: 5 } as Margin)
    }
  }
}