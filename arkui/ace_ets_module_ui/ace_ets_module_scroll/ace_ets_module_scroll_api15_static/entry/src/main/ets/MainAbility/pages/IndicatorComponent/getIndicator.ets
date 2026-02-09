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
  Column,
  Component,
  Color,
  Text,
  LengthMetrics,
  Scroller,
  NodeContainer,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent,
  SwiperController,
  IndicatorComponentController,
  IndicatorComponent,
  Swiper,
  Indicator,
  ForEach,
  Curve,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DigitIndicatorDemo1 {
  private indicatorController: IndicatorComponentController = new IndicatorComponentController()
  private swiperController: SwiperController = new SwiperController()
  @State list: number[] = [] as number[]

  aboutToAppear(): void {
    for (let i = 1; i <= 6; i++) {
      this.list.push(i);
    }
  }

  build() {
    Column() {
      Swiper(this.swiperController) {
        ForEach(this.list, (item: number, i: int) => {
          Text(item.toString())
            .width('100%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => item.toString())
      }
      // .cachedCount(2)
      .index(0)
      .autoPlay(false, undefined)
      .interval(2000)
      .indicator(this.indicatorController)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int) => {
        console.info(index.toString())
      })

      IndicatorComponent(this.indicatorController)
        .id('IndicatorComponent_1')
        .initialIndex(0)
        .style(Indicator.digit()
          .fontColor(Color.Gray)
          .selectedFontColor(Color.Gray)
          .digitFont({ size: 20, weight: FontWeight.Bold })
          .selectedDigitFont({ size: 20, weight: FontWeight.Normal }))
        .count(6)
        .vertical(true)
        .loop(false)
        .onChange((index: int) => {
          console.log('current index: ' + index)
        })
    }
  }
}
