/*
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

@Entry
@Component
struct EnableSound {
  @State status: boolean | undefined |null  = true;
  @State statusList: (boolean | undefined |null )[] = [true, false, undefined, null]; //所有可能的状态
  private statusListIndex: number = 0

  build() {
    Row() {
      Column() {
        Text('添加enableClickSoundEffect属性')
          .fontWeight(FontWeight.Bold)
          .margin(10)
        Button('切换enableClickSoundEffect属性：'+ this.status).id('statusButton')
          .onClick((event: ClickEvent) => {
            this.statusListIndex = (this.statusListIndex + 1) % this.statusList.length
            this.status = this.statusList[this.statusListIndex]
          }).margin(1)
        Button('触发音效').id('enableClickSoundEffect')
          .enableClickSoundEffect(this.status)
          .borderRadius(8)
          .width('40%')
          .margin(10)
          .onClick(() => {
            console.info('Button click success')
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}