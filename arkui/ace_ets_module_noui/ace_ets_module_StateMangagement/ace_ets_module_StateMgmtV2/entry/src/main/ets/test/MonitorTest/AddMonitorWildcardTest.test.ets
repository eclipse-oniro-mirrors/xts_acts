/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';
const TAG = '[AddMonitorWildcardTest]';
const DOMAIN = 0xF811;

export default function AddMonitorWildcardTest() {
  describe('AddMonitorWildcardTest', () => {

    beforeEach(async (done: Function) => {
      console.info("AddMonitorWildcardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Monitor/AddMonitorWildcardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AddMonitorWildcardTest state pages: " + JSON.stringify(pages));
        if (!("AddMonitorWildcardTest" == pages.name)) {
          console.info("get AddMonitorWildcardTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AddMonitorWildcardTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitorWildcardTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'afterEach start');
    })

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll start');
    })

    /**
     * @tc.name   AddMonitorWildcardTest001
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0100
     * @tc.desc   Test UIUtils.addMonitor with wildcard for array push operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest001', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest001 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonArrayPush = await driver.findComponent(ON.id('button_array_push'));
      await buttonArrayPush.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest001 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest002
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0200
     * @tc.desc   Test UIUtils.addMonitor with wildcard for array pop operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest002', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest002 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonArrayPop = await driver.findComponent(ON.id('button_array_pop'));
      await buttonArrayPop.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest002 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest003
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0300
     * @tc.desc   Test UIUtils.addMonitor with wildcard for map set operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest003', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest003 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonMapSet = await driver.findComponent(ON.id('button_map_set'));
      await buttonMapSet.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest003 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest004
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0400
     * @tc.desc   Test UIUtils.addMonitor with wildcard for map delete operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest004', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest004 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonMapDelete = await driver.findComponent(ON.id('button_map_delete'));
      await buttonMapDelete.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest004 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest005
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0500
     * @tc.desc   Test UIUtils.addMonitor with wildcard for set add operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest005', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest005 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonSetAdd = await driver.findComponent(ON.id('button_set_add'));
      await buttonSetAdd.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest005 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest006
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0600
     * @tc.desc   Test UIUtils.addMonitor with wildcard for set delete operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest006', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest006 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonSetDelete = await driver.findComponent(ON.id('button_set_delete'));
      await buttonSetDelete.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest006 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest007
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0700
     * @tc.desc   Test UIUtils.addMonitor with wildcard for date setTime operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest007', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest007 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonDateSet = await driver.findComponent(ON.id('button_date_set'));
      await buttonDateSet.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest007 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest008
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0800
     * @tc.desc   Test UIUtils.addMonitor with wildcard for date setMilliseconds operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest008', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest008 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonDateMilliseconds = await driver.findComponent(ON.id('button_date_milliseconds'));
      await buttonDateMilliseconds.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest008 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest009
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_0900
     * @tc.desc   Test UIUtils.addMonitor with wildcard for person firstName change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest009', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest009 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonPersonFirstName = await driver.findComponent(ON.id('button_person_firstname'));
      await buttonPersonFirstName.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest009 end');
    })

    /**
     * @tc.name   AddMonitorWildcardTest010
     * @tc.number SUB_ARUI_ADDMONITOR_WILDCARD_1000
     * @tc.desc   Test UIUtils.addMonitor with wildcard for person lastName change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AddMonitorWildcardTest010', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest010 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonReset = await driver.findComponent(ON.id('button_reset_count'));
      await buttonReset.click();
      await CommonFunc.sleep(500);

      let buttonPersonLastName = await driver.findComponent(ON.id('button_person_lastname'));
      await buttonPersonLastName.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'AddMonitorWildcardTest010 end');
    })
  })
}
