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
const TAG = '[MonitorWildcardTest]';
const DOMAIN = 0xF811;

export default function MonitorWildcardTest() {
  describe('MonitorWildcardTest', () => {
    beforeEach(async (done: Function) => {
      console.info(" CommonFunc.MonitorWildcardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Monitor/MonitorWildcardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get  CommonFunc.MonitorWildcardTest state pages: " + JSON.stringify(pages));
        if (!("MonitorWildcardTest" == pages.name)) {
          console.info("get  CommonFunc.MonitorWildcardTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push  CommonFunc.MonitorWildcardTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push  CommonFunc.MonitorWildcardTest page error: " + err);
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
     * @tc.name   MonitorWildcardTest001
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0100
     * @tc.desc   Test @Monitor with wildcard for array push operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest001', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest001 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonArrayPush = await driver.findComponent(ON.id('button_array_push'));
      await buttonArrayPush.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest001 end');
    })

    /**
     * @tc.name   MonitorWildcardTest002
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0200
     * @tc.desc   Test @Monitor with wildcard for array pop operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest002', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest002 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonArrayPop = await driver.findComponent(ON.id('button_array_pop'));
      await buttonArrayPop.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest002 end');
    })

    /**
     * @tc.name   MonitorWildcardTest003
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0300
     * @tc.desc   Test @Monitor with wildcard for map set operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest003', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest003 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonMapSet = await driver.findComponent(ON.id('button_map_set'));
      await buttonMapSet.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest003 end');
    })

    /**
     * @tc.name   MonitorWildcardTest004
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0400
     * @tc.desc   Test @Monitor with wildcard for map delete operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest004', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest004 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonMapDelete = await driver.findComponent(ON.id('button_map_delete'));
      await buttonMapDelete.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest004 end');
    })

    /**
     * @tc.name   MonitorWildcardTest005
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0500
     * @tc.desc   Test @Monitor with wildcard for set add operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest005', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest005 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonSetAdd = await driver.findComponent(ON.id('button_set_add'));
      await buttonSetAdd.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest005 end');
    })

    /**
     * @tc.name   MonitorWildcardTest006
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0600
     * @tc.desc   Test @Monitor with wildcard for set delete operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest006', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest006 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonSetDelete = await driver.findComponent(ON.id('button_set_delete'));
      await buttonSetDelete.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest006 end');
    })

    /**
     * @tc.name   MonitorWildcardTest007
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0700
     * @tc.desc   Test @Monitor with wildcard for date setTime operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest007', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest007 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonDateSet = await driver.findComponent(ON.id('button_date_set'));
      await buttonDateSet.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest007 end');
    })

    /**
     * @tc.name   MonitorWildcardTest008
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0800
     * @tc.desc   Test @Monitor with wildcard for date setMilliseconds operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest008', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest008 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonDateMilliseconds = await driver.findComponent(ON.id('button_date_milliseconds'));
      await buttonDateMilliseconds.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest008 end');
    })

    /**
     * @tc.name   MonitorWildcardTest009
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_0900
     * @tc.desc   Test @Monitor with wildcard for person firstName change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest009', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest009 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonPersonFirstName = await driver.findComponent(ON.id('button_person_firstname'));
      await buttonPersonFirstName.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest009 end');
    })

    /**
     * @tc.name   MonitorWildcardTest010
     * @tc.number SUB_ARUI_MONITOR_WILDCARD_1000
     * @tc.desc   Test @Monitor with wildcard for person lastName change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('MonitorWildcardTest010', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest010 start');
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let buttonPersonLastName = await driver.findComponent(ON.id('button_person_lastname'));
      await buttonPersonLastName.click();
      await CommonFunc.sleep(500);

      let callbackCountText = await driver.findComponent(ON.id('callback_count_text'));
      let countText = await callbackCountText.getText();
      expect(countText).assertContain('Callback Count: 1');

      hilog.info(DOMAIN, TAG, 'MonitorWildcardTest010 end');
    })
  })
}
