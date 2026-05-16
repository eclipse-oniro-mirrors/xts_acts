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
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct showDialogTest {
  build() {
    Column() {
      Row() {
        Button('Dialog')
          .height('8%')
          .id('click')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.Thin,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })

        Button('Dialog1')
          .height('8%')
          .id('click1')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.Regular,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog2')
          .height('8%')
          .id('click2')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FFFFFFFF',
                backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
        Button('Dialog3')
          .height('8%')
          .id('click3')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#00000000',
                backgroundBlurStyle: BlurStyle.Thick,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog4')
          .height('8%')
          .id('click4')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
        Button('Dialog5')
          .height('8%')
          .id('click5')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }

          })

      }

      Row() {
        Button('Dialog6')
          .height('8%')
          .id('click6')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })

        Button('Dialog7')
          .height('8%')
          .id('click7')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.NONE,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog8')
          .height('8%')
          .id('click8')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })

        Button('Dialog9')
          .height('8%')
          .id('click9')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }

      Row() {
        Button('Dialog10')
          .height('8%')
          .id('click10')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })

        Button('Dialog11')
          .height('8%')
          .id('click11')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })
      }
      Row() {
        Button('Dialog12')
          .height('8%')
          .id('click12')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })

        Button('Dialog13')
          .height('8%')
          .id('click13')
          .onClick(() => {
            try {
              promptAction.showDialog({
                title: 'showDialog Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  }
                ],
                backgroundColor: '#FF6582F8',
                backgroundBlurStyle: undefined,
              }, (err, data) => {
                if (err) {
                  console.info('showDialog err: ' + err);
                  return;
                }
                console.info('showDialog success callback, click button: ' + data.index);
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}