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

@Entry
@Component
struct AnimateToNullUndefined {
  @State heightSize: string = '20%';
  @State isShow: boolean= true;
  @State count: number= 0;
  private isToBottom: boolean = true; // 向下

  build() {
    Column() {
      if (this.isShow) {
        Column()
          .id('blueId')
          .width('100%')
          .height(this.heightSize)
          .backgroundColor('blue')
          .onClick(() => {
            animateTo({
              duration: 2000,
              curve: '',
              iterations: 1,
              playMode: PlayMode.Normal,
              onFinish: () => {
                this.count--;
              }
            }, () => {
              this.count++;
              if (this.isToBottom) {
                this.heightSize = '10%';
              } else {
                this.heightSize = '20%';
              }
              this.isToBottom = !this.isToBottom;
            })
          })
        Column()
          .id('greenId')
          .width('100%')
          .height(this.heightSize)
          .backgroundColor('green')
          .onClick(() => {
            // 建议使用this.getUIContext()?.animateTo()
            animateTo(null, () => {
              this.count++;
              if (this.isToBottom) {
                this.heightSize = '10%';
              } else {
                this.heightSize = '20%';
              }
              this.isToBottom = !this.isToBottom;
            })
          })
        Column()
          .id('redId')
          .width('100%')
          .height(this.heightSize)
          .backgroundColor('red')
          .onClick(() => {
            // 建议使用this.getUIContext()?.animateTo()
            animateTo(undefined, () => {
              this.count++;
              if (this.isToBottom) {
                this.heightSize = '10%';
              } else {
                this.heightSize = '20%';
              }
              this.isToBottom = !this.isToBottom;
            })
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}