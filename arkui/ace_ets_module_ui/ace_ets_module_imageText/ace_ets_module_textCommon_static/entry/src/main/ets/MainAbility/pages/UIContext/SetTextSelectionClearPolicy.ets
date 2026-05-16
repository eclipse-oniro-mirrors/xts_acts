'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { TextSelectionClearPolicy } from '@ohos.arkui.UIContext'
import {
  Entry,
  Component,
  State,
  UIContext,
  Column,
  Text,
  FontWeight,
  Row,
  Divider,
  CopyOptions,
  Color,
  FlexAlign,
  Button,
  ColumnOptions,
  RowOptions,
} from '@kit.ArkUI';

@Entry
@Component
struct SetTextSelectionClearPolicy {
  @State selectionStart: number = -1;
  @State selectionEnd: number = -1;
  @State selectionChangeCount: number = 0;
  @State currentPolicy: string = 'KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
  @State testText: string = 'This is test text for selection. Please long press to select.';
  uiContext: UIContext | undefined = undefined;

  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('setTextSelectionClearPolicy Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row(){
        Text(`Current Policy: ${this.currentPolicy}`)
          .id('text_current_policy')
          .width('30%')
          .clip(true)

        Text(`Selection: [${this.selectionStart}, ${this.selectionEnd}]`)
          .id('text_selection_range')
          .width('30%')

        Text(`Change Count: ${this.selectionChangeCount}`)
          .id('text_selection_count')
          .width('30%')
      }.height('5%')
      Divider()
      Text(this.testText)
        .id('text_selectable')
        .fontSize(16)
        .copyOption(CopyOptions.LocalDevice)
        .width('90%')
        .height('5%')
        .border({ width: 1, color: Color.Blue })
        .padding(10)
        .onTextSelectionChange((start: Int, end: Int) => {
          this.selectionStart = start;
          this.selectionEnd = end;
          this.selectionChangeCount++;
        })
      Divider()
      Column() {
        Text('External Touch Area')
          .fontSize(16)
          .fontColor(Color.Gray)
      }
      .id('external_touch_area')
      .width('90%')
      .height('5%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)
      Divider()
      Row({ space: 10 } as RowOptions) {
        Button('Set CLEAR_SELECTED_TEXT')
          .id('btn_clear_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(
              TextSelectionClearPolicy.CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH
            );
            this.currentPolicy = 'CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
            this.selectionChangeCount = 0;
          })

        Button('Set KEEP_SELECTED_TEXT')
          .id('btn_keep_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(
              TextSelectionClearPolicy.KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH
            );
            this.currentPolicy = 'KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
            this.selectionChangeCount = 0;
          })
      }
      .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}