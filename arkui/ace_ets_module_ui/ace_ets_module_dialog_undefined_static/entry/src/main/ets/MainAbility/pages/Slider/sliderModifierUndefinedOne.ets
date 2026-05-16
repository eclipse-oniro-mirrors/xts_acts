'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  Color,
  WrappedBuilder,
  ContentModifier,
  wrapBuilder,
  Builder,
  Slider,
  SliderAttribute,
  AttributeModifier,
  Dimension,
  SlideRange,
  SliderConfiguration,
  SliderOptions,
  SliderStyle
} from '@ohos.arkui.component';

import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'

@Observed
export class MySliderModifier implements AttributeModifier<SliderAttribute> {
  @State public isUndefined1: boolean = true;
  @State public isUndefined2: boolean = true;
  @State public isUndefined3: boolean = true;

  applyNormalAttribute(instance: SliderAttribute): void {
    instance
      .showTips(this.isUndefined1 ? true : undefined)
      .slideRange(this.isUndefined2 ? {from:20, to:80} as SlideRange : undefined)
      .selectedBorderRadius(this.isUndefined3 ? '55vp' as Dimension: undefined)
  }
}

@Entry
@Component
struct Index {
  @State isContentModifier: boolean = false;
  @State modifier: MySliderModifier = new MySliderModifier()

  build() {
    Column() {
      Slider({ style: SliderStyle.InSet } as SliderOptions)
        .id('Slider_1')
        .attributeModifier(this.modifier)
      Row() {
        Button('showTips: ' + this.modifier.isUndefined1)
          .id('Slider_btn1')
          .onClick((e: ClickEvent) => {
            this.modifier.isUndefined1 = !this.modifier.isUndefined1;
          })
        Button('slideRange: ' + this.modifier.isUndefined2)
          .id('Slider_btn2')
          .onClick((e: ClickEvent) => {
            this.modifier.isUndefined2 = !this.modifier.isUndefined2;
          })
        Button('selectedBorderRadius: ' + this.modifier.isUndefined3)
          .id('Slider_btn3')
          .onClick((e: ClickEvent) => {
            this.modifier.isUndefined3 = !this.modifier.isUndefined3;
          })
      }
    }.height('100%').width('100%')
  }
}