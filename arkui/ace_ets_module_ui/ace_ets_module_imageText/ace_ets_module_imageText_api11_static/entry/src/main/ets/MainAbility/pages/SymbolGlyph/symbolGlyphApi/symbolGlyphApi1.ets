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
  Entry,
  Component,
  Column,
  Color,
  SymbolEffectStrategy,
  $r,
  Text,
  SymbolGlyph
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct symbolGlyphApi1 {
  @State text1: string = ''

  build() {
    Column() {
        Column(){
          Text("无动效")
          SymbolGlyph($r('sys.symbol.ohos_lungs'))
            .fontSize(100)
            .effectStrategy(SymbolEffectStrategy.NONE)
            .key('symbolGlyphApi1')
        }
    }
  }
}