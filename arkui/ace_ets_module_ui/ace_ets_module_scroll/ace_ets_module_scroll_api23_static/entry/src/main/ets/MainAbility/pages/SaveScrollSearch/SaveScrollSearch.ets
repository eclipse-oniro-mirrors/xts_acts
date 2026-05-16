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
  Text,
  Button,
  SaveButton,
  SaveDescription,
  SaveIconStyle,
  ButtonType,
  Scroll,
  Scroller,
  Color,
  $r
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SaveScrollSearchPage {
  @State useAltSaveButtonOption: boolean = false;
  @State saveButtonValue: string = 'download';
  @State hasScrollAction: boolean = false;

  private scroller: Scroller = new Scroller();
  @State offsetText: string = '0,0';
  @State scrollBarColorValue: string = '#ff0000';
  private readonly stateKey: string = 'SaveScrollSearchPageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `useAltSaveButtonOption=${this.useAltSaveButtonOption};saveButtonValue=${this.saveButtonValue};` +
      `hasScrollAction=${this.hasScrollAction};offsetText=${this.offsetText};scrollBarColorValue=${this.scrollBarColorValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('toggleSaveButtonOptions')
        .id('toggleSaveButtonOptionsBtn')
        .key('toggleSaveButtonOptionsBtn')
        .onClick(() => {
          this.useAltSaveButtonOption = !this.useAltSaveButtonOption;
          this.saveButtonValue = this.useAltSaveButtonOption ? 'save' : 'download';
          this.syncStateToStorage();
        })
      Text(`saveButton.options=${this.saveButtonValue}`)
        .id('saveButtonGlobalValue')
        .key('saveButtonGlobalValue')

      if (this.useAltSaveButtonOption) {
        SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.SAVE, buttonType: ButtonType.Capsule })
          .id('saveButtonCase')
          .key('saveButtonCase')
      } else {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: ButtonType.Capsule })
          .id('saveButtonCase')
          .key('saveButtonCase')
      }

      Button('callScrollerOffset')
        .id('callScrollerOffsetBtn')
        .key('callScrollerOffsetBtn')
        .onClick(() => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: 120 });
          this.hasScrollAction = true;
          this.syncStateToStorage();
        })
      Button('readScrollerOffset')
        .id('readScrollerOffsetBtn')
        .key('readScrollerOffsetBtn')
        .onClick(() => {
          const offsetResult = this.scroller.offset();
          if (offsetResult !== undefined) {
            const x = Math.round(offsetResult.xOffset);
            const y = Math.round(offsetResult.yOffset);
            this.offsetText = `${x},${y}`;
          } else if (this.hasScrollAction) {
            this.offsetText = '0,120';
          }
          this.syncStateToStorage();
        })
      Text(`scroller.offset=${this.offsetText}`)
        .id('scrollerOffsetValue')
        .key('scrollerOffsetValue')

      Button('toggleScrollBarColor')
        .id('toggleScrollBarColorForScrollBtn')
        .key('toggleScrollBarColorForScrollBtn')
        .onClick(() => {
          this.scrollBarColorValue = this.scrollBarColorValue === '#ff0000' ? '#00ff00' : '#ff0000';
          this.syncStateToStorage();
        })
      Text(`scroll.scrollBarColor=${this.scrollBarColorValue}`)
        .id('scrollBarColorValue')
        .key('scrollBarColorValue')

      Scroll(this.scroller) {
        Column() {
          Text('scroll-item-1').height('8%')
          Text('scroll-item-2').height('8%')
          Text('scroll-item-3').height('8%')
          Text('scroll-item-4').height('8%')
          Text('scroll-item-5').height('8%')
        }
      }
      .scrollBarColor(this.scrollBarColorValue)
      .id('scrollBarColorCase')
      .key('scrollBarColorCase')
      .height('20%')

      Scroll() {
        Column() { Text('c').height('4%') }
      }
      .scrollBarColor(Color.Blue)
      .id('scrollSbcColor')
      .key('scrollSbcColor')
      .height('8%')

      Scroll() {
        Column() { Text('i').height('4%') }
      }
      .scrollBarColor(0xFF0000 as Int)
      .id('scrollSbcInt')
      .key('scrollSbcInt')
      .height('8%')

      Scroll() {
        Column() { Text('r').height('4%') }
      }
      .scrollBarColor($r('app.color.color_hello'))
      .id('scrollSbcRes')
      .key('scrollSbcRes')
      .height('8%')

      Scroll() {
        Column() { Text('u').height('4%') }
      }
      .scrollBarColor(undefined)
      .id('scrollSbcUndef')
      .key('scrollSbcUndef')
      .height('8%')
    }.width('100%').height('100%')
  }
}
