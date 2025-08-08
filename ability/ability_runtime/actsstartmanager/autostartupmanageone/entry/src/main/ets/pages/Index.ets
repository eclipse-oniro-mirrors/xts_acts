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

import hilog from '@ohos.hilog';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { autoStartupManager, common } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';


@Entry
@Component
struct Index {
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_AutoStartupManageOne_IndexEntry';
  @State message: string = 'message';

  aboutToAppear(): void {
    hilog.info(0x0000, this.TAG, '%{public}s', 'EntryAbility index aboutToAppear');
  }

  onPageShow(): void {
    hilog.info(0x0000, this.TAG, '%{public}s', 'EntryAbility index onPageShow');
  }

  build() {
    Row() {
      Column() {
        Text("AutoStartupManageOne")
          .fontSize(35)
          .fontWeight(FontWeight.Bold)

        Text(this.message)
          .margin({top: 10})

        Button('set_callback')
          .id('setCallbackButton')
          .size({ width: '1%', height: '1%' })
          .onClick(() => {
            try {
              autoStartupManager.setApplicationAutoStartup({
                bundleName: 'com.test.autostartupmanageone',
                abilityName: 'EntryAbility'
              }, (err, data) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] setApplicationAutoStartup callback err: %{public}s', this.TAG, JSON.stringify(err));
                  this.message = 'setApplicationAutoStartup callback err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
                } else {
                  hilog.info(0x0000, this.TAG, '[%{public}s] setApplicationAutoStartup callback succeed.', this.TAG);
                  this.message = 'setApplicationAutoStartup callback succeed.';
                  let options: commonEventManager.CommonEventPublishData = {
                    code: 1,
                    parameters: {
                      'from': 'setCallbackButton',
                      'errCode': 0,
                    }
                  };
                  commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                    if (err) {
                      hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                    } else {
                      hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                    }
                  });
                }
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] setApplicationAutoStartup callback throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'setApplicationAutoStartup callback throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'setCallbackButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('cancel_callback')
          .size({ width: '1%', height: '1%' })
          .id('cancelCallbackButton')
          .onClick(() => {
            try {
              autoStartupManager.cancelApplicationAutoStartup({
                bundleName: 'com.test.autostartupmanageone',
                abilityName: 'EntryAbility'
              }, (err, data) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] cancelApplicationAutoStartup callback err: %{public}s', this.TAG, JSON.stringify(err));
                  this.message = 'cancelApplicationAutoStartup callback err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
                } else {
                  hilog.info(0x0000, this.TAG, '[%{public}s] cancelApplicationAutoStartup callback succeed.', this.TAG);
                  this.message = 'cancelApplicationAutoStartup callback succeed.';
                  let options: commonEventManager.CommonEventPublishData = {
                    code: 1,
                    parameters: {
                      'from': 'cancelCallbackButton',
                      'errCode': 0,
                    }
                  };
                  commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                    if (err) {
                      hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                    } else {
                      hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                    }
                  });
                }
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] cancelApplicationAutoStartup callback throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'cancelApplicationAutoStartup callback throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'cancelCallbackButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('set_promise')
          .size({ width: '1%', height: '1%' })
          .id('setPromiseButton')
          .onClick(() => {
            try {
              autoStartupManager.setApplicationAutoStartup({
                bundleName: 'com.test.autostartupmanageone',
                abilityName: 'EntryAbility'
              }).then((data: void) => {
                hilog.info(0x0000, this.TAG, '[%{public}s] setApplicationAutoStartup promise succeed.', this.TAG);
                this.message = 'setApplicationAutoStartup promise succeed.';
                let options: commonEventManager.CommonEventPublishData = {
                  code: 1,
                  parameters: {
                    'from': 'setPromiseButton',
                    'errCode': 0,
                  }
                };
                commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                  if (err) {
                    hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                  } else {
                    hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                  }
                });
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] setApplicationAutoStartup promise throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'setApplicationAutoStartup promise throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'setPromiseButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('cancel_promise')
          .size({ width: '1%', height: '1%' })
          .id('cancelPromiseButton')
          .onClick(() => {
            try {
              autoStartupManager.cancelApplicationAutoStartup({
                bundleName: 'com.test.autostartupmanageone',
                abilityName: 'EntryAbility'
              }).then((data: void) => {
                hilog.info(0x0000, this.TAG, '[%{public}s] cancelApplicationAutoStartup promise succeed.', this.TAG);
                this.message = 'cancelApplicationAutoStartup promise succeed.';
                let options: commonEventManager.CommonEventPublishData = {
                  code: 1,
                  parameters: {
                    'from': 'cancelPromiseButton',
                    'errCode': 0,
                  }
                };
                commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                  if (err) {
                    hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                  } else {
                    hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                  }
                });
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] cancelApplicationAutoStartup promise throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'cancelApplicationAutoStartup promise throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'cancelPromiseButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('query_callback')
          .size({ width: '1%', height: '1%' })
          .id('queryCallbackButton')
          .onClick(() => {
            try {
              autoStartupManager.queryAllAutoStartupApplications((err, data) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] queryAllAutoStartupApplications callback err: %{public}s', this.TAG, JSON.stringify(err));
                  this.message = 'queryAllAutoStartupApplications callback err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
                } else {
                  hilog.info(0x0000, this.TAG, '[%{public}s] queryAllAutoStartupApplications callback succeed.', this.TAG);
                  this.message = 'queryAllAutoStartupApplications callback succeed.';
                  let options: commonEventManager.CommonEventPublishData = {
                    code: 1,
                    parameters: {
                      'from': 'queryCallbackButton',
                      'errCode': 0,
                    }
                  };
                  commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                    if (err) {
                      hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                    } else {
                      hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                    }
                  });
                }
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] queryAllAutoStartupApplications callback throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'queryAllAutoStartupApplications callback throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'queryCallbackButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('query_promise')
          .size({ width: '1%', height: '1%' })
          .id('queryPromiseButton')
          .onClick(() => {
            try {
              autoStartupManager.queryAllAutoStartupApplications().then((data: common.AutoStartupInfo[]) => {
                hilog.info(0x0000, this.TAG, '[%{public}s] queryAllAutoStartupApplications promise succeed. data: %{public}s', this.TAG, JSON.stringify(data));
                this.message = 'queryAllAutoStartupApplications promise succeed. data: ' + JSON.stringify(data);
                let options: commonEventManager.CommonEventPublishData = {
                  code: 1,
                  parameters: {
                    'from': 'queryPromiseButton',
                    'errCode': 0,
                  }
                };
                commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                  if (err) {
                    hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                  } else {
                    hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                  }
                });
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] queryAllAutoStartupApplications promise throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'queryAllAutoStartupApplications promise throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'queryPromiseButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('on')
          .size({ width: '1%', height: '1%' })
          .id('onButton')
          .onClick(() => {
            try {
              autoStartupManager.on('systemAutoStartup', {
                onAutoStartupOn(data: common.AutoStartupInfo) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager onAutoStartupOn data: %{public}s', this.TAG, JSON.stringify(data));
                },
                onAutoStartupOff(data: common.AutoStartupInfo) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager onAutoStartupOff data: %{public}s', this.TAG, JSON.stringify(data));
                }
              });
              this.message = 'autostartupmanager on succeed.';
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'onButton',
                  'errCode': 0,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager on throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'autostartupmanager on throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'onButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('off')
          .size({ width: '1%', height: '1%' })
          .id('offButton')
          .onClick(() => {
            try {
              autoStartupManager.off('systemAutoStartup', {
                onAutoStartupOn(data: common.AutoStartupInfo) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager onAutoStartupOn data: %{public}s', this.TAG, JSON.stringify(data));
                },
                onAutoStartupOff(data: common.AutoStartupInfo) {
                  hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager onAutoStartupOff data: %{public}s', this.TAG, JSON.stringify(data));
                }
              });
              this.message = 'autostartupmanager off succeed.';
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'offButton',
                  'errCode': 0,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            } catch (err) {
              hilog.info(0x0000, this.TAG, '[%{public}s] autostartupmanager off throw err: %{public}s', this.TAG, JSON.stringify(err));
              this.message = 'autostartupmanager off throw err, code: ' + JSON.stringify(err.code) + ', message: ' + JSON.stringify(err.message);
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'from': 'offButton',
                  'errCode': err.code,
                }
              };
              commonEventManager.publish('catchErrorEvent', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
                }
              });
            }
          })
          .margin({top: 10})

        Button('terminate')
          .size({ width: '1%', height: '1%' })
          .id('terminateButton')
          .onClick(() => {
            try {
              this.context.terminateSelf((err: BusinessError) => {
                if (err.code) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf failed, err: %{public}s", this.TAG, JSON.stringify(err));
                  return;
                }
                hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf succeed", this.TAG);
              });
            } catch (paramErr) {
              hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf failed, paramErr: %{public}s", this.TAG, JSON.stringify(paramErr));
            }
          })
          .margin({top: 10})
      }
      .width('100%')
    }
    .height('100%')
  }
}