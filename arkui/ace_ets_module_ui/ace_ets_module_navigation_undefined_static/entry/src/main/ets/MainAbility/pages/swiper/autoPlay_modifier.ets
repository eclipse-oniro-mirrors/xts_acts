'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,
  Scroll,Column, Row,Component, Button, TextAlign,
  ClickEvent, TextStyle, List, ListItem, SwiperController,
  Divider, TextInput, Swiper, AutoPlayOptions,
  AttributeModifier,SwiperAttribute,
} from '@ohos.arkui.component'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class ModifierAutoPlay4 implements AttributeModifier<SwiperAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.autoPlay(this.isUndefined ? undefined : true)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:number = 0;
  @State modifier4 : ModifierAutoPlay4 = new ModifierAutoPlay4()
  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .id('changeButton')
        .onClick(() => {
          this.modifier4.isUndefined == true ? this.modifier4.isUndefined = false : this.modifier4.isUndefined = true
          this.modifier4.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })

      Text('autoPlay_-动态切换').fontSize(20).margin(15).width('90%')
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
      }).attributeModifier(this.modifier4)
        .id('swiper_autoPlay_modifier')
      Divider()
    }.width('100%')
  }
}