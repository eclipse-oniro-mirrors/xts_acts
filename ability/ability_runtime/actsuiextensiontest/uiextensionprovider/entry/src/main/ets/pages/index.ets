/*
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

import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession'
import IdlServiceExtProxy from '../IdlServiceExt/idl_service_ext_proxy';
import commonEventManager from '@ohos.commonEventManager'
import Logger from '../model/Logger'
import common from '@ohos.app.ability.common';
let context= getContext(this) as common.UIExtensionContext;

const TAG: string = '[UIExtAbility]'
const sleepTimeOne = 1000;
const ERROR_CODE_INVALID_PARAM = '401'
const ERROR_CODE_INTERNAL = '16000050'

let storage = LocalStorage.GetShared();
let failExceptionEvent = 'ACTS_UIExtension_Exception_FailConnect';
let successExceptionEvent = 'ACTS_UIExtension_Exception_SuccessConnect';
let failcount = 0;
@Entry(storage)
@Component
struct Index {
  @State message: string = 'UIExtension'
  private session: UIExtensionContentSession = storage.get<UIExtensionContentSession>('session');

  aboutToAppear() {
	let options = {
      parameters: {
        cacheDir: context.cacheDir,
        tempDir: context.tempDir,
        filesDir: context.filesDir,
        databaseDir: context.databaseDir,
        preferencesDir: context.preferencesDir,
        bundleCodeDir: context.bundleCodeDir,
        distributedFilesDir: context.distributedFilesDir,
        cloudFileDir: context.cloudFileDir,
        stageMode: context.stageMode,
        area: context.area,
        eventHub: context.eventHub
      }
    }
    commonEventManager.publish('0100_UIExtensionAbilityContext', options, (err) => {
      console.log('SUB_AA_Extension_UIServiceExtensionAbility_Context_0100 commonEventManager 0100_UIExtensionAbilityContext');
    })
    let appearEvent = 'ACTS_UIExtension_AboutToAppear';
    let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';
    let reportDrawnCompletedEvent = 'ACTS_UIExtension_ReportDrawnCompleted';
    let sendDataEvent = 'ACTS_UIExtension_SendData';
    let startAbilityEvent1 = 'ACTS_UIExtension_StartAbility_001';
    let startAbilityEvent2 = 'ACTS_UIExtension_StartAbility_002';
    let startAbilityEvent3 = 'ACTS_UIExtension_StartAbility_003';
    let startAbilityEvent4 = 'ACTS_UIExtension_StartAbility_004';

    let startAbilityForResultEvent1 = 'ACTS_UIExtension_StartAbilityForResult_001';
    let startAbilityForResultEvent2 = 'ACTS_UIExtension_StartAbilityForResult_002';
    let startAbilityForResultEvent3 = 'ACTS_UIExtension_StartAbilityForResult_003';
    let startAbilityForResultEvent4 = 'ACTS_UIExtension_StartAbilityForResult_004';

    let connectAbilityEvent = 'ACTS_UIExtension_ConnectAbility';
    let connectExceptionEvent = 'ACTS_UIExtension_Exception_ConnectAbility';
    let disConnectEvent = 'ACTS_UIExtension_DisconnectAbility';
    let sameAppEvent = 'ACTS_UIExtension_SameApp';
    let differentAppEvent = 'ACTS_UIExtension_DifferentApp';
    let MoreParamaterEvent = 'ACTS_UIExtension_MoreParamaterEvent';
    let differentAppEvent002 = 'ACTS_UIExtension_DifferentApp002';
    let differentAppEvent003 = 'ACTS_UIExtension_DifferentApp003';
    let differentAppEvent004 = 'ACTS_UIExtension_DifferentApp004';
    let differentAppEvent005 = 'ACTS_UIExtension_DifferentApp005';
    let differentAppEvent006 = 'ACTS_UIExtension_DifferentApp006';
    let differentAppEvent008 = 'ACTS_UIExtension_DifferentApp008';
    let differentAppEvent010 = 'ACTS_UIExtension_DifferentApp010';
    let deviceEvent01 = 'ACTS_UIExtension_Device_Event_01';
    let deviceEvent02 = 'ACTS_UIExtension_Device_Event_02';
    let startAbilityByTypeEvent001 = 'ACTS_UIExtension_StartAbilityByType001';
    let getUIExtensionWindowProxy001 = 'ACTS_UIExtension_GetUIExtensionWindowProxy001';
    var subscriber;
    var startresult = false;
    var subscribeInfo = {
    events: [startAbilityEvent1, startAbilityEvent2, startAbilityEvent3,
                  startAbilityEvent4, startAbilityForResultEvent1,
                  startAbilityForResultEvent2, startAbilityForResultEvent3,
                  startAbilityForResultEvent4, terminateSelfWithResultEvent, reportDrawnCompletedEvent,
                  MoreParamaterEvent, sendDataEvent,connectAbilityEvent,connectExceptionEvent,disConnectEvent,
                  sameAppEvent,differentAppEvent,differentAppEvent002,differentAppEvent003,
                  differentAppEvent004,differentAppEvent005,differentAppEvent006,
                  differentAppEvent008,differentAppEvent010,deviceEvent01,deviceEvent02,
                  startAbilityByTypeEvent001]
    }
    commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
      console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
      subscriber = data;

      commonEventManager.subscribe(subscriber, async (err, data) => {
        console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
        console.log(TAG + "___get data event ->" + data.event);
        if (data.event == terminateSelfWithResultEvent) {
          this.session.terminateSelfWithResult({
            "resultCode": 0,
            "want": {
              "bundleName": "test"
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
        } else if (data.event == sendDataEvent) {
          this.session.sendData({
            name: {
              last: 'King'
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
        } else if (data.event == "terminateSelfPromise") {
          this.session.terminateSelf().then((data)=>{
            console.log(TAG + "terminateSelfPromise : " + JSON.stringify(data));
          }).catch((err)=>{
            console.log(TAG + "terminateSelfPromise : " + JSON.stringify(err));
          })
        } else if (data.event == reportDrawnCompletedEvent) {
          globalThis.context2.reportDrawnCompleted((err, data) => {
            console.log(TAG + "reportDrawnCompleted : " + JSON.stringify(data));
          });
        } else if (data.event == "terminateSelfCallback") {
          this.session.terminateSelf((err, data)=>{
            console.log(TAG + "terminateSelfCallback : " + JSON.stringify(data));
          })
        } else if (data.event == "setWindowPrivacyModeFalseCallback") {
          this.session.setWindowPrivacyMode(false, (err, data)=>{
            console.log(TAG + "setWindowPrivacyModeFalseCallback : " + JSON.stringify(data));
          })
        } else if (data.event == "setWindowPrivacyModeFalsePromise") {
          this.session.setWindowPrivacyMode(false).then(()=>{
            console.log(TAG + "setWindowPrivacyModeFalsePromise : " + JSON.stringify(data));
          }).catch((err)=>{
            console.log(TAG + "setWindowPrivacyModeFalsePromise : " + JSON.stringify(err));
          })
        } else if(data.event == startAbilityEvent1) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            }, () => {
            console.log(TAG + "====>startAbilityEvent1 end====>" );
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent2) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            },
            {
              windowMode: 0
            }, () => {
            console.log(TAG + "====>startAbilityEvent2 end====>" );
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent3) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            }).then((data)=>{
              console.log(TAG + "====>startAbilityEvent3 end====>");
              console.log(TAG + "====>data is====>" + JSON.stringify(data));
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent4) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            },
            {
              windowMode: 0
           }).then((data)=>{
              console.log(TAG + "====>startAbilityEvent4 end====>");
              console.log(TAG + "====>data is====>" + JSON.stringify(data));
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent1) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            }, (err,data) => {
              console.log(TAG +  "====>startAbilityForResultEvent1 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_001_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_001_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_001_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent2) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            },
            {
              windowMode: 0
            }, (err,data) => {
              console.log(TAG +  "====>startAbilityForResultEvent2 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_002_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_002_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_002_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent3) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            }).then((data) => {
              console.log(TAG +  "====>startAbilityForResultEvent3 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_003_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_003_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_003_OnResult success');
                }
              });
            }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent4) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            },
            {
              windowMode: 0
            }).then((data) => {
              console.log(TAG +  "====>startAbilityForResultEvent4 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_004_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_004_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_004_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if (data.event == connectAbilityEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doConnectAbilityEvent();
        } else if (data.event == MoreParamaterEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doMoreParamaterEvent();
        } else if (data.event == connectExceptionEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doConnectExceptionEvent();
          let waitTime = 1000;
          setTimeout(async () => {
            console.log("timeout failcount = " + failcount);
            if(failcount == 0){
              commonEventManager.publish(successExceptionEvent, (err) => { });
            }else{
              commonEventManager.publish(failExceptionEvent, (err) => { });
            }
          }, waitTime);
        } else if (data.event == disConnectEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDisConnectEvent();
        } else if (data.event == sameAppEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doSameAppEvent();
        } else if (data.event == differentAppEvent) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent();
        } else if (data.event == differentAppEvent002) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent002();
        } else if (data.event == differentAppEvent003) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent003();
        } else if (data.event == differentAppEvent004) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent004();
        } else if (data.event == differentAppEvent005) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent005();
        } else if (data.event == differentAppEvent006) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent006();
        } else if (data.event == differentAppEvent008) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent008();
        } else if (data.event == differentAppEvent010) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent010();
        } else if (data.event == deviceEvent01) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDeviceEvent01();
        } else if (data.event == deviceEvent02) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDeviceEvent02();
        } else if (data.event == startAbilityByTypeEvent001) {
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.startAbilityByTypeEvent001();
        } else if (data.event == getUIExtensionWindowProxy001) {
          let windowProxy = this.session.getUIExtensionWindowProxy();
          console.log(TAG + "UIExtAbility onSessionCreate, windowProxy: " + JSON.stringify(windowProxy));
        }
      });
    }).catch((error) => {
      console.log(TAG + "createSubscriber error : " + JSON.stringify(error));
    })
    setTimeout(async () => {
      commonEventManager.publish(appearEvent, (err) => {
        if (err) {
          Logger.log(TAG + `publish ACTS_UIExtension_AboutToAppear failed, code is ${err.code}, message is ${err.message}`);
        } else {
          Logger.log(TAG + 'publish ACTS_UIExtension_AboutToAppear success');
        }
      });
    }, sleepTimeOne);
  }

  async doConnectAbilityEvent(){
    let successConnectEvent = 'ACTS_UIExtension_SuccessConnect';
    let successConnectEvent2 = 'ACTS_UIExtension_SuccessConnect2';
    let failConnectEvent = 'ACTS_UIExtension_FailConnect';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        console.info('___onConnect callback' + elementName);
        let serviceExtProxy = new IdlServiceExtProxy(remote);
        serviceExtProxy.add(101,202,(errorCode, retVal) => {
          console.info(`ret: ${errorCode}, retVal: ${retVal}`);
          if(retVal === 303){
            commonEventManager.publish(successConnectEvent, (err) => { });
            console.info('___successConnectEvent')
          }else{
            commonEventManager.publish(failConnectEvent, (err) => { });
          }
        });
      },
      onDisconnect(elementName) {
        console.info('___onDisconnect callback')
      },
      onFailed(code) {
        console.info('___onFailed callback')
      }
    }
    let connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400)
    globalThis.context2.disconnectServiceExtensionAbility(connectid, (err) => {
      if (err.code) {
        commonEventManager.publish(failConnectEvent, (err) => { });
        console.info('___failConnectEvent')
      }else{
        commonEventManager.publish(successConnectEvent2, (err) => { });
        console.info('___successConnectEvent2')
      }
    });
  }

  async doMoreParamaterEvent(){
    let successConnectMoreParamater = 'ACTS_UIExtension_Connect_More_Paramater';
    let successDisconnectMoreParamater = 'ACTS_UIExtension_Disconnect_More_Paramater';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        commonEventManager.publish(successConnectMoreParamater, (err) => { });
        console.info('___successConnectMoreParamater')
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    let connectid = globalThis.context2.connectServiceExtensionAbility(want, options,1111);
    await this.sleep(400)
    await globalThis.context2.disconnectServiceExtensionAbility(connectid, (err) => {
      if (err.code) {
      }else{
        commonEventManager.publish(successDisconnectMoreParamater, (err) => { });
        console.info('___successDisconnectMoreParamater')
      }
    },1111);
  }

  doConnectExceptionEvent(){
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
        failcount -= 1;
        console.info("Exception failcount = "+ failcount);
      }
    }
    let newWant;
    this.testParamException(null,options);
    this.testParamException(undefined,options);
    this.testParamException("",options);
    this.testParamException(want,null);
    this.testParamException(want,undefined);
    newWant = {
      "bundleName": "",
      "abilityName": "TestServiceExtAbility"
    };
    this.testParamException(newWant,options);
    newWant = {
      "abilityName": "TestServiceExtAbility"
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": "com.test.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": undefined,
      "abilityName": "TestServiceExtAbility"
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": undefined
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": ""
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "ServiceExtAbility"
    };
    this.testParamException(newWant,options);
    newWant = {
      "bundleName": "com.acts.uiextensionservice",
    };
    this.testParamException(newWant,options);
    try {
      globalThis.context2.connectServiceExtensionAbility(want);
    } catch (error) {
      console.info(error.code +":"+error.message);
      if(error.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failExceptionEvent, (err) => { });
        return;
      }
    }
    try {
      globalThis.context2.connectServiceExtensionAbility(options);
    } catch (error) {
      console.info(error.code +":"+error.message);
      if(error.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failExceptionEvent, (err) => { });
        return;
      }
    }
    try {
      globalThis.context2.connectServiceExtensionAbility(want,options);
    } catch (error) {
      console.info(error.code +":"+error.message);
      if(error.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failExceptionEvent, (err) => { });
        return;
      }
    }
  }

  async doDisConnectEvent(){
    let successDisconnectEvent = 'ACTS_UIExtension_Disconnect_Success';
    let failDisconnectEvent = 'ACTS_UIExtension_Disconnect_Fail';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        console.info('onConnect callback' + elementName);
      },
      onDisconnect(elementName) {
        console.info('onDisconnect callback')
      },
      onFailed(code) {
        console.info('onFailed callback')
      }
    }

    let connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(500);
    globalThis.context2.disconnectServiceExtensionAbility(connectid).then(() => {
      console.info('disconnect success..');
    }).catch((err) => {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      commonEventManager.publish(failDisconnectEvent, (err) => { });
      return;
    });

    await this.sleep(500);
    connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(500);
    globalThis.context2.disconnectServiceExtensionAbility(connectid, (err) => {
      if (err.code) {
        console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
      console.info('disconnectServiceExtensionAbility succeed');
    });

    await this.sleep(500);
    connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(500);
    globalThis.context2.disconnectServiceExtensionAbility(connectid, (err) => {
      if (err.code) {
        console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
      console.info('disconnectServiceExtensionAbility succeed');
    },"extra param");

    await this.sleep(500);
    try {
      globalThis.context2.disconnectServiceExtensionAbility();
      commonEventManager.publish(failDisconnectEvent, (err) => { });
      return;
    } catch (err) {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      if(err.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
    }

    try {
      globalThis.context2.disconnectServiceExtensionAbility(undefined);
      commonEventManager.publish(failDisconnectEvent, (err) => { });
      return;
    } catch (err) {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      if(err.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
    }

    try {
      globalThis.context2.disconnectServiceExtensionAbility(null);
      commonEventManager.publish(failDisconnectEvent, (err) => { });
      return;
    } catch (err) {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      if(err.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
    }

    try {
      globalThis.context2.disconnectServiceExtensionAbility("");
      commonEventManager.publish(failDisconnectEvent, (err) => { });
      return;
    } catch (err) {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      if(err.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
    }

    globalThis.context2.disconnectServiceExtensionAbility(100000000).then(() => {
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
    }).catch((err) => {
      console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      if(err.code != ERROR_CODE_INTERNAL){
        commonEventManager.publish(failDisconnectEvent, (err) => { });
        return;
      }
    });
    commonEventManager.publish(successDisconnectEvent, (err) => { });
  }

  async doSameAppEvent(){
    let successSameAppEvent = 'ACTS_UIExtension_SameApp_Success';
    let successSameAppEvent2 = 'ACTS_UIExtension_SameApp_Success2';
    let successSameAppEvent3 = 'ACTS_UIExtension_SameApp_Success3';
    let failSameAppEvent = 'ACTS_UIExtension_SameApp_Fail';
    let want = {
      "bundleName": "com.acts.uiextensionprovider",
      "abilityName": "TestServiceExtAbility"
    };
    let want2 = {
      "bundleName": "com.acts.uiextensionprovider",
      "abilityName": "SubServiceExtAbility"
    };
    let want3 = {
      "bundleName": "com.acts.uiextensionprovider",
      "abilityName": "MultipServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    let connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400)
    globalThis.context2.disconnectServiceExtensionAbility(connectid, (err) => {
      if (err.code) {
        commonEventManager.publish(failSameAppEvent, (err) => { });
        return;
      }
    });
    await this.sleep(400)
    let connectid1 = globalThis.context2.connectServiceExtensionAbility(want, options);
    let connectid2 = globalThis.context2.connectServiceExtensionAbility(want2, options);
    let connectid3 = globalThis.context2.connectServiceExtensionAbility(want3, options);

    await this.sleep(400)
    await globalThis.context2.disconnectServiceExtensionAbility(connectid1, (err) => {
      console.info('___connectid1 err.code'+ err.code);
      if (err.code) {
        console.error(`___disconnect failed, code is ${err.code}, message is ${err.message}`);
        commonEventManager.publish(failSameAppEvent, (err) => { });
      }else{
        commonEventManager.publish(successSameAppEvent, (err) => { });
      }
    });

    await globalThis.context2.disconnectServiceExtensionAbility(connectid2, (err) => {
      console.info('___connectid2 err.code'+ err.code);
      if (err.code) {
        console.error(`___disconnect, code is ${err.code}, message is ${err.message}`);
        commonEventManager.publish(failSameAppEvent, (err) => { });
      }else{
        commonEventManager.publish(successSameAppEvent2, (err) => { });
      }
    });

    await globalThis.context2.disconnectServiceExtensionAbility(connectid3, (err) => {
      console.info('___connectid3 err.code'+ err.code);
      if (err.code) {
        console.error(`___disconnect failed, code is ${err.code}, message is ${err.message}`);
        commonEventManager.publish(failSameAppEvent, (err) => { });
      }else{
        commonEventManager.publish(successSameAppEvent3, (err) => { });
      }
    });
  }


  async doDifferentAppEvent(){
    let successDifferentAppEvent = 'ACTS_UIExtension_DifferentApp_Success';
    let failDifferentAppEvent = 'ACTS_UIExtension_DifferentApp_Fail';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    let connectid = await globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400);
    await globalThis.context2.disconnectServiceExtensionAbility(connectid).then(() => {
    }).catch((err) => {
      commonEventManager.publish(failDifferentAppEvent, (err) => { });
      return;
    });
    commonEventManager.publish(successDifferentAppEvent, (err) => { });
  }

  async doDifferentAppEvent002(){
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityEvent"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(800);
    globalThis.context2.terminateSelf();
  }

  async doDifferentAppEvent003(){
    let want1 = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "SubServiceExtAbilityEvent"
    };
    let want2 = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "MultipServiceExtAbilityEvent"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want1, options);
    globalThis.context2.connectServiceExtensionAbility(want2, options);
    await this.sleep(800);
    globalThis.context2.terminateSelf();
  }

  async doDifferentAppEvent004(){
    let successDifferentAppEvent004 = 'ACTS_UIExtension_DifferentApp004_Success';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityTerminalSelf"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
        commonEventManager.publish(successDifferentAppEvent004, (err) => { });
      },
      onFailed(code) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400);
  }

  async doDifferentAppEvent005(){
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility005"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    console.info('before connectServiceExtensionAbility');
    let connectid = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400);
    globalThis.context2.disconnectServiceExtensionAbility(connectid).then(() => {
    }).catch((err) => {
      return;
    });
    await this.sleep(400);
  }

  async doDifferentAppEvent006(){
    let successDifferentAppEvent006_visible = 'ACTS_UIExtension_DifferentApp006_visibleSuccess';
    let successDifferentAppEvent006_unvisible = 'ACTS_UIExtension_DifferentApp006_unvisibleSuccess';
    let wantUnvisible = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityUnvisible"
    };
    let optionsUnvisible = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
        commonEventManager.publish(successDifferentAppEvent006_unvisible, (err) => { });
        console.info('successDifferentAppEvent006_unvisible___')
      }
    }
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        commonEventManager.publish(successDifferentAppEvent006_visible, (err) => { });
        console.info('successDifferentAppEvent006_visible___' + elementName);
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
    globalThis.context2.connectServiceExtensionAbility(wantUnvisible, optionsUnvisible);
    await this.sleep(400);
  }

  async doDifferentAppEvent008(){
    let successDifferentAppEvent008_visible = 'ACTS_UIExtension_DifferentApp008_visibleSuccess';
    let successDifferentAppEvent008_unvisible = 'ACTS_UIExtension_DifferentApp008_unvisibleSuccess';
    let wantUnvisible = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityUnvisible"
    };
    let optionsUnvisible = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
        commonEventManager.publish(successDifferentAppEvent008_unvisible, (err) => { });
        console.info('successDifferentAppEvent006_unvisible___')
      }
    }
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        commonEventManager.publish(successDifferentAppEvent008_visible, (err) => { });
        console.info('successDifferentAppEvent006_visible___' + elementName);
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    // ability to the background
    await globalThis.context2.startAbility(
      {
        bundleName: 'com.acts.uiextensionprovider',
        abilityName: 'MainAbility'
      })
    await this.sleep(1000);
    globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400);
    globalThis.context2.connectServiceExtensionAbility(wantUnvisible, optionsUnvisible);
    await this.sleep(400);
  }

  doDifferentAppEvent010(){
    let successDifferentAppEvent010_ext1 = 'ACTS_UIExtension_DifferentApp010_ext1_Success';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        commonEventManager.publish(successDifferentAppEvent010_ext1, (err) => { });
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
  }

  async doDeviceEvent01(){
    let successBackToDesktop = 'ACTS_UIExtension_Success_Back_To_Desktop';
    let failBackToDesktop = 'ACTS_UIExtension_Fail_Back_To_Desktop';
    let canBackToDesktop = 'ACTS_UIExtension_Can_Back_To_Desktop';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        console.log(TAG + '___connect success');
        commonEventManager.publish(canBackToDesktop, (err) => { });
      },
      onDisconnect(elementName) {
        commonEventManager.publish(failBackToDesktop, (err) => { });
      },
      onFailed(code) {
        commonEventManager.publish(failBackToDesktop, (err) => { });
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400)
    setTimeout(async () => {
      commonEventManager.publish(successBackToDesktop, (err) => { });
    }, 200);
  }

  async doDeviceEvent02(){
    let successOffTheScreen = 'ACTS_UIExtension_Success_Off_The_Screen';
    let failOffTheScreen = 'ACTS_UIExtension_Fail_Off_The_Screen';
    let canOffTheScreen = 'ACTS_UIExtension_Can_Off_The_Screen';
    let want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options = {
      onConnect(elementName, remote) {
        console.log(TAG + '___connect success');
        commonEventManager.publish(canOffTheScreen, (err) => { });
      },
      onDisconnect(elementName) {
        console.log(TAG + '___failOffTheScreen Event onDisconnect');
        commonEventManager.publish(failOffTheScreen, (err) => { });
      },
      onFailed(code) {
        console.log(TAG + '___failOffTheScreen Event onFailed');
        commonEventManager.publish(failOffTheScreen, (err) => { });
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400)

    setTimeout(async () => {
      console.log(TAG + '___successOffTheScreen Event');
      commonEventManager.publish(successOffTheScreen, (err) => { });
    }, 200);
  }

  async startAbilityByTypeEvent001() {
    let successStartAbilityByTypeEvent = 'ACTS_UIExtension_SuccessStartAbilityByType';
    let failStartAbilityByTypeEvent = 'ACTS_UIExtension_FailStartAbilityByType';
    console.log(TAG + "start startAbilityByTypeEvent001");
    let wantParam = {}
    let abilityStartCallback = {
      onError: (code, name, message) => {
        commonEventManager.publish(failStartAbilityByTypeEvent, (err) => { });
        console.log(TAG + "code:" + code + "name:" + name + "message:" + message);
      }
    }
    this.session.startAbilityByType("shareerror", wantParam, abilityStartCallback, (err) => {
      if (err) {
        commonEventManager.publish(failStartAbilityByTypeEvent, (err) => { });
        console.error(TAG + "startAbilityByType001 fail, err:" + JSON.stringify(err));
      } else {
        commonEventManager.publish(successStartAbilityByTypeEvent, (err) => { });
        console.log(TAG + "startAbilityByType001 success");
      }
    });
  }

  testParamException(want,options){
    try {
      globalThis.context2.connectServiceExtensionAbility(want, options);
      failcount += 1;
    } catch (error) {
      console.info(error.code +":"+error.message);
      if(error.code != ERROR_CODE_INVALID_PARAM){
        commonEventManager.publish(failExceptionEvent, (err) => { });
        return;
      }
    }
  }

  sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
