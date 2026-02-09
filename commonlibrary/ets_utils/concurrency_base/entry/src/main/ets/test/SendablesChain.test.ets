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
import { describe, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'

import { testChainedPath1, testChainedPath0, testChainedPath0Negative,  testChainedPath2 } from './SendablesChainTest';
import { skipConditional } from './utils';

export default function SendableChainTest() {
    let printLog = 'SendableChainTest:';
    describe('SendableChainTest', () => {

        afterAll(() => {
            console.info(printLog + 'total case over');
        })

        /**
         * @tc.name   testChainedPath0
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_CHAIN_001
         * @tc.desc   checks Sendable with primitive type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChainedPath0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
           let result = await skipConditional("testChainedPath0 in progress", true, testChainedPath0);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.name   testChainedPath1
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_CHAIN_002
         * @tc.desc   checks Sendable with primitive type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testChainedPath1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
           let result = await testChainedPath1();
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.name   testChainedPath0Negative
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_CHAIN_003
         * @tc.desc   checks Sendable with primitive type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testChainedPath0Negative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
           let result = await skipConditional("testChainedPath0Negative in progress", true, testChainedPath0Negative);
           expect(result).assertEqual("PASSED");
           done();
        })

        /**
         * @tc.name   In_Progress_testChainedPath2
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_CHAIN_004
         * @tc.desc   checks Sendable with primitive type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('In_Progress_testChainedPath2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
           let result = await skipConditional("testChainedPath2 in progress", true, testChainedPath2);
           expect(result).assertEqual("PASSED");
           done();
        })
    })
}
