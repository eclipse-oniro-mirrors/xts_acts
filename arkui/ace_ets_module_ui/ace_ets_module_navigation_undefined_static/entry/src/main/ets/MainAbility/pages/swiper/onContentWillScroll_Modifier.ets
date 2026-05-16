'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Margin,
  Color,
  $r,
  Swiper,
  SwiperController,
  DotIndicator,
  ScrollState,
  SwiperAnimationEvent,
  TextAlign,
  Curve,
  SwiperContentWillScrollResult,
  SwiperAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class SwiperModifierSwitched implements AttributeModifier<SwiperAttribute> {
  public isUndefined: Boolean = false
  public testIndex :string = 'swiperIndex'

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance
      .curve(Curve.Linear)
      .onContentWillScroll(this.isUndefined ? undefined :
        (result: SwiperContentWillScrollResult) => {
          // 触发该事件的场景仅限于手势操作
          this.testIndex = 'swiperIndex2'
          return true
        })

  }
}

@Entry
@Component
struct SwiperExample {
  @State modifierSwitched: SwiperModifierSwitched = new SwiperModifierSwitched()
  private swiperControllerSwitched: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column(undefined) {
        Text(this.modifierSwitched.testIndex).id('testTextModifier')
        // Switched
        Swiper(this.swiperControllerSwitched) {
          Text('00000')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('111111')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('222222')
            .width('90%')
            .height(160)
            .backgroundColor('#ffAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }.attributeModifier(this.modifierSwitched)
        .id('testSwiper')

        Row(undefined) {
          Button('isUndefined')
            .onClick(() => {
              this.modifierSwitched.isUndefined = !this.modifierSwitched.isUndefined;
              this.swiperControllerSwitched.changeIndex(0, true);
              this.modifierSwitched.testIndex = 'isUndefined'
            })
            .id('undefinedBtnModifier')
        }.margin(10)
      }.width('100%')
      .margin({ top: 5 } as Margin)
    }
  }
}