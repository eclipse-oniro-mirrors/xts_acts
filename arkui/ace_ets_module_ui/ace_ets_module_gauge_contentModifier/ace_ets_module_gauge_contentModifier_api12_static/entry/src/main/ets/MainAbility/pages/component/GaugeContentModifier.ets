'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Canvas,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Callback,
  Column,
  Row,
  Button,
  ClickEvent,
  Color,
  Text,
  Divider,
  Canvas,
  TabsController,
  TabContent,
  BarPosition,
  BarMode,
  Margin,
  Builder,
  Tabs,
  GaugeConfiguration,
  ContentModifier,
  ResourceColor,
  LinearGradient,
  Length,
  Padding,
  WrappedBuilder,
  wrapBuilder,
  Scroller,
  Scroll,
  Flex,
  Gauge,
  ColumnOptions,
  Alignment,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  CustomBuilderT,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Builder
function buildGaugeContentModifier(config: GaugeConfiguration){
  Column() {
    console.log('----------------------------1')
    Text(`value:${(config.contentModifier as MyGaugeContentModifier).value}`).id('GaugeContentModifier01')
    console.log('----------------------------2')
    Text(`min:${(config.contentModifier as MyGaugeContentModifier).min}`).id('GaugeContentModifier02')
    console.log('----------------------------3')
    Text(`max:${(config.contentModifier as MyGaugeContentModifier).max}`).id('GaugeContentModifier03')
    Text(`startAngle:${(config.contentModifier as MyGaugeContentModifier).startAngle}`).id('GaugeContentModifier04')
    Text(`endAngle:${(config.contentModifier as MyGaugeContentModifier).endAngle}`).id('GaugeContentModifier05')
    Text(`colors:${(config.contentModifier as MyGaugeContentModifier).colors}`).id('GaugeContentModifier06')
    Text(`strokeWidth:${(config.contentModifier as MyGaugeContentModifier).strokeWidth}`).id('GaugeContentModifier07')
    Text(`width:${(config.contentModifier as MyGaugeContentModifier).width}`).id('GaugeContentModifier08')
    Text(`height:${(config.contentModifier as MyGaugeContentModifier).height}`).id('GaugeContentModifier09')
    Text(`sizeWidth:${(config.contentModifier as MyGaugeContentModifier).sizeWidth}`).id('GaugeContentModifier10')
    Text(`sizeHeight:${(config.contentModifier as MyGaugeContentModifier).sizeHeight}`).id('GaugeContentModifier11')
    Text(`padding:${(config.contentModifier as MyGaugeContentModifier).padding}`).id('GaugeContentModifier12')
    Text(`margin:${(config.contentModifier as MyGaugeContentModifier).margin}`).id('GaugeContentModifier13')
    Text(`layoutWeight:${(config.contentModifier as MyGaugeContentModifier).layoutWeight}`).id('GaugeContentModifier14')
    Text(`constraintSizeMinWidth:${(config.contentModifier as MyGaugeContentModifier).constraintSizeMinWidth}`).id('GaugeContentModifier15')
    Text(`constraintSizeMaxWidth:${(config.contentModifier as MyGaugeContentModifier).constraintSizeMaxWidth}`).id('GaugeContentModifier16')
    Text(`constraintSizeMinHeight:${(config.contentModifier as MyGaugeContentModifier).constraintSizeMinHeight}`).id('GaugeContentModifier17')
    Text(`constraintSizeMaxHeight:${(config.contentModifier as MyGaugeContentModifier).constraintSizeMaxHeight}`).id('GaugeContentModifier18')
  }.width('100%').margin({top:0} as Margin)
}

class MyGaugeContentModifier implements ContentModifier<GaugeConfiguration> {
  public value: number
  public min: number
  public max: number
  public startAngle: number
  public endAngle: number
  public colors: ResourceColor | LinearGradient | Array<[ResourceColor | LinearGradient, number]>
  public strokeWidth: Length
  public width: Length
  public height: Length
  public sizeWidth: Length
  public sizeHeight: Length
  public padding: Padding | Length
  public margin: Margin | Length
  public layoutWeight: number | string
  public constraintSizeMinWidth: Length
  public constraintSizeMaxWidth: Length
  public constraintSizeMinHeight: Length
  public constraintSizeMaxHeight: Length

  constructor(value: number, min: number, max: number, startAngle: number, endAngle: number,
              colors: ResourceColor, strokeWidth: Length, width: Length, height: Length,
              sizeWidth: Length, sizeHeight: Length, padding: Length, margin: Length,
              layoutWeight: number, constraintSizeMinWidth: Length,constraintSizeMaxWidth: Length,
              constraintSizeMinHeight: Length, constraintSizeMaxHeight: Length){
    this.value = value
    this.min = min
    this.max = max
    this.startAngle = startAngle
    this.endAngle = endAngle
    this.colors = colors
    this.strokeWidth = strokeWidth
    this.width = width
    this.height = height
    this.sizeWidth = sizeWidth
    this.sizeHeight = sizeHeight
    this.padding = padding
    this.margin = margin
    this.layoutWeight = layoutWeight
    this.constraintSizeMinWidth = constraintSizeMinWidth
    this.constraintSizeMaxWidth = constraintSizeMaxWidth
    this.constraintSizeMinHeight = constraintSizeMinHeight
    this.constraintSizeMaxHeight = constraintSizeMaxHeight
  }

  applyContent(): WrappedBuilder<CustomBuilderT<GaugeConfiguration>>{
    return wrapBuilder<CustomBuilderT<GaugeConfiguration>>(buildGaugeContentModifier)
  }

}


@Entry
@Component
struct GaugeContentModifier {
  private scroller: Scroller = new Scroller()
  build(){
    Scroll(this.scroller) {
      Column() {
        Flex() {
          Column({ space: 20 } as ColumnOptions) {
            Gauge({
              value: 0,
              min: 0,
              max: 0
            })
            .contentModifier(new MyGaugeContentModifier(60, 0, 100, 20, 180, '#ff000000', 20, 100, 100, 100, 100, 20, 10, 5, 1, 100, 1, 100))
          }.width('100%')
        }.align(Alignment.Top)
      }
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .friction(0.6)
    .edgeEffect(EdgeEffect.Fade)
  }
}