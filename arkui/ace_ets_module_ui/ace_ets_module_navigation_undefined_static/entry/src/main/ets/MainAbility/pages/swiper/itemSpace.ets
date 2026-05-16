'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,
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
  @State index:number = 0;
  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        }).id('changeButton')
      Column() {
        Text('itemSpace').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).itemSpace( this.isUndefined ? undefined : 30 as Double)
          .displayCount(3 as int)
          .id('swiper_itemSpace')
      }
    }.width('100%')
  }
}