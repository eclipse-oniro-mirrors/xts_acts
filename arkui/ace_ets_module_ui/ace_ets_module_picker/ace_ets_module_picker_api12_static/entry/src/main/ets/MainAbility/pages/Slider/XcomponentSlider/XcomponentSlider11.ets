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
  Slider,XComponentParameters,XComponentController,XComponentType,Slider,SurfaceRect,SliderChangeMode,
  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct XSlider11 {
  private surfaceId: string = ''
    private xComponentContext: SurfaceRect = {surfaceWidth:0, surfaceHeight:0 } as SurfaceRect
  xComponentController: XComponentController = new XComponentController()
  @State outSetValueOne: number = 20

  build() {
    Row() {
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
        })
          .id('XSlider11')
          .width('400px')
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
      }
      .onLoad(():void => {
        this.xComponentController.setXComponentSurfaceRect({ surfaceWidth: 1920, surfaceHeight: 1100 })
        this.surfaceId = this.xComponentController.getXComponentSurfaceId()
        // this.xComponentContext = this.xComponentController.getXComponentSurfaceRect()
      })
      .width(100)
      .height(200)
    }
    .position({ x: 40, y: 60 } as Position)
  }
}