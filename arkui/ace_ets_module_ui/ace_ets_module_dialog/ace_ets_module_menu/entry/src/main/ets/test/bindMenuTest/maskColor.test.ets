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

export default function maskColorTest() {
  describe('maskColorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/maskColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get maskColorTest state success ' + JSON.stringify(pages));
        if (!('maskColorTest' == pages.name)) {
          console.info('get colorTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
          console.info('push maskColorTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push maskColorTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   bindMenu_maskColor_0001
     * @tc.number bindMenu_maskColor_0001
     * @tc.desc   set mask color is #809b43c9,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskColor_0001 START============================');
      let driver: Driver = Driver.create();
      let btn5 = await driver.findComponent(ON.id('button5'));
      await btn5.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect(JSON.parse(text01)).assertEqual('#809B43C9');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn5.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0001 END============================');
      done();
    });
    /**
     * @tc.name   bindMenu_maskColor_0002
     * @tc.number bindMenu_maskColor_0002
     * @tc.desc   set mask color is 0xFF6495ED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_maskColor_0002 START============================");
      let driver: Driver = Driver.create();
      let btn6 = await driver.findComponent(ON.id('button6'));
      await btn6.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect(JSON.parse(text01)).assertEqual('#FF6495ED');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn6.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0002 END============================');
      done();
    });

    /**
     * @tc.name   bindMenu_maskColor_0003
     * @tc.number bindMenu_maskColor_0003
     * @tc.desc   set mask color is Color.Blue,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskColor_0003 START============================');
      let driver: Driver = Driver.create();
      let btn7 = await driver.findComponent(ON.id('button7'));
      await btn7.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect(JSON.parse(text01)).assertEqual('#FF0000FF');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn7.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0003 END============================');
      done();
    });

    /**
     * @tc.name   bindMenu_maskColor_0004
     * @tc.number bindMenu_maskColor_0004
     * @tc.desc   set mask color is undefined,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskColor_0004 START============================');
      let driver: Driver = Driver.create();
      let btn8 = await driver.findComponent(ON.id('button8'));
      await btn8.click();
      await Utils.sleep(SLEEP_TIME_500);
      let color = getInspectorByKey('resource1');
      let color4 = JSON.stringify(JSON.parse(color).$attrs.backgroundColor);
      console.log('bindMenu_maskColor_0004' + color4);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect('\"' + JSON.parse(text01) + '\"').assertEqual(color4);
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn8.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0004 END============================');
      done();
    });

    /**
     * @tc.name   bindMenu_maskColor_0005
     * @tc.number bindMenu_maskColor_0005
     * @tc.desc   set mask color is null,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskColor_0005 START============================');
      let driver: Driver = Driver.create();
      let btn9 = await driver.findComponent(ON.id('button9'));
      await btn9.click();
      await Utils.sleep(SLEEP_TIME_500);
      let color = getInspectorByKey('resource1');
      let color5 = JSON.stringify(JSON.parse(color).$attrs.backgroundColor);
      console.log('bindMenu_maskColor_0005' + color5);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect('\"' + JSON.parse(text01) + '\"').assertEqual(color5);
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn9.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0005 END============================');
      done();
    });

    /**
     * @tc.name   bindMenu_maskColor_0006
     * @tc.number bindMenu_maskColor_0006
     * @tc.desc   set mask color is $r('app.color.start_window_background'),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindMenu_maskColor_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskColor_0006 START============================');
      let driver: Driver = Driver.create();
      let btn25 = await driver.findComponent(ON.id('button25'));
      await btn25.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.color);
        expect(JSON.parse(text01)).assertEqual('#FFFFFFFF');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn25.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0006 END============================');
      done();
    });
  })
}