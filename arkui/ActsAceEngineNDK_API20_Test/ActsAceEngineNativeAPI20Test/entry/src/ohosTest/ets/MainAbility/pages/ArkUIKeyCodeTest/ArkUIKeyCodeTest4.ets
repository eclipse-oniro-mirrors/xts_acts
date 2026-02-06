/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import ArkUIkeyCodeNdk from 'libarkuikeycodendk.so'

@Entry
@Component
struct KeyCodeTest4 {
  PAGE_TAG: string = 'KeyCodeTest4';

  build() {
    Row() {
      Column() {
        Button('keyCodeEvent')
          .defaultFocus(true)
          .onKeyEvent((event: KeyEvent)=>{
            ArkUIkeyCodeNdk.InitArkUIKeyMonitor4(event?.keyCode);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}