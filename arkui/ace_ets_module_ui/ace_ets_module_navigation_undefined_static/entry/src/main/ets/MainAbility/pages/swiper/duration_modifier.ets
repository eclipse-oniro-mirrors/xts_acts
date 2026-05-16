'use static'
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Scroll, Margin, Color, $r, IDataSource,
  DataChangeListener, Swiper, SwiperController, DotIndicator, ScrollState, SwiperAnimationEvent, LazyForEach,
  TextAlign, SwiperAttribute, ArrowStyle, Curve, TabsController, AttributeModifier,Divider
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class ModifierAutoPlay4 implements AttributeModifier<SwiperAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance
      .duration( this.isUndefined ? undefined : 1000 as Int)
      .curve(Curve.Linear)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State buttonText: string = 'false'
  @State index:number = 0;
  @State modifier4 : ModifierAutoPlay4 = new ModifierAutoPlay4()
  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .id('changeButton')
        .onClick(() => {
          this.modifier4.isUndefined = !this.modifier4.isUndefined
          this.modifier4.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })
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
      }).attributeModifier(this.modifier4)
        .id('swiper_duration_modifier')
      Divider()
    }.width('100%')
  }
}