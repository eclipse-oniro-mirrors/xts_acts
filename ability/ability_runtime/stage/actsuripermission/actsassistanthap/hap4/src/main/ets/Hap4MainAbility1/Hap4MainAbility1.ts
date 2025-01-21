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

export default class Hap4MainAbility1 extends Ability {
    onCreate(want, launchParam) {
        console.log('[Demo] Hap4MainAbility1 onCreate')
    }

    onDestroy() {
        console.log('[Demo] Hap4MainAbility1 onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('[Demo] Hap4MainAbility1 onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/Hap4MainAbility1_pages', null)
    }

    onWindowStageDestroy() {
        console.log('[Demo] Hap4MainAbility1 onWindowStageDestroy')
    }

    onForeground() {
        console.log('[Demo] Hap4MainAbility1 onForeground')
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null || uri == undefined) {
            console.log('[Demo] Hap2MainAbility1 uri is invalid');
            return;
        }
        let eventName1 : string = 'Temp_UriPermissionTest_0500_Read_Successfully';
        let eventName2 : string = 'Temp_UriPermissionTest_0500_Read_Failed';
        globalThis.fs.open(uri, globalThis.fs.OpenMode.READ_ONLY).then((file) => {
            console.info('file fd: ' + file.fd);
            commonEvent.publish(eventName1, (err) => {
                console.log('Hap2MainAbility2' + eventName1);
            });
        }).catch((err) => {
            console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
            commonEvent.publish(eventName2, (err) => {
                console.log('Hap2MainAbility2' + eventName2);
            });
        });

        let eventName3 : string = 'Temp_UriPermissionTest_0500_Write_Successfully';
        let eventName4 : string = 'Temp_UriPermissionTest_0500_Write_Failed';
        globalThis.fs.open(uri, globalThis.fs.OpenMode.READ_WRITE).then((file) => {
            console.info('file fd: ' + file.fd);
            commonEvent.publish(eventName3, (err) => {
                console.log('Hap2MainAbility2' + eventName3);
            });
        }).catch((err) => {
            console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
            commonEvent.publish(eventName4, (err) => {
                console.log('Hap2MainAbility2' + eventName4);
            });
        });
    }

    onBackground() {
        console.log('[Demo] Hap4MainAbility1 onBackground')
    }
};
