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

import { ProgressButtonV2, ProgressButtonV2Color } from '@ohos.arkui.advanced.ProgressButtonV2';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';

@Entry
@ComponentV2
struct ProgressButtonV2Example {
  @Local progressIndex1: number = 0;
  @Local textState1: string = '下载';
  @Local buttonWidth: LengthMetrics = LengthMetrics.vp(200);
  @Local isRunning1: boolean = false;
  @Local enableState1: boolean = true;
  @Local value: number = 0;
  @Local colorOptions1: ProgressButtonV2Color = new ProgressButtonV2Color({
    progressColor: ColorMetrics.resourceColor(Color.Gray),
    borderColor: ColorMetrics.resourceColor(Color.Blue),
    textColor: ColorMetrics.resourceColor(Color.Black),
    backgroundColor: ColorMetrics.resourceColor(Color.Transparent),
  });

  build() {
    Column() {
      Scroll() {
        Column({ space: 20 }) {
          ProgressButtonV2({
            progress: this.progressIndex1,
            progressButtonWidth: this.buttonWidth,
            progressButtonRadius: LengthMetrics.vp(8),
            content: this.textState1,
            isEnabled: this.enableState1,
            colorOptions: this.colorOptions1,
            onClicked: () => {
              if (this.textState1 && !this.isRunning1 && this.progressIndex1 < 100){
                this.textState1 = '继续';
              }
              this.isRunning1 = !this.isRunning1;
              let timer = setInterval(() => {
                if (this.isRunning1) {
                  if (this.progressIndex1 === 100) {
                  } else {
                    this.progressIndex1++
                    if (this.progressIndex1 === 100) {
                      this.textState1 = '已完成';
                      this.enableState1 = false;
                    }
                    console.info(`x progress++ = ${this.progressIndex1}`);
                  }
                } else {
                  console.info(`x isRunning = false`);
                  clearInterval(timer);
                }
              }, 20)
            }
          })
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .margin({ top: 50 })
      }
    }
  }
}