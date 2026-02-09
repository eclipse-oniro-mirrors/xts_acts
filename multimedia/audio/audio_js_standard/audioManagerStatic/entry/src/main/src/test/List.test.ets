/*
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
import audioManagerApi9 from "./AudioManagerApi9.test";
import audioFramework from "./AudioFramework.test";
import getAudioSceneApi12 from "./GetAudioScene.test"
import audioRoutingManager from "./AudioRoutingManager.test"
import audioLoopBack from './AudioLoopBack.test';
import audioSpatializationManager from './AudioSpatializationManager.test';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let getPermission = async () => {
    try {
        let g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MANAGE_AUDIO_CONFIG')
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
            (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                console.info("request success permissions" + JSON.stringify(data));
                console.info("getPermissionRequestResult err" + JSON.stringify(err));
            });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
            await permissionButton.click();
        }
    } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
    }
}

export default function testsuite() {
    getPermission();
    audioManagerApi9();
    audioFramework();
    audioRoutingManager();
    getAudioSceneApi12();
    audioLoopBack();
    audioSpatializationManager();
}
