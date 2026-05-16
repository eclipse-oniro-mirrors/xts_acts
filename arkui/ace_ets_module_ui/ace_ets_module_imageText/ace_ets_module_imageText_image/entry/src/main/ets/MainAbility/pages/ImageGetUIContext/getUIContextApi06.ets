/**
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

@Entry
@Component
struct getUIContextApi06 {
@State text1: string = '';
@State text2: string = '';
  onPageShow() {
    this.getUIContext().setImageCacheCount(2147483647);
    this.getUIContext().setImageRawDataCacheSize(2147483647);
    console.info('Application onPageShow');
  }
  onDestroy() {
    console.info('Application onDestroy');
  }

  build() {
    Column(){
      Row(){
        Button('setImage')
          .onClick(() => {
            this.getUIContext().setImageCacheCount(2147483647);
            this.getUIContext().setImageRawDataCacheSize(2147483647);
            this.text1 = 'setImageCacheCount = 2147483647'
            this.text2 = 'setImageRawDataCacheSize = 2147483647'
            console.info('Application onPageShow');
          })
          .id('Button001')
          .width('20%')
      }.width('100%')
      Text(this.text1)
        .id('text001')
      Text(this.text2)
        .id('text002')
      Image($r('app.media.icon'))
        .width('10%')
        .height(35)
    }.width('100%').height('100%')
  }
}