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
import { Entry, Margin, Text, SymbolGlyph, $r, EffectScope, EffectDirection, ReplaceSymbolEffect, ScaleSymbolEffect, AppearSymbolEffect, DisappearSymbolEffect, Column, Component, Button, Row, ClickEvent } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index121313 {
  @State isActive: boolean = true;
  @State triggerValueReplace: number = 0;
  replaceFlag: boolean = true;

  build() {
    Column() {
      Row() {
        Column() {
          Text("ScaleSymbolEffect")
          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .id("ScaleSymbolEffect")
            .fontSize(96)
            .symbolEffect(new ScaleSymbolEffect(EffectScope.LAYER , EffectDirection.UP), this.isActive)
          Button(this.isActive ? '关闭' : '播放').onClick((e: ClickEvent) => {
            this.isActive = !this.isActive;
          })
        }.margin({right:20} as Margin)

        Column() {
          Text("AppearSymbolEffect")
          SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
            .id("AppearSymbolEffect")
            .fontSize(96)
            .symbolEffect(new AppearSymbolEffect(EffectScope.WHOLE), this.triggerValueReplace as int)
          Button('trigger').onClick((e: ClickEvent) => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }

        Column() {
          Text("DisappearSymbolEffect")
          SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
            .id("DisappearSymbolEffect")
            .fontSize(96)
            .symbolEffect(new DisappearSymbolEffect(EffectScope.WHOLE), this.triggerValueReplace as int)
          Button('trigger').onClick((e: ClickEvent) => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }

      }
    }.margin({
      left:30,
      top:50
    } as Margin)
  }
}