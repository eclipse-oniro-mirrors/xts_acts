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
struct symbolSpanApi1 {
  @State text1: string = ''
  build() {
    Column() {
      Column(){
        Text("渲染模式：多色")
        Text(){
          SymbolSpan($r('sys.symbol.ohos_lungs'))
            .fontWeight(FontWeight.Lighter)
            .fontSize(100)
            .effectStrategy(SymbolEffectStrategy.NONE)
            .key('symbolSpanApi1')
        }
      }

    }
  }
}