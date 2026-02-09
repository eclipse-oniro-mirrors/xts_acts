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

import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox,
  ColumnOptions, Shape, Path, Flex, Builder, Margin, Radio, RadioIndicatorType, Rating, RatingConfiguration,
  CustomBuilderT, wrapBuilder, WrappedBuilder, ContentModifier} from '@ohos.arkui.component'

class MyRatingStyle implements ContentModifier<RatingConfiguration> {

  constructor() {}

  applyContent(): WrappedBuilder<CustomBuilderT<RatingConfiguration>>{
    return wrapBuilder<CustomBuilderT<RatingConfiguration>>(buildRating)
  }
}

@Builder function buildRating(config: RatingConfiguration) {
  Column({space:10} as ColumnOptions) {
    Text("Rating" + config.rating).id('RatingContentModifier_text')
    Button('triggerChange')
      .id('RatingContentModifier_btn')
      .onClick((e:ClickEvent)=>{
        config.triggerChange(2)
      })
  }
}

@Entry
@Component
struct RatingContentModifierTest {

  build() {
    Column({space:10} as ColumnOptions) {
      Rating({
        rating: 0,
      })
        .stars(5)
        .width('100%')
        .onChange((value: number):void => {
          console.info('Rating change is'+ value);
        })
        .contentModifier(new MyRatingStyle())

    }
    .width('100%')
    .height('100%')
  }
}