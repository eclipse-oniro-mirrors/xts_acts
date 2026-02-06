/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import json from '@ohos.util.json';
import dragController from '@ohos.arkui.dragController';

@Entry
@Component
struct dragSpringLoading {
  @State isPush: boolean = false
  @State isPush1: boolean = false
  @State isChange: boolean = false
  @State isAbort0: boolean = false
  @State isAbort1: boolean = false
  @State isAbort2: boolean = false
  @State isAbort3: boolean = false
  @State isAbort4: boolean = false
  @State isVisible: boolean = false
  @State isUpdate1: boolean = false
  @State isUpdate2: boolean = false
  @State isPopup: boolean = false
  @State isEnable: boolean = true
  @State handlePopup: boolean = false
  @State show: boolean = true
  @State folderSize: number = 50
  @State begin: (number | null | undefined)[] = [0, 10, 1000, -100, null, undefined]
  @State update: (number | null | undefined)[] = [0, 10, 1000, -100, null, undefined]
  @State updateCount: (number | null | undefined)[] = [undefined, 0, 2, 5, -1, null, 1.5, 3]
  @State end: (number | null | undefined)[] = [undefined, 0, 500, 1000, -100, null]
  @State beginIndex0: number = 0
  @State updateIndex0: number = 0
  @State updateCountIndex0: number = 0
  @State endIndex0: number = 0
  @State beginIndex: number = 5
  @State updateIndex: number = 5
  @State updateCountIndex: number = 0
  @State endIndex: number = 0
  @State color1: Color = Color.Pink
  @State beginInfo: string = ''
  @State beginConfig: string = ''
  @State endInfo: string = ''
  @State endConfig: string = ''
  @State cancel: string = ''
  @State currentNotifySequence: number = 100

