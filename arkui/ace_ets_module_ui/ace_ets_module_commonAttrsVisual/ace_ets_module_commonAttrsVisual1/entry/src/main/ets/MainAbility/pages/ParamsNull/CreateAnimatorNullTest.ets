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
struct CreateAnimatorIndex {
  build() {
    Column() {
      Button('createAnimator null undefined')
        .id('btn_createAnimator_null')
        .onClick(() => {
          try {
            this.getUIContext().createAnimator(null);
            console.info('createAnimator null success')
          } catch (e) {
            console.info('createAnimator null :' + e);
            AppStorage.SetOrCreate('createAnimatorNull', 'fail');
          }

          try {
            this.getUIContext().createAnimator(undefined);
            console.info('createAnimator undefined success')
          } catch (e) {
            console.info('createAnimator undefined :' + e);
            AppStorage.SetOrCreate('createAnimatorUndefined', 'fail');
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}