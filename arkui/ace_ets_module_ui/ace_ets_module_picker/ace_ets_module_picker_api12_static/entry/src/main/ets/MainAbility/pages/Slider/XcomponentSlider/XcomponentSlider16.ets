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
  Slider,XComponentController, XComponentParameters, SliderChangeMode, XComponentParameters,
  XComponentController,XComponentType,Slider,SliderStyle,SurfaceRect,SliderChangeMode,

  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct XSlider16 {
  private surfaceId: string = ''
  private xComponentContext: SurfaceRect = {surfaceWidth:0, surfaceHeight:0 } as SurfaceRect
  xComponentController: XComponentController = new XComponentController()
  @State outSetValueOne: number = 10

  build() {
    Column() {
      Text('Slider value is : ' + this.outSetValueOne)
        .id('XSliderText16')
        .fontSize(18)

      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.xComponentController
      } as XComponentParameters){
        Slider({
          value: this.outSetValueOne,
          min: 0,
          step: 10,
          max: 100,
          style:SliderStyle.OutSet
        })
          .id('XSlider16')
          .width('400px')
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
      }
      .onLoad(():void => {
        this.xComponentController.setXComponentSurfaceRect({ surfaceWidth: 1920, surfaceHeight: 1600 })
        this.surfaceId = this.xComponentController.getXComponentSurfaceId()
        // this.xComponentContext = this.xComponentController.getXComponentSurfaceRect()
      })
      .width(100)
      .height('10%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}