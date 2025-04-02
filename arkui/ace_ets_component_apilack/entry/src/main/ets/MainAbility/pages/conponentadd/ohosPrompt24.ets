/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct promptExample {
  @State text: string = 'item1'
  @State color: string = '#000000'

  build() {
    Column() {
      Button('showActionMenu')
        .key('button1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          prompt.showActionMenu({
            title: 'Title Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              },
            ],
            success: function (data) {
              console.log('dialog success callback，click button : ' + data.tapIndex);
              Utils.emitEvent(this.text, 404)
            },
            fail: function (data) {
              console.log('dialog fail callback' + data.errMsg);
            },
          });
        })
      Button('showDialog')
        .key('button2')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          prompt.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              },
            ],
            success: function (data) {
              console.log('dialog success callback，click button : ' + data.index);
              Utils.emitEvent(this.text, 404)
            },
            cancel: function () {
              console.log('dialog cancel callback');
            },
          });
        })
      Button('showActionMenu1')
        .key('button3')
        .backgroundColor('#ffe20b48')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          prompt.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000',
              },
              {
                text: 'button2',
                color: '#000000',
              }
            ],
          })
            .then(data => {
              Utils.emitEvent('sucessful', 422)
              console.info('showDialog success, click button: ' + data.index);
            })
            .catch(err => {
              console.info('showDialog error: ' + err);
            })
        })
      Button('showActionMenu2')
        .key('button6')
        .backgroundColor('#ffe20b48')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          prompt.showActionMenu({
            title: 'showActionMenu Title Info',
            buttons: [
              {
                text: 'item1',
                color: '#666666',
              },
              {
                text: 'item2',
                color: '#000000',
              },
            ]
          })
            .then(data => {
              Utils.emitEvent(this.text, 404)
              console.info('showActionMenu success, click button: ' + data.index);
            })
            .catch(err => {
              console.info('showActionMenu error: ' + err);
            })
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          promptAction.showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: this.text,
                color: this.color,
              },
            ],
          })
            .then(data => {
              console.info('showDialog success, click button: ' + data.tapIndex);
              Utils.emitEvent('sucessful', 422)
            })
            .catch(data => {
              console.info('showDialog error: ' + data.errMsg);
            });
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          try {
            promptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000',
                },
                {
                  text: 'button2',
                  color: '#000000',
                }
              ]
            }, (err, data) => {
              if (err) {
                console.info('showDialog err: ' + err);
                return;
              }
              console.info('showDialog success callback, click button: ' + data.index);
            });
          } catch (error) {
            console.error(`showDialog args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        })
      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          try {
            promptAction.showActionMenu({
              title: 'showActionMenu Title Info',
              buttons: [
                {
                  text: 'item1',
                  color: '#666666',
                },
                {
                  text: 'item2',
                  color: '#000000',
                },
              ]
            })
              .then(data => {
                console.info('showActionMenu success, click button: ' + data.index);
              })
              .catch(err => {
                console.info('showActionMenu error: ' + err);
              })
          } catch (error) {
            console.error(`showActionMenu args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;

        })

      Button('showDialog2')
        .key('button5')
        .backgroundColor('#ffe20b56')
        .fontSize(20)
        .margin({ top: 20 })
        .onClick(() => {
          try {
            promptAction.showActionMenu({
              title: 'showActionMenu Title Info',
              buttons: [
                {
                  text: 'item1',
                  color: '#666666',
                },
                {
                  text: 'item2',
                  color: '#000000',
                },
              ]
            })
              .then(data => {
                console.info('showActionMenu success, click button: ' + data.index);
              })
              .catch(err => {
                console.info('showActionMenu error: ' + err);
              })
          } catch (error) {
            console.error(`showActionMenu args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        })
    }
  }
}