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

import { afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function focusWrapModeTest() {

  describe('focusWrapModeTest', () => {
    const SLEEP_TIME = 1000;
    const TAB_KEY = 2049;
    const RIGHT_KEY = 2015;
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   FocusWrapMode_001
     * @tc.number FocusWrapMode_001
     * @tc.desc   FocusWrapMode: 0, the cross axis directional keys cannot wrap lines.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusWrapMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FocusWrapMode_001] start');
      let PAGE_TAG = 'FocusWrapModeTest001';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('focusWrapModeID0');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FocusWrapMode_001]: ' + JSON.stringify(obj.$attrs.focusWrapMode));
      expect(obj.$attrs.focusWrapMode).assertEqual('FocusWrapMode.DEFAULT');

      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(TAB_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('isFocus'));
     
      let btn_isFocusedValue = await btn.isFocused();
      console.info('[FocusWrapMode_001] GridItem isFocused ' + btn_isFocusedValue);
      expect(btn_isFocusedValue).assertEqual(false);
      console.info('FocusWrapMode_001 END');
      done();
    });

    /**
     * @tc.name   FocusWrapMode_002
     * @tc.number FocusWrapMode_002
     * @tc.desc   FocusWrapMode: 1,The cross axis directional keys can wrap lines.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusWrapMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FocusWrapMode_002] start');
      await Utils.sleep(SLEEP_TIME);
      let PAGE_TAG = 'FocusWrapModeTest002';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('focusWrapModeID1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FocusWrapMode_002]: ' + JSON.stringify(obj.$attrs.focusWrapMode));
      expect(obj.$attrs.focusWrapMode).assertEqual('FocusWrapMode.WRAP_WITH_ARROW');

      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(TAB_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('isFocus'));
      let btn_isFocusedValue = await btn.isFocused();
      console.info('[FocusWrapMode_002] GridItem isFocused ' + btn_isFocusedValue);
      expect(btn_isFocusedValue).assertEqual(true);
      console.info('FocusWrapMode_002 END');
      done();
    });

    /**
     * @tc.name   FocusWrapMode_003
     * @tc.number FocusWrapMode_003
     * @tc.desc   Test FocusWrapMode -1, return FocusWrapMode.DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusWrapMode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FocusWrapMode_003] start');
      await Utils.sleep(SLEEP_TIME);
      let PAGE_TAG = 'FocusWrapModeTest003';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('focusWrapModeID2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FocusWrapMode_003]: ' + JSON.stringify(obj.$attrs.focusWrapMode));
      expect(obj.$attrs.focusWrapMode).assertEqual('FocusWrapMode.DEFAULT');

      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(TAB_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      await driver.triggerKey(RIGHT_KEY);
      await Utils.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('isFocus'));
      let btn_isFocusedValue = await btn.isFocused();
      console.info('[FocusWrapMode_003] GridItem isFocused ' + btn_isFocusedValue);
      expect(btn_isFocusedValue).assertEqual(false);
      console.info('FocusWrapMode_003 END');
      done();
    });
  })
}