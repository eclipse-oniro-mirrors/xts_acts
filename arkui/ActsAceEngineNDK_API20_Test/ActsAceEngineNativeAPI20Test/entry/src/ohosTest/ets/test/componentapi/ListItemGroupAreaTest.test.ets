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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";
import { ON, Component, Point } from '@kit.TestKit';

export default function ListItemGroupAreaTest() {
  describe('ListItemGroupAreaTest', () => {
    let Component: Component;
    let ComponentPoint: Point;
    beforeEach(async (done: Function) => {
      await Utils.pushPageNoClear(`componentapi/ListItemGroupArea`);
      Component = await Utils.driver.findComponent(ON.id('SwiperList'));
      ComponentPoint = await Component.getBoundsCenter();
      done();
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100
     * @tc.name    : testListItemGroupArea0100
     * @tc.desc    : Test the ListItemGroup component area.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testListItemGroupArea0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100 start<====`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y - 350, 5000);
        await Utils.sleep(300);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y + 350, 5000);
        await Utils.sleep(300);
        await Utils.driver.click(ComponentPoint.x, ComponentPoint.y);
        let result: number = nativexcomponent.TestAreaOutside();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200
     * @tc.name    : testListItemGroupArea0200
     * @tc.desc    : Test the ListItemGroup component area.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testListItemGroupArea0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200 start<====`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y - 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y + 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.click(ComponentPoint.x, ComponentPoint.y);
        let result: number = nativexcomponent.TestAreaNone();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300
     * @tc.name    : testListItemGroupArea0300
     * @tc.desc    : Test the ListItemGroup component area.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testListItemGroupArea0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300 start<====`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y - 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y + 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.click(ComponentPoint.x, ComponentPoint.y);
        let result: number = nativexcomponent.TestAreaItem();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400
     * @tc.name    : testListItemGroupArea0400
     * @tc.desc    : Test the ListItemGroup component area.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testListItemGroupArea0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400 start<====`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y - 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y + 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.click(ComponentPoint.x, ComponentPoint.y);
        let result: number = nativexcomponent.TestAreaHeader();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500
     * @tc.name    : testListItemGroupArea0500
     * @tc.desc    : Test the ListItemGroup component area.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testListItemGroupArea0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500 start<====`);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y - 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, ComponentPoint.x,
                           ComponentPoint.y + 250, 8000);
        await Utils.sleep(300);
        await Utils.driver.click(ComponentPoint.x, ComponentPoint.y);
        let result: number = nativexcomponent.TestAreaFooter();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}