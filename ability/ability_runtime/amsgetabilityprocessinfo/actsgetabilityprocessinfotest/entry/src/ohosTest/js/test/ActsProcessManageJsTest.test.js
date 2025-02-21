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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import appManager from '@ohos.application.appManager'

export default function ActsAbilityRunningInfosTest() {
describe('ActsAbilityRunningInfosTest', function () {

    function checkRunningProcess(name, dataInfo) {
        for (let i = 0, len = dataInfo.length; i < len; i++) {
            if (dataInfo[i].processName.indexOf(name) >= 0) {
                expect(dataInfo[i].uid).assertLarger(0);
                expect(dataInfo[i].pid).assertLarger(0);
                return true;
            }
        }
        return false;
    }

    /*
    * @tc.number: ACTS_getProcessRunningInfos_0100
    * @tc.name: Application running ability information query
    * @tc.desc: Verify applications are started to query getProcessRunningInfos ability information
    *           （by promise）
    */
    it('ACTS_getProcessRunningInfos_0100', 0, async function (done) {
        console.log('ACTS_getProcessRunningInfos_0100====<begin');
        var data = await appManager.getProcessRunningInfos()
        console.info('====> ACTS_getProcessRunningInfos_0100 ====>' + JSON.stringify(data))
        expect(checkRunningProcess('com.example.abilityrunninginfostest', data)).assertTrue();
        done();
    })

    /*
    * @tc.number: ACTS_getProcessRunningInfos_0200
    * @tc.name: Application running ability information query
    * @tc.desc: Verify applications are started to query getProcessRunningInfos ability information
    *           （by callback）
    */
    it('ACTS_getProcessRunningInfos_0200', 0, async function (done) {
        console.log('ACTS_getProcessRunningInfos_0200====<begin');
        appManager.getProcessRunningInfos((err, data) => {
            console.info('====> ACTS_getProcessRunningInfos_0200 ====>' + JSON.stringify(data))
            expect(checkRunningProcess('com.example.abilityrunninginfostest', data)).assertTrue();
            done();
        })
    })
})
}
