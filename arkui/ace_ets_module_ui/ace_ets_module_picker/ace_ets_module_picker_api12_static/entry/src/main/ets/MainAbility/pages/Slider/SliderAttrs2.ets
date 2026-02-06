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
import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox, Position,XComponent,
  Slider,SliderStyle,SliderInteraction,SliderChangeMode,
  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct SliderAttrsTest2 {
  @State value2: number = 0
  @State value3: number = 0

  build() {
    Column({ space: 20 } as ColumnOptions) {

      Slider({ style: SliderStyle.InSet, value: 0, min: 0, max: 100 })
        .width('300vp')
        .id('SliderAttrs2_slider2')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK)
        .onChange((value: number, mode: SliderChangeMode):void => {
          this.value2 = value
        })
      Text((this.value2 > 0)?'true':'false').id('SliderAttrs2_text2')



    }.width('100%')
  }
}