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
 import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function SnapSpeedTest(){

  describe('SnapSpeedTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.name   snapSpeedTest001
     * @tc.number snapSpeedTest001
     * @tc.desc   input ScrollSnapAnimationSpeed.NORMAL ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapSpeedTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'snapSpeedTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('NORMAL'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('List');
      expect(JSON.parse(strJsonNew).$attrs.scrollSnapAnimationSpeed).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.name   snapSpeedTest002
     * @tc.number snapSpeedTest002
     * @tc.desc   input ScrollSnapAnimationSpeed.SLOW ,return ScrollSnapAnimationSpeed.SLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapSpeedTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'snapSpeedTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('SLOW'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('List');
      expect(JSON.parse(strJsonNew).$attrs.scrollSnapAnimationSpeed).assertEqual('ScrollSnapAnimationSpeed.SLOW');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.name   snapSpeedTest003
     * @tc.number snapSpeedTest003
     * @tc.desc   input -1 ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapSpeedTest003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'snapSpeedTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create()
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('-1'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('List');
      expect(JSON.parse(strJsonNew).$attrs.scrollSnapAnimationSpeed).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.name   snapSpeedTest004
     * @tc.number snapSpeedTest004
     * @tc.desc   input undefined ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapSpeedTest004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'snapSpeedTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('List');
      expect(JSON.parse(strJsonNew).$attrs.scrollSnapAnimationSpeed).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      await Utils.sleep(SLEEP_TIME);
      done();
    });
  })
}