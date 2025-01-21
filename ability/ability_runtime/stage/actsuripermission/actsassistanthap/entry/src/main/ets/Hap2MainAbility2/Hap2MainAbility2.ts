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

export default class Hap2MainAbility2 extends Ability {
    onCreate(want, launchParam) {
        console.log('[Demo] Hap2MainAbility2 onCreate')
        globalThis.abilityWant2 = want;
    }

    onDestroy() {
        console.log('[Demo] Hap2MainAbility2 onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('[Demo] Hap2MainAbility2 onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/Hap2MainAbility2_pages', null)
    }

    onWindowStageDestroy() {
        console.log('[Demo] Hap2MainAbility2 onWindowStageDestroy')
    }

    onNewWant(want, launchParams) {
        globalThis.abilityWant2 = want;
    }

    onForeground() {
        console.log('[Demo] Hap2MainAbility2 onForeground')
        switch (globalThis.abilityWant2.parameters['number']) {
            case 20: {
                let uri : string = globalThis.abilityWant2.uri;
                if (uri == null) {
                    console.log('[Demo] Hap2MainAbility2 uri is invalid');
                    return;
                }
                let eventName20_1 : string = 'Temp_UriPermissionTest_0200_Read_Successfully';
                let eventName20_2 : string = 'Temp_UriPermissionTest_0200_Read_Failed';
                globalThis.fs.open(uri, globalThis.fs.OpenMode.READ_ONLY).then((file) => {
                    console.info('read file fd: ' + file.fd);
                    commonEvent.publish(eventName20_1, (err) => {
                        console.log('Hap2MainAbility2' + eventName20_1);
                    });
                }).catch((err) => {
                    console.info('read open file failed with error message: ' + err.message + ', error code: ' + err.code);
                    commonEvent.publish(eventName20_2, (err) => {
                        console.log('Hap2MainAbility2' + eventName20_2);
                    });
                });

                let eventName20_3 : string = 'Temp_UriPermissionTest_0200_Write_Successfully';
                let eventName20_4 : string = 'Temp_UriPermissionTest_0200_Write_Failed';
                globalThis.fs.open(uri, globalThis.fs.OpenMode.READ_WRITE).then((file) => {
                    console.info('write file fd: ' + file.fd);
                    commonEvent.publish(eventName20_3, (err) => {
                        console.log('Hap2MainAbility2' + eventName20_3);
                    });
                }).catch((err) => {
                    console.info('write open file failed with error message: ' + err.message + ', error code: ' + err.code);
                    commonEvent.publish(eventName20_4, (err) => {
                        console.log('Hap2MainAbility2' + eventName20_4);
                    });
                });
                break;
            }

            case 21: {
                let eventName : string = 'StartDone_Hap2MainAbility2';
                commonEvent.publish(eventName, (err) => {
                    console.log('Hap2MainAbility2' + eventName);
                });
                break;
            }

            default:
                break;
        }
        
    }

    onBackground() {
        console.log('[Demo] Hap2MainAbility2 onBackground')
    }
};
