/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import Logger from '../../../model/Logger';
import connection from '@ohos.bluetooth.connection';
import emitter from '@ohos.events.emitter';

const TAG: string = 'PinDialog'

@CustomDialog
export struct PinDialog {
  private controller?: CustomDialogController
  private data: connection.PinRequiredParam | null = null
  @State titleText: string = ''
  @State pinCode: string = ''

  @Builder choiceText(message: string, handlerClick) {
    Text(message)
      .width('50%')
      .fontSize(30)
      .textAlign(TextAlign.Center)
      .fontColor('#ff0742ef')
      .onClick(handlerClick)
  }

  aboutToAppear() {
    this.titleText = `"${this.data.deviceId}"要与您配对。请确认此配对码已在"${this.data.deviceId}"上直接显示，且不是手动输入的。`
    this.pinCode = JSON.stringify(this.data.pinCode)
  }

  build() {
    Column({ space: 10 }) {
      Text('蓝牙配对请求')
        .fontSize(30)
        .alignSelf(ItemAlign.Start)
      Text(this.titleText)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 20 })
        .fontSize(21)
      Text(this.pinCode)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'checkbox' })
          .select(false)
          .selectedColor('#ff3d6fb8')
          .key('checkBox')
        Text('配对之后，向所配对设备授予通讯录和通话记录的访问权限')
          .fontSize(15)
          .margin({ left: 3, top: 6 })
      }
      .alignSelf(ItemAlign.Start)
      .width('95%')
      .margin({ top: 5 })

      Row() {
        this.choiceText('取消', () => {
          try {
            connection.setDevicePairingConfirmation(this.data.deviceId, false)
            Logger.info(TAG, `setDevicePairingConfirmation = ${connection.setDevicePairingConfirmation(this.data.deviceId, false)}`)
            this.controller.close()
          } catch (err) {
            Logger.info(TAG, `点击配对` + JSON.stringify(err.message))
          }

        })

        Divider()
          .vertical(true)
          .height(32)

        this.choiceText('配对', () => {
          try {
            connection.setDevicePairingConfirmation(this.data.deviceId, true)
            let eventData: emitter.EventData = {
              data: {
                "id": 11,
                "flag": true,
              }
            };

            let innerEvent: emitter.InnerEvent = {
              eventId: 11,
              priority: emitter.EventPriority.HIGH
            };

            emitter.emit(innerEvent, eventData);
            Logger.info(TAG, `setDevicePairingConfirmation = ${connection.setDevicePairingConfirmation(this.data.deviceId, true)}`)
            this.controller.close()
          } catch (err) {
            Logger.info(TAG, `点击配对` + JSON.stringify(err.message))
          }
        })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .padding(15)
  }
}