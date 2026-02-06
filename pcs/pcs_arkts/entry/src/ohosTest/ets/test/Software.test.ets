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

import { describe, it, expect, beforeAll, TestType, Level, Size } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import i18n from '@ohos.i18n';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';
import installer from '@ohos.bundle.installer';
import fs from '@ohos.file.fs';

import AbilityUtils from './AbilityUtils'
import { Options } from '@kit.CoreFileKit';


async function getSystemSupportEvent() {
  let hapFilePath = '/data/storage/el2/base/haps/entry/files/'
  let options: Options = {
    encoding: 'utf-8'
  };
  let eventList: string[] = [];
  try {
    let readerIterator: fs.ReaderIterator = await fs.readLines(hapFilePath + 'common_event.txt', options);
    for (let it = readerIterator.next(); !it.done; it = readerIterator.next()) {
      let lineList: string[] = it.value.trim().split('=');
      if (lineList.length == 1) {
        let item = lineList[0];
        if (item) {
          item = item.trim();
          let index = item.indexOf('\"');
          let lastIndex = item.lastIndexOf('\"');
          let result = item.substring(index + 1, lastIndex);
          if (result) {
            if(result.startsWith("usual.event") || result.startsWith('common.event.')) {
              console.log(`testCommonEventNotChanged0100 item 000000 , ${ result } `);
              eventList.push(result);
            }
          }
        }
      }
      if (lineList.length == 2) {
        let item = lineList[1];
        if (item) {
          item = item.trim();
          let index = item.indexOf('\"');
          let lastIndex = item.lastIndexOf('\"');
          let result = item.substring(index + 1, lastIndex);
          if (result) {
            if(result.startsWith('usual.event.') || result.startsWith('common.event.')) {
              console.log(`testCommonEventNotChanged0100 item 000000 , ${ result } `);
              eventList.push(result);
            }
          }
        }
      }
    }
  } catch (err) {
    console.log(`ljl testCommonEventNotChanged0100 getSystemSupportEvent error, ${JSON.stringify(err)}`)
  }
  return eventList;
}

export default function softwareTest() {
  describe('SoftwareTest', () => {
    let abilityContext: common.UIAbilityContext
    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(2000)
      done()
    })

    /**
     * @tc.name   testBackToLastPage0100
     * @tc.number G-SOFTWARE-0402
     * @tc.desc   【G-SOFTWARE-0402】应实现一个可让用户轻松切换到前一个 FA 的快捷方式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBackToLastPage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      let scroll = await driver.findComponent(ON.id('scroll').inWindow('com.acts.pcs.arktstest'))
      await driver.delayMs(1000)
      let firstButton = await scroll.scrollSearch(ON.id('firstButton').inWindow('com.acts.pcs.arktstest'))
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

    /**
     * @tc.name   testResourceReferenceRulesNotChange0100
     * @tc.number G-SOFTWARE-0606
     * @tc.desc   【G-SOFTWARE-0606】禁止修改支持多语言、定义资源文件和引用资源的规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceReferenceRulesNotChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'EntryAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      let scroll = await driver.findComponent(ON.id('scroll').inWindow('com.acts.pcs.arktstest'))
      try {
        i18n.System.setAppPreferredLanguage('zh')
        expect(i18n.System.getAppPreferredLanguage()).assertEqual('zh')
      } catch (error) {
        expect(false).assertTrue()
      }
      await driver.delayMs(1000)
      let text = await scroll.scrollSearch(ON.id('multilingualText').inWindow('com.acts.pcs.arktstest'));
      expect(text != undefined).assertTrue()
      expect(await text.getText()).assertEqual('中文文本')
      try {
        i18n.System.setAppPreferredLanguage('en')
        expect(i18n.System.getAppPreferredLanguage()).assertEqual('en')
      } catch (error) {
        expect(false).assertTrue()
      }
      await driver.delayMs(1000)
      text = await scroll.scrollSearch(ON.id('multilingualText').inWindow('com.acts.pcs.arktstest'))
      expect(text != undefined).assertTrue()
      expect(await text.getText()).assertEqual('EnglishText')
      let image = await scroll.scrollSearch(ON.id('image').inWindow('com.acts.pcs.arktstest'))
      expect(image != undefined).assertTrue()
      let imageLoadSuccess = await scroll.scrollSearch(ON.id('imageLoadSuccess').inWindow('com.acts.pcs.arktstest'))
      expect(imageLoadSuccess != undefined).assertTrue()
      expect(await imageLoadSuccess.getText()).assertEqual("LoadSuccess")
      done()
    })

    /**
     * @tc.name   testCoreApplicationWants0100
     * @tc.number STD-SOFTWARE-0300
     * @tc.desc   【STD-SOFTWARE-0300】任何替代 ohos 核心应用程序的版本都必须遵守 ohos 核心应用程序提供的相同 want，系统实现者必须支持 ohos SDK 提供的所有 want。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoreApplicationWants0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create()
      let filepickerWantInfo1: Want = {
        uri: 'http://assist.arkts.pcs.acts.com',
        type: "pcs/test"
      }
      expect(await AbilityUtils.startAbilityImplicitly(filepickerWantInfo1, abilityContext)).assertTrue()
      await driver.delayMs(2000)
      let openButton = await driver.findComponent(ON.within(ON.type('Dialog')).text('打开'))
      if(openButton != undefined && openButton != null) {
        await openButton.click()
        await driver.delayMs(2000)
      }
      let openButton1 = await driver.findComponent(ON.within(ON.type('Dialog')).text('本次打开'))
      if(openButton1 != undefined && openButton1 != null) {
        await openButton1.click()
        await driver.delayMs(2000)
      }
      let openButton2 = await driver.findComponent(ON.within(ON.type('Dialog')).text('始终允许打开'))
      if(openButton2 != undefined && openButton2 != null) {
        await openButton2.click()
        await driver.delayMs(2000)
      }
      done()
    })

    /**
     * @tc.name   testForbidSilentInstall0100
     * @tc.number G-SOFTWARE-0503
     * @tc.desc   【G-SOFTWARE-0503】禁止在没有任何用户提示的情况下静默安装应用。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForbidSilentInstall0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   testForbidSilentUninstall0100
     * @tc.number G-SOFTWARE-0504
     * @tc.desc   【G-SOFTWARE-0504】针对显式安装的应用，禁止在没有用户确认的情况下静默卸载应用。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForbidSilentUninstall0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   testCommonEventNotChanged0100
     * @tc.number STD-SOFTWARE-0303
     * @tc.desc   【STD-SOFTWARE-0303】系统实现者不应在 commonevent 命名空间中添加新的公共事件类型，
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCommonEventNotChanged0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log(`testCommonEventNotChanged0100 start`)
      let eventList = await getSystemSupportEvent();
      console.log(`testCommonEventNotChanged0100 eventList, ${JSON.stringify(eventList)}`)
      let commonEventValues: Array<CommonEventManager.Support> = Object.values(CommonEventManager.Support)
      console.log(`testCommonEventNotChanged0100 commonEventValues, ${JSON.stringify(commonEventValues)}`);
      let errorEventList: Array<CommonEventManager.Support> = [];
      for(let commonEventValue of commonEventValues) {
        let index = eventList.indexOf(commonEventValue);
        if (index < 0) {
          errorEventList.push(commonEventValue);
        }
      }
      if (errorEventList.length > 0) {
        console.log(`testCommonEventNotChanged0100 errorEventList, ${JSON.stringify(errorEventList)}`);
        expect(false).assertTrue()
      }
      console.log(`testCommonEventNotChanged0100 end`)
      done()
    })
  })
}