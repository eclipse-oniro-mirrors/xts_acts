/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";
let tcName = ''
const EVENT_ID_SET_SUITE_KEY = 176201;
const driver = Driver.create();

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      try {
        await driver.waitForComponent(ON.id("WebEnableDataDetectorButton"), 10000);
      } catch (err) {
        console.error("push WebViewControllerHitTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   SearchAllAsync
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_016
     * @tc.desc   SearchAllAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchAllAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitSearchAllAsync';
      tcName = 'SearchAllAsync'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "01", 176210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   ContextMenuMediaType
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033
     * @tc.desc   ContextMenuMediaType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContextMenuMediaType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitContextMenuMediaType';
      tcName = 'ContextMenuMediaType'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 1, 176220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   ContextMenuInputFieldType
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034
     * @tc.desc   ContextMenuInputFieldType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContextMenuInputFieldType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitContextMenuInputFieldType';
      tcName = 'ContextMenuInputFieldType'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 1, 176230, () => { isReturn = true });
      Utils.registerEvent(tcName, 4, 176231, () => { isReturn = true });
      Utils.registerEvent(tcName, 5, 176232, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   ContextMenuEditStateFlags
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_035
     * @tc.desc   ContextMenuEditStateFlags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContextMenuEditStateFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitContextMenuEditStateFlags';
      tcName = 'ContextMenuEditStateFlags'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 0, 176240, () => { isReturn = true });
      Utils.registerEvent(tcName, 1, 176241, () => { isReturn = true });
      Utils.registerEvent(tcName, 2, 176242, () => { isReturn = true });
      Utils.registerEvent(tcName, 4, 176243, () => { isReturn = true });
      Utils.registerEvent(tcName, 8, 176244, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testGetFavicon
     * @tc.number SUB_ACE_BASIC_ETS_API_0800
     * @tc.desc   test for getFavicon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFavicon',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitGetFavicon';
      tcName = 'testGetFavicon'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, null, 176250, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testGetFaviconAgain
     * @tc.number SUB_ACE_BASIC_ETS_API_0900
     * @tc.desc   test for getFavicon again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFaviconAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey = 'emitGetFaviconAgain';
      tcName = 'testGetFaviconAgain'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176260, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testOnSearchResultReceive001
     * @tc.number SUB_WEB_ONSEARCHRESULTRECEIVE_0100
     * @tc.desc   test onSearchResultReceive when have results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSearchResultReceive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitOnSearchResultReceive001';
      tcName = 'testOnSearchResultReceive001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 3, 176270, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testOnSearchResultReceive002
     * @tc.number SUB_WEB_ONSEARCHRESULTRECEIVE_0200
     * @tc.desc   test onSearchResultReceive when have no results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSearchResultReceive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitOnSearchResultReceive002';
      tcName = 'testOnSearchResultReceive002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 0, 176280, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    
  })
}
