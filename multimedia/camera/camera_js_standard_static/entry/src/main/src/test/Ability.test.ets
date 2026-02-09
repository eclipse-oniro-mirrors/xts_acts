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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import camera from '@ohos.multimedia.camera';
import Context from "application.Context";

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
let g_context: Context;

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'abilityTest describe start');
        beforeAll(() => {
            try {
                hilog.info(domain, tag, '%{public}s', '  beforeAll get Context');
                g_context = Hypium.get('Context') as Context;
                // 相机权限
                hilog.info(domain, tag, '%{public}s', '  beforeAll createAtManager');
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.CAMERA')
                arr.push('ohos.permission.GRANT_SENSITIVE_PERMISSIONS')
                arr.push('ohos.permission.MICROPHONE')
                arr.push('ohos.permission.MEDIA_LOCATION')
                arr.push('ohos.permission.READ_IMAGEVIDEO')
                arr.push('ohos.permission.WRITE_IMAGEVIDEO')
                hilog.info(domain, tag, '%{public}s', '  beforeAll requestPermissionsFromUser');
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', '  requestPermissionsFromUser end');
                    });
                await Utils.msSleep(5000);
                let driver = Driver.create();
                let permissionButton: Component | null = null;
                hilog.info(domain, tag, '%{public}s', '  beforeAll waitForComponent');
                for (let i = 0; i < 4; i++) {
                    permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 5000);
                    if (permissionButton != null) {
                        await permissionButton.click();
                        console.info('  after permissionButton.click ');
                        await Utils.msSleep(1000); // 等待下一个权限请求弹窗出现
                    }
                }

                await Utils.msSleep(2000);
                console.info('  abilityTest beforeAll end');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '  beforeAll failed, err: ' + err);
            }
        })
        beforeEach((): void => {
            await Utils.msSleep(1000);
            console.info('  abilityTest beforeEach case');
        })

        afterEach((): void => {
            console.info('  abilityTest afterEach case');
        })

        afterAll((): void => {
            console.info('  abilityTest afterAll case');
        })
    })

}