/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[ReuseOptionsTest]';
const DOMAIN = 0xF811;

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Require @Param num: number;
  @Require @Param componentName: string;

  @Local isReuse: string = 'false';

  aboutToRecycle() {
    hilog.info(DOMAIN, TAG, `aboutToRecycle: ${this.componentName}, num: ${this.num}`);
  }

  aboutToReuse() {
    this.isReuse = 'true'
    hilog.info(DOMAIN, TAG, `aboutToReuse: ${this.componentName}, num: ${this.num}`);
  }

  build() {
    Column() {
      Text(`${this.isReuse}`)
        .fontSize(20)
        .id(`text_${this.componentName}_${this.num}`)
    }
    .height('5%')
    .padding(10)
    .backgroundColor('#F0F0F0')
  }
}

@Entry
@ComponentV2
struct ReuseOptionsDynamicReuseIdTest {
  @Local condition1: boolean = true;
  @Local condition2: boolean = false;
  @Local reuseIdValue1: string = 'groupA';

  getReuseId1(): string {
    return this.reuseIdValue1;
  }


  build() {
    Column({ space: 10 }) {
      Text('ReuseOptions Dynamic ReuseId Test')
        .height('5%')
        .margin({ bottom: 20 })

      Button('Toggle Component 1 (Group A)')
        .height('5%')
        .id('button_toggle_1')
        .onClick(() => {
          this.condition1 = !this.condition1;
        })

      Button('Toggle Component 2 (Group B)')
        .height('5%')
        .id('button_toggle_2')
        .onClick(() => {
          this.condition2 = !this.condition2;
        })

      Divider().margin({ top: 10, bottom: 10 })

      if (this.condition1) {
        ReusableV2Component({ num: 1, componentName: 'Component1' })
          .reuse({ reuseId: () => this.getReuseId1() })
      }

      if (this.condition2) {
        ReusableV2Component({ num: 2, componentName: 'Component2' })
          .reuse({ reuseId: () => 'ReusableV2Component' })
      }

      if (this.condition2) {
        ReusableV2Component({ num: 3, componentName: 'Component3' })
          .reuse({ reuseId: () => this.getReuseId1() })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
