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

import { Animator as animator, AnimatorResult, AnimatorOptions } from '@kit.ArkUI';

@Entry
@Component
struct AnimatorNullUndefinedTest {
  private animatorResult: AnimatorResult | undefined = undefined;
  @State columnWidth: number = 100;
  @State columnHeight: number = 100;
  private defaultOptions: AnimatorOptions = {
    duration: 1500,
    easing: 'ease',
    delay: 0,
    fill: 'forwards',
    direction: 'normal',
    iterations: 1,
    begin: 100,
    end: 200
  };

  aboutToDisappear() {
    this.animatorResult?.finish();
    this.animatorResult = undefined;
  }

  build() {
    Column() {
      // ========== createAnimator tests ==========
      Button('CreateUndefined')
        .id('btn_createAnimator_undefined')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(undefined);
            console.info('[createAnimator_default] SUCCESS', JSON.stringify(this.animatorResult));
          } catch (error) {
            console.info('[createAnimator_default] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')
      Button('CreateNull')
        .id('btn_createAnimator_null')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(null);
            console.info('[createAnimator_default] SUCCESS', JSON.stringify(this.animatorResult));
          } catch (error) {
            console.info('[createAnimator_default] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      // ========== reset tests ==========
      Divider().color(Color.Gray).margin({ top: 10, bottom: 10 })
      Button('ResetUndefined')
        .id('btn_reset_default')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(this.defaultOptions);
            this.animatorResult.reset(null);
            console.info('[reset_default] SUCCESS after create');
          } catch (error) {
            console.info('[reset_default] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Button('ResetNull')
        .id('btn_reset_null')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(this.defaultOptions);
            this.animatorResult.reset(null);
            console.info('[reset_null] SUCCESS after create');
          } catch (error) {
            console.info('[reset_null] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      // ========== setExpectedFrameRateRange tests ==========
      Divider().color(Color.Gray).margin({ top: 10, bottom: 10 })
      Button('SetFrameRateRangeNull')
        .id('btn_setExpectedFrameRateRange_null')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(this.defaultOptions);
            this.animatorResult.setExpectedFrameRateRange(null);
            console.info('[setExpectedFrameRateRange_null] SUCCESS after create');
          } catch (error) {
            console.info('[setExpectedFrameRateRange_null] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      // Test setExpectedFrameRateRange with undefined parameter - using variable
      Button('SetFrameRateRangeUndefined')
        .id('btn_setExpectedFrameRateRange_undefined')
        .onClick(() => {
          try {
            this.animatorResult = this.getUIContext().createAnimator(this.defaultOptions);
            this.animatorResult.setExpectedFrameRateRange(undefined);
            console.info('[setExpectedFrameRateRange_undefined] SUCCESS after create');
          } catch (error) {
            console.info('[setExpectedFrameRateRange_undefined] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      // Animation display column
      Divider().color(Color.Gray).margin({ top: 10, bottom: 10 })

      Column()
        .width(this.columnWidth)
        .height(this.columnHeight)
        .backgroundColor(Color.Red)
        .id('animation_column')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
