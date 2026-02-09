/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct bindSheetType {
  @State isShow: boolean = false
  @State sheetType: SheetType = SheetType.BOTTOM;
  @State sheetTypeValue: string = 'value SheetType:';
  @State widthValue: string = 'value Width:';

  @Builder
  myBuilder() {
    Column({space: 5}) {
      Text(this.sheetTypeValue).id('sheetTypeValue')
      Text(this.widthValue).id('widthValue')
      Button('this.sheetType:' + this.sheetType)
        .id('changeType')
        .onClick(() => {
        this.sheetType = SheetType.POPUP
      })
      Button('Close Model Sheet')
        .id('close')
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('Open Model Sheet')
        .id('btn')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: SheetSize.MEDIUM,
          backgroundColor: Color.Green,
          preferType: this.sheetType,
          onTypeDidChange: (value: SheetType) => {
            this.sheetTypeValue = (`value SheetType:${this.sheetType = value}`)
            console.info(`value SheetType:${this.sheetType = value}`)
          },
          onWidthDidChange: (value: number) => {
            this.widthValue = (`value Width:${value}`)
            console.info(`value Width:${value}`)
          },
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.')
          },
          onAppear: () => {
            console.log('BindSheet onAppear.')
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.')
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.')
          }
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}