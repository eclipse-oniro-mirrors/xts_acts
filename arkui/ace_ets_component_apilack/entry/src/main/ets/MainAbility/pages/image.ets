/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component

struct ImageExample {
  build() {
    Column() {
      Column() {
        Column() {
          Image($rawfile('test.png'))
            .width(240).height(240)
            .colorFilter([1,2,3])
            .overlay('colorFilter', { align: Alignment.Bottom, offset: { x: 0, y: -15 } })
            .draggable(false)
        }.border({ color: Color.Black, width: 2 })
      }.width('100%')
    }.padding({ top: 20 })
  }
}