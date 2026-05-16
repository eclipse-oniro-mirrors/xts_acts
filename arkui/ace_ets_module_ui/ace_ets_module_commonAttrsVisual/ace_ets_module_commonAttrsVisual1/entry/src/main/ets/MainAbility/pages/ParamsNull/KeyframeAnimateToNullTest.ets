/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct keyframeAnimateToIndex {

  @State widthSize: number = 250;
  @State heightSize: number = 100;

  build() {
    Column() {
      Button('keyframeAnimateTo 1 null')
        .id('btn_keyframeAnimateTo1_null')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.keyframeAnimateTo(null, [
            {
              duration: 800,
              event: () => {
              }
            }]);
          console.info('keyframeAnimateTo null 1 success');
          AppStorage.SetOrCreate('keyframeAnimateTo1Null', 'success');
        })

      Button('keyframeAnimateTo 2 null')
        .id('btn_keyframeAnimateTo2_null')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.keyframeAnimateTo({
            iterations: 3,
            expectedFrameRateRange: {
              min: 10,
              max: 120,
              expected: 60,
            }
          }, null);
          console.info('keyframeAnimateTo null 2 success');
          AppStorage.SetOrCreate('keyframeAnimateTo2Null', 'success');
        })

      Button('keyframeAnimateTo 1 undefined')
        .id('btn_keyframeAnimateTo1_undefined')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.keyframeAnimateTo(undefined, []);
          console.info('keyframeAnimateTo undefined 1 success');
          AppStorage.SetOrCreate('keyframeAnimateTo1Undefined', 'success');
        })

      Button('keyframeAnimateTo 2 undefined')
        .id('btn_keyframeAnimateTo2_undefined')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.keyframeAnimateTo({
            iterations: 3,
            expectedFrameRateRange: {
              min: 10,
              max: 120,
              expected: 60,
            }
          }, undefined);
          console.info('keyframeAnimateTo undefined 2 success');
          AppStorage.SetOrCreate('keyframeAnimateTo2Undefined', 'success');
        })

    }
    .width('100%')
    .height('100%')
  }
}