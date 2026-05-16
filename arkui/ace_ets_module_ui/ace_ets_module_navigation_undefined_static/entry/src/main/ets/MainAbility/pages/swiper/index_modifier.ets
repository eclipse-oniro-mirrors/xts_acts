'use static'
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Scroll, Margin, Color, $r, IDataSource,
  DataChangeListener, Swiper, SwiperController, DotIndicator, ScrollState, SwiperAnimationEvent, LazyForEach,
  TextAlign, SwiperAttribute, ArrowStyle, Curve, TabsController, AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyIndexModifier implements AttributeModifier<SwiperAttribute> {
  public isIndexModifier : Boolean = false

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.index(this.isIndexModifier ?  undefined : 2 as Int)
  }
}

@Entry
@Component
struct SwiperExample {
  @State indexModifier:MyIndexModifier = new MyIndexModifier()
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Button('动态切换 indexModifier: ' + JSON.stringify(this.indexModifier.isIndexModifier))
          .margin(10)
          .id('changeButton')
          .onClick(() => {
            this.indexModifier.isIndexModifier = !this.indexModifier.isIndexModifier
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
        .attributeModifier(this.indexModifier)
        .id('swiper_index_modifier')
        .height(200)
        .itemSpace(5)
        .prevMargin(35)
        .nextMargin(35)
        .curve(Curve.Linear)
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