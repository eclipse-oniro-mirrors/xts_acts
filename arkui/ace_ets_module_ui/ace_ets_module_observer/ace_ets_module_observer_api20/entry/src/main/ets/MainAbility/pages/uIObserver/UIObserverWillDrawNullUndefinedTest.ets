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

import observer from '@ohos.arkui.observer';

@Entry
@Component
struct UIObserverWillDrawNullUndefinedTest {
  @State message: string = 'start'

  willDrawCallback = () => {
    this.message = 'willDraw callback triggered';
  }

  build() {
    Column() {
      Button('willDraw on').id('willDraw_on_null_id')
        .onClick(() => {
          // 测试 on 方法第一个参数为 null 的情况
          try {
            this.getUIContext().getUIObserver().on(null, this.willDrawCallback);
            AppStorage.setOrCreate('willDraw_on_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_on_null', 'error');
          }

          // 测试 on 方法第一个参数为 undefined 的情况
          try {
            this.getUIContext().getUIObserver().on(undefined, this.willDrawCallback);
            AppStorage.setOrCreate('willDraw_on_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_on_undefined', 'error');
          }
        })
      Button('willDraw off').id('willDraw_off_null_id')
        .onClick(() => {
          // 测试 off 方法第一个参数为 null 的情况
          try {
            this.getUIContext().getUIObserver().off(null);
            AppStorage.setOrCreate('willDraw_off_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_off_null', 'error');
          }

          // 测试 off 方法第一个参数为 undefined 的情况
          try {
            this.getUIContext().getUIObserver().off(undefined);
            AppStorage.setOrCreate('willDraw_off_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_off_undefined', 'error');
          }

          // 测试 off 方法第一个参数为 null，第二个参数为 callback 的情况
          try {
            this.getUIContext().getUIObserver().off(null, this.willDrawCallback);
            AppStorage.setOrCreate('willDraw_off_null_with_callback', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_off_null_with_callback', 'error');
          }

          // 测试 off 方法第一个参数为 undefined，第二个参数为 callback 的情况
          try {
            this.getUIContext().getUIObserver().off(undefined, this.willDrawCallback);
            AppStorage.setOrCreate('willDraw_off_undefined_with_callback', 'success');
          } catch (e) {
            AppStorage.setOrCreate('willDraw_off_undefined_with_callback', 'error');
          }
        })

    }
    .height('100%')
  }
}
