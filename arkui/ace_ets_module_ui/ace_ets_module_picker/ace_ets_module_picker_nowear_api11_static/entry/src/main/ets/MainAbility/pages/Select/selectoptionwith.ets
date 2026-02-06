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
  OnSelectCallback,
  MenuAlignType,
  OptionWidthMode
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Selectoptionwith {
  @State text: string = "TTTTT1"
  @State index: int = 2
  @State space: number = 8
  @State arrowPosition: ArrowPosition = ArrowPosition.END
  @State text2: string = "TTTTT2"
  @State index2: int = 2
  @State space2: number = 8
  @State arrowPosition2: ArrowPosition = ArrowPosition.END

  build() {
    Column() {
      Select([{ value: 'aaa' },
        { value: 'bbb' },
        { value: 'ccc' },
        { value: 'ddd' }])
        .selected(this.index)
        .width(50)
        .value(this.text)
        .font({ size: 16, weight: 500 })
        .key('selectoption1')
        .fontColor('#182431')
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .space(this.space)
        .arrowPosition(this.arrowPosition)
        .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
        .optionWidth(OptionWidthMode.FIT_CONTENT)
        .optionHeight(100)
        .onSelect((index: int, text?: string | undefined) => {
          console.info('Select:' + index)
          this.index = index;
          if (text) {
            this.text = text;
          }
        } as OnSelectCallback)
      Select([{ value: 'aaa' },
        { value: 'bbb' },
        { value: 'ccc' },
        { value: 'ddd' }])
        .width(500)
        .key('selectoption2')
        .selected(this.index2)
        .value(this.text2)
        .font({ size: 16, weight: 500 })
        .fontColor('#182431')
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .space(this.space2)
        .arrowPosition(this.arrowPosition2)
        .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
        .optionWidth(OptionWidthMode.FIT_TRIGGER)
        .optionHeight(100)
        .onSelect((index2: int, text2?: string | undefined) => {
          console.info('Select:' + index2)
          this.index2 = index2;
          if (text2) {
            this.text2 = text2;
          }
        } as OnSelectCallback)
    }.width('100%')
  }
}