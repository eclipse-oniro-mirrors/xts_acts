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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, ExpectedFrameRateRange } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import displaySync from '@ohos.graphics.displaySync'
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  ds: displaySync.DisplaySync = displaySync.create();
  @State timestamp: Double = 0;
  @State targetTimestamp: Double = 0;
  build() {
    Column(undefined) {
      Text(String(this.timestamp)).id('timestamp');
      Text(String(this.targetTimestamp)).id('targetTimestamp');
      Button('start').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'Start');
          let range: ExpectedFrameRateRange = {
            expected: 60,
            min: 0,
            max: 120
          }
          this.ds.setExpectedFrameRateRange(range);
          this.ds.onFrame((info: displaySync.IntervalInfo) => {
            this.timestamp = info.timestamp;
            this.targetTimestamp = info.targetTimestamp;
          })
          this.ds.start();
        }).id('start')
      Button('stop').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'Stop');
          this.ds.offFrame();
          this.ds.stop();
        }).id('stop')
    }
  }
}
