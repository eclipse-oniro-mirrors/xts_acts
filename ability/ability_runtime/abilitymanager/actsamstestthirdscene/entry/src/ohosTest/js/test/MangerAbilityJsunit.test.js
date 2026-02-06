/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import appManager from "@ohos.application.appManager"
import { describe, it, expect, Level } from '@ohos/hypium'
export default function ActsAmsTestThirdScene() {
    describe('ActsAmsTestThirdScene', function () {
        console.info('----ActsAmsTestThirdScene----');

        /**
         * @tc.name   Acts_Ams_test_3300
         * @tc.number Acts_Ams_test_3300
         * @tc.desc   Get All Running Processes Info(by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Acts_Ams_test_3300', Level.LEVEL0, async function (done) {
            var info = await appManager.getProcessRunningInfos();
            console.info('Acts_Ams_test_3300 getProcessRunningInfos JSON String: ' + JSON.stringify(info));
            expect(Array.isArray(info)).assertEqual(true);
            expect(info.length).assertLarger(0);
            for (var i = 0; i < info.length; i++) {
                console.info('Acts_Ams_test_3300 getProcessRunningInfo[' + i + "]: " + JSON.stringify(info[i]));
                expect(typeof (info[i].pid)).assertEqual("number");
                expect(info[i].pid).assertLarger(0);

                expect(typeof (info[i].processName)).assertEqual("string");
                expect(info[i].processName.length).assertLarger(0);
                expect(Array.isArray(info[i].bundleNames)).assertEqual(true);
                expect(info[i].bundleNames.length).assertLarger(0);

                expect(typeof (info[i].uid)).assertEqual("number");
                expect(info[i].uid).assertLarger(0);
            }
            done();
        })
    })
}