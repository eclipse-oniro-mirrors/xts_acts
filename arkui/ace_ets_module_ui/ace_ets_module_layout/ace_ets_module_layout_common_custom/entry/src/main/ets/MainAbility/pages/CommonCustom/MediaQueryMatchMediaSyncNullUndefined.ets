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

import { mediaquery } from '@kit.ArkUI';

@Entry
@Component
struct MediaQueryMatchMediaSyncNullUndefined {
  @State color: string = '#DB7093'
  @State text: string = 'Portrait'
  listener: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('');

  onPortrait(mediaQueryResult:mediaquery.MediaQueryResult) {
    if (mediaQueryResult.matches) {
      this.color = '#FFD700'
      this.text = 'Landscape'
    } else {
      this.color = '#DB7093'
      this.text = 'Portrait'
    }
  }

  aboutToAppear() {
    let portraitFunc = (mediaQueryResult: mediaquery.MediaQueryResult): void => this.onPortrait(mediaQueryResult)
    this.listener.on('change', portraitFunc);
  }

  aboutToDisappear() {
    this.listener.off('change');
  }

  build() {
    Column({space:5}) {
      Button('changeNull').onClick(()=>{
        try {
          this.getUIContext().getMediaQuery().matchMediaSync(null)
        } catch(e) {
            console.info('error code is error');
          }
      })
        .height(25)
        .id('MediaQueryMatchMediaSyncNull')
      Button('changeUndefined').onClick(()=>{
        try {
          this.getUIContext().getMediaQuery().matchMediaSync(undefined)
        } catch(e) {
          console.info('error code is error');
        }
      })
        .height(25)
        .id('MediaQueryMatchMediaSyncUndefined')
      Text(this.text).fontSize(24).fontColor(this.color).height(40).id('MediaQueryMatchMediaSyncNullUndefinedText')
    }
    .width('100%').height('100%')
  }
}