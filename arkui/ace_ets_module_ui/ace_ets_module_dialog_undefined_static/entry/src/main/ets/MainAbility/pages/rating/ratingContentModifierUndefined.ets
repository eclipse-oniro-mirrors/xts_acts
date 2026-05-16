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
  Text,
  Column,
  Component,
  Button,
  RatingConfiguration,
  Rating,
  Visibility,
  CircleOptions,
  StarStyleOptions,
  Builder,
  ContentModifier,
  WrappedBuilder,
  Row,
  ClickEvent,
  Color,
  Circle,
  wrapBuilder
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

type RatingBuilder = @Builder (config: RatingConfiguration) => void;

class MyRatingStyle implements ContentModifier<RatingConfiguration> {
  name: string = '';
  style: int = 0;

  constructor(value1: string, value2: int) {
    this.name = value1;
    this.style = value2;
  }

  applyContent(): WrappedBuilder<RatingBuilder> {
    return wrapBuilder(buildRating);
  }
}

@Builder
function buildRating(config: RatingConfiguration) {
  Column() {
    Row() {
      Circle({ width: 25, height: 25 } as CircleOptions)
        .fill(config.rating >= 1 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize = 1) {
              config.triggerChange(1);
              return
            }
            if (config.stepSize = 1) {
              config.triggerChange(1);
              return
            }
          }
        }).visibility(config.stars >= 1 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 } as CircleOptions)
        .fill(config.rating >= 1 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            config.triggerChange(1);
          }
        }).visibility(config.stars >= 1 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 } as CircleOptions)
        .fill(config.rating >= 1.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize = 1) {
              config.triggerChange(2);
              return
            }
            if (config.stepSize = 1) {
              config.triggerChange(2);
              return
            }
          }
        }).visibility(config.stars >= 2 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 } as CircleOptions)
        .fill(config.rating >= 2 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            config.triggerChange(2);
          }
        }).visibility(config.stars >= 2 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 } as CircleOptions)
        .fill(config.rating >= 2 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize = 1) {
              config.triggerChange(3);
              return
            }
            if (config.stepSize = 1) {
              config.triggerChange(3);
              return
            }
          }
        }).visibility(config.stars >= 3 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 })
        .fill(config.rating >= 3 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            config.triggerChange(4);
          }
        }).visibility(config.stars >= 3 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 })
        .fill(config.rating >= 3 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize = 1) {
              config.triggerChange(3);
              return
            }
            if (config.stepSize = 1) {
              config.triggerChange(4);
              return
            }
          }
        }).visibility(config.stars >= 4 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 })
        .fill(config.rating >= 3.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            config.triggerChange(4);
          }
        }).visibility(config.stars >= 4 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 })
        .fill(config.rating >= 4.4 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            if (config.stepSize = 1) {
              config.triggerChange(4);
              return
            }
            if (config.stepSize = 1) {
              config.triggerChange(5);
              return
            }
          }
        }).visibility(config.stars >= 5 ? Visibility.Visible : Visibility.Hidden)

      Circle({ width: 25, height: 25 })
        .fill(config.rating >= 4.9 ? Color.Black : Color.Red)
        .onClick((event: ClickEvent) => {
          if (!config.indicator) {
            config.triggerChange(5);
          }
        }).visibility(config.stars >= 5 ? Visibility.Visible : Visibility.Hidden)
    }

    Text('分值:' + config.rating)
      .id('ratingContentModifierUndefined')
  }
}

@Entry
@Component
struct MyStateSample {
  @State rating: int = 0;
  @State ratingStars: int = 0 as int;
  @State ratingStepsize: int = 1;
  @State contentModifier: ContentModifier<RatingConfiguration> | undefined = new MyRatingStyle('hello', 3);
  @State public isUndefined: boolean = false;

  build() {
    Column() {
      Column() {
        Rating({
          rating: 0,
          indicator: true
        })
          .stepSize(this.ratingStepsize)
          .stars(this.ratingStars)
          .backgroundColor(Color.Transparent)
          .width('100%')
          .height(50)
          .contentModifier(this.isUndefined ? undefined : this.contentModifier)

        Row() {
          Button('changeUndefined').onClick((e: ClickEvent) => {
            this.isUndefined = !this.isUndefined;
          }).margin('20px')
            .id('ratingContentModifierUndefined2')
        }
      }
    }
  }
}