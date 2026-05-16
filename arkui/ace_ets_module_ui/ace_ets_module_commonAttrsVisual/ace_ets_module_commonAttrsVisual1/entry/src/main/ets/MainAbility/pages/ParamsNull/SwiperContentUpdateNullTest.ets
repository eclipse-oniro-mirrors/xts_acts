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
struct SwiperContentUpdateIndex {
  build() {
    Column() {
      Button('onSwiperContentUpdate null')
        .id('btn_onSwiperContentUpdate_null')
        .height('10%')
        .onClick(() => {
          this.getUIContext().getUIObserver().onSwiperContentUpdate(null);
          console.info('onSwiperContentUpdate success');
          AppStorage.SetOrCreate('onSwiperContentUpdateNull', 'success');
        })
      Button('onSwiperContentUpdate undefined')
        .id('btn_onSwiperContentUpdate_undefined')
        .height('10%')
        .onClick(() => {
          this.getUIContext().getUIObserver().onSwiperContentUpdate(undefined);
          console.info('onSwiperContentUpdate success');
          AppStorage.SetOrCreate('onSwiperContentUpdateUndefined', 'success');
        })
      Button('offSwiperContentUpdate null')
        .id('btn_offSwiperContentUpdate_null')
        .height('10%')
        .onClick(() => {
          this.getUIContext().getUIObserver().offSwiperContentUpdate(null);
          console.info('onSwiperContentUpdate success');
          AppStorage.SetOrCreate('offSwiperContentUpdateNull', 'success');
        })
      Button('offSwiperContentUpdate undefined')
        .id('btn_offSwiperContentUpdate_undefined')
        .height('10%')
        .onClick(() => {
          this.getUIContext().getUIObserver().offSwiperContentUpdate(undefined);
          console.info('onSwiperContentUpdate success');
          AppStorage.SetOrCreate('offSwiperContentUpdateUndefined', 'success');
        })
    }
    .width('100%')
    .height('100%')
  }
}