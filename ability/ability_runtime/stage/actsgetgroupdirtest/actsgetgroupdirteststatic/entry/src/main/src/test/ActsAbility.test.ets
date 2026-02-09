/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let abilityContext: common.UIAbilityContext;

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        beforeAll(async() => {
            let driver = Driver.create();	
            try {
                let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
                if (allowed) {
                    await allowed.click();
                }
            } catch (err) {
                console.error('findComponent failed: ' + JSON.stringify(err));
            }
            hilog.info(domain, tag, 'beforeAll start');
            let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            hilog.info(domain, tag, 'beforeAll AbilityDelegator');
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.getgroupdir.static")
            await Utils.msSleep(2000);
            abilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
            hilog.info(domain, tag, 'beforeAll end');
        })

        /**
         * @tc.name   Context_getGroupDir_Static_002
         * @tc.number Context_getGroupDir_Static_002
         * @tc.desc   Function test,getGroupDir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Context_getGroupDir_Static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.log("start Context_getGroupDir_Static_002 =====>");
            await Utils.msSleep(1000);
            abilityContext.getGroupDir("111").then(data => {
                console.error("getGroupDir Context_getGroupDir_Static_002 ====> result data" + data);
                expect(data).assertEqual("");
            }).catch((error: Error): void => {
                console.error("getGroupDir Context_getGroupDir_Static_002 ====> result err" + JSON.stringify(error));
                expect().assertFail();
            });
            done();
        })

        /**
         * @tc.name   Context_getGroupDir_Static_003
         * @tc.number Context_getGroupDir_Static_003
         * @tc.desc   Function test,getGroupDir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Context_getGroupDir_Static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.log("start Context_getGroupDir_Static_003 =====>");
            await Utils.msSleep(1000);
            abilityContext.getGroupDir("context_hap1").then(data => {
                console.error("getGroupDir Context_getGroupDir_Static_003 ====> result data" + data);
                expect(data).assertEqual("");
            }).catch((error: Error): void => {
                console.error("getGroupDir Context_getGroupDir_Static_003 ====> result err" + JSON.stringify(error));
                expect().assertFail();
            });
            done();
        })

        /**
         * @tc.name   Context_getGroupDir_Static_005
         * @tc.number Context_getGroupDir_Static_005
         * @tc.desc   Function test,getGroupDir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Context_getGroupDir_Static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.log("start Context_getGroupDir_Static_005 =====>");
            await Utils.msSleep(1000);
            abilityContext.getGroupDir("", (err, data) => {
                console.error("Context_getGroupDir_Static_005 ====> result data" + data);
                console.error("Context_getGroupDir_Static_005 ====> result err" + JSON.stringify(err));
                expect(data).assertEqual("");
                expect(err?.code).assertEqual(0);
                done();
            })
        })

        /**
         * @tc.name   Context_getGroupDir_Static_006
         * @tc.number Context_getGroupDir_Static_006
         * @tc.desc   Function test,getGroupDir
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Context_getGroupDir_Static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.log("start Context_getGroupDir_Static_006 =====>");
            await Utils.msSleep(1000);
            abilityContext.getGroupDir("context_hap1", (err, data) => {
                console.error("Context_getGroupDir_Static_006 ====> result data" + data);
                console.error("Context_getGroupDir_Static_006 ====> result err" + JSON.stringify(err));
                expect(data).assertEqual("");
                expect(err?.code).assertEqual(0);
                done();
            })
        })
    })
}