'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Resource,
  FontWeight,
  Color,
  Row,
  $r,
  AlphabetIndexer,
  Margin,
  IndexerAlign,
  Font
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { RecordData } from '@ohos.base';

@Component
@Entry
struct AlphabetIndexerTestux {
  private arrayA: string[] = ['安', '爱', '奥']
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private arrayH: string[] = ['韩', '何', '郝', '黑']
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢']
  private arrayT: string[] = ['太', '天', '田', '唐', '陶', '汤']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
  @State popupSelectedColorStr: string = '#00FF00'
  @State popupUnselectedColorStr: string = '#DA70D6'
  @State popupItemBackgroundStr: string = '#FFD700'
  @State popupItemFontSizeStr: string = '20'
  @State popupItemFontWeightStr: string = '400'
  @State popupSpaceStr: string = '120'
  @State popupSelectedColor: Color = Color.Orange
  @State popupUnselectedColor: Color = Color.Green
  @State popupItemBackgroundColor: Color = Color.Pink
  @State popupSelectedColorNum: number = 0x00CED1
  @State popupUnselectedColorNum: number = 0xC0FF3E
  @State popupItemBackgroundNum: number = 0x8470FF
  @State popupItemFontSizeNum: number = 30
  @State popupItemFontWeightNum: FontWeight = FontWeight.Normal
  @State popupSpaceNum: number = 50
  @State popupSelectedColorRes: Resource = $r('app.color.popupSelectedColor')
  @State popupUnselectedColorRes: Resource = $r('app.color.popupUnselectedColor')
  @State popupItemBackgroundRes: Resource = $r('app.color.popupItemBackground')
  @State popupItemFontSizeRes: Resource = $r('app.string.fontSize')
  @State popupSpaceRes: Resource = $r('app.string.popupSpace')
  @State popupItemFontWeightFont: FontWeight = FontWeight.Bolder
  @State nullFlag1: boolean = false
  @State nullFlag2: boolean = false
  @State nullFlag3: boolean = false
  @State nullFlag4: boolean = false
  @State nullFlag5: boolean = false
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("sideBar page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>;

      if (data['popupSelectedColorStr'] != null) {
        this.popupSelectedColorStr = data['popupSelectedColorStr'] as string
      }
      if (data['popupUnselectedColorStr'] != null) {
        this.popupUnselectedColorStr = data['popupUnselectedColorStr'] as string;
      }
      if (data['popupItemBackgroundStr'] != null) {
        this.popupItemBackgroundStr = data['popupItemBackgroundStr'] as string;
      }
      if (data['popupItemFontSizeStr'] != null) {
        this.popupItemFontSizeStr = data['popupItemFontSizeStr'] as string;
      }
      if (data['popupItemFontWeightStr'] != null) {
        this.popupItemFontWeightStr = data['popupItemFontWeightStr'] as string;
      }
      if (data['popupSpaceStr'] != null) {
        this.popupSpaceStr = data['popupSpaceStr'] as string;
      }
      if (data['popupSelectedColor'] != null) {
        this.popupSelectedColor = data['popupSelectedColor'] as Color;
      }
      if (data['popupUnselectedColor'] != null) {
        this.popupUnselectedColor = data['popupUnselectedColor'] as Color;
      }
      if (data['popupItemBackgroundColor'] != null) {
        this.popupItemBackgroundColor = data['popupItemBackgroundColor'] as Color;
      }
      if (data['popupSelectedColorNum'] != null) {
        this.popupSelectedColorNum = data['popupSelectedColorNum'] as number;
      }
      if (data['popupUnselectedColorNum'] != null) {
        this.popupUnselectedColorNum = data['popupUnselectedColorNum'] as number;
      }
      if (data['popupItemBackgroundNum'] != null) {
        this.popupItemBackgroundNum = data['popupItemBackgroundNum'] as number;
      }
      if (data['popupItemFontSizeNum'] != null) {
        this.popupItemFontSizeNum = data['popupItemFontSizeNum'] as number;
      }
      if (data['popupSpaceNum'] != null) {
        this.popupSpaceNum = data['popupSpaceNum'] as number;
      }
      if (data['popupSelectedColorRes'] != null) {
        this.popupSelectedColorRes = data['popupSelectedColorRes'] as Resource;
      }
      if (data['popupUnselectedColorRes'] != null) {
        this.popupUnselectedColorRes = data['popupUnselectedColorRes'] as Resource;
      }
      if (data['popupItemBackgroundRes'] != null) {
        this.popupItemBackgroundRes = data['popupItemBackgroundRes'] as Resource;
      }
      if (data['popupItemFontSizeRes'] != null) {
        this.popupItemFontSizeRes = data['popupItemFontSizeRes'] as Resource;
      }
      if (data['popupSpaceRes'] != null) {
        this.popupSpaceRes = data['popupSpaceRes'] as Resource;
      }
      if (data['popupItemFontWeightFont'] != null) {
        this.popupItemFontWeightFont = data['popupItemFontWeightFont'] as FontWeight;
      }
      if (data['nullFlag1'] != null) {
        this.nullFlag1 = data['nullFlag1'] as boolean;
      }
      if (data['nullFlag2'] != null) {
        this.nullFlag2 = data['nullFlag2'] as boolean;
      }
      if (data['nullFlag3'] != null) {
        this.nullFlag3 = data['nullFlag3'] as boolean;
      }
      if (data['nullFlag4'] != null) {
        this.nullFlag4 = data['nullFlag4'] as boolean;
      }
      if (data['nullFlag5'] != null) {
        this.nullFlag5 = data['nullFlag5'] as boolean;
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    console.info("AlphabetIndexerTest about to appear");
  }

  build() {
    Row() {
      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest1')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20 } as Margin)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest2')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index] == 'A') {
            return this.arrayA
          } else if (this.value[index] == 'B') {
            return this.arrayB
          } else if (this.value[index] == 'C') {
            return this.arrayC
          } else if (this.value[index] == 'L') {
            return this.arrayL
          } else if (this.value[index] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceNum)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorNum.toInt())
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorNum.toInt())
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundNum.toInt())
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeNum, weight: this.popupItemFontWeightNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest3')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceStr)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorStr)
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorStr)
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundStr)
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeStr, weight: this.popupItemFontWeightStr } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest4')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceRes)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorRes)
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorRes)
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundRes)
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeRes, weight: this.popupItemFontWeightFont } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest5')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.popupSpaceNum)
        .popupSelectedColor(this.popupSelectedColor)
        .popupUnselectedColor(this.popupUnselectedColor)
        .popupItemBackgroundColor(this.popupItemBackgroundColor)
        .popupItemFont({ size: this.popupItemFontSizeNum, weight: this.popupItemFontWeightNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest6')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .popupItemFont({ size: this.popupItemFontSizeNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest7')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: int): Array<String> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: int): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .popupItemFont({ weight: this.popupItemFontWeightNum } as Font)
    }.backgroundColor(0x00FFFF).width('100%').height('100%')
  }
}
