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
struct EffectFillStyleExample {
  @State isActive: boolean = true;
  @State triggerValueReplace: number = 0;
  replaceFlag: boolean = true;

  build() {
    Column() {
      Row() {
        Column() {
          Text("可变颜色动效 ITERATIVE")
          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .id("ITERATIVE")
            .fontSize(96)
            .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.ITERATIVE), this.isActive)
          Button(this.isActive ? '关闭' : '播放').onClick(() => {
            this.isActive = !this.isActive;
          })
        }.margin({right:20})

        Column() {
          Text("可变颜色动效 CUMULATIVE")
          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .id("CUMULATIVE")
            .fontSize(96)
            .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.CUMULATIVE), this.isActive)
          Button(this.isActive ? '关闭' : '播放').onClick(() => {
            this.isActive = !this.isActive;
          })
        }.margin({right:20})
      }
    }.margin({
      left:30,
      top:50
    })
  }
}