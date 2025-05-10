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
var serverBundleName = 'com.amsst.stserviceabilityclient';
var serverAbilityName = 'com.amsst.stserviceabilityclient.ServiceAbility1';
var mConnIdJs;
class StubTest extends rpc.RemoteObject {
    constructor(des) {
        console.info('ACTS_SerivceAbilityServerSecond ====< des = ' + des);
        if (typeof des === 'string') {
            console.info('ACTS_ super');
            super(des);
        } else {
            return null;
        }
    }

    onRemoteRequest(code, data, reply, option) {
        if (code === 1) {
            console.info('ACTS_SerivceAbilityServerSecond ====< onRemoteRequest code = 1');
            let token = data.readInterfaceToken();
            console.log('ACTS_SerivceAbilityServerSecond ====< onRemoteRequest token:' + token);
            let num = data.readInt();
            console.log('ACTS_SerivceAbilityServerSecond ====< onRemoteRequest num:' + num);
            this.method();
            num = num + 777;
            reply.writeInt(num);
        } else {
            console.info('ACTS_SerivceAbilityServerSecond ====< onRemoteRequest code not 1');
        }
        return true;
    }
    method() {
        console.log('ACTS_SerivceAbilityServerSecond ====< method called.');
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default {
    onStart(want) {
        console.debug('ACTS_SerivceAbilityServerSecond ====>onStart=' +
        want + ' , JSON.' + JSON.stringify(want));
        commonEvent.publish('ACTS_SerivceAbilityServerSecond_onStart', (err) => { });
    },
    onStop() {
        console.debug('ACTS_SerivceAbilityServerSecond ====<onStop');
        commonEvent.publish('ACTS_SerivceAbilityServerSecond_onStop', (err) => { });
    },
    onCommand(want, restart, startId) {
        console.debug('ACTS_SerivceAbilityServerSecond ====>onCommand=' + 
        'JSON(want)=' + JSON.stringify(want) +
        ' ,restart=' + restart + ' ,startId=' + startId);
        commonEvent.publish('ACTS_SerivceAbilityServerSecond_onCommand' + '_' + want.action, (err) => {
            console.debug('ACTS_SerivceAbilityServerSecond_onCommand' + '_' + want.action +
            'err: ' + JSON.stringify(err));
        });
        sleep(500);
    },
    onConnect(want) {
        console.info('ACTS_SerivceAbilityServerSecond ====< onConnect');
        try {
            console.debug('ACTS_SerivceAbilityServerSecond ====>onConnect=' +
            want + ' , JSON.' + JSON.stringify(want));
            function onConnectCallback(element, remote) {
                console.debug('ACTS_SerivceAbilityServerSecond_onConnectCallback ====> want.action=' + 
                JSON.stringify(want.action) + ' , ' + want.action);
                console.debug('ACTS_SerivceAbilityServerSecond_onConnectCallback ====> element=' + 
                JSON.stringify(element) + ' , ' + element);
                console.debug('ACTS_SerivceAbilityServerSecond_onConnectCallback ====> remote=' + 
                JSON.stringify(remote) + ' , ' + remote);
                if (want.action === 'ServiceConnectService_1500' || want.action === 'ServiceConnectService_1600') {
                    commonEvent.publish('ACTS_SerivceAbilityServerSecond_onConnect' + '_' + want.action, (err) => {
                        console.debug('publish = ACTS_SerivceAbilityServerSecond_onConnect' + '_' + want.action);
                    });
                }
            }

            function onDisconnectCallback(element) {
                console.debug('ACTS_SerivceAbilityServerSecond_onDisconnectCallback ====> element=' + 
                JSON.stringify(element) + ' , ' + element);
            }

            function onFailedCallback(code) {
                console.debug('ACTS_SerivceAbilityServerSecond_onFailedCallback ====> code=' + 
                JSON.stringify(code) + ' , ' + code);
            }
            if (want.action === 'ServiceConnectService_1500') {
                mConnIdJs = particleAbility.connectAbility(
                    {
                        bundleName: serverBundleName,
                        abilityName: serverAbilityName,
                        action: 'ServiceConnectService_1501',
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                );
            } else if (want.action === 'ServiceConnectService_1600') {
                mConnIdJs = particleAbility.connectAbility(
                    {
                        bundleName: serverBundleName,
                        abilityName: serverAbilityName,
                        action: 'ServiceConnectService_1601',
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                );
            } else if (want.action === 'ServiceConnectService_1590') {
                mConnIdJs = particleAbility.connectAbility(
                    {
                        bundleName: serverBundleName,
                        abilityName: serverAbilityName,
                        action: 'ServiceConnectService_1591',
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                );
            } else {
                commonEvent.publish('ACTS_SerivceAbilityServerSecond_onConnect' + '_' + want.action, (err) => { });
            }
        } catch (err) {
            console.log('ACTS_SerivceAbilityServerSecond ====< error:' + err);
        }
        console.info('ACTS_SerivceAbilityServerSecond ====< onConnect end');
        return new StubTest('connect-test');
    },
    onDisconnect(want) {
        console.debug('ACTS_SerivceAbilityServerSecond ====>onDisConnect=' +
        want + ' , JSON.' + JSON.stringify(want));
        commonEvent.publish('ACTS_SerivceAbilityServerSecond_onDisConnect_' + want.action, (err) => {
            if (err.code) {
                console.debug('ACTS_SerivceAbilityServerSecond_onDisConnect publish err=====>' + err);
            } else {
                console.debug('ACTS_SerivceAbilityServerSecond_onDisConnect =====<' + 
                want.action);
                if (want.action === 'ServiceConnectService_1500' || want.action === 'ServiceConnectService_1501' || 
                want.action === 'ServiceConnectService_1600' || want.action === 'ServiceConnectService_1601' || 
                want.action === 'ServiceConnectService_1590') {
                    particleAbility.disconnectAbility(mConnIdJs, (err) => {
                        console.debug('=ACTS_SerivceAbilityServerSecond_onDisConnect err====>' + 
                        ('json err=') + JSON.stringify(err) + ' , ' + want.action);
                    });
                }
            }
        });
    },
    onReady() {
        console.debug('ACTS_SerivceAbilityServerSecond ====<onReady');
    },
    onReconnect(want) {
        console.debug('ACTS_SerivceAbilityServerSecond ====>onReconnect=' +
        want + ' , JSON.' + JSON.stringify(want));
    },
    OnAbilityConnectDone(element, remoteObject, resultCode) {
        console.debug('ACTS_SerivceAbilityServerSecond ====>OnAbilityConnectDone=' +
        element + ' , JSON.' + JSON.stringify(element) + 
        remoteObject + ' , JSON.' + JSON.stringify(remoteObject) + 
        resultCode + ' , JSON.' + JSON.stringify(resultCode));
        commonEvent.publish('ACTS_SerivceAbilityServerSecond_OnAbilityConnectDone', (err) => { });
    },
};
