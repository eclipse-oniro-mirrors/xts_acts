/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest'
import Utils from '../common/Utils'

export default function listCaseTest(){

  describe('listCaseTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   listLanesTest001
     * @tc.number SUB_ARKUI_CAPI_LIST_001
     * @tc.desc   testing List lanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listLanesTest001', Level.LEVEL1, async (done: Function) => {
        console.info('listLanesTest001 START' )
        let PAGE_TAG = 'ListCaseTest'
        await Utils.pushPage(`list/${PAGE_TAG}`)
        await Utils.sleep(1000)
        let driver = await Driver.create()
        await Utils.sleep(1000)	

        let setLanesButton = await driver.findComponent(ON.id('setLanes'))
        await setLanesButton.click()
        await Utils.sleep(1000)
        let  strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        let obj: ESObject = JSON.parse(strJson)
        console.info('listLanesTest001 lanes1 ' + obj.$attrs.lanes)
        expect(obj.$attrs.lanes).assertEqual('1')

        let setLanesButton1 = await driver.findComponent(ON.id('setLanes1'))
        await setLanesButton1.click()
        await Utils.sleep(1000)
        strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        obj = JSON.parse(strJson)
        console.info('listLanesTest001 lanes2 ' + obj.$attrs.lanes)
        expect(obj.$attrs.lanes).assertEqual('2')

        let resetLanesButton = await driver.findComponent(ON.id('resetLanes'))
        await resetLanesButton.click()
        await Utils.sleep(1000)
        strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        obj = JSON.parse(strJson)
        console.info('listLanesTest001 lanes3 ' + obj.$attrs.lanes)
        expect(obj.$attrs.lanes).assertEqual('1')
        console.info('listLanesTest001 END')
        done()
    })

    /**
     * @tc.name   listscrollSnapAlignTest001
     * @tc.number SUB_ARKUI_CAPI_LIST_002
     * @tc.desc   testing List scrollSnapAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listscrollSnapAlignTest001', Level.LEVEL1, async (done: Function) => {
        console.info('listscrollSnapAlignTest001 START' )
        let PAGE_TAG = 'ListCaseTest'
        await Utils.pushPage(`list/${PAGE_TAG}`)
        await Utils.sleep(1000)
        let driver = await Driver.create()
        await Utils.sleep(1000)	

        let setscrollAlignButton = await driver.findComponent(ON.id('setscrollAlign'))
        await setscrollAlignButton.click()
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        let obj: ESObject = JSON.parse(strJson)
        console.info('listscrollSnapAlignTest001 scrollSnapAlign1 ' + obj.$attrs.scrollSnapAlign)
        expect(obj.$attrs.scrollSnapAlign).assertEqual('ScrollSnapAlign.END')

        let resetscrollAlignButton = await driver.findComponent(ON.id('resetscrollAlign'))
        await resetscrollAlignButton.click()
        await Utils.sleep(1000)
        strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        obj = JSON.parse(strJson)
        console.info('listscrollSnapAlignTest001 scrollSnapAlign2 ' + obj.$attrs.scrollSnapAlign)
        expect(obj.$attrs.scrollSnapAlign).assertEqual('ScrollSnapAlign.NONE')
        console.info('listscrollSnapAlignTest001 END')
        done()
    })

    /**
     * @tc.name   listContentOffsetTest001
     * @tc.number SUB_ARKUI_CAPI_LIST_003
     * @tc.desc   testing List contentStartOffset And contentAndOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listContentOffsetTest001', Level.LEVEL1, async (done: Function) => {
        console.info('listContentOffsetTest001 START' )
        let PAGE_TAG = 'ListCaseTest'
        await Utils.pushPage(`list/${PAGE_TAG}`)
        await Utils.sleep(1000)
        let driver = await Driver.create()
        await Utils.sleep(1000)	

        let setcontentOffsetButton = await driver.findComponent(ON.id('setcontentOffset'))
        await setcontentOffsetButton.click()
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        let obj: ESObject = JSON.parse(strJson)
        console.info('listContentOffsetTest001 contentStartOffset1 ' + obj.$attrs.contentStartOffset)
        console.info('listContentOffsetTest001 contentEndOffset1 ' + obj.$attrs.contentEndOffset)
//        expect(obj.$attrs.contentStartOffset).assertEqual('100.000000')
//        expect(obj.$attrs.contentEndOffset).assertEqual('100.000000')

        expect(Math.abs(Math.round(Number(obj.$attrs.contentStartOffset)) - 100) <= 1).assertTrue();
        expect(Math.abs(Math.round(Number(obj.$attrs.contentEndOffset)) - 100) <= 1).assertTrue();

        console.info('listContentOffsetTest001 1111')
        let scrollToIndex40Button = await driver.findComponent(ON.id('scrollToIndex40'))
        await scrollToIndex40Button.click()
        await Utils.sleep(1000)
        let scrollToIndex0Button = await driver.findComponent(ON.id('scrollToIndex0'))
        await scrollToIndex0Button.click()
        await Utils.sleep(1000)

        let resetcontentOffsetButton = await driver.findComponent(ON.id('resetcontentOffset'))
        await resetcontentOffsetButton.click()
        await Utils.sleep(1000)
        strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        obj = JSON.parse(strJson)
        console.info('listContentOffsetTest001 contentStartOffset2 ' + obj.$attrs.contentStartOffset)
        console.info('listContentOffsetTest001 contentEndOffset2 ' + obj.$attrs.contentEndOffset)

        expect(Math.abs(Math.round(Number(obj.$attrs.contentStartOffset)) - 0) <= 1).assertTrue();
        expect(Math.abs(Math.round(Number(obj.$attrs.contentEndOffset)) - 0) <= 1).assertTrue();
//        expect(obj.$attrs.contentStartOffset).assertEqual('0.000000')
//        expect(obj.$attrs.contentEndOffset).assertEqual('0.000000')


        console.info('listContentOffsetTest001 END')
        done()
    })

    /**
     * @tc.name   listmaintainVisibleContentPositionTest001
     * @tc.number SUB_ARKUI_CAPI_LIST_004
     * @tc.desc   testing List maintainVisibleContentPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listmaintainVisibleContentPositionTest001', Level.LEVEL1, async (done: Function) => {
        console.info('listmaintainVisibleContentPositionTest001 START' )
        let PAGE_TAG = 'ListCaseTest'
        await Utils.pushPage(`list/${PAGE_TAG}`)
        await Utils.sleep(1000)
        let driver = await Driver.create()
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        let obj: ESObject = JSON.parse(strJson)
        console.info('listmaintainVisibleContentPositionTest001 ' + obj.$attrs.maintainVisibleContentPosition)
        expect(obj.$attrs.maintainVisibleContentPosition).assertEqual(true)

        let resetmaintainVisibleButton = await driver.findComponent(ON.id('resetmaintainVisibleContentPosition'))
        await resetmaintainVisibleButton.click()
        await Utils.sleep(1000)
        strJson = getInspectorByKey('ListId')
        await Utils.sleep(1000)
        obj = JSON.parse(strJson)
        console.info('listmaintainVisibleContentPositionTest001 ' + obj.$attrs.maintainVisibleContentPosition)
        expect(obj.$attrs.maintainVisibleContentPosition).assertEqual(false)
        console.info('listmaintainVisibleContentPositionTest001 END')
        done()
    })
  })
}