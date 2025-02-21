/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, afterAll, it, expect } from '@ohos/hypium'

import { testManySendablesToGroup, testSendableToGroupAndUpdate, testSendablesFromOtherTaskWithAlloc } from './SendablesGroupTestWithAlloc'
import { skipConditional } from './utils'

export default function SendableGroupWithAllocTest() {
    let printLog = 'SendableGroupWithAllocTest:';
    describe('SendableGroupWithAllocTest', () => {

        afterAll(() => {
            console.info(printLog + 'total case over');
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUPWITHALLOC_001
         * @tc.name: testManySendablesToGroup
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testManySendablesToGroup', 0, async (done: Function) => {
           let result = await testManySendablesToGroup();
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUPWITHALLOC_002
         * @tc.name: testManySendablesToGroupWithAlloc
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it("testSendableToGroupAndUpdateWithAlloc", 0, async (done: Function) => {
           let result = await skipConditional(
             "testSendableToGroupAndUpdateWithAlloc in progress", true, testSendableToGroupAndUpdate);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUPWITHALLOC_003
         * @tc.name: testManySendablesToGroupWithAlloc
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it("testSendablesFromOtherTaskWithAlloc", 0, async (done: Function) => {
           let result = await skipConditional(
             "testSendablesFromOtherTaskWithAlloc excluded", true, testSendablesFromOtherTaskWithAlloc);
           expect(result).assertEqual("PASSED");
           done();
        })

    })
}

