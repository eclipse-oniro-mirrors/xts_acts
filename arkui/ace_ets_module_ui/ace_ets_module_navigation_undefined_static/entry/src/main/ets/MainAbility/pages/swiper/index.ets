'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,
  Scroll,Column, Row,Component, Button, TextAlign,Margin,Curve,
  ClickEvent, TextStyle, List, ListItem, SwiperController,
  Divider, TextInput, Swiper, SwiperContentAnimatedTransition, SwiperContentTransitionProxy
} from '@ohos.arkui.component'
@Entry
@Component
struct SwiperExample {
  @State isUndefined_Index: Boolean = false
  private swiperNormalController: SwiperController = new SwiperController();
  private swiperUndefinedController: SwiperController = new SwiperController();
  private swiperNULLController: SwiperController = new SwiperController();
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Button('动态切换 index: ' + JSON.stringify(this.isUndefined_Index))
          .id('changeButton')
          .margin(10)
          .onClick(() => {
            this.isUndefined_Index = !this.isUndefined_Index
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
        .index(this.isUndefined_Index ?  undefined : 2 )
        .height(200)
        .itemSpace(5)
        .prevMargin(35.0)
        .nextMargin(35)
        .curve(Curve.Linear)
        .id('swiper_index')

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