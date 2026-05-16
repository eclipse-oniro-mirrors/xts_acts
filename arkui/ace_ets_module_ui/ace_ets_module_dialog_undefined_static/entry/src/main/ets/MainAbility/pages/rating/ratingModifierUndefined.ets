'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Button,
  Column,
  Margin,
  Color,
  ClickEvent,
  Rating,
  StarStyleOptions,
  $r,
  AttributeModifier,
  RatingAttribute
} from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyRatingModifier implements AttributeModifier<RatingAttribute> {
  @State public stars: int | undefined = undefined;
  @State public flag: Boolean = true;
  @State public rating: Int = 3;
  @State public stepSize: Double | undefined = undefined;
  @State public isNormal: boolean = true;
  @State public text: Int = 0;

  applyNormalAttribute(instance: RatingAttribute): void {
    instance
      .starStyle(this.isNormal ? {
        backgroundUri: $r('app.media.startIcon'),
        foregroundUri: $r('app.media.startIcon'),
        secondaryUri: $r('app.media.startIcon')
      } as StarStyleOptions : undefined)
      .stars(this.stars)
      .stepSize(this.stepSize)
      .onChange(this.flag ? (value: Double) => {
        this.text += 1;
      } : undefined)
  }
}

@Entry
@Component
struct DividerExample {
  @State modifier: MyRatingModifier = new MyRatingModifier();

  build() {
    Column() {
      Rating({ rating: 2, indicator: false })
        .attributeModifier(this.modifier)
        .id('ratingModifier')

      Column() {
        Button('starStyle dynamic change' + this.modifier.isNormal)
          .onClick((e: ClickEvent) => {
            this.modifier.isNormal = !this.modifier.isNormal;
          }).margin('20px')
          .id('rating_starStyleModifier')
        Button('stars changeNormal' + this.modifier.stars)
          .onClick((e: ClickEvent) => {
            this.modifier.stars = this.modifier.stars == undefined ? 6 : undefined;
          }).margin('20px')
          .id('rating_starsModifier')
        Button('stepSize dynamic change' + this.modifier.stepSize)
          .onClick((e: ClickEvent) => {
            this.modifier.stepSize = this.modifier.stepSize == undefined ? 3 : undefined;
          }).margin('20px')
          .id('rating_stepSizeModifier')
        Text('count:' + this.modifier.text)
          .id('rating_onChangeModifier1')
        Button('onChange dynamic change' + this.modifier.flag)
          .onClick((e: ClickEvent) => {
            this.modifier.flag = !this.modifier.flag;
          }).margin('20px')
          .id('rating_onChangeModifier2')
      }.height('20%')

    }.width('100%')
  }
}