/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON, UiDirection } from '@ohos.UiTest'
import { PerfMetric, PerfTest, PerfTestStrategy, PerfMeasureResult } from '@ohos.test.PerfTest';
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import { PerfUtils } from '../../../main/ets/utils/PerfUtils';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`PerfTestCase, start abilityFinished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`PerfTestCase, start abilityFailed: ${err}`)
  })
}
async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`PerfTestCase, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`PerfTestCase,stop application failed: ${err}`)
  })
}

export default function PerfTestTest() {
  describe('PerfTestTest', () => {

    beforeAll(async (done: Function) => {
      done()
    })

    /*
     * @tc.number: perfTest_20001
     * @tc.name: testPerfTestCalculate
     * @tc.desc: Test the performance of computing scenarios
     */
    it('testPerfTestCalculate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        PerfUtils.CalculateTest()
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
        timeout: 30000,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      perfTest.destroy()
      expect(res1.metric).assertEqual(PerfMetric.DURATION)
      expect(res1.average).assertLargerOrEqual(0)
      expect(res1.maximum).assertLargerOrEqual(0)
      expect(res1.minimum).assertLargerOrEqual(0)
      expect(res1.roundValues.length).assertLargerOrEqual(5)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20002
     * @tc.name: testPerfTestPageSwitch
     * @tc.desc: Test the performance of page swipe scenarios
     */
    it('testPerfTestPageSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let button = await driver.findComponent(ON.text('ListPage'))
        await driver.delayMs(1000)
        await button.click()
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      await stopApplication('com.perftestScene.acts')
      done()
    })

    /*
     * @tc.number: perfTest_20003
     * @tc.name: testPerfTestListSwipe
     * @tc.desc: Test the performance of list swipe scenarios
     */
    it('testPerfTestListSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftest.acts', 'EntryAbility');
      let driver = Driver.create()
      await driver.delayMs(3000)
      let button = await driver.findComponent(ON.text('ListPage'))
      await driver.delayMs(1000)
      await button.click()
      await driver.delayMs(1000)
      let metrics: Array<PerfMetric> = [PerfMetric.LIST_SWIPE_FPS]
      let actionCode = async (finish: Callback<boolean>) => {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        await driver.delayMs(1000)
        let center = await scroll.getBoundsCenter()
        await driver.delayMs(1000)
        await driver.fling({x: center.x, y: Math.floor(center.y * 3 / 2)}, {x: center.x, y: Math.floor(center.y / 2)}, 50, 20000)
        await driver.delayMs(3000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        await driver.delayMs(1000)
        await scroll.scrollToTop(40000)
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        iterations: 5,
        timeout: 50000,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.LIST_SWIPE_FPS)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20004
     * @tc.name: testPerfTest_Keep
     * @tc.desc: Test the performance of Page keep
     */
    it('testPerfTest_Keep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
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
      expect(res1.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20005
     * @tc.name: testPerfTest_Navigationchange
     * @tc.desc: Test the performance of Page switching(Navigation)
     */
    it('testPerfTest_Navigationchange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let textCom = await driver.findComponent(ON.text('navigation'))
      await driver.delayMs(1000)
      let center = await textCom.getBoundsCenter()
      await driver.delayMs(1000)
      await driver.click(center.x, center.y)
      await driver.delayMs(1000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS, PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        let textCom1 = await driver.findComponent(ON.text('push Page01'))
        await driver.delayMs(1000)
        let center1 = await textCom1.getBoundsCenter()
        await driver.delayMs(1000)
        await driver.click(center1.x, center1.y)
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
        resetCode: resetCode,
        timeout: 50000,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_Navigationchange run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      let res6 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20007
     * @tc.name: testPerfTest_Start
     * @tc.desc: Test the performance of App launch
     */
    it('testPerfTest_Start', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      await driver.pressHome()
      await driver.delayMs(1000)
      let btn1 = await driver.findComponent(ON.text('PerftestScene'))
      let num = 0;
      while (btn1 == null && num < 3) {
        await driver.fling(UiDirection.RIGHT, 2000)
		await driver.delayMs(1000)
        num += 1
        btn1 = await driver.findComponent(ON.text('PerftestScene'))
      }
      if (btn1 == null) {
        done()
        return
      }
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.APP_START_RESPONSE_TIME, PerfMetric.APP_START_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        await btn1.click()
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
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
        iterations: 5,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_start run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res6 = perfTest.getMeasureResult(PerfMetric.APP_START_RESPONSE_TIME)
      let res7 = perfTest.getMeasureResult(PerfMetric.APP_START_COMPLETE_TIME)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      expect(res7.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20009
     * @tc.name: testPerfTest_ActionCodenull
     * @tc.desc: Test the performance of the ActionCodenull
     */
    it('testPerfTest_ActionCodenull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        iterations: 5,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

  })
}