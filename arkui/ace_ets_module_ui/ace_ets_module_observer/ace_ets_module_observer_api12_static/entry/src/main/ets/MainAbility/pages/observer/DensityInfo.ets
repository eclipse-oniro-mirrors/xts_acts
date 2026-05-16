'use static';
/**
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

import uiObserver from '@ohos.arkui.observer';
import observer from '@ohos.arkui.observer';
import { Entry, Component, Column, Text, Image, Color, FontWeight, Padding, Button, ClickEvent, ColumnOptions} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DensityInfo1 {
  @State density: number = 0;
  @State message: string = 'start'

  densityUpdateCallback:(info: observer.DensityInfo) => void = (info: observer.DensityInfo) => {
    this.density = info.density;
    this.message = 'later DPI: ' + this.density.toString();
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      Button(this.message).id("DensityInfo_id")
        .onClick((e: ClickEvent) => {
          console.log('++++++++++++++++++++++1')
          this.getUIContext().getUIObserver().onDensityUpdate(this.densityUpdateCallback);
          console.log('++++++++++++++++++++++2')
          this.message = 'DensityInfo succ'
        })
    }
  }
}