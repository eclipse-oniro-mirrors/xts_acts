'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  $r,
  Radio,
  RadioStyle,
  RowOptions,
  Slider,
  SliderOptions,
  SliderStyle,
  Dimension,
  SlideRange,
  SliderConfiguration,
  WrappedBuilder,
  ContentModifier,
  wrapBuilder
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

type SliderBuilder = @Builder (config: SliderConfiguration) => void;
class MySliderStyle implements ContentModifier<SliderConfiguration> {
  showSlider: boolean = true;
  sliderChangeMode: number = 0;

  constructor(showSlider: boolean, sliderChangeMode: number) {
    this.showSlider = showSlider;
    this.sliderChangeMode = sliderChangeMode;
  }

  applyContent(): WrappedBuilder<SliderBuilder> {
    return wrapBuilder(buildSlider);
  }
}

@Builder
function buildSlider(config: SliderConfiguration) {
  Row() {
    Column() {
      Text('value'+ config.value).id('SliderContentModifier_text1')
    }
    .width('80%')
  }
  .width('100%')
}

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State showSlider: boolean = true;
  @State sliderChangeMode: number = 0;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Slider({ style: SliderStyle.InSet } as SliderOptions)
        .id('Slider_1')
        .showTips(this.isUndefined1 ? true : undefined)
        .slideRange(this.isUndefined2 ? {from:20, to:80} as SlideRange : undefined)
        .selectedBorderRadius(this.isUndefined3 ? '55vp' as Dimension: undefined)
        .contentModifier(this.isUndefined4? undefined : new MySliderStyle(this.showSlider, this.sliderChangeMode))
      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('Slider_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('Slider_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
        Button('btn3 : ' + this.isUndefined3)
          .id('Slider_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
        Button('btn4 : ' + this.isUndefined4)
          .id('Slider_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
      }
    }
    .width('100%').height('100%')
  }
}