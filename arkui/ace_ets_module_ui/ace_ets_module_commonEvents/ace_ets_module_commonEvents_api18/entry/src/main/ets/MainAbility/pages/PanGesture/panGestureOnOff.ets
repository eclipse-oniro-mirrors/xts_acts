/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

import { uiObserver } from '@kit.ArkUI';
import router from '@ohos.router';

let TEST_TAG: string = 'node'

function callbackFunc() {
  AppStorage.setOrCreate('callbackFunc', 'callbackFunc')
}

function afterPanCallBack() {
  AppStorage.setOrCreate('callbackFunc', AppStorage.get('callbackFunc') + '_afterPanCallBack')
}

function beforeEndCallBack() {
  AppStorage.setOrCreate('callbackFunc', AppStorage.get('callbackFunc') + '_beforeEndCallBack')
}

function afterEndCallBack() {
  AppStorage.setOrCreate('callbackFunc', AppStorage.get('callbackFunc') + '_afterEndCallBack')
}

@Entry
@Component
struct ListExample {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  private listData: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.All });

  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.on('beforePanStart', callbackFunc);
    observer.on('afterPanStart', afterPanCallBack);
    observer.on('beforePanEnd', beforeEndCallBack);
    observer.on('afterPanEnd', afterEndCallBack)
  }

  aboutToDisappear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.off('beforePanStart', () =>{
      console.log('bxq off ==> beforePanStart');
    })
    observer.off('afterPanStart', () =>{
      console.log('bxq off ==> afterPanStart');
    })
    observer.off('beforePanEnd', () =>{
      console.log('bxq off ==> beforePanEnd');
    })
    observer.off('afterPanEnd', () =>{
      console.log('bxq off ==> afterPanEnd');
    })

  }
  build() {
    Scroll() {
        List({ space: 20, initialIndex: 0 }) {
            ForEach(this.listData, (item: number) => {
            ListItem() {
                Text('' + item)
                .width('100%')
                .height('50%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
            .id(`item${item}`)
                .gesture(
                    PanGesture(this.panOption)
                    .tag('tag0')
                    .onActionStart((event: GestureEvent) => {
                        console.info('bxq Pan start')
                        console.info('bxq Pan Start id ' + event.target.id)
                    })
                    .tag('tag1')
                    .onActionUpdate((event: GestureEvent) => {
                        if (event) {
                        this.offsetX = this.positionX + event.offsetX
                        this.offsetY = this.positionY + event.offsetY
                        }
                    })
                    .tag('tag2')
                    .onActionEnd((event: GestureEvent) => {
                        console.info('bxq Pan end')
                        console.info('bxq Pan End id ' + event.target.id)
                    })
                )
            .customProperty('customData', '这是一个自定义属性的值'); // 设置自定义属性
            }, (item: string) => item)
        }
        .width('100%')
        .height('100%')
        .backgroundColor(0xDCDCDC)
        .padding({ top: 5 })
    }.id('panGesture_on_beforePanStart_scroll_id')
  }
}