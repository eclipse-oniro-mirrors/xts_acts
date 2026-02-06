/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';


@Entry
@Component
struct StartMoving {
  @State message: string = 'startMoving'

  build() {
    Column() {
      Button(this.message).id('startMovingText')
      Blank()
        .id('startMoving')
        .backgroundColor(Color.Gray)
        .size({ width: '80%', height: 200 })
        .hitTestBehavior(HitTestMode.Transparent)
        .onTouch((event: TouchEvent) => {
          if (event.type == TouchType.Down) {
            try {
              window.getLastWindow(getContext(this), (err: BusinessError, windowClass) => {
                windowClass.startMoving().then(() => {
                  this.message = 'startMoving success'
                  console.info('start moving successfully');
                }).catch((err: BusinessError) => {
                  if (err.code == 801) {
                    this.message = 'startMoving 801'
                  }else if (err.code == 1300004) {
                    this.message = 'startMoving 1300004'
                  }
                  console.error('start moving : ' + err.code + ',message:' + err.message)
                })
              })
            } catch (exception) {
              console.error(`Failed to start drag window. Cause code: ${exception.code}, message: ${exception.message}`)
            }
          }
        })
    }
    .height('100%')
    .width('100%')
    .onFocus(() => {
      AppStorage.setOrCreate('pageContext', getContext(this))
    })
  }
}