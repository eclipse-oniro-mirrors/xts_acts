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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  ArrowPosition,
  Select,
  $r,
  MenuAlignType,
  OnSelectCallback
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct menuBackgroundColorExample {
  @State text: string = "TTTTT"
  @State index: int = 2
  @State space: number = 8
  @State arrowPosition: ArrowPosition = ArrowPosition.END

  build() {
    Column() {
      Select([{ value: 'aaa', icon: $r("app.media.selecticon") },
        { value: 'bbb', icon: $r("app.media.selecticon") },
        { value: 'ccc', icon: $r("app.media.selecticon") },
        { value: 'ddd', icon: $r("app.media.selecticon") }])
        .id("menuBackgroundColor")
        .margin(100)
        .menuBackgroundColor(Color.Gray)
        .selected(this.index)
        .value(this.text)
        .font({ size: 16, weight: 500 })
        .fontColor('#182431')
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .space(this.space)
        .arrowPosition(this.arrowPosition)
        .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
        .optionWidth(200)
        .optionHeight(100)
        .onSelect((index: int, text?: string | undefined) => {
          console.info('Select:' + index)
          this.index = index;
          if (text) {
            this.text = text;
          }
        } as OnSelectCallback)
    }.width('100%')
  }
}