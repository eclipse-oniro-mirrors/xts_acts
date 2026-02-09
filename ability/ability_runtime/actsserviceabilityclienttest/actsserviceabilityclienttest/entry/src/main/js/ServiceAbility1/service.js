/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import rpc from '@ohos.rpc';
import particleAbility from '@ohos.ability.particleAbility'
import commonEvent from '@ohos.commonEvent'
var serverSecondBundleName = 'com.amsst.stserviceabilityclient';
var serverSecondAbilityName = 'com.amsst.stserviceabilityclient.ServiceAbility2';
var mConnIdJs;
class StubTest extends rpc.RemoteObject {
    constructor(des) {
        console.info('ACTS_SerivceAbilityServer ====< des = ' + des);
        if (typeof des === 'string') {
            console.info('ACTS_ super');
            super(des);
        } else {
            return null;
        }
    }

    onRemoteRequest(code, data, reply, option) {
        if (code === 1) {
            console.info('ACTS_SerivceAbilityServer ====< onRemoteRequest code = 1');
            let token = data.readInterfaceToken();
            console.log('ACTS_SerivceAbilityServer ====< onRemoteRequest token:' + token);
            let num = data.readInt();
            console.log('ACTS_SerivceAbilityServer ====< onRemoteRequest num:' + num);
            this.method();
            num = num + 777;
            reply.writeInt(num);
        } else {
            console.info('ACTS_SerivceAbilityServer ====< onRemoteRequest code not 1');
        }
        return true;
    }
    method() {
        console.log('ACTS_SerivceAbilityServer ====< method called.');
    }
}

function sleep(delay) {
    let start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > delay) {
            break;
        }
    }
}

