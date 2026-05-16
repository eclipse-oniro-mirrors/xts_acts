'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,EdgeEffect,SwiperNestedScrollMode,
  Scroll,Column, Row,Component, Button, TextAlign,Margin,Curve,$$,
  ClickEvent, TextStyle, List, ListItem, SwiperController,ArrowStyle,
  Divider, TextInput, Swiper, PageFlipMode, IndicatorComponentController
} from '@ohos.arkui.component'

@Entry
@Component
struct MyStateSample {
  private controller: SwiperController = new SwiperController()
  private indicatorController: IndicatorComponentController = new IndicatorComponentController();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:int = 0;
  @State swiperIndex:int = 0

  build() {
    Column() {
      Button('isUndefined = ' + this.buttonText)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true
          this.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        }).id('changeButton')
      Scroll() {
        Swiper(this.controller) {
          Text('000000000000000000000000000000000000000000000000000000000000000000000000000000000')
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
        .displayArrow({ // 设置导航点箭头样式
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        } as ArrowStyle, false)
        .nestedScroll( this.isUndefined ? undefined : SwiperNestedScrollMode.SELF_FIRST)
        .indicatorInteractive(true)
        .index($$(this.swiperIndex))
        .id('swiper_nestedScroll')
      }.width('100%').height(100)
    }
  }

}
