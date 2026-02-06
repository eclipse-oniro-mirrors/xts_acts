/**
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

@Entry
@Component
struct SymbolShadowTest {
  options1: ShadowOptions = {
    radius: 30.0,
    color: Color.Blue,
    offsetX: 20,
    offsetY: 20,
  };
  options2: ShadowOptions = {
    radius: 0,
    color: '#FFFF0000',
    offsetX: 0,
    offsetY: 0,
  };
  options3: ShadowOptions = {
    radius: $r('app.float.radius_1'),
    color: $r('app.color.red_1'),
    offsetX: $r('app.float.offsetX_1'),
    offsetY: $r('app.float.offsetY_1'),
  };

  build() {
    Column() {
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .symbolShadow(this.options1)
        .id('symbolGlyph1')
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .symbolShadow(this.options2)
        .id('symbolGlyph2')
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .symbolShadow(this.options3)
        .id('symbolGlyph3')
    }
    .margin({
      left: 20,
      top: 50
    })
  }
}