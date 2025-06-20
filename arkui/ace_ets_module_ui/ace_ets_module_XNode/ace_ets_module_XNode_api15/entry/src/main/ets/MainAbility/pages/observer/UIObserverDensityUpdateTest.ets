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
struct DensityInfoIndex {
  @State density: number = 0;
  @State densityUpdate1: string = 'start'
  @State densityUpdate2: string = 'start'
  @State message: string = 'start'

  densityUpdateCallback = (info: observer.DensityInfo) => {
    this.density = info.density;
    this.message = 'later DPI: ' + this.density.toString();
  }

  build() {
    Column() {
      Text(this.densityUpdate1).id('densityUpdate1_value_id')
      Text(this.densityUpdate2).id('densityUpdate2_value_id')

      Button('densityUpdate on').id('densityUpdate_on_id')
        .onClick(() => {
          this.getUIContext().getUIObserver().on('densityUpdate', this.densityUpdateCallback);
          this.densityUpdate1 = 'DensityInfo succ';
        })
      Button('densityUpdate off').id("densityUpdate_off_id")
        .onClick(() => {
          this.getUIContext().getUIObserver().off('densityUpdate', this.densityUpdateCallback);
          this.densityUpdate2 = 'DensityInfo succ';
        })

    }
    .height('100%')
  }
}