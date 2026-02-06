'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  $r,
  Text,
  Row,
  Column,
  Color,
  ClickEvent,
  Search,
  TextInput,
  TextArea,
  Button,
  GradientDirection,
  ColumnOptions,
  LinearGradientOptions,
  RadialGradientOptions,
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextShaderStyle {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('angle为45°的线性渐变').fontSize(18).width('90%').height('5%')
      Text(this.message)
        .id('Text_shaderStyle')
        .fontSize(20)
        // .shaderStyle({
        //   angle: 'deg',
        //   direction: GradientDirection.Right,
        //   colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
        //   repeating: true
        // } as ShaderStyle)
        .width('80%')
        .height('10%')

      Text('direction为LeftTop的线性渐变').fontSize(18).width('90%').height('5%')
      Text(this.message)
        .id('Text_linearGradientStyle')
        .fontSize(20)
        .linearGradient({
          angle: 45,
          direction: GradientDirection.LeftTop,
          colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
          repeating: false,
        } as LinearGradientOptions)
        .width('80%')
        .height('10%')

      Text('径向渐变').fontSize(18).width('90%').height('5%')
      Text(this.message)
        .id('Text_radialGradientStyle')
        .fontSize(20)
        .radialGradient({
          center: [50, 50],
          radius: 20,
          colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
          repeating: true,
        } as RadialGradientOptions)
        .width('80%')
        .height('10%')

      Text('纯色渐变').fontSize(18).width('90%').height('5%')
      Text(this.message)
        .id('Text_ColorShaderStyle')
        .fontSize(20)
        // .shaderStyle({
        //   color: Color.Blue
        // } as ColorShaderStyle)
        .width('80%')
        .height('10%')
    }
  }
}