  build() {
    Scroll() {
      Column({ space: "1%" }) {
        Row() {
          Image($r('app.media.icon'))
            .id('image1')
            .width("25%")
            .height("50%")
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log("Drag Start Image")
            })
            .onDragEnd(() => {
              console.log("Drag End Image")
              this.folderSize = 50
            })
          Column({ space: "1%" }) {
            Text(String(this.currentNotifySequence))
              .id('currentNotifySequence')
              .fontSize(12)
              .width('90%')
              .fontColor(0xCCCCCC)
            Text(this.beginInfo)
              .fontSize(12)
              .id('beginInfo')
              .width('90%')
              .fontColor(0xCCCCCC)
            Text(this.beginConfig)
              .fontSize(12)
              .id('beginConfig')
              .width('90%')
              .fontColor(0xCCCCCC)
            Text(this.endConfig)
              .fontSize(12)
              .id('endConfig')
              .width('90%')
              .fontColor(0xCCCCCC)
            Text(this.cancel)
              .fontSize(12)
              .id('cancel')
              .width('90%')
              .fontColor(0xCCCCCC)
          }.width("65%")
        }.height("20%").width('90%')

        if (this.show) {
          Button('files')
            .id('button1')
            .width("90%")
            .height("20%")
            .enabled(this.isEnable)
            .type(ButtonType.Normal)
            .backgroundColor(Color.Pink)
            .backgroundColor(this.color1)
            .onClick(() => {
              router.pushUrl({ url: "pages/pushPage" })
            })
            .onDragMove((event) => {
            })
            .onDragEnter((event) => {
              console.log("Drag Enter" + json.stringify(event))
            })
            .onDragLeave((event) => {
              console.log("Drag Leave" + json.stringify(event));
            })
            .onDrop((event) => {
              console.log("Drag Drop" + json.stringify(event));
            })
            .onDragSpringLoading((context: SpringLoadingContext) => {
              this.currentNotifySequence = context.currentNotifySequence
              this.cancel = ''
              if (context.state == dragController.DragSpringLoadingState.BEGIN) {
                this.beginConfig = context.currentConfig?.stillTimeLimit + ','
                  + context.currentConfig?.updateInterval + ',' + context.currentConfig?.updateNotifyCount + ','
                  + context.currentConfig?.updateToFinishInterval
                this.beginInfo = "extraInfos totalSize: " + context.dragInfos?.dataSummary?.totalSize + '\n'
                  + " summary: " + context.dragInfos?.dataSummary?.summary + '\n' + "extraInfos:"
                  + context.dragInfos?.extraInfos
                if (this.isAbort0 == true) {
                  context.abort()
                }
                if (this.isUpdate1 == true) {
                  context.updateConfiguration({
                    stillTimeLimit: this.begin[this.beginIndex],
                    updateInterval: this.update[this.updateIndex],
                    updateNotifyCount: this.updateCount[this.updateCountIndex],
                    updateToFinishInterval: this.end[this.endIndex]
                  })
                }

              } else if (context.state == dragController.DragSpringLoadingState.UPDATE) {
                if (context.currentNotifySequence == 1) {
                  this.color1 = Color.Blue
                } else if (context.currentNotifySequence == 2) {
                  this.color1 = Color.Pink
                } else if (context.currentNotifySequence == 3) {
                  this.color1 = Color.Blue
                }

                if (this.isAbort1 == true) {
                  context.abort()
                }
                if (this.isAbort4 == true && context.currentNotifySequence == 2) {
                  context.abort()
                }
                if (this.isChange == true) {
                  this.folderSize = 300
                }
                if (this.isVisible == true) {
                  this.show = false
                }
                if (this.isPopup == true) {
                  this.handlePopup = true
                }
                if (this.isPush1 == true && context.currentNotifySequence == 2) {
                  router.pushUrl({ url: "pages/pushPage" })
                }
                if (this.isUpdate2 == true && context.currentNotifySequence == 1) {
                  context.updateConfiguration({
                    stillTimeLimit: this.begin[this.beginIndex],
                    updateInterval: this.update[this.updateIndex],
                    updateNotifyCount: this.updateCount[this.updateCountIndex],
                    updateToFinishInterval: this.end[this.endIndex]
                  })
                }
              } else if (context.state == dragController.DragSpringLoadingState.END) {
                this.color1 = Color.Pink
                this.endConfig = context.currentConfig?.stillTimeLimit + ','
                  + context.currentConfig?.updateInterval + ','
                  + context.currentConfig?.updateNotifyCount + ','
                  + context.currentConfig?.updateToFinishInterval
                if (this.isAbort2 == true) {
                  context.abort()
                }
                if (this.isPush == true) {
                  router.pushUrl({ url: "pages/pushPage" })
                }
              } else if (context.state == dragController.DragSpringLoadingState.CANCEL) {
                this.color1 = Color.Pink
                this.cancel = "DragSpringLoading cancel"
                if (this.isAbort3 == true) {
                  context.abort()
                }
              }

            },
              {
                stillTimeLimit: this.begin[this.beginIndex0],
                updateInterval: this.update[this.updateIndex0],
                updateNotifyCount: this.updateCount[this.updateCountIndex0],
                updateToFinishInterval: this.end[this.endIndex0]
              }
            )
        }
        Text('isabort()').fontColor(0xCCCCCC).width('90%').height('5%')
        Row() {
          Button('begin: ' + this.isAbort0)
            .id('abortBegin')
            .onClick(() => {
              this.isAbort0 = !this.isAbort0
            })
        }.width('90%').height('5%')

        Text('Update By updateConfiguration').fontColor(0xCCCCCC).width('90%').height('5%')
        Button('threeUpdate: ' + this.isUpdate2)
          .id('updateThree')
          .width('90%')
          .height('5%')
          .type(ButtonType.Normal)
          .fontColor(Color.Black)
          .backgroundColor(Color.Pink)
          .onClick(() => {
            this.isUpdate2 = !this.isUpdate2
            if (this.isUpdate2) {
              this.isUpdate1 = false
            }
          })
        Button('stillTimeLimit: ' + this.begin[this.beginIndex])
          .id('updateStillTimeLimit')
          .width('90%')
          .height('5%')
          .onClick(() => {
            this.beginIndex++
            if (this.beginIndex > 5) {
              this.beginIndex = 0
            }
          })
        Button('updateInterval: ' + this.update[this.updateIndex])
          .id('updateInterval')
          .width('90%')
          .height('5%')
          .onClick(() => {
            this.updateIndex++
            if (this.updateIndex > 5) {
              this.updateIndex = 0
            }
          })
        Button('updateNotifyCount: ' + this.updateCount[this.updateCountIndex])
          .id('updateNotifyCount')
          .width('90%')
          .height('5%')
          .onClick(() => {
            this.updateCountIndex++
            if (this.updateCountIndex > 7) {
              this.updateCountIndex = 0
            }
          })
        Button('updateToFinishInterval: ' + this.end[this.endIndex])
          .id('updateToFinishInterval')
          .width('90%')
          .height('5%')
          .onClick(() => {
            this.endIndex++
            if (this.endIndex > 5) {
              this.endIndex = 0
            }
          })
      }
      .width('90%')
    }
  }
}