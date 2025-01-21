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
struct IndexS {
  @State text: string = "";

  onFormRecover() {
    this.text = "onFormRecover";
  }

  onFormRecycle() {
    this.text = "onFormRecycle";
    return this.text;
  }

  build() {
    Column() {

      Text("life test" + this.text)
        .key('lifecycle')

      Row() {
        Column() {
          Text("细")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontWeight(FontWeight.Lighter)
              .fontSize(100)
          }
        }

        Column() {
          Text("标准")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontWeight(FontWeight.Normal)
              .fontSize(100)
          }
        }

        Column() {
          Text("粗")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontWeight(FontWeight.Bold)
              .fontSize(100)
          }
        }
      }

      Row() {
        Column() {
          Text("单色")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .renderingStrategy(SymbolRenderingStrategy.SINGLE)
              .fontColor([Color.Blue, Color.Grey, Color.Green])
          }.key("singleSym")
        }

        Column() {
          Text("多色")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
              .fontColor([Color.Blue, Color.Grey, Color.Green])
          }
        }

        Column() {
          Text("透明度")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)
              .fontColor([Color.Blue, Color.Grey, Color.Green])
          }
        }
      }

      Row() {
        Column() {
          Text("无动效")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .effectStrategy(SymbolEffectStrategy.NONE)
          }
        }

        Column() {
          Text("整体缩放动效")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .effectStrategy(SymbolEffectStrategy.SCALE)
          }
        }

        Column() {
          Text("层级动效")
          Text() {
            SymbolSpan($r('sys.symbol.ohos_lungs'))
              .fontSize(100)
              .effectStrategy(SymbolEffectStrategy.HIERARCHICAL)
          }
        }
      }
    }
  }
}
