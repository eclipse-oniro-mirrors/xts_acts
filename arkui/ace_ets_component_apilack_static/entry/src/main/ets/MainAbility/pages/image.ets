'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import Log from '../common/Log';
import events_emitter from '@ohos.events.emitter';
import {
  $rawfile,
  Alignment,
  Color,
  ColorFilter,
  Column,
  Component,
  Entry,
  Image,
  Padding
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ImageExample {
  colorFilterArray: Array<number> = new Array<number>(1, 2, 3)

  build() {
    Column() {
      Column() {
        Column() {
          Image($rawfile('test.png'))
            .width(240).height(240)
            .colorFilter(new ColorFilter(this.colorFilterArray))
            .overlay('colorFilter', { align: Alignment.Bottom, offset: { x: 0, y: -15 } })
        }.border({ color: Color.Black, width: 2 })
      }.width('100%')
    }.padding({ top: 20 } as Padding)
  }
}