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

import { describe, it, expect, beforeAll } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import i18n from '@ohos.i18n';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';
import installer from '@ohos.bundle.installer';
import AbilityUtils from './AbilityUtils'

export default function softwareTest() {
  describe('SoftwareTest', () => {
    let abilityContext: common.UIAbilityContext
    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(2000)
      done()
    })

    /*
    * @tc.number: G-SOFTWARE-0402
    * @tc.name: testBackToLastPage0100
    * @tc.desc: 【G-SOFTWARE-0402】应实现一个可让用户轻松切换到前一个 FA 的快捷方式
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('testBackToLastPage0100', 0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      let firstButton = await driver.findComponent(ON.id('firstButton').inWindow('com.acts.pcs.arktstest'))
      expect(firstButton != undefined).assertTrue()
      await firstButton.click()
      await driver.delayMs(1000)
      let secondButton = await driver.findComponent(ON.id('secondButton').inWindow('com.acts.pcs.arktstest'))
      expect(secondButton != undefined).assertTrue()
      await secondButton.click()
      await driver.delayMs(1000)
      let lastButton = await driver.findComponent(ON.id('firstButton').inWindow('com.acts.pcs.arktstest'))
      expect(lastButton != undefined).assertTrue()
      expect(await lastButton.getText()).assertEqual('Next Page')
      done()
    })

    /*
    * @tc.number: G-SOFTWARE-0606
    * @tc.name: testResourceReferenceRulesNotChange0100
    * @tc.desc: 【G-SOFTWARE-0606】禁止修改支持多语言、定义资源文件和引用资源的规则
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('testResourceReferenceRulesNotChange0100', 0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      try {
        i18n.System.setAppPreferredLanguage('zh')
        expect(i18n.System.getAppPreferredLanguage()).assertEqual('zh')
      } catch (error) {
        expect(false).assertTrue()
      }
      await driver.delayMs(1000)
      let text = await driver.findComponent(ON.id('multilingualText').inWindow('com.acts.pcs.arktstest'))
      expect(text != undefined).assertTrue()
      expect(await text.getText()).assertEqual('中文文本')
      try {
        i18n.System.setAppPreferredLanguage('en')
        expect(i18n.System.getAppPreferredLanguage()).assertEqual('en')
      } catch (error) {
        expect(false).assertTrue()
      }
      await driver.delayMs(1000)
      text = await driver.findComponent(ON.id('multilingualText').inWindow('com.acts.pcs.arktstest'))
      expect(text != undefined).assertTrue()
      expect(await text.getText()).assertEqual('EnglishText')
      let image = await driver.findComponent(ON.id('image').inWindow('com.acts.pcs.arktstest'))
      expect(image != undefined).assertTrue()
      let imageLoadSuccess = await driver.findComponent(ON.id('imageLoadSuccess').inWindow('com.acts.pcs.arktstest'))
      expect(imageLoadSuccess != undefined).assertTrue()
      expect(await imageLoadSuccess.getText()).assertEqual("LoadSuccess")
      done()
    })

    /*
    * @tc.number: STD-SOFTWARE-0300
    * @tc.name: testCoreApplicationWants0100
    * @tc.desc: 【STD-SOFTWARE-0300】任何替代 ohos 核心应用程序的版本都必须遵守 ohos 核心应用程序提供的相同 want，系统实现者必须支持 ohos SDK 提供的所有 want。
    *           【STD-SOFTWARE-0301】系统实现者不应对使用 ohos SDK 提供的 want 的系统应用附加任何特权，不应阻止三方应用绑定并承担对这些 want 的控制。
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('testCoreApplicationWants0100', 0, async (done: Function) => {
      let driver = Driver.create()
      let filepickerWantInfo1: Want = {
        action: 'ohos.want.action.OPEN_FILE'
      }
      expect(await AbilityUtils.startAbilityImplicitly(filepickerWantInfo1, abilityContext)).assertTrue()
      await driver.delayMs(2000)
      done()
    })

    /*
     * @tc.number: G-SOFTWARE-0503
     * @tc.name: testForbidSilentInstall0100
     * @tc.desc: 【G-SOFTWARE-0503】禁止在没有任何用户提示的情况下静默安装应用。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testForbidSilentInstall0100', 0, async (done: Function) => {
      let hapFilePath = '/data/storage/el2/base/haps/entry/files/'
      try {
        let bundleInstaller = await installer.getBundleInstaller()
        await bundleInstaller.install([hapFilePath + 'bundle_fifth.hap'])
        expect(false).assertTrue()
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.log(`install bundle fail: code: ${err.code}, message: ${err.message}`)
      }
      done()
    })

    /*
     * @tc.number: G-SOFTWARE-0504
     * @tc.name: testForbidSilentUninstall0100
     * @tc.desc: 【G-SOFTWARE-0504】针对显式安装的应用，禁止在没有用户确认的情况下静默卸载应用。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testForbidSilentUninstall0100', 0, async (done: Function) => {
      try {
        let bundleInstaller = await installer.getBundleInstaller()
        await bundleInstaller.uninstall('com.pcs.software.bundle.second')
        expect(false).assertTrue()
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.log(`uninstall bundle fail: code: ${err.code}, message: ${err.message}`)
      }
      done()
    })

    /*
     * @tc.number: STD-SOFTWARE-0303
     * @tc.name: testCommonEventNotChanged0100
     * @tc.desc: 【STD-SOFTWARE-0303】系统实现者不应在 commonevent 命名空间中添加新的公共事件类型，
     *            不应更改或扩展 ohos 核心应用使用的任何公共事件。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCommonEventNotChanged0100', 0, async (done: Function) => {
      let currentCommonEventCounts = 214
      let commonEventValues: Array<CommonEventManager.Support> = Object.values(CommonEventManager.Support)
      expect(commonEventValues.length).assertLessOrEqual(currentCommonEventCounts)
      for(let commonEventValue of commonEventValues) {
        if(!commonEventValue.startsWith('usual.event.') && !commonEventValue.startsWith('common.event.')) {
          expect(false).assertTrue()
        }
      }
      done()
    })
  })
}