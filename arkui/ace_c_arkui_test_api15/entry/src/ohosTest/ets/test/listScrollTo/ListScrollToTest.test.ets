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

import { expect, describe, it, afterEach } from '@ohos/hypium'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest'
import Utils from '../common/Utils'

export default function listScrollToIndexTest(){

  describe('listScrollToIndexTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_001
     * @tc.name       : listScrollToIndexTest001
     * @tc.desc       : testing List ScrollToIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('listScrollToIndexTest001', 0, async (done: Function) => {
      console.info('listScrollToIndexTest001 START' )
      let PAGE_TAG = 'ListScrollToTest'
      await Utils.pushPage(`listScrollTo/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)	

      let scrollToIndex10Button = await driver.findComponent(ON.id('scrollToIndex10'))
      await scrollToIndex10Button.click()
      await Utils.sleep(1000)
      let listRect: Rect = Utils.getComponentRect('ListId1');
      console.info('listScrollToIndexTest001 ' + listRect.top)
      let listItemRect: Rect = Utils.getComponentRect('listItem10');
      console.info('listScrollToIndexTest001 ' + listItemRect.top)
      console.info('listScrollToIndexTest001 ' + Math.abs(listRect.top - listItemRect.top))
      expect(Math.abs(listRect.top - listItemRect.top) <= 31).assertTrue();
      console.info('listScrollToIndexTest001 END')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_002
     * @tc.name       : listScrollToItemInGroupTest001
     * @tc.desc       : testing List ScrollToItemInGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('listScrollToItemInGroupTest001', 0, async (done: Function) => {
      console.info('listScrollToItemInGroupTest001 START' )
      let PAGE_TAG = 'ListScrollToTest'
      await Utils.pushPage(`listScrollTo/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)	

      let scrollTo7In2Button = await driver.findComponent(ON.id('scrollTo7In2'))
      await scrollTo7In2Button.click()
      await Utils.sleep(1000)
      let listRect: Rect = Utils.getComponentRect('ListId2');
      console.info('listScrollToItemInGroupTest001 ' + listRect.top)
      let listItemRect: Rect = Utils.getComponentRect('listItem7to2');
      console.info('listScrollToItemInGroupTest001 ' + listItemRect.top)
      console.info('listScrollToItemInGroupTest001 ' + Math.abs(listRect.top - listItemRect.top))
      expect(Math.abs(listRect.top - listItemRect.top) <= 1).assertTrue();
      console.info('listScrollToItemInGroupTest001 END')
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_003
     * @tc.name       : listItemGroupHeaderAndFooterTest001
     * @tc.desc       : testing ListItem header and footer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('listItemGroupHeaderAndFooterTest001', 0, async (done: Function) => {
      console.info('listItemGroupHeaderAndFooterTest001 START' )
      let PAGE_TAG = 'ListScrollToTest'
      await Utils.pushPage(`listScrollTo/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let scrollToEndButton = await driver.findComponent(ON.id('scrollToEnd'))
      await scrollToEndButton.click()
      await Utils.sleep(1000)

      let strJson = getInspectorByKey('setHeader');
      let strJson2 = getInspectorByKey('setFooter');
      console.info("listItemGroupHeaderAndFooterTest001 setHeader" + String(strJson))
      console.info("listItemGroupHeaderAndFooterTest001 setFooter" + String(strJson2))
      expect(String(strJson) !== '').assertTrue()
      expect(String(strJson2) !== '').assertTrue()
      expect(JSON.parse(strJson).$attrs.content == 'setHeader').assertTrue();
      expect(JSON.parse(strJson2).$attrs.content == 'setFooter').assertTrue();

      let resetHeaderFooterButton = await driver.findComponent(ON.id('resetHeaderFooter'))
      await resetHeaderFooterButton.click()
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('setHeader');
      let strJson4 = getInspectorByKey('setFooter');
      console.info("listItemGroupHeaderAndFooterTest001 setHeader" + String(strJson3))
      console.info("listItemGroupHeaderAndFooterTest001 setFooter" + String(strJson4))
      expect(String(strJson3) == '').assertTrue()
      expect(String(strJson4) == '').assertTrue()
      console.info('listItemGroupHeaderAndFooterTest001 END')
      done()
    })
  })
}