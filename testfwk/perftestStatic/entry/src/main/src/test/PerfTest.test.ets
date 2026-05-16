/**
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

import {beforeAll, afterEach, describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { Driver, ON, UiDirection, Component } from '@ohos.UiTest'
import { PerfMetric, PerfTest, PerfTestStrategy, PerfMeasureResult } from '@ohos.test.PerfTest';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Utils, startAbility, stopApplication } from './Util.test';
import { PerfUtils } from '../../ets/utils/PerfUtils';

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'PerfTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function perfTestTest() {
    describe("perfTestTest", (): void => {
        let driver: Driver;
        beforeAll(async () : Promise<void> => {
            driver = Driver.create();
            await Utils.msSleep(1000);
        })
        afterEach(async () => {
            try {
                await stopApplication('com.perftestScene.acts');
            } catch(error: BusinessError) {
                hilog.info(domain, tag, `afterEach stopApplication, ${JSON.stringify(error)}`);
            }
        })

        /**
         * @tc.name testPerfTestCalculate_static
         * @tc.number perfTest_20001
         * @tc.desc Test the performance of computing scenarios
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTestCalculate_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTestCalculate_static start`);
            let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
            let actionCode = (finish: Callback<boolean>) => {
                PerfUtils.CalculateTest()
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                iterations: 1,
                timeout: 30000,
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
            let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
            let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
            let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
            let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
            hilog.info(domain, tag, `testPerfTestCalculate_static res1, ${JSON.stringify(res1)}`);
            hilog.info(domain, tag, `testPerfTestCalculate_static res2, ${JSON.stringify(res2)}`);
            hilog.info(domain, tag, `testPerfTestCalculate_static res3, ${JSON.stringify(res3)}`);
            hilog.info(domain, tag, `testPerfTestCalculate_static res4, ${JSON.stringify(res4)}`);
            hilog.info(domain, tag, `testPerfTestCalculate_static res5, ${JSON.stringify(res5)}`);
            perfTest.destroy()
            expect(res1.metric).assertEqual(PerfMetric.DURATION)
            expect(res1.average).assertLargerOrEqual(0)
            expect(res1.maximum).assertLargerOrEqual(0)
            expect(res1.minimum).assertLargerOrEqual(0)
            expect(res1.roundValues.length).assertLargerOrEqual(1)
            expect(res2.average).assertLargerOrEqual(0)
            expect(res3.average).assertLargerOrEqual(0)
            expect(res4.average).assertLargerOrEqual(0)
            expect(res5.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTestCalculate_static end`);
        })

        /**
         * @tc.name testPerfTestPageSwitch_static
         * @tc.number perfTest_20002
         * @tc.desc Test the performance of page swipe scenarios
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTestPageSwitch_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTestPageSwitch_static start`);
            await startAbility('com.perftestScene.acts', 'EntryAbility');
            await driver.delayMs(3000)
            let metrics: Array<PerfMetric> = [PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
            let actionCode = (finish: Callback<boolean>) => {
                let button = await driver.findComponent(ON.text('ListPage'))
                if (button != null) {
                    await driver.delayMs(1000)
                    await button.click()
                    await driver.delayMs(1000)
                }
                finish(true)
            }
            let resetCode = (finish: Callback<boolean>) => {
                await driver.pressBack()
                await driver.delayMs(1000)
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                resetCode: resetCode,
                timeout: 50000,
                iterations: 1,
                bundleName: "com.perftestScene.acts"
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            let res1 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
            perfTest.destroy()
            hilog.info(domain, tag, `testPerfTestPageSwitch_static res1, ${JSON.stringify(res1)}`);
            expect(res1.average).assertLargerOrEqual(0)
            await stopApplication('com.perftestScene.acts')
            hilog.info(domain, tag, `testPerfTestPageSwitch_static end`);
        })

        /**
         * @tc.name testPerfTestListSwipe_static
         * @tc.number perfTest_20003
         * @tc.desc Test the performance of list swipe scenarios
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTestListSwipe_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTestListSwipe_static start`);
            await startAbility('com.perftest.acts.static', 'EntryAbility');
            await driver.delayMs(3000)
            let button = await driver.findComponent(ON.text('ListPage'))
            expect(button != null).assertTrue()
            if (button != null) {
                await driver.delayMs(1000)
                await button.click()
                await driver.delayMs(1000)
            }
            let metrics: Array<PerfMetric> = [PerfMetric.LIST_SWIPE_FPS]
            let actionCode = (finish: Callback<boolean>) => {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                if (scroll != null) {
                    await driver.delayMs(1000)
                    let center = await scroll.getBoundsCenter()
                    await driver.delayMs(1000)
                    await driver.fling({x: center.x, y: Math.floor(center.y * 3 / 2).toInt()}, {x: center.x, y: Math.floor(center.y / 2).toInt()}, 50, 20000)
                    await driver.delayMs(3000)
                }
                finish(true)
            }
            let resetCode = (finish: Callback<boolean>) => {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                if (scroll != null) {
                    await driver.delayMs(1000)
                    await scroll.scrollToTop(40000)
                    await driver.delayMs(1000)
                }
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                resetCode: resetCode,
                iterations: 1,
                timeout: 50000,
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            let res1 = perfTest.getMeasureResult(PerfMetric.LIST_SWIPE_FPS)
            perfTest.destroy()
            hilog.info(domain, tag, `testPerfTestListSwipe_static res1, ${JSON.stringify(res1)}`);
            expect(res1.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTestListSwipe_static end`);
        })

        /**
         * @tc.name testPerfTest_Keep_static
         * @tc.number perfTest_20004
         * @tc.desc Test the performance of Page keep
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTest_Keep_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTest_Keep_static start`);
            await startAbility('com.perftestScene.acts', 'EntryAbility');
            await driver.delayMs(3000)
            let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
            let actionCode = (finish: Callback<boolean>) => {
                await driver.delayMs(1000)
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                iterations: 1,
                timeout: 50000,
                bundleName: "com.perftestScene.acts"
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
            let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
            let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
            perfTest.destroy()
            await stopApplication('com.perftestScene.acts')
            hilog.info(domain, tag, `testPerfTest_Keep_static res1, ${JSON.stringify(res1)}`);
            hilog.info(domain, tag, `testPerfTest_Keep_static res4, ${JSON.stringify(res4)}`);
            hilog.info(domain, tag, `testPerfTest_Keep_static res5, ${JSON.stringify(res5)}`);
            expect(res1.average).assertLargerOrEqual(0)
            expect(res4.average).assertLargerOrEqual(0)
            expect(res5.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTest_Keep_static end`);
        })

        /**
         * @tc.name testPerfTest_NavigationChange_static
         * @tc.number perfTest_20005
         * @tc.desc Test the performance of Page switching(Navigation)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTest_NavigationChange_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static start`);
            await startAbility('com.perftestScene.acts', 'EntryAbility');
            await driver.delayMs(3000)
            let textCom = await driver.findComponent(ON.text('navigation'))
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static textCom, ${JSON.stringify(textCom)}`);
            expect(textCom != null).assertTrue()
            if (textCom != null) {
                await driver.delayMs(1000)
                let center = await textCom.getBoundsCenter()
                await driver.delayMs(1000)
                await driver.click(center.x, center.y)
                await driver.delayMs(1000)
            }
            let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS, PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
            let actionCode = (finish: Callback<boolean>) => {
                await driver.delayMs(1000)
                let textCom1 = await driver.findComponent(ON.text('push Page01'))
                if (textCom1 != null) {
                    await driver.delayMs(1000)
                    let center1 = await textCom1.getBoundsCenter()
                    await driver.delayMs(1000)
                    await driver.click(center1.x, center1.y)
                    await driver.delayMs(1000)
                }
                finish(true)
            }
            let resetCode = (finish: Callback<boolean>) => {
                await driver.delayMs(1000)
                await driver.pressBack()
                await driver.delayMs(1000)
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                iterations: 1,
                resetCode: resetCode,
                timeout: 50000,
                bundleName: "com.perftestScene.acts"
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static run over!!!!!!!!`);
            console.info(`testPerfTest_NavigationChange_static run over!!!!!!!!`)
            let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
            let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
            let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
            let res6 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
            perfTest.destroy()
            await stopApplication('com.perftestScene.acts')
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static res1, ${JSON.stringify(res1)}`);
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static res4, ${JSON.stringify(res4)}`);
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static res5, ${JSON.stringify(res5)}`);
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static res6, ${JSON.stringify(res6)}`);
            expect(res1.average).assertLargerOrEqual(0)
            expect(res4.average).assertLargerOrEqual(0)
            expect(res5.average).assertLargerOrEqual(0)
            expect(res6.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTest_NavigationChange_static end`);
        })

        /**
         * @tc.name testPerfTest_Start_static
         * @tc.number perfTest_20007
         * @tc.desc Test the performance of App launch
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTest_Start_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTest_Start_static start`);
            await driver.delayMs(3000)
            await driver.pressHome()
            await driver.delayMs(1000)
            let btn1 = await driver.findComponent(ON.text('PerftestScene'))
            let num = 0;
            while (btn1 == null && num < 5) {
                await driver.fling(UiDirection.RIGHT, 2000)
                await driver.delayMs(1000)
                num += 1
                btn1 = await driver.findComponent(ON.text('PerftestScene'))
            }
            if (btn1 == null) {
                hilog.info(domain, tag, `testPerfTest_Start_static btn1,${JSON.stringify(btn1)}`);
                return;
            }
            expect(btn1 != null).assertTrue();
            let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.APP_START_RESPONSE_TIME, PerfMetric.APP_START_COMPLETE_TIME]
            let actionCode = (finish: Callback<boolean>) => {
                if (btn1 != null) {
                    let point = await (btn1 as Component).getBoundsCenter()
                    await driver.click(point.x , point.y - 50)
                    await driver.delayMs(1000)
                }
                finish(true)
            }
            let resetCode = (finish: Callback<boolean>) => {
                await driver.delayMs(1000)
                await stopApplication('com.perftestScene.acts')
                await driver.delayMs(1000)
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                actionCode: actionCode,
                resetCode: resetCode,
                timeout: 50000,
                iterations: 1,
                bundleName: "com.perftestScene.acts"
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            console.info(`testPerfTest_Start_static run over!!!!!!!!`)
            let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
            let res6 = perfTest.getMeasureResult(PerfMetric.APP_START_RESPONSE_TIME)
            let res7 = perfTest.getMeasureResult(PerfMetric.APP_START_COMPLETE_TIME)
            perfTest.destroy()
            await stopApplication('com.perftestScene.acts')
            hilog.info(domain, tag, `testPerfTest_Start_static res1, ${JSON.stringify(res1.average)}`);
            hilog.info(domain, tag, `testPerfTest_Start_static res6, ${JSON.stringify(res6.average)}`);
            hilog.info(domain, tag, `testPerfTest_Start_static res7, ${JSON.stringify(res7.average)}`);
            expect(res1.average).assertLargerOrEqual(0)
            expect(res6.average).assertLargerOrEqual(0)
            expect(res7.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTest_Start_static end`);
        })

        /**
         * @tc.name testPerfTest_resetCode_static
         * @tc.number perfTest_20009
         * @tc.desc Test the performance of the resetCode null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPerfTest_resetCode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testPerfTest_resetCode_static start`);
            await driver.delayMs(3000)
            let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
            let actionCode = (finish: Callback<boolean>) => {
                finish(true)
            }
            let perfTestStrategy: PerfTestStrategy = {
                metrics: metrics,
                iterations: 1,
                actionCode: actionCode
            }
            let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
            await perfTest.run()
            let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
            let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
            let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
            perfTest.destroy()
            hilog.info(domain, tag, `testPerfTest_resetCode_static res1,${JSON.stringify(res1)}`);
            hilog.info(domain, tag, `testPerfTest_resetCode_static res4,${JSON.stringify(res4)}`);
            hilog.info(domain, tag, `testPerfTest_resetCode_static res5,${JSON.stringify(res5)}`);
            expect(res1.average).assertLargerOrEqual(0)
            expect(res4.average).assertLargerOrEqual(0)
            expect(res5.average).assertLargerOrEqual(0)
            hilog.info(domain, tag, `testPerfTest_resetCode_static end`);
        })
    })
}