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

import { SegmentButtonV2Items, SegmentButtonV2Item, TabSegmentButtonV2 } from '@ohos.arkui.advanced.SegmentButtonV2'
import { ImageModifier, TextModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'

@Entry
@ComponentV2
struct SegmentButtonV20010 {
  @Local selectedIndex0: number = 0
  @Local selectedIndex1: number = 0
  @Local items: SegmentButtonV2Items = new SegmentButtonV2Items([
    {
      text: 'search',
      icon: $r('sys.media.ohos_ic_public_search_filled'),
      enabled: true,
      textModifier: new TextModifier().fontColor('#FFFFFF00'),
      iconModifier: new ImageModifier().backgroundColor('#FFFFA500'),
      accessibilityText: 'search',
      accessibilityDescription: 'ButtonSearch',
      accessibilityLevel: 'auto'
    },
    {
      text: 'scan',
      icon: $r('sys.media.ohos_ic_public_scan'),
      enabled: false,
      accessibilityText: 'scan',
      accessibilityDescription: 'ButtonScan',
      accessibilityLevel: 'no'
    },
    {
      text: 'share',
      icon: $r('sys.media.ohos_ic_public_share'),
      accessibilityText: 'share',
      accessibilityDescription: 'ButtonShare',
      accessibilityLevel: 'yes'
    },
    {
      text: 'feedback',
      symbol: $r('sys.symbol.fade'),
      symbolModifier: new SymbolGlyphModifier().fontWeight(FontWeight.Bolder),
      accessibilityText: 'feedback',
      accessibilityDescription: 'ButtonFeedback',
      accessibilityLevel: 'no-hide-descendants'
    }
  ])
  @Local segItems: SegmentButtonV2Items = new SegmentButtonV2Items([])
  @Local segItem1: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: 'close1',
      icon: $r('sys.media.ohos_ic_public_close'),
      enabled: true,
      textModifier: new TextModifier().fontColor('#FFFFFF00'),
      iconModifier: new ImageModifier().backgroundColor('#FFFFA500'),
      accessibilityText: 'close1',
      accessibilityDescription: 'ButtonClose1',
      accessibilityLevel: 'auto'
    }
  )
  @Local segItem2: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: 'close2',
      icon: $r('sys.media.ohos_ic_public_close'),
      enabled: false,
      accessibilityText: 'close2',
      accessibilityDescription: 'ButtonClose2',
      accessibilityLevel: 'no-hide-descendants'
    }
  )
  @Local segItem3: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: 'close3',
      icon: $r('sys.media.ohos_ic_public_close'),
      accessibilityText: 'close3',
      accessibilityDescription: 'ButtonClose3',
      accessibilityLevel: 'no'
    }
  )
  @Local segItem4: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: 'close4',
      symbol: $r('sys.symbol.fade'),
      symbolModifier: new SymbolGlyphModifier().fontWeight(FontWeight.Bolder),
      accessibilityText: 'close4',
      accessibilityDescription: 'ButtonClose4',
      accessibilityLevel: 'yes'
    }
  )

  aboutToAppear(): void {
    this.segItems.push(this.segItem1)
    this.segItems.push(this.segItem2)
    this.segItems.push(this.segItem3)
    this.segItems.push(this.segItem4)
  }

  build() {
    Column() {
      Text(this.selectedIndex0.toString())
        .id('tvIndex0')
      Text(this.selectedIndex1.toString())
        .id('tvIndex1')
      TabSegmentButtonV2({
        items: this.items,
        selectedIndex: this.selectedIndex0,
        $selectedIndex: (selectedIndex) => {
          this.selectedIndex0 = selectedIndex
        },
        itemMinFontScale: 0.1,
        itemMaxFontScale: 1
      })
      TabSegmentButtonV2({
        items: this.segItems,
        selectedIndex: this.selectedIndex1,
        onItemClicked: (index: number) => {
          this.selectedIndex1 = index
        }
      })
    }
  }
}