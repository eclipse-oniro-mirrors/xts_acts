
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
 import { UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ApplySync001 {
  @Local w: number = 50;
  @Local h: number = 0;
  @Monitor('w')
  changW() {
    this.h++;
  }

  build() {
    Column() {
      Button('change size')
        .id('ApplySync001_1')
        .height('5%')
        .onClick(() => {
          UIUtils.applySync(() => {
            this.w = 100;
          })
          this.w = 200;
        })
      Text(this.h.toString())
        .id('ApplySync001_2')
        .height('5%')
    }
    .margin({top: '5%'})
    .height('90%')
  }
}