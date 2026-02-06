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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
const SLEEP_TIME_2000 = 2000;
const SLEEP_TIME_500 = 500;
const CHILD_ONE = 1;
const CHILD_ZERO = 0;

export default function maskTest() {
  describe('maskTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/mask',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get maskTest state success ' + JSON.stringify(pages));
        if (!('maskTest' == pages.name)) {
          console.info('get maskTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
          console.info('push maskTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push maskTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   bindMenu_mask_0001
     * @tc.number bindMenu_mask_0001
     * @tc.desc   set mask value is true, this use case has device differentiation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_mask_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_mask_0001 START============================");
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      let close = await driver.findComponent(ON.id('close'));
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0001 END============================");
      done();
    });

    /**
     * @tc.name   bindMenu_mask_0002
     * @tc.number bindMenu_mask_0002
     * @tc.desc   set mask value is false, this use case has device differentiation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_mask_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_mask_0002 START============================");
      let driver: Driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('button2'));
      await btn2.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      let close = await driver.findComponent(ON.id('close'));
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0002 END============================");
      done();
    });

    /**
     * @tc.name   bindMenu_mask_0003
     * @tc.number bindMenu_mask_0003
     * @tc.desc   set mask value is undefined, this use case has device differentiation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_mask_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_mask_0003 START============================");
      let driver: Driver = Driver.create();
      let btn3 = await driver.findComponent(ON.id('button3'));
      await btn3.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      let close = await driver.findComponent(ON.id('close'));
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0003 END============================");
      done();
    });

    /**
     * @tc.name   bindMenu_mask_0004
     * @tc.number bindMenu_mask_0004
     * @tc.desc   set mask value is null, this use case has device differentiation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_mask_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_mask_0004 START============================");
      let driver: Driver = Driver.create();
      let btn4 = await driver.findComponent(ON.id('button4'));
      await btn4.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      let close = await driver.findComponent(ON.id('close'));
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0004 END============================");
      done();
    });
  })
}