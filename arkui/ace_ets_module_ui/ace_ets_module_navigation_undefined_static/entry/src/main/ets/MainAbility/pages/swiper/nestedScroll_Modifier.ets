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
  AttributeModifier,
  ArrowStyle,
  PageFlipMode,
  EdgeEffect,
  IndicatorComponentController,
  $$,
  ForEach,
  Divider,
  SwiperNestedScrollMode
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

// 1. 定义 AttributeModifier —— 作用在 Swiper 上
@Observed
export class SwiperNestedScrollModifierTest0 implements AttributeModifier<SwiperAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance
      .nestedScroll(this.isUndefined ? undefined : SwiperNestedScrollMode.SELF_FIRST);
  }
}

// 2. 页面结构 —— 与源码保持 100% 一致，仅把「动态 nestedScroll」那段交给 modifier 处理
@Entry
@Component
struct MyStateSample {
  private controller: SwiperController = new SwiperController()
  private indicatorController: IndicatorComponentController = new IndicatorComponentController();
  @State modifier0: SwiperNestedScrollModifierTest0 = new SwiperNestedScrollModifierTest0()
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index: int = 0;
  @State swiperIndex: int = 0

  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .onClick(() => {
          this.modifier0.isUndefined = !this.modifier0.isUndefined;
          this.buttonText = this.modifier0.isUndefined ? 'true' : 'false';
        }).id('changeButton')
      Scroll() {
        Swiper(this.controller) {
          Text('000000000000000000000000000000000000000000000000000000000000000000000000000000000')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('aaaaaaaaaaaaaaaaaaaa')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('bbbbbbbbbbbbbbbbbbbbbbb')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('cccccccccccccccccccccc')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('cccccccccccccccccccccc')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('cccccccccccccccccccccc')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text('cccccccccccccccccccccc')
            .width(200)
            .height(300)
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }
        .width(200)
        .height(300)
        .cachedCount(1, true)
        .pageFlipMode(PageFlipMode.SINGLE)
        .vertical(true)
        .itemSpace(10)
        .disableSwipe(false)
        .curve(Curve.Linear)
        .effectMode(EdgeEffect.Fade)
        .loop(false)
        .displayArrow({
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        } as ArrowStyle, false)
        .attributeModifier(this.modifier0)
        .indicatorInteractive(true)
        .index($$(this.swiperIndex))
        .id('swiper_nestedScroll')
      }.width('100%').height(100)
    }
  }
}
