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

import { SwiperDynamicSyncScene } from '@kit.ArkUI';

@Entry
@Component
struct SetFrameRateRangeNullIndex {
  private scenes: SwiperDynamicSyncScene[] = [];

  build() {
    Column() {
      Swiper() {
        Text('one')
        Text('two')
        Text('three')
      }
      .width('100%')
      .height('30%')
      .id('dynamicSwiper')
      .backgroundColor(Color.Blue)
      .autoPlay(true)
      .onAppear(()=>{
        this.scenes = this.getUIContext().requireDynamicSyncScene('dynamicSwiper') as SwiperDynamicSyncScene[];
      })

      Button('set frame')
        .id('btn_setFrameRateRange_null')
        .height('10%')
        .onClick(() => {
          this.scenes.forEach((scenes: SwiperDynamicSyncScene) => {
            try{
              scenes.setFrameRateRange(null);
              console.info('setFrameRateRange null success:');
            } catch (e) {
              console.info('setFrameRateRange null fail');
              AppStorage.SetOrCreate('setFrameRateRangeNull', 'fail');
            }

            try{
              scenes.setFrameRateRange(undefined);
              console.info('setFrameRateRange undefined success:');
            } catch (e) {
              console.info('setFrameRateRange undefined fail');
              AppStorage.SetOrCreate('setFrameRateRangeUndefined', 'fail');
            }
          });
        })
    }
  }
}