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
struct AnimateToImmediatelyNullUndefined {
  @State widthSize: string = '80%';
  @State heightSize: string = '10%'
  @State opacitySize: number = 0;
  private flag: boolean = true;

  build() {
    Column() {
      Column()
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Green)
        .opacity(this.opacitySize)
        .id('columnId')
      Button('change size')
        .id('changeId')
        .height('10%')
        .margin(5)
        .onClick(() => {
          if (this.flag) {
            animateToImmediately({
              delay: 0,
              duration: 1000,
              curve: '',
              finishCallbackType: FinishCallbackType.REMOVED,
            }, () => {
              this.opacitySize = 1;
            })
            this.getUIContext()?.animateTo({
              delay: 1000,
              duration: 1000
            }, () => {
              this.widthSize ='80%';
              this.heightSize = '10%';
            })
          } else {
            animateToImmediately({
              delay: 0,
              duration: 1000,
              finishCallbackType: FinishCallbackType.LOGICALLY,
            }, () => {
              this.widthSize = '80%';
              this.heightSize = '10%';
            })
            this.getUIContext()?.animateTo({
              delay: 1000,
              duration: 1000
            }, () => {
              this.opacitySize = 0;
            })
          }
          this.flag = !this.flag;
        })
      Button('change2')
        .id('change2Id')
        .margin(5)
        .height('10%')
        .onClick(() => {
            animateToImmediately(null, () => {
              this.opacitySize = 1;
            })
            this.getUIContext()?.animateTo({
              delay: 1000,
              duration: 1000
            }, () => {
              this.widthSize = '80%';
              this.heightSize = '20%';
            })
          this.flag = !this.flag;
        })
      Button('change3')
        .id('change3Id')
        .margin(5)
        .height('10%')
        .onClick(() => {
          animateToImmediately(undefined, () => {
            this.opacitySize = 1;
          })
          this.getUIContext()?.animateTo({
            delay: 1000,
            duration: 1000
          }, () => {
            this.widthSize = '80%';
            this.heightSize = '20%';
          })
          this.flag = !this.flag;
        })
      Button('clear')
        .id('clearId')
        .height('10%')
        .onClick(() => {
          this.flag = true;
          this.widthSize = '80%';
          this.heightSize = '10%';
      })
    }.width('100%')
  }
}