export default {
    onStart(want) {
        console.info('ACTS_SerivceAbilityServer 0425 ====>onStart .ts 0851 =' + 
        want + ' , JSON.' + JSON.stringify(want));
        commonEvent.publish('ACTS_SerivceAbilityServer_onStart', (err) => { });
    },
    onStop() {
        console.info('ACTS_SerivceAbilityServer ====<onStop');
        commonEvent.publish('ACTS_SerivceAbilityServer_onStop', (err) => { });
    },
    onCommand(want, restart, startId) {
        console.info('ACTS_SerivceAbilityServer ====>onCommand=' + 
        'JSON(want)=' + JSON.stringify(want) + 
        ' ,restart=' + restart + ' ,startId=' + startId);
        if (want.action === 'ServiceStartService_0900') {
            particleAbility.startAbility(
                {
                    want:
                    {
                        bundleName: serverSecondBundleName,
                        abilityName: serverSecondAbilityName,
                        action: 'ServiceStartService_0900',
                    },
                }
            );
            sleep(600);
        } else if (want.action === 'ServiceStartService_1000') {
            particleAbility.startAbility(
                {
                    want:
                    {
                        bundleName: serverSecondBundleName,
                        abilityName: serverSecondAbilityName,
                        action: 'ServiceStartService_1000',
                    },
                }, (err, data) => {
                console.info('ACTS_SerivceAbilityServer start Ability 1000 callback=====' + 
                err + ', data= ' + data + ' , JSON.' + JSON.stringify(data));
            });
        } else if (want.action === 'ACTS_JsServiceAbility_1600') {
            // let uri = '';
            try{
              let value = particleAbility.acquireDataAbilityHelper('dataability:///com.example.dataabilityserver_fa.DataAbility');
              commonEvent.publish('ACTS_SerivceAbilityServer_FunctionCallback', {
                parameters: {
                  result: 'success get value'
                }
              }, (err) => {
                console.info('ACTS_SerivceAbilityServer_onCommand publish err=====>' + err?.code);
              });
            } catch(err) {
              console.info('ACTS_SerivceAbilityServer acquireDateHelper callback=====' + 
                err?.code + ' ' + err?.message);
                commonEvent.publish('ACTS_SerivceAbilityServer_FunctionCallback', {
                  parameters: {
                    result: 'fail get value'
                  }
                }, (err) => {
                  console.info('ACTS_SerivceAbilityServer_onCommand publish err=====>' + err?.code);
                });
            }
        } else if (want.action === 'ACTS_JsServiceAbility_1700') {
          try{
            let value = particleAbility.ErrorCode.INVALID_PARAMETER;
            commonEvent.publish('ACTS_SerivceAbilityServer_FunctionCallback', {
              parameters: {
                result: value
              }
            }, (err) => {
              console.info('ACTS_SerivceAbilityServer_onCommand publish err=====>' + err?.code);
              
            });
          } catch(err) {
            console.info('ACTS_SerivceAbilityServer acquireDateHelper callback=====' + 
              err?.code + ' ' + err?.message);
              commonEvent.publish('ACTS_SerivceAbilityServer_FunctionCallback', {
                parameters: {
                  result: 101
                }
              }, (err) => {
                console.info('ACTS_SerivceAbilityServer_onCommand publish err=====>' + err?.code);
                
              });
          }
        } else {
            commonEvent.publish('ACTS_SerivceAbilityServer_onCommand' + '_' + want.action, (err) => {
                if (!err.code) {
                    if (want.action === 'PageStartService_0100' || want.action === 'PageStartService_0200' || 
                    want.action === 'PageStartService_0301' || want.action === 'PageStartService_0401') {
                        console.info('ACTS_SerivceAbilityServer_onCommand 100 200 301 401.=====>' + 
                        want.action);
                    }
                } else {
                    console.info('ACTS_SerivceAbilityServer_onCommand publish err=====>' + err);
                }
            });
        }
    },
    onConnect(want) {
        console.info('ACTS_SerivceAbilityServer ====< onConnect');
        try {
            console.info('ACTS_SerivceAbilityServer ====>onConnect=' + 
            want + ' , JSON.' + JSON.stringify(want));
            commonEvent.publish('ACTS_SerivceAbilityServer_onConnect' + '_' + want.action, (err) => { });
            function onConnectCallback(element, remote) {
                console.info('ACTS_SerivceAbilityServer_onConnectCallback ====> mConnIdJs=' + 
                JSON.stringify(mConnIdJs) + ' , ' + mConnIdJs);
                console.info('ACTS_SerivceAbilityServer_onConnectCallback ====> element=' + 
                JSON.stringify(element) + ' , ' + element);
                console.info('ACTS_SerivceAbilityServer_onConnectCallback ====> remote=' + 
                JSON.stringify(remote) + ' , ' + remote);
            }
            function onDisconnectCallback(element) {
                console.info('ACTS_SerivceAbilityServer_onDisconnectCallback ====> element=' + 
                JSON.stringify(element) + ' , ' + element);
            }
            function onFailedCallback(code) {
                console.info('ACTS_SerivceAbilityServer_onFailedCallback ====> code=' + 
                JSON.stringify(code) + ' , ' + code);
            }
            if (want.action === 'ServiceConnectService_1300' || want.action === 'ServiceConnectService_1400' || 
            want.action === 'ServiceConnectService_1500' || want.action === 'ServiceConnectService_1600') {
                mConnIdJs = particleAbility.connectAbility(
                    {
                        bundleName: serverSecondBundleName,
                        abilityName: serverSecondAbilityName,
                        action: want.action,
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                );
            }
        } catch (err) {
            console.log('ACTS_SerivceAbilityServer ====< error:' + err);
        }
        console.info('ACTS_SerivceAbilityServer ====< onConnect end');
        return new StubTest('connect-test');
    },
    onDisconnect(want) {
        console.info('ACTS_SerivceAbilityServer ====>onDisConnect=' + 
        want + ' , JSON.' + JSON.stringify(want));
        commonEvent.publish('ACTS_SerivceAbilityServer_onDisConnect_' + want.action, (err) => {
            console.info('ACTS_SerivceAbilityServer_onDisConnect ===' + want.action);
        });
        if (want.action === 'ServiceConnectService_1300' || want.action === 'ServiceConnectService_1400' || 
        want.action === 'ServiceConnectService_1500' || want.action === 'ServiceConnectService_1501' || 
        want.action === 'ServiceConnectService_1600' || want.action === 'ServiceConnectService_1601'
        ) {
            particleAbility.disconnectAbility(mConnIdJs, (err) => {
                console.info('=ACTS_SerivceAbilityServer_onDisConnect 13 14 15 16 err====>' +
                ('json err=') + JSON.stringify(err) + ' , ' + want.action);
            });
        }
    },
    onReady() {
        console.info('ACTS_SerivceAbilityServer ====<onReady');
    },
    onReconnect(want) {
        console.info('ACTS_SerivceAbilityServer ====>onReconnect=' + 
        want + ' , JSON.' + JSON.stringify(want));
        commonEvent.publish('ACTS_SerivceAbilityServer_onReconnect' + '_' + want.action, (err) => { });
    },
    OnAbilityConnectDone(element, remoteObject, resultCode) {
        console.info('ACTS_SerivceAbilityServer ====>OnAbilityConnectDone=' + 
        element + ' , JSON.' + JSON.stringify(element) + 
        remoteObject + ' , JSON.' + JSON.stringify(remoteObject) + 
        resultCode + ' , JSON.' + JSON.stringify(resultCode));
        commonEvent.publish('ACTS_SerivceAbilityServer_OnAbilityConnectDone', (err) => { });
    },
};
