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
struct SymbolEffectTest {
  @State triggerValueReplace1: number = 0;
  @State triggerValueReplace2: number = 0;
  @State triggerValueReplace3: number = 0;
  @State renderMode: number = 1;

  replaceFlag1: boolean = true;
  replaceFlag2: boolean = true;
  replaceFlag3: boolean = true;
  build() {
    Column() {
      Row() {
        Column() {
          Text("替换动效")
          SymbolGlyph(this.replaceFlag1 ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
            .renderingStrategy(this.renderMode)
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.LAYER,ReplaceEffectType.SEQUENTIAL), this.triggerValueReplace1)
            .id('SymbolGlyph1')
          Button('trigger')
            .onClick(() => {
              this.replaceFlag1 = !this.replaceFlag1;
              this.triggerValueReplace1 = this.triggerValueReplace1 + 1;
            }).id('trigger_1')
        }
        Column() {
          Text("快速替换动效")
          SymbolGlyph(this.replaceFlag2 ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE,ReplaceEffectType.CROSS_FADE), this.triggerValueReplace2)
            .id('SymbolGlyph2')
          Button('trigger')
            .onClick(() => {
              this.replaceFlag2 = !this.replaceFlag2;
              this.triggerValueReplace2 = this.triggerValueReplace2 + 1;
            }).id('trigger_2')
        }
        Column() {
          Text("禁用动效")
          SymbolGlyph(this.replaceFlag3 ? $r('sys.symbol.eye_slash') : $r('sys.symbol.eye'))
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE,ReplaceEffectType.SLASH_OVERLAY ), this.triggerValueReplace3)
            .id('SymbolGlyph3')
          Button('trigger')
            .onClick(() => {
              this.replaceFlag3 = !this.replaceFlag3;
              this.triggerValueReplace3 = this.triggerValueReplace3 + 1;
            }).id('trigger_3')
        }
      }
    }
  }
}