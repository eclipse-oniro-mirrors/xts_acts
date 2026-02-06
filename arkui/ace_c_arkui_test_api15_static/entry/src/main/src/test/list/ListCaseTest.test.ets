'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium'
import { Driver, ON, PointerMatrix, Rect, Component } from '@ohos.UiTest'
import Utils from '../common/Utils'
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function listCaseTest() {

  describe('listCaseTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   listLanesTest001
     * @tc.name     listLanesTest001
     * @tc.desc     listLanesTest001
     * @tc.level    Level.LEVEL1
     */
    it('listLanesTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listLanesTest001 START')
      let PAGE_TAG = 'ListCaseTest'
      await Utils.pushPage(`list/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)

      let setLanesButton: Component = await driver.findComponent(ON.id('setLanes')) as Component
      await setLanesButton.click()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson)
      console.info('listLanesTest001 lanes1 ' + obj.getElement('$attrs').getString('lanes'))
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('1')

      let setLanesButton1: Component = await driver.findComponent(ON.id('setLanes1')) as Component
      await setLanesButton1.click()
      await Utils.sleep(1000)
      strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      obj = JSON.parseJsonElement(strJson)
      console.info('listLanesTest001 lanes2 ' + obj.getElement('$attrs').getString('lanes'))
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('2')

      let resetLanesButton: Component = await driver.findComponent(ON.id('resetLanes')) as Component
      await resetLanesButton.click()
      await Utils.sleep(1000)
      strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      obj = JSON.parseJsonElement(strJson)
      console.info('listLanesTest001 lanes3 ' + obj.getElement('$attrs').getString('lanes'))
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('1')
      console.info('listLanesTest001 END')
      done()
    })

    
    /**
     * @tc.number   listscrollSnapAlignTest001
     * @tc.name     listscrollSnapAlignTest001
     * @tc.desc     listscrollSnapAlignTest001
     * @tc.level    Level.LEVEL1
     */
    it('listscrollSnapAlignTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listscrollSnapAlignTest001 START')
      let PAGE_TAG = 'ListCaseTest'
      await Utils.pushPage(`list/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)

      let setscrollAlignButton: Component = await driver.findComponent(ON.id('setscrollAlign')) as Component
      await setscrollAlignButton.click()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson)
      console.info('listscrollSnapAlignTest001 scrollSnapAlign1 ' +
      obj.getElement('$attrs').getString('scrollSnapAlign'))
      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual('ScrollSnapAlign.END')

      let resetscrollAlignButton: Component = await driver.findComponent(ON.id('resetscrollAlign')) as Component
      await resetscrollAlignButton.click()
      await Utils.sleep(1000)
      strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      obj = JSON.parseJsonElement(strJson)
      console.info('listscrollSnapAlignTest001 scrollSnapAlign2 ' +
      obj.getElement('$attrs').getString('scrollSnapAlign'))
      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual('ScrollSnapAlign.NONE')
      console.info('listscrollSnapAlignTest001 END')
      done()
    })

    
    /**
     * @tc.number   listContentOffsetTest001
     * @tc.name     listContentOffsetTest001
     * @tc.desc     listContentOffsetTest001
     * @tc.level    Level.LEVEL1
     */
    it('listContentOffsetTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listContentOffsetTest001 START')
      let PAGE_TAG = 'ListCaseTest'
      await Utils.pushPage(`list/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)

      let setcontentOffsetButton: Component = await driver.findComponent(ON.id('setcontentOffset')) as Component
      await setcontentOffsetButton.click()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson)
      console.info('listContentOffsetTest001 contentStartOffset1 ' +
      obj.getElement('$attrs').getString('contentStartOffset'))
      console.info('listContentOffsetTest001 contentEndOffset1 ' +
      obj.getElement('$attrs').getString('contentEndOffset'))
      //        expect(obj.getElement('$attrs').contentStartOffset).assertEqual('100.000000')
      //        expect(obj.getElement('$attrs').contentEndOffset).assertEqual('100.000000')

      expect(Math.abs(Math.round(Number(obj.getElement('$attrs').getString('contentStartOffset'))) - 100) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Number(obj.getElement('$attrs').getString('contentEndOffset'))) - 100) <= 1)
        .assertTrue();

      console.info('listContentOffsetTest001 1111')
      let scrollToIndex40Button: Component = await driver.findComponent(ON.id('scrollToIndex40')) as Component
      await scrollToIndex40Button.click()
      await Utils.sleep(1000)
      let scrollToIndex0Button: Component = await driver.findComponent(ON.id('scrollToIndex0')) as Component
      await scrollToIndex0Button.click()
      await Utils.sleep(1000)

      let resetcontentOffsetButton: Component = await driver.findComponent(ON.id('resetcontentOffset')) as Component
      await resetcontentOffsetButton.click()
      await Utils.sleep(1000)
      strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      obj = JSON.parseJsonElement(strJson)
      console.info('listContentOffsetTest001 contentStartOffset2 ' +
      obj.getElement('$attrs').getString('contentStartOffset'))
      console.info('listContentOffsetTest001 contentEndOffset2 ' +
      obj.getElement('$attrs').getString('contentEndOffset'))

      expect(Math.abs(Math.round(Number(obj.getElement('$attrs').getString('contentStartOffset'))) - 0) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Number(obj.getElement('$attrs').getString('contentEndOffset'))) - 0) <= 1)
        .assertTrue();
      //        expect(obj.getElement('$attrs').contentStartOffset).assertEqual('0.000000')
      //        expect(obj.getElement('$attrs').contentEndOffset).assertEqual('0.000000')


      console.info('listContentOffsetTest001 END')
      done()
    })

    
    /**
     * @tc.number   listmaintainVisibleContentPositionTest001
     * @tc.name     listmaintainVisibleContentPositionTest001
     * @tc.desc     listmaintainVisibleContentPositionTest001
     * @tc.level    Level.LEVEL1
     */
    it('listmaintainVisibleContentPositionTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listmaintainVisibleContentPositionTest001 START')
      let PAGE_TAG = 'ListCaseTest'
      await Utils.pushPage(`list/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      let obj = JSON.parseJsonElement(strJson)
      console.info('listmaintainVisibleContentPositionTest001 ' +
      obj.getElement('$attrs').getBoolean('maintainVisibleContentPosition'))
      expect(obj.getElement('$attrs').getBoolean('maintainVisibleContentPosition')).assertEqual(true)

      let resetmaintainVisibleButton: Component =
        await driver.findComponent(ON.id('resetmaintainVisibleContentPosition')) as Component
      await resetmaintainVisibleButton.click()
      await Utils.sleep(1000)
      strJson = inspector.getInspectorByKey('ListId')
      await Utils.sleep(1000)
      obj = JSON.parseJsonElement(strJson)
      console.info('listmaintainVisibleContentPositionTest001 ' +
      obj.getElement('$attrs').getBoolean('maintainVisibleContentPosition'))
      expect(obj.getElement('$attrs').getBoolean('maintainVisibleContentPosition')).assertEqual(false)
      console.info('listmaintainVisibleContentPositionTest001 END')
      done()
    })
  })
}