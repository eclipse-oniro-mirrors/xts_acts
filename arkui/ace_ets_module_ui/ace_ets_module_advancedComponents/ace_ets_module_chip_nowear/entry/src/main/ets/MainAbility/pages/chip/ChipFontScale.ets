/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Chip } from '@kit.ArkUI';

@Entry
@Component
struct ChipFontScale {
  build() {
    Column({ space: 10 }) {
      Chip({
        label: {
          text: 'minFontScale:0 maxFontScale:1',
        },
        minFontScale: 0,
        maxFontScale: 1,
      })
      Chip({
        label: {
          text: 'minFontScale:1 maxFontScale:2',
        },
        minFontScale: 1,
        maxFontScale: 2,
      })
      Chip({
        label: {
          text: 'minFontScale:-1 maxFontScale:0',
        },
        minFontScale: -1,
        maxFontScale: 0,
      })


    }
    .height('90%')
    .margin({
      top: '2%',
      bottom: '2%',
      left: '5%',
      right: '5%'
    })

  }
}