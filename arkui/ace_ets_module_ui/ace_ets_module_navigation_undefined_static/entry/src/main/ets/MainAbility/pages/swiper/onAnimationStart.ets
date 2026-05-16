'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,OnSwiperAnimationStartCallback,
  Scroll,Column, Row,Component, Button, TextAlign,Margin,Curve,
  ClickEvent, TextStyle, List, ListItem, SwiperController,
  Divider, TextInput, Swiper, SwiperContentAnimatedTransition, ForEach
} from '@ohos.arkui.component'

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:int = 0;
  build() {
    Column() {
      Text(this.index.toString()).id('swiper_onAnimationStart')
      Button('isUndefined = ' + this.buttonText)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        }).id('changeButton')
      Column() {
        Text('onAnimationStart').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).onAnimationStart(this.isUndefined ? undefined : () => {
          console.info("xxx onAnimationStart 被执行")
          this.index += 1;
        } as OnSwiperAnimationStartCallback)
      }
    }.width('100%')
  }
}