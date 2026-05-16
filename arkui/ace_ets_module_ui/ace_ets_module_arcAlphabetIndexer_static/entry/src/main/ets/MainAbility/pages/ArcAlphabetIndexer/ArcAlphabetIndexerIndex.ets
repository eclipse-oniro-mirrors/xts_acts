'use static';
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
import { Entry, Component, Column, Scroll, Text, BlurStyle, ColorMetrics, Font, LengthMetrics } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ArcAlphabetIndexer, ArcAlphabetIndexerInitInfo } from '@ohos.arkui.ArcAlphabetIndexer';

@Entry
@Component
struct ArcAlphabetIndexerIndex {
  @State selectedIdx: int = 0;
  private letters: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
      AppStorage.setOrCreate<int>('arcOnSelectIndex', -1);
    } catch (error) { console.info('[ARKUI_NEW] ArcAlphabetIndexerIndex error ' + error); }
  }

  build() {
    Scroll() {
      Column() {
        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 0 })
          .color(ColorMetrics.resourceColor('#FF0000'))
          .selectedColor(ColorMetrics.resourceColor('#00FF00'))
          .popupColor(ColorMetrics.resourceColor('#0000FF'))
          .selectedBackgroundColor(ColorMetrics.resourceColor('#FFFF00'))
          .popupBackground(ColorMetrics.resourceColor('#FF00FF'))
          .usePopup(true)
          .autoCollapse(false)
          .popupBackgroundBlurStyle(BlurStyle.NONE)
          .key('arcIndexerFull')
          .id('arcIndexerFull')

        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 2 })
          .usePopup(false)
          .autoCollapse(true)
          .key('arcIndexerSimple')
          .id('arcIndexerSimple')

        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 0 })
          .color(undefined)
          .selectedColor(undefined)
          .popupColor(undefined)
          .selectedBackgroundColor(undefined)
          .popupBackground(undefined)
          .usePopup(undefined)
          .autoCollapse(undefined)
          .selectedFont(undefined)
          .popupFont(undefined)
          .font(undefined)
          .itemSize(undefined)
          .selected(undefined)
          .onSelect(undefined)
          .popupBackgroundBlurStyle(undefined)
          .key('arcIndexerUndefined')
          .id('arcIndexerUndefined')

        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 1 })
          .selectedFont({ size: 16, weight: 700 } as Font)
          .popupFont({ size: 20, weight: 400 } as Font)
          .font({ size: 12, weight: 500 } as Font)
          .itemSize(LengthMetrics.vp(24))
          .selected(3)
          .onSelect((index: int) => {
            console.info('[ARKUI_NEW] arcIndexerFontSize onSelect index=' + index);
            AppStorage.setOrCreate<int>('arcOnSelectIndex', index);
          })
          .popupBackgroundBlurStyle(BlurStyle.Thin)
          .key('arcIndexerFontSize')
          .id('arcIndexerFontSize')

        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 0 })
          .popupBackgroundBlurStyle(BlurStyle.Regular)
          .key('arcIndexerBlurRegular')
          .id('arcIndexerBlurRegular')

        ArcAlphabetIndexer({ arrayValue: this.letters, selected: 0 })
          .popupBackgroundBlurStyle(BlurStyle.Thick)
          .key('arcIndexerBlurThick')
          .id('arcIndexerBlurThick')
      }.width('100%').padding({ top: '2%', bottom: '2%' })
    }.width('100%').height('100%')
  }
}
