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
struct DensityInfoNullIndex {
  @State density: number = 0;
  @State message: string = 'start'

  densityUpdateCallback = (info: observer.DensityInfo) => {
    this.density = info.density;
    this.message = 'later DPI: ' + this.density.toString();
  }

  build() {
    Column() {
      Button('densityUpdate on').id('densityUpdate_on_null_id')
        .onClick(() => {
          // 在回调中测试 null/undefined 参数
          try {
            this.getUIContext().getUIObserver().on(null, this.densityUpdateCallback);
            AppStorage.setOrCreate('densityUpdate_on_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_on_null', 'error');
          }

          try {
            this.getUIContext().getUIObserver()?.on(undefined, this.densityUpdateCallback);
            AppStorage.setOrCreate('densityUpdate_on_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_on_undefined', 'error');
          }
        })
      Button('densityUpdate off').id('densityUpdate_off_null_id')
        .onClick(() => {
          try {
            this.getUIContext().getUIObserver()?.off(null);
            AppStorage.setOrCreate('densityUpdate_off_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_off_null', 'error');
          }

          try {
            this.getUIContext().getUIObserver()?.off(undefined);
            AppStorage.setOrCreate('densityUpdate_off_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_off_undefined', 'error');
          }

          try {
            this.getUIContext().getUIObserver()?.off(null, (info: observer.DensityInfo) => {});
            AppStorage.setOrCreate('densityUpdate_off_null_with_callback', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_off_null_with_callback', 'error');
          }

          try {
            this.getUIContext().getUIObserver()?.off(undefined, (info: observer.DensityInfo) => {});
            AppStorage.setOrCreate('densityUpdate_off_undefined_with_callback', 'success');
          } catch (e) {
            AppStorage.setOrCreate('densityUpdate_off_undefined_with_callback', 'error');
          }
        })

    }
    .height('100%')
  }
}