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
  Row,
  Text,
  Component,
  Search,
  SymbolGlyph,
  Margin,
  $r,
  ColumnOptions,
  CopyOptions,
  TextArea,
  DragEvent,
  DragItemInfo,
  MarqueeState,
  TextOverflow,
  MarqueeStartPolicy
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct marqueeOptions2 {
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('This is the text with the text overflow set marquee')
        .width(300)
        .borderWidth(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: true,
          fromStart: true,
          step: 6,
          loop: 1,
          delay: 0,
          fadeout: false,
          marqueeStartPolicy: MarqueeStartPolicy.ON_FOCUS
        })
        .onMarqueeStateChange((state: MarqueeState):void => {
          if (state == MarqueeState.START) {
          } else if (state == MarqueeState.BOUNCE) {
            this.text1 = 'MarqueeState.BOUNCE';
          } else if (state == MarqueeState.FINISH) {
            this.text2 = 'MarqueeState.FINISH';
          }
        })
        .defaultFocus(true)
        .focusable(true)

      Text(this.text1).id('marqueeOptionsTest2_text1')
      Text(this.text2).id('marqueeOptionsTest2_text2')
    }
  }
}