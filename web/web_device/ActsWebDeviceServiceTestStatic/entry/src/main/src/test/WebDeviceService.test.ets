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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function webDeviceServiceTest() {

    describe('webDeviceServiceTest', (): void => {
        beforeAll(async (): Promise<void> => {
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                testAbilityContext = abilitys.context
                console.info('onAbilityCreate end')
                },
            }, (err : BusinessError | null) : void => {
                if (err != null ) {
                console.info('-----' + err.code)
                }
                console.info('BusinessError  end')
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebdeviceservicetest.static")
            await Utils.msSleep(2000)
            console.info('beforeAll end,%s', 'Succeed!')
         });

        beforeEach(async () => {
            await Utils.msSleep(2000);
            console.info('webDeviceServiceTest beforeEach start');
        })


        /**
         * @tc.name   testGeolocationAccess_static
         * @tc.number SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0001
         * @tc.desc   test GeolocationAccess
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGeolocationAccess_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            Utils.emitEvent("GeolocationAccess", 10);
            Utils.registerEvent("testGeolocationAccess_static", true, 101, done);
            await Utils.msSleep(2000);
            inspector.sendEventByKey('WebAttributeTestButton', 10, '');
            await Utils.msSleep(5000);
            done();
            console.info(domain, tag, '%{public}s', 'testGeolocationAccess end');
        })

        /**
         * @tc.name   testOnGeolocationShow_static
         * @tc.number SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0002
         * @tc.desc   test OnGeolocationShow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOnGeolocationShow_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnGeolocationShow", 10);
            Utils.registerEvent("testOnGeolocationShow_static", true, 102, done);
            await Utils.msSleep(2000);
            inspector.sendEventByKey('WebAttributeTestButton', 10, '');
            await Utils.msSleep(5000);
            done();
            console.info(domain, tag, '%{public}s', 'testOnGeolocationShow end');
        })


        /**
         * @tc.name   testGeoLocation_Constructor_static
         * @tc.number SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0003
         * @tc.desc   test Constructor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGeoLocation_Constructor_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Constructor", 10);
            Utils.registerEvent("testGeoLocation_Constructor_static", "done", 103, done);
            await Utils.msSleep(2000);
            inspector.sendEventByKey('WebviewContrllerTestButton', 10, '');
            await Utils.msSleep(5000);
            done();
            console.info(domain, tag, '%{public}s', 'testGeoLocation_Constructor end');
        })
    })
}