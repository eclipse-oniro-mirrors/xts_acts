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
  private swiperController: SwiperController = new SwiperController();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:number = 0;
  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .id('changeButton')
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })
      Column() {
        Text('duration-动态切换').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          Text('1')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('2')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('3')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }).duration( this.isUndefined ? undefined : 1000 as Int).curve(Curve.Linear)
          .id('swiper_duration')
        Divider()
      }
    }.width('100%')
  }
}