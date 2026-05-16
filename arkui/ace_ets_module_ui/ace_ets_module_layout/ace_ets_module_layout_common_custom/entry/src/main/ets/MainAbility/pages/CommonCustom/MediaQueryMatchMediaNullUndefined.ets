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

import mediaquery from '@system.mediaquery';

@Entry
@Component
struct MediaQueryMatchMediaNullUndefined {
  @State color: string = '#DB7093'
  @State text: string = 'Portrait'

  build() {
    Column({space:5}) {
      Button('changeNull').onClick(()=>{
        try {
          mediaquery.matchMedia(null)
        } catch(e) {
          console.info('error code is error');
        }
      })
        .height(25)
        .id('MediaQueryMatchMediaNull')
      Button('changeUndefined').onClick(()=>{
        try {
          mediaquery.matchMedia(undefined)
        } catch(e) {
          console.info('error code is error');
        }
      })
        .height(25)
        .id('MediaQueryMatchMediaUndefined')
      Button('StringNull').onClick(()=>{
        try {
          mediaquery.matchMedia('')
        } catch(e) {
          console.info('error code is error');
        }
      })
        .height(25)
        .id('MediaQueryMatchMediaStringNull')

      Text(this.text).fontSize(24).fontColor(this.color).height(25).id('MediaQueryMatchMediaNullUndefinedText')
    }
    .width('100%').height('100%')
  }
}