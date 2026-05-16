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
  $r
} from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DividerExample {
  @State stars: Int | undefined = undefined;
  @State public flag: boolean = true;
  @State rating: Int = 3;
  @State stepSize: Double | undefined = undefined;
  @State text: Int = 0;
  @State isNormal: boolean = true;

  build() {
    Column() {
      Rating({ rating: 2, indicator: false })
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
        .id('rating')

      Column() {
        Button('starStyle dynamic change' + this.isNormal)
          .onClick((e: ClickEvent) => {
            this.isNormal = !this.isNormal;
          }).margin('20px')
          .id('rating_starStyle')
        Button('stars changeNormal' + this.stars)
          .onClick((e: ClickEvent) => {
            this.stars = this.stars == undefined ? 6 : undefined;
          }).margin('20px')
          .id('rating_stars')
        Button('stepSize dynamic change' + this.stepSize)
          .onClick((e: ClickEvent) => {
            this.stepSize = this.stepSize == undefined ? 3 : undefined;
          }).margin('20px')
          .id('rating_stepSize')
        Text('count:' + this.text)
          .id('rating_onChange1')
        Button('onChange dynamic change' + this.flag)
          .onClick((e: ClickEvent) => {
            this.flag = !this.flag;
          }).margin('20px')
          .id('rating_onChange2')
      }
    }.width('100%')
  }
}