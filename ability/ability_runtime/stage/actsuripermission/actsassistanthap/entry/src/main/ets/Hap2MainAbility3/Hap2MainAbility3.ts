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
import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';
import fs from '@ohos.file.fs'

export default class Hap2MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.log('[Demo] Hap2MainAbility3 onCreate')
        globalThis.abilityWant3 = want;
        globalThis.Hap2MainAbility3Context = this.context;

        let eventName : string = 'TerminateSelf_Hap2MainAbility3';
        let subscribeInfo = {
            events: [eventName]
        }

        function SubscribeCallBackContext(err, data) {
            console.log('Subscribe CallBack data:' + JSON.stringify(data));
            if (data.event === eventName) {
                globalThis.Hap2MainAbility3Context.terminateSelf();
            }
        }

        let subscriber_1;
        commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
            subscriber_1 = data;
            console.debug('====>Create Subscriber====>');
            await commonEvent.subscribe(subscriber_1, SubscribeCallBackContext);
        });
    }

    onDestroy() {
        console.log('[Demo] Hap2MainAbility3 onDestroy')
        let eventName2 : string = 'TerminateDone_Hap2MainAbility3';
        commonEvent.publish(eventName2, (err) => {
            console.log('Hap2MainAbility3' + eventName2);
        });
    }

    onNewWant(want, launchParams) {
        globalThis.abilityWant3 = want;
    }

    onWindowStageCreate(windowStage) {
        console.log('[Demo] Hap2MainAbility3 onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/Hap2MainAbility3_pages', null)
    }

    onWindowStageDestroy() {
        console.log('[Demo] Hap2MainAbility3 onWindowStageDestroy')
    }

    onForeground() {
        console.log('[Demo] Hap2MainAbility3 onForeground ' + globalThis.abilityWant3.parameters['number'])
        let uri : string = globalThis.abilityWant3.uri;
        if (uri == null) {
            console.log('[Demo] Hap2MainAbility3 uri is invalid');
            return;
        }
        switch (globalThis.abilityWant3.parameters['number']) {
            case 30: {
                console.log('[Demo] Hap2MainAbility3 enter 30');
                let eventName30_1 : string = 'Temp_UriPermissionTest_0400_Read_Successfully';
                let eventName30_2 : string = 'Temp_UriPermissionTest_0400_Read_Failed';
                fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
                    console.info('file fd: ' + file.fd);
                    commonEvent.publish(eventName30_1, (err) => {
                        console.log('Hap2MainAbility3' + eventName30_1);
                    });
                }).catch((err) => {
                    console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
                    commonEvent.publish(eventName30_2, (err) => {
                        console.log('Hap2MainAbility3' + eventName30_2);
                    });
                });

                let eventName30_3 : string = 'Temp_UriPermissionTest_0400_Write_Successfully';
                let eventName30_4 : string = 'Temp_UriPermissionTest_0400_Write_Failed';
                fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
                    console.info('file fd: ' + file.fd);
                    commonEvent.publish(eventName30_3, (err) => {
                        console.log('Hap2MainAbility3' + eventName30_3);
                    });
                }).catch((err) => {
                    console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
                    commonEvent.publish(eventName30_4, (err) => {
                        console.log('Hap2MainAbility3' + eventName30_4);
                    });
                });
                this.context.terminateSelf();
                break;
            }

            case 31: {
                console.log('[Demo] Hap2MainAbility3 enter 31');
                let eventName31_1 : string = 'Temp_UriPermissionTest_0400_Read_Successfully_';
                let eventName31_2 : string = 'Temp_UriPermissionTest_0400_Read_Failed_';
                fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
                    console.info('file fd: ' + file.fd);
                    commonEvent.publish(eventName31_1, (err) => {
                        console.log('Hap2MainAbility3' + eventName31_1);
                    });
                }).catch((err) => {
                    console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
                    commonEvent.publish(eventName31_2, (err) => {
                        console.log('Hap2MainAbility3' + eventName31_2);
                    });
                });
                break;
            }
        
            default:
                console.log('[Demo] Hap2MainAbility3 enter default.');
                break;
        }
    }

    onBackground() {
        console.log('[Demo] Hap2MainAbility3 onBackground')
    }
};
