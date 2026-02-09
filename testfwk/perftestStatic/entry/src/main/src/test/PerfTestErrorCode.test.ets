/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { PerfMetric, PerfTestStrategy, PerfMeasureResult, PerfTest} from '@ohos.test.PerfTest';
import { Driver, ON } from '@kit.TestKit';
import hilog from '@ohos.hilog'
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import { Utils, startAbility, stopApplication } from './Util.test';
const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag: string = 'PerfTestTag';
const AsyncErrorCode: int = 32400002;
const ParameterErrorCode: int = 32400003;
const TimeoutErrorCode: int = 32400004;
const CollectErrorCode: int = 32400005;
const ObtainErrorCode: int = 32400006;


export default function perfTestErrorTest() {

    describe("perfTestErrorTest", (): void => {


        /**
         * @tc.name test_PerfTest_create_32400003_static
         * @tc.number perfTestErrorTest_001
         * @tc.desc create 32400003 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_create_32400003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`${TestTag}, test_PerfTest_create_32400003_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        finish(true)
                    },
                    iterations: -1,
                    resetCode: (finish: Callback<boolean>) => {
                        finish(true)
                    },
                    timeout: 30000,
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_create_32400003_static strategy.iterations = -1 error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
            }
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        finish(true)
                    },
                    iterations: 5,
                    resetCode: (finish: Callback<boolean>) => {
                        finish(true)
                    },
                    timeout: -10,
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_create_32400003_static strategy.timeout = -10 error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_create_32400003 end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400005_bundleName_static
         * @tc.number perfTestErrorTest_004
         * @tc.desc run 32400005 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400005_bundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400005_bundleName_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName_static actionCode called`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName_static resetCode called`);
                        finish(true)
                    },
                    timeout: 30000,
                    bundleName: "com.example.test0011"
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName_static bundleName error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(CollectErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_actionCode_static
         * @tc.number perfTestErrorTest_005
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_actionCode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_actionCode_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode_static actionCode called not finish`);
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode_static resetCode called 1`);
                        finish(true)
                    },
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode_static actionCode not finish error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_resetCode_static
         * @tc.number perfTestErrorTest_006
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_resetCode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_resetCode_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode_static actionCode called not finish`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode_static resetCode called 1`);
                    },
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode_static actionCode not finish error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_actionCodeError_static
         * @tc.number perfTestErrorTest_007
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_actionCodeError_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_actionCodeError_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError_static actionCode called throw error`);
                        throw new Error('throw error test');
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError_static resetCode called 2`);
                        finish(true)
                    },
                    timeout: 30000,
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError_static error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_resetCodeError_static
         * @tc.number perfTestErrorTest_008
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_resetCodeError_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_resetCodeError_static start`);

            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError_static actionCode called 1`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError_static resetCode called thorw error`);
                        throw new Error('resetCode throw error test');
                        finish(true)
                    },
                    timeout: 30000,
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError_static resetCode throw error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_actionCodeTimeOut_static
         * @tc.number perfTestErrorTest_009
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_actionCodeTimeOut_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_actionCodeTimeOut_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut_static actionCode start`);
                        await Utils.msSleep(5000);
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut_static actionCode end`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut_static resetCode called 2`);
                        finish(true)
                    },
                    timeout: 2000,
                }
                let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut_static actionCode timeOut is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            await Utils.msSleep(8000);
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400004_resetCodeTimeOut_static
         * @tc.number perfTestErrorTest_010
         * @tc.desc run 32400004 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400004_resetCodeTimeOut_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400004_resetCodeTimeOut_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut_static actionCode called 3`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut_static resetCode start `);
                        await Utils.msSleep(5000);
                        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut_static resetCode end`);
                        finish(true)
                    },
                    timeout: 2000,
                }
                let perfTest: PerfTest= PerfTest.create(perfTestStrategy)
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut_static resetCode timeOut is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(TimeoutErrorCode);
            }
            await Utils.msSleep(8000);
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut_static end`);
        })

        /**
         * @tc.name test_PerfTest_run_32400002_afterDestroy_static
         * @tc.number perfTestErrorTest_011
         * @tc.desc run 32400002 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_run_32400002_afterDestroy_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_run_32400002_afterDestroy_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy_static actionCode called 3`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy_static resetCode called 3`);
                        finish(true)
                    },
                    timeout: 5000,
                }
                let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
                perfTest.destroy();
                await Utils.msSleep(2000);
                await perfTest.run();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy_static after destroy error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(AsyncErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy_static end`);
        })

        /**
         * @tc.name test_PerfTest_getMeasureResult_32400006_noRun_static
         * @tc.number perfTestErrorTest_013
         * @tc.desc getMeasureResult 32400006 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_getMeasureResult_32400006_noRun_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`test_PerfTest_getMeasureResult_32400006_noRun_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun_static actionCode called 3`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun_static resetCode called 3`);
                        finish(true)
                    },
                    timeout: 5000,
                }
                let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
                await Utils.msSleep(2000);
                perfTest.getMeasureResult(PerfMetric.DURATION);
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun_static error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(ObtainErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun_static end`);
        })

        /**
         * @tc.name test_PerfTest_getMeasureResult_32400002_static
         * @tc.number perfTestErrorTest_015
         * @tc.desc getMeasureResult 32400002 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_getMeasureResult_32400002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002_static actionCode called 3`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002_static resetCode called 3`);
                        finish(true)
                    },
                    timeout: 5000,
                }
                let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
                await perfTest.run();
                await Utils.msSleep(1000);
                perfTest.destroy();
                await Utils.msSleep(1000);
                perfTest.getMeasureResult(PerfMetric.DURATION);
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002_static error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(AsyncErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002_static end`);
        })

        /**
         * @tc.name test_PerfTest_destroy_32400002_static
         * @tc.number perfTestErrorTest_017
         * @tc.desc destroy 32400002 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_PerfTest_destroy_32400002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.log(`${TestTag}, test_PerfTest_destroy_32400002_static start`);
            try {
                let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
                let perfTestStrategy: PerfTestStrategy = {
                    metrics: metrics,
                    actionCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_destroy_32400002_static actionCode called 3`);
                        finish(true)
                    },
                    iterations: 1,
                    resetCode: (finish: Callback<boolean>) => {
                        console.log(`${TestTag}, test_PerfTest_destroy_32400002_static resetCode called 3`);
                        finish(true)
                    },
                    timeout: 5000,
                }
                let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
                await perfTest.run();
                await Utils.msSleep(1000);
                perfTest.destroy();
                await Utils.msSleep(1000);
                perfTest.destroy();
                expect().assertFail();
            }catch (e) {
                console.log(`${TestTag}, test_PerfTest_destroy_32400002_static error is: ${JSON.stringify(e)}`);
                expect((e as BusinessError).code).assertEqual(AsyncErrorCode);
            }
            console.log(`${TestTag}, test_PerfTest_destroy_32400002_static end`);
        })
    })
}