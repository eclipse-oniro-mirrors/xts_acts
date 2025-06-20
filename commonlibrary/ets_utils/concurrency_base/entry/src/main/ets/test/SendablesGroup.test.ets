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

import { testManySendablesToGroup, testSendableToGroupAndUpdate, testSendablesFromOtherTask,
  testSendablesFromOtherTask_1, testSendablesFromOtherTask_2, testSendablesFromOtherTask_2_1,
  testSendablesFromOtherTask_3, testSendablesFromOtherTask_3_1 } from './SendablesGroupTest'
import { skipConditional } from './utils'

export default function SendableGroupTest() {
    let printLog = 'SendableGroupTest:';
    describe('SendableGroupTest', () => {

        afterAll(() => {
            console.info(printLog + 'total case over');
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_001
         * @tc.name: testManySendablesToGroup
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testManySendablesToGroup', 0, async (done: Function) => {
           let result = await testManySendablesToGroup();
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_002
         * @tc.name: testSendablesFromOtherTask
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask', 0, async (done: Function) => {
           let result = await skipConditional("testSendablesFromOtherTask excluded", true, testSendablesFromOtherTask);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_003
         * @tc.name: testSendablesFromOtherTask_1
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask_1', 0, async (done: Function) => {
           let result = await skipConditional(
             "testSendablesFromOtherTask_1 excluded", true, testSendablesFromOtherTask_1);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_004
         * @tc.name: testSendableToGroupAndUpdate
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendableToGroupAndUpdate', 0, async (done: Function) => {
           let result = await skipConditional(
             "testSendableToGroupAndUpdate excluded", true, testSendableToGroupAndUpdate);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_005
         * @tc.name: testSendablesFromOtherTask_2
         * @tc.desc: checks Sendable with primitive type specific scenario
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask_2', 0, async (done: Function) => {
          let result = await skipConditional(
            "testSendablesFromOtherTask_2 excluded", true, testSendablesFromOtherTask_2);
          expect(result).assertEqual("PASSED");
          done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_006
         * @tc.name: testSendablesFromOtherTask_2_1
         * @tc.desc: checks Sendable with primitive type specific scenario
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask_2_1', 0, async (done: Function) => {
          let result = await skipConditional(
            "testSendablesFromOtherTask_2_1 excluded", true, testSendablesFromOtherTask_2_1);
          expect(result).assertEqual("PASSED");
          done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_007
         * @tc.name: testSendablesFromOtherTask_3
         * @tc.desc: checks Sendable with primitive type specific scenario
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask_3', 0, async (done: Function) => {
          let result = await skipConditional(
            "testSendablesFromOtherTask_3 excluded", true, testSendablesFromOtherTask_3);
          expect(result).assertEqual("PASSED");
          done();
        })

        /**
         * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_GROUP_008
         * @tc.name: testSendablesFromOtherTask_3_1
         * @tc.desc: checks Sendable with primitive type specific scenario
         * @tc.author: oleg-ignatenko
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testSendablesFromOtherTask_3_1', 0, async (done: Function) => {
          let result = await skipConditional(
            "testSendablesFromOtherTask_3_1 excluded", true, testSendablesFromOtherTask_3_1);
          expect(result).assertEqual("PASSED");
          done();
        })
      })
}
