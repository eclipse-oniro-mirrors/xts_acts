/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import observer from '@ohos.arkui.observer';

@Entry
@Component
struct WillDrawIndex {
  @State willDraw: string = 'start'

  willDrawCallback = () => {
    this.willDraw = 'WillDraw succ'
  }

  build() {
    Column() {
      Text(this.willDraw).id('willDraw_value_id')

      Button('willDraw on').id('willDraw_on_id')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.getUIContext().getUIObserver().on('willDraw', this.willDrawCallback);
        })
      Button('willDraw off').id('willDraw_off_id')
        .onClick(() => {
          this.getUIContext().getUIObserver().off('willDraw', this.willDrawCallback);
        })
    }
    .height('100%')
  }
}