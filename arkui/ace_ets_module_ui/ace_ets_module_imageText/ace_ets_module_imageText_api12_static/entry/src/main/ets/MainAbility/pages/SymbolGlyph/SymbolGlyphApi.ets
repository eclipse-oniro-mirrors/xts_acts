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
import { Entry, Margin, Text, Row, SymbolGlyph, $r, EffectFillStyle, Column, Component, Button, HierarchicalSymbolEffect, ClickEvent, BounceSymbolEffect, ReplaceSymbolEffect, ScaleSymbolEffect, AppearSymbolEffect, DisappearSymbolEffect } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SymbolGlyphApi {
  @State isActive: boolean = true;
  @State triggerValueReplace: number = 0;
  replaceFlag: boolean = true;
  @State text: string = ''

  build() {
    Column() {
      Row() {
        Column() {
          Text("可变颜色动效")
          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .fontSize(96)
            .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.ITERATIVE), this.isActive).key('SymbolGlyphApi')

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(96)
              .key('SymbolGlyphApi1')
              .symbolEffect(new ReplaceSymbolEffect()) // type 7

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(96)
              .key('SymbolGlyphApi2')
              .symbolEffect(new ScaleSymbolEffect()) // type 1

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(96)
              .key('SymbolGlyphApi3')
              .symbolEffect(new AppearSymbolEffect()) // type 3
          }

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(96)
              .key('SymbolGlyphApi4')
              .symbolEffect(new DisappearSymbolEffect()) // type 4

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(96)
              .key('SymbolGlyphApi5')
              .symbolEffect(new BounceSymbolEffect()) // type 5
          }

          Button(this.isActive ? '关闭' : '播放').onClick((e: ClickEvent) => {
            this.isActive = !this.isActive;
          })
        }.margin({right:20} as Margin)
      }
    }.margin({
      left:30,
      top:50
    } as Margin)
  }
}