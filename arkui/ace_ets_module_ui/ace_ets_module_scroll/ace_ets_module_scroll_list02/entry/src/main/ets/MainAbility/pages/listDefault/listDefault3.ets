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
struct ListNullUndefined3 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column() {
        // ========== friction tests ==========
        Text('friction')
        Row() {
          // Test friction default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_friction_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test friction with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_friction_null')
          .friction(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test friction with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_friction_undefined')
          .friction(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== childrenMainSize tests ==========
        Text('childrenMainSize')
        Row(){
          // Test childrenMainSize default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_childrenMainSize_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test childrenMainSize with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_childrenMainSize_null')
          .childrenMainSize(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test childrenMainSize with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_childrenMainSize_undefined')
          .childrenMainSize(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== maintainVisibleContentPosition tests ==========
        Text('maintainVisibleContentPosition')
        Row() {
          // Test maintainVisibleContentPosition default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_maintainVisibleContentPosition_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test maintainVisibleContentPosition with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_maintainVisibleContentPosition_null')
          .maintainVisibleContentPosition(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test maintainVisibleContentPosition with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_maintainVisibleContentPosition_undefined')
          .maintainVisibleContentPosition(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== focusWrapMode tests ==========
        Text('focusWrapMode')
        Row() {
          // Test focusWrapMode default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_focusWrapMode_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test focusWrapMode with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_focusWrapMode_null')
          .focusWrapMode(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test focusWrapMode with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_focusWrapMode_undefined')
          .focusWrapMode(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== syncLoad tests ==========
        Text('syncLoad')
        Row() {
          // Test syncLoad default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_syncLoad_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test syncLoad with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_syncLoad_null')
          .syncLoad(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test syncLoad with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_syncLoad_undefined')
          .syncLoad(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== editModeOptions tests ==========
        Text('editModeOptions')
        Row() {
          // Test editModeOptions default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editModeOptions_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test editModeOptions with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editModeOptions_null')
          .editModeOptions(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test editModeOptions with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editModeOptions_undefined')
          .editModeOptions(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== onItemDelete tests ==========
        Text('onItemDelete')
        Row() {
          // Test onItemDelete return false
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_onItemDelete_return_false')
          .editMode(true)
          .onItemDelete((index: number) => {
            console.info('onItem return onItemDelete: succ')
            console.info('onItem return onItemDelete index: ' + index)
            return false
          })
          .width('90%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== onItemMove tests ==========
        Text('onItemMove')
        Row() {
          // Test onItemMove return false
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_onItemMove_return_false')
          .onItemMove((from: number, to: number) => {
            console.info('onItem return onItemMove: succ')
            console.info('onItem return onItemMove: from: ' + from + ' to: ' + to)
            return false
          })
          .width('90%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}