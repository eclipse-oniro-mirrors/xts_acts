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
struct AnimateToIndex {

  @State widthSize: number = 250;
  @State heightSize: number = 100;

  build() {
    Column() {
      Button('animateTo null')
        .id('btn_animateTo_null')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.animateTo(null, () => {
            this.widthSize = 150;
            this.heightSize = 60;
          });
          console.info('animateTo null success');
          AppStorage.SetOrCreate('animateToNull', 'success');
        })

      Button('animateTo undefined')
        .id('btn_animateTo_undefined')
        .height('10%')
        .onClick(() => {
          this.getUIContext()?.animateTo(undefined, () => {
            this.widthSize = 150;
            this.heightSize = 60;
          });
          console.info('animateTo undefined success');
          AppStorage.SetOrCreate('animateToUndefined', 'success');
        })
    }
    .width('100%')
    .height('100%')
  }
}