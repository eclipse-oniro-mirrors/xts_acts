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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function lanesValueTest(){

  describe('lanesValueTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })
    /**
     * @tc.number lanesValueTest001
     * @tc.name   lanesValueTest001
     * @tc.desc   input 0,return PresetFillType::BREAKPOINT_DEFAULT
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('lanesValueTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'lanesValueTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME)
      let driver = await Driver.create()
      await Utils.sleep(SLEEP_TIME)
      let button = await driver.findComponent(ON.id('click0'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('list');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_DEFAULT");
      await Utils.sleep(SLEEP_TIME)
      done();
    });
    /**
     * @tc.number lanesValueTest002
     * @tc.name   lanesValueTest002
     * @tc.desc   input 1,return PresetFillType::BREAKPOINT_SM1MD2LG3
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('lanesValueTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'lanesValueTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME)
      let driver = await Driver.create()
      await Utils.sleep(SLEEP_TIME)
      let button = await driver.findComponent(ON.id('click1'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('list');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_SM1MD2LG3");
      await Utils.sleep(SLEEP_TIME)
      done();
    });
    /**
     * @tc.number lanesValueTest003
     * @tc.name   lanesValueTest003
     * @tc.desc   input 2,return PresetFillType::BREAKPOINT_SM2MD3LG5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('lanesValueTest003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'lanesValueTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME)
      let driver = await Driver.create()
      await Utils.sleep(SLEEP_TIME)
      let button = await driver.findComponent(ON.id('click2'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('list');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_SM2MD3LG5");
      await Utils.sleep(SLEEP_TIME)
      done();
    });
    /**
     * @tc.number lanesValueTest004
     * @tc.name   lanesValueTest004
     * @tc.desc   input -1,return undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('lanesValueTest004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'lanesValueTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME)
      let driver = await Driver.create()
      await Utils.sleep(SLEEP_TIME)
      let button = await driver.findComponent(ON.id('click-1'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('list');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual(undefined)
      await Utils.sleep(SLEEP_TIME)
      done();
    });
  })
}