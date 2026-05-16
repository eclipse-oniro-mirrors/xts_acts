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
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest'
import Utils from '../common/Utils'
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function listScrollToIndexTest(){

  describe('listScrollToIndexTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   listScrollToIndexTest001
     * @tc.name     listScrollToIndexTest001
     * @tc.desc     listScrollToIndexTest001
     * @tc.level    Level.LEVEL1
     */
    it('listScrollToIndexTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listScrollToIndexTest001 START' )
      let PAGE_TAG = 'ListScrollToTest'
      await Utils.pushPage(`listScrollTo/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let scrollToIndex10Button:Component | null = await driver.findComponent(ON.id('scrollToIndex10'))
      await (scrollToIndex10Button?.click() as Promise<void>)
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('ListId1')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListId1')
      let obj2 = JSON.parseJsonElement(strJson2);
      let listRect = Utils.getComponentRectByObj(obj1);
      console.info('listScrollToIndexTest001 ' + listRect.top)
      let listItemRect = Utils.getComponentRectByObj(obj2);
      console.info('listScrollToIndexTest001 ' + listItemRect.top)
      console.info('listScrollToIndexTest001 ' + Math.abs(listRect.top - listItemRect.top))
      expect(Math.abs(listRect.top - listItemRect.top) <= 31).assertTrue();
      console.info('listScrollToIndexTest001 END')
      done()
    })

    
    /**
     * @tc.number   listScrollToItemInGroupTest001
     * @tc.name     listScrollToItemInGroupTest001
     * @tc.desc     listScrollToItemInGroupTest001
     * @tc.level    Level.LEVEL1
     */
    it('listScrollToItemInGroupTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listScrollToItemInGroupTest001 START' )
      let PAGE_TAG = 'ListScrollToTest'
      await Utils.pushPage(`listScrollTo/${PAGE_TAG}`)
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)	

      let scrollTo7In2Button:Component = await driver.findComponent(ON.id('scrollTo7In2')) as Component
      await scrollTo7In2Button.click()
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('ListId2')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('ListId2')
      let obj2 = JSON.parseJsonElement(strJson2);
      let listRect = Utils.getComponentRectByObj(obj1);
      console.info('listScrollToItemInGroupTest001 ' + listRect.top)
      let listItemRect = Utils.getComponentRectByObj(obj2);
      console.info('listScrollToItemInGroupTest001 ' + listItemRect.top)
      console.info('listScrollToItemInGroupTest001 ' + Math.abs(listRect.top - listItemRect.top))
      expect(Math.abs(listRect.top - listItemRect.top) <= 1).assertTrue();
      console.info('listScrollToItemInGroupTest001 END')
      done()
    })

  })
}