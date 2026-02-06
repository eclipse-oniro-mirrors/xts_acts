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

@Entry
@Component
struct SymbolGlyphShaderStyle {

  build() {
    Column({ space: 5 }) {
      Text('angle为45°的线性渐变').fontSize(18).width('90%').height('5%')
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('SymbolGlyph_shaderStyle')
        .fontSize(20)
        .shaderStyle(
        [{
            angle: 100,
            direction: GradientDirection.Right,
            colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
            repeating: true,
          } as ShaderStyle,
          {
            center: [50, 50],
            radius: 30,
            colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
            repeating: true,
          }] as Array<ShaderStyle>)
        .width('80%')
        .height('10%')

      Text('direction为LeftTop的线性渐变').fontSize(18).width('90%').height('5%')
      SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
        .id('SymbolGlyph_linearGradientStyle')
        .fontSize(20)
        .linearGradient({
          angle: 90,
          direction: GradientDirection.Right,
          colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
          repeating: true,
        } as LinearGradientOptions)
        .width('80%')
        .height('10%')

      Text('径向渐变').fontSize(18).width('90%').height('5%')
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .id('SymbolGlyph_radialGradientStyle')
        .fontSize(20)
        .radialGradient({
          center: [50, 50],
          radius: 30,
          colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
          repeating: true,
        } as RadialGradientOptions)
        .width('80%')
        .height('10%')
    }
  }
}