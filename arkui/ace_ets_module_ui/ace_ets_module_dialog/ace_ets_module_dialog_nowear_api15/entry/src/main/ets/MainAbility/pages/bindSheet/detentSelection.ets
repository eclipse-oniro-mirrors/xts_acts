/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
struct detentSelection {
  @State isShow: boolean = false
  @State detentSelection: SheetSize | number = SheetSize.MEDIUM;
  @State value: number = 0

  @Builder
  myBuilder() {
    Column({ space: 5 }) {
      Text('' + this.value)
        .id('text')
      Button('Change detent -10')
        .id('changeBtn')
        .onClick(() => {
          this.detentSelection = -10;
        })
      Button('Change detent to Large')
        .id('changedetent')
        .onClick(() => {
          this.detentSelection = SheetSize.LARGE;
        })
      Button('关闭模态框')
        .id('close')
        .onClick(() => {
          this.isShow = false
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Column({ space: 5 }) {
      Button('Open Sheet')
        .id('bindSheet')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet(this.isShow!!, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.FIT_CONTENT, SheetSize.LARGE],
          preferType: SheetType.BOTTOM,
          detentSelection: this.detentSelection,
          onAppear: () => {
            console.log('BindSheet onAppear.')
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.')
          },
          onDetentsDidChange: (value: number) => {
            this.value = value
            console.log('BindSheet onDetentsDidChange.' + value)
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}