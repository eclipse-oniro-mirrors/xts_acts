'use static'
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Scroll, Margin, Color, $r, IDataSource,
  DataChangeListener, Swiper, SwiperController, DotIndicator, ScrollState, SwiperAnimationEvent, LazyForEach,
  TextAlign, SwiperAttribute, ArrowStyle, Curve, TabsController, AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
@Observed
export class MyVerticalModifier implements AttributeModifier<SwiperAttribute> {
  public isVerticalModifier : Boolean = false

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.vertical(this.isVerticalModifier ?  undefined : true)
  }
}

@Entry
@Component
struct SwiperExample {
  @State verticalModifier:MyVerticalModifier = new MyVerticalModifier()
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Button('动态切换 verticalModifier: ' + JSON.stringify(this.verticalModifier.isVerticalModifier))
          .id('changeButton')
          .margin(10)
          .onClick(() => {
            this.verticalModifier.isVerticalModifier = !this.verticalModifier.isVerticalModifier
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
        .attributeModifier(this.verticalModifier)
        .id('swiper_vertical_modifier')
        .height(200)
        .itemSpace(5)
        .prevMargin(35)
        .nextMargin(35)
        .curve(Curve.Linear)

      }.width('100%')
      .margin({ top: 5 } as Margin)
    }
  }
}