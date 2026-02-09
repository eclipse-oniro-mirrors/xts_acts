/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, TestType, Level, Size } from '@ohos/hypium';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import PermissionUtils from './PermissionUtils';
import { Driver, ON } from '@ohos.UiTest';
import { Permissions } from '@ohos.abilityAccessCtrl';
import audio from '@ohos.multimedia.audio';
import wantAgent from '@ohos.app.ability.wantAgent';
import fs from '@ohos.file.fs';
import AVSessionManager from '@ohos.multimedia.avsession';
import AbilityUtils from './AbilityUtils';

export default function performanceTest() {
  describe('PerformanceTest', () => {
    let abilityContext: common.UIAbilityContext

    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(2000)
      done()
    })
    /**
     * @tc.name   testShorttermTask0100
     * @tc.number STD-PERFORMANCE-0100
     * @tc.desc   【STD-PERFORMANCE-0100】为保障系统性能和能效，必须支持长时任务、短时任务管理机制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShorttermTask0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let id: number
      let reason = 'pcs test'
      let defaultDelayTime = 180000
      try {
        let delayInfo = backgroundTaskManager.requestSuspendDelay(reason, () => {
          backgroundTaskManager.cancelSuspendDelay(id)
        })
        id = delayInfo.requestId
        let delayTime = delayInfo.actualDelayTime
        backgroundTaskManager.cancelSuspendDelay(id)
        expect(delayTime).assertEqual(defaultDelayTime)
      } catch (error) {
        let err = error as BusinessError
        console.error(`Request SuspendDelay Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /**
     * @tc.name   testLongtermTask0100
     * @tc.number STD-PERFORMANCE-0100
     * @tc.desc   【STD-PERFORMANCE-0100】为保障系统性能和能效，必须支持长时任务、短时任务管理机制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongtermTask0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
      try {
        let driver = Driver.create()
        await driver.delayMs(2000)
        let scroll = await driver.findComponent(ON.id('scroll').inWindow('com.acts.pcs.arktstest'))
        await driver.delayMs(1000)
        let startAudio = await scroll.scrollSearch(ON.id('StartAudio').inWindow('com.acts.pcs.arktstest'))
        await startAudio.click()
        await driver.delayMs(2000)
        let audioStateText = await scroll.scrollSearch(ON.id('AudioStateText').inWindow('com.acts.pcs.arktstest'))
        expect(await audioStateText.getText()).assertEqual(audio.AudioState.STATE_RUNNING.toString())
        await driver.delayMs(2000)
        expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
        await driver.delayMs(2000)
        let testAssistWantInfo: Want = {
          uri: 'http://assist.arkts.pcs.acts.com',
          type: "pcs/test"
        }
        expect(await AbilityUtils.startAbilityImplicitly(testAssistWantInfo, abilityContext)).assertTrue()
        await driver.delayMs(2000)
        let button = await driver.findComponent(ON.within(ON.type('Dialog')).text('打开'))
        if(button != undefined) {
          await button.click()
          await driver.delayMs(2000)
        }
        let allowButton1 = await driver.findComponent(ON.text('允许'))
        if(allowButton1 != undefined && allowButton1 != null) {
          await allowButton1.click()
          await driver.delayMs(2000)
        }
        let allowButton2 = await driver.findComponent(ON.text('本次允许'))
        if(allowButton2 != undefined && allowButton2 != null) {
          await allowButton2.click()
          await driver.delayMs(2000)
        }
        let openButton3 = await driver.findComponent(ON.within(ON.type('Dialog')).text('本次打开'))
        if(openButton3 != undefined && openButton3 != null) {
          await openButton3.click()
          await driver.delayMs(2000)
        }
        let openButton4 = await driver.findComponent(ON.within(ON.type('Dialog')).text('始终允许打开'))
        if(openButton4 != undefined && openButton4 != null) {
          await openButton4.click()
          await driver.delayMs(2000)
        }
        expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
        await driver.delayMs(2000)
        audioStateText = await scroll.scrollSearch(ON.id('AudioStateText').inWindow('com.acts.pcs.arktstest'))
        expect(await audioStateText.getText()).assertEqual(audio.AudioState.STATE_RUNNING.toString())
        await driver.delayMs(2000)
        let stopAudio = await scroll.scrollSearch(ON.id('StopAudio').inWindow('com.acts.pcs.arktstest'))
        await stopAudio.click()
        await driver.delayMs(2000)
      } catch (error) {
        let err = error as BusinessError
        console.error(`Test long term task fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })
  })
}