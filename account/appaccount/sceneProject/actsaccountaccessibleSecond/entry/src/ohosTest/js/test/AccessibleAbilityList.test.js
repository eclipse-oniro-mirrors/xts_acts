/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import accessibility from '@ohos.accessibility'
const abilityType = 'all';
const abilityState = 'install';
export default function AccessibleAbilityList() {
    describe('AccessibleAbilityList', function () {

        beforeAll(async function (done) {
            console.info(`AccessibleAbilityList: beforeAll starts`);
            done();
        })

        beforeEach(async function (done) {
            console.info(`AccessibleAbilityList: beforeEach starts`);
            done();
        })

        afterEach(async function (done) {
            console.info(`AccessibleAbilityList: afterEach starts`);
            done();
        })

        /******************************************************************************** */
        /* Cases SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100-0460 are for accessibility.getAbilityLists() API test   */
        /******************************************************************************** */

        /**
         * @tc.name   AccessibleAbilityList_0100
         * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100
         * @tc.desc   The parameters input are 'audible' and 'install', test the getAbilityLists() function,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('AccessibleAbilityList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100');
            let abilityType = 'audible';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })
    })
}
