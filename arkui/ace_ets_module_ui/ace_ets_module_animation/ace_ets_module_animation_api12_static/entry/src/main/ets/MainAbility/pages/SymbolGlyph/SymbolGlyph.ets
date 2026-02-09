'use static';
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
import {
  $r,
  AppearSymbolEffect,
  BounceSymbolEffect,
  Button,
  ClickEvent,
  Column,
  Component,
  DisappearSymbolEffect,
  EffectDirection,
  EffectScope,
  Entry,
  ReplaceSymbolEffect,
  Row,
  Stack,
  SymbolGlyph,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  @State isActive: boolean = true;
  @State isActive2: boolean = true;
  @State isActive3: boolean = true;
  @State triggerValueReplace: Int = 0;
  replaceFlag: boolean = true;

  build() {
    Row() {
      Column() {
        Column() {
          Text("AppearSymbolEffect:" + this.isActive)
            .id("AppearSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new AppearSymbolEffect(EffectScope.LAYER), this.isActive)
          Button(this.isActive ? "关闭" : "播放").onClick((e: ClickEvent) => {
            this.isActive = !this.isActive;
          })
        }

        Column() {
          Text("DisappearSymbolEffect:" + this.isActive2)
            .id("DisappearSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new DisappearSymbolEffect(EffectScope.LAYER), this.isActive)
          Button(this.isActive2 ? "关闭" : "播放").onClick((e: ClickEvent) => {
            this.isActive2 = !this.isActive2;
          })
        }

        Column() {
          Text("ReplaceSymbolEffect:" + this.replaceFlag)
            .id("ReplaceSymbolEffect")
          SymbolGlyph(this.replaceFlag ? $r("sys.symbol.checkmark_circle") : $r("sys.symbol.repeat_1"))
            .fontSize(96)
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE), this.triggerValueReplace)
          Button("trigger").onClick((e: ClickEvent) => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }

        Column() {
          Text("BounceSymbolEffect:" + this.isActive3)
            .id("BounceSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new BounceSymbolEffect(EffectScope.LAYER, EffectDirection.DOWN), this.isActive)
          Button(this.isActive3 ? "关闭" : "播放").onClick((e: ClickEvent) => {
            this.isActive3 = !this.isActive3;
          })
        }
      }.width("100%")
    }.height("100%")
  }
}