/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Button,
  Scroll,
  SymbolGlyph,
  ReplaceSymbolEffect,
  ReplaceEffectType,
  EffectScope,
  $r
} from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SymbolGlyphIndex {
  // ReplaceSymbolEffect 的 replaceType 测试（4 种 ReplaceEffectType）
  @State mTypeSeq: string = 'type_seq_init'
  @State mTypeIter: string = 'type_iter_init'
  @State mTypeCrossFade: string = 'type_crossfade_init'
  @State mTypeSlash: string = 'type_slash_init'
  // ReplaceSymbolEffect 的 scope 测试（2 种 EffectScope）
  @State mScopeWhole: string = 'scope_whole_init'
  @State mScopeLayer: string = 'scope_layer_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('SymbolGlyphIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {

        // 真实 SymbolGlyph 组件（覆盖所有 ReplaceEffectType 枚举值）
        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL), 1)
          .key('symbolGlyphSequential')
          .width('10%')
          .height('5%')

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL), 1)
          .key('symbolGlyphIterative')
          .width('10%')
          .height('5%')

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE), 1)
          .key('symbolGlyphCrossFade')
          .width('10%')
          .height('5%')

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SLASH_OVERLAY), 1)
          .key('symbolGlyphSlashOverlay')
          .width('10%')
          .height('5%')

        // 测试 ReplaceEffectType.SEQUENTIAL
        Button(this.mTypeSeq)
          .id('btnTypeSeq')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL);
            this.mTypeSeq = 'type_seq:' + (effect.replaceType === ReplaceEffectType.SEQUENTIAL ? 'match' : 'nomatch');
          })

        // 当前 SDK 不支持 ITERATIVE，回退为 SEQUENTIAL
        Button(this.mTypeIter)
          .id('btnTypeIter')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL);
            this.mTypeIter = 'type_iter:' + (effect.replaceType === ReplaceEffectType.SEQUENTIAL ? 'match' : 'nomatch');
          })

        // 当前 SDK 对 CROSS_FADE 会回退为 SEQUENTIAL
        Button(this.mTypeCrossFade)
          .id('btnTypeCrossFade')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE);
            this.mTypeCrossFade = 'type_crossfade:' + (effect.replaceType === ReplaceEffectType.SEQUENTIAL ? 'fallback_seq' : 'match');
          })

        // 当前 SDK 对 SLASH_OVERLAY 会回退为 SEQUENTIAL
        Button(this.mTypeSlash)
          .id('btnTypeSlash')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SLASH_OVERLAY);
            this.mTypeSlash = 'type_slash:' + (effect.replaceType === ReplaceEffectType.SEQUENTIAL ? 'fallback_seq' : 'match');
          })

        // 测试 EffectScope.WHOLE
        Button(this.mScopeWhole)
          .id('btnScopeWhole')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL);
            this.mScopeWhole = 'scope_whole:' + (effect.scope === EffectScope.WHOLE ? 'match' : 'nomatch');
          })

        // 测试 EffectScope.LAYER
        Button(this.mScopeLayer)
          .id('btnScopeLayer')
          .onClick(() => {
            let effect = new ReplaceSymbolEffect(EffectScope.LAYER, ReplaceEffectType.SEQUENTIAL);
            this.mScopeLayer = 'scope_layer:' + (effect.scope === EffectScope.LAYER ? 'match' : 'nomatch');
          })

      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
