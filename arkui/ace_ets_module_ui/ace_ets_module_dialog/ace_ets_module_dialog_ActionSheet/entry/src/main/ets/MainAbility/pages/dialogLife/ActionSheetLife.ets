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
struct ActionSheetExampleB {
  @State actionSheetFlag1: string = 'false';
  @State actionSheetFlag2: string = 'false';
  @State actionSheetFlag3: string = 'false';
  @State actionSheetFlag4: string = 'false';
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
      Button('ActionSheet生命周期').key('ActionSheet')
        .onClick(() => {
          ActionSheet.show({
            title:    'ActionSheet生命周期',
            message:  'ActionSheet生命周期',
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -20 },
            confirm: {
              value: 'button',
              action: () => {
                console.info('ActionSheet Button-clicking callback')
              }
            },
            cancel: () => {
              console.info('ActionSheet Closed callbacks')
            },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('ActionSheet apples')
                }
              }
            ],
            onDidAppear: () => {
              this.actionSheetFlag2 = 'true';
              console.info('ActionSheet,is onDidAppear!')
            },
            onDidDisappear: () => {
              this.actionSheetFlag4 = 'true';
              console.info('ActionSheet,is onDidDisappear!')
            },
            onWillAppear: () => {
              this.actionSheetFlag1 = 'true';
              console.info('ActionSheet,is onWillAppear!')
            },
            onWillDisappear: () => {
              this.actionSheetFlag3 = 'true';
              console.info('ActionSheet,is onWillDisappear!')
            }
          })
        })
      Text(this.actionSheetFlag1).id('actionSheetFlag1')
      Text(this.actionSheetFlag2).id('actionSheetFlag2')
      Text(this.actionSheetFlag3).id('actionSheetFlag3')
      Text(this.actionSheetFlag4).id('actionSheetFlag4')
    }.width('100%')
    .height('100%')
  }
}