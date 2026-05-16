'use static'
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Scroll, Margin, Color, $r, IDataSource,
  DataChangeListener, Swiper, SwiperController, DotIndicator, ScrollState, SwiperAnimationEvent, LazyForEach,
  TextAlign, SwiperAttribute, ArrowStyle, Curve, TabsController, AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SwiperExample {
  @State isUndefinedVertical: Boolean = false

  private swiperController: SwiperController = new SwiperController();
  private swiperNormalController: SwiperController = new SwiperController();
  private swiperUndefinedController: SwiperController = new SwiperController();
  private swiperNULLController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Button('动态切换 vertical: ' + JSON.stringify(this.isUndefinedVertical))
          .id('changeButton')
          .margin(10)
          .onClick(() => {
            this.isUndefinedVertical = !this.isUndefinedVertical
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
        .prevMargin(35.0)
        .nextMargin(35)
        .curve(Curve.Linear)
        .vertical(this.isUndefinedVertical ?  undefined : true)
        .id('swiper_vertical')
      }.width('100%')
      .margin({ top: 5 } as Margin)
    }
  }
}