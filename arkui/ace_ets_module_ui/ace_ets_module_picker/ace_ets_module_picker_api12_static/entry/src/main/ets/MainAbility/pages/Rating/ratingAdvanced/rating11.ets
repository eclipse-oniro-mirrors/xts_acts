'use static';
/*
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
import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox,CircleOptions,
  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration,
  ContentModifier, RatingConfiguration, WrappedBuilder,wrapBuilder,CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyRatingStyle11 implements ContentModifier<RatingConfiguration> {
  private name: string = ''
  private style: number = 0
  constructor(value1: string, value2: number){
    this.name = value1
    this.style = value2
  }
  applyContent(): WrappedBuilder<CustomBuilderT<RatingConfiguration>>{
    return wrapBuilder<CustomBuilderT<RatingConfiguration>>(buildRating11)
  }
}

@Builder function buildRating11(config: RatingConfiguration){
  Column() {
    Row() {
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .id('circle11')
        .fill(config.rating >= 0.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize == 0.5) {
              // config.triggerChange(undefined);
              // return
            }
            if (config.stepSize == 1) {
              // config.triggerChange(undefined);
              // return
            }
          }
        }).visibility(config.stars >= 1 ? Visibility.Visible : Visibility.Hidden)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 0.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            // config.triggerChange(undefined);
          }
        }).visibility(config.stars >= 1 ? Visibility.Visible : Visibility.Hidden)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 1.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize == 0.5) {
              // config.triggerChange(undefined);
              // return
            }
            if (config.stepSize == 1) {
              // config.triggerChange(undefined);
              // return
            }
          }
        }).visibility(config.stars >= 2 ? Visibility.Visible : Visibility.Hidden).margin({left:10} as Margin)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 1.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            // config.triggerChange(undefined);
          }
        }).visibility(config.stars >= 2 ? Visibility.Visible : Visibility.Hidden)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 2.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize == 0.5) {
              // config.triggerChange(undefined);
              // return
            }
            if (config.stepSize == 1) {
              // config.triggerChange(undefined);
              // return
            }
          }
        }).visibility(config.stars >= 3 ? Visibility.Visible : Visibility.Hidden).margin({left:10} as Margin)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 2.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            // config.triggerChange(undefined);
          }
        }).visibility(config.stars >= 3 ? Visibility.Visible : Visibility.Hidden)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 3.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize == 0.5) {
              // config.triggerChange(undefined);
              // return
            }
            if (config.stepSize == 1) {
              // config.triggerChange(undefined);
              // return
            }
          }
        }).visibility(config.stars >= 4 ? Visibility.Visible : Visibility.Hidden).margin({left:10} as Margin)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 3.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            // config.triggerChange(undefined);
          }
        }).visibility(config.stars >= 4 ? Visibility.Visible : Visibility.Hidden)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 4.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize == 0.5) {
              // config.triggerChange(undefined);
              // return
            }
            if (config.stepSize == 1) {
              // config.triggerChange(undefined);
              // return
            }
          }
        }).visibility(config.stars >= 5 ? Visibility.Visible : Visibility.Hidden).margin({left:10} as Margin)
      Circle({ width: 25, height: 25 } as CircleOptions)
      
        .fill(config.rating >= 4.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            // config.triggerChange(undefined);
          }
        }).visibility(config.stars >= 5 ? Visibility.Visible : Visibility.Hidden)
    }.height(100)
    Text('分值：' + config.rating)
  }
}

@Entry
@Component
struct rating11 {
  @State rating: number = 0;
  @State ratingIndicator: boolean = true;
  @State ratingStars: int = 0;
  @State ratingStepsize: number = 0.5;
  @State ratingEnabled: boolean = true;
  @State ratingClick:string = "can't click rating"
  build(){
    Row() {
      Column() {
        Text(this.ratingClick)
          .fontSize(30)
          .id('ratingText11')
        Rating({
          rating: 0,
          indicator: this.ratingIndicator
        })
          .id('rating11')
          .onClick((e:ClickEvent) => {
            this.ratingClick = 'can click rating'
          })
          .stepSize(this.ratingStepsize)
          .stars(this.ratingStars)
          .backgroundColor(Color.Transparent)
          .width('100%')
          .height(50)
          .onChange((value: number):void => {
            console.info('Rating change is' + value);
            this.rating = value
          })
          .contentModifier(new MyRatingStyle11('hello', 3))
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
  }
}