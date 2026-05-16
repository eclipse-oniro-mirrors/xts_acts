/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct SXSymbolGlyphSINGLE01 {
  @State text: string = ''

  build() {
    Column({space:20}) {
      Column() {
        Text("渲染模式：统一")
        SymbolGlyph($r('sys.symbol.ohos_lungs'))
          .key('SXSymbolGlyphSINGLE01Key')
          .fontSize(100)
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor([Color.Blue,Color.Grey,Color.Green])
      }

    }.margin(20)
  }
}