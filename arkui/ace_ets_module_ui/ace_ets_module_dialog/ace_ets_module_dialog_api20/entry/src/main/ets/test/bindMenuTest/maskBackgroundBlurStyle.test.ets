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

export default function maskBackgroundBlurStyleTest() {
  describe('maskBackgroundBlurStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/maskBackgroundBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get maskBackgroundBlurStyleTest state success ' + JSON.stringify(pages));
        if (!('maskBackgroundBlurStyleTest' == pages.name)) {
          console.info('get maskBackgroundBlurStyleTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
          console.info('push maskBackgroundBlurStyleTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push maskBackgroundBlurStyleTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0001
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0001
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.Thin,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_maskBackgroundBlurStyle_0001 START============================");
      let driver: Driver = Driver.create();
      let btn10 = await driver.findComponent(ON.id('button10'));
      await btn10.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.Thin');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn10.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0001 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0002
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0002
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.Regular,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("bindMenu_maskBackgroundBlurStyle_0002 START============================");
      const SLEEP_TIME_500 = 1000;
      let driver: Driver = Driver.create();
      let btn11 = await driver.findComponent(ON.id('button11'));
      await btn11.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.Regular');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn11.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0002 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0003
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0003
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.Thick,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0003 START============================');
      let driver: Driver = Driver.create();
      let btn12 = await driver.findComponent(ON.id('button12'));
      await btn12.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.Thick');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn12.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0003 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0004
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0004
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.BACKGROUND_THIN,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0004 START============================');
      let driver: Driver = Driver.create();
      let btn13 = await driver.findComponent(ON.id('button13'));
      await btn13.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn13.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0004 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0005
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0005
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.BACKGROUND_REGULAR,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0005 START============================');
      let driver: Driver = Driver.create();
      let btn14 = await driver.findComponent(ON.id('button14'));
      await btn14.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree)).
          $children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn14.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0005 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0006
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0006
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.BACKGROUND_THICK,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0006 START============================');
      let driver: Driver = Driver.create();
      let btn15 = await driver.findComponent(ON.id('button15'));
      await btn15.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_THICK');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn15.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0006 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0007
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0007
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.BACKGROUND_ULTRA_THICK,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0007 START============================');
      let driver: Driver = Driver.create();
      let btn16 = await driver.findComponent(ON.id('button16'));
      await btn16.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn16.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0007 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0008
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0008
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.NONE,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0008 START============================');
      let driver: Driver = Driver.create();
      let btn17 = await driver.findComponent(ON.id('button17'));
      await btn17.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.NONE');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn17.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0008 END============================");
      done();
    });
    
    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0009
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0009
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.COMPONENT_ULTRA_THIN,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0009 START============================');
      let driver: Driver = Driver.create();
      let btn18 = await driver.findComponent(ON.id('button18'));
      await btn18.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn18.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0009 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0010
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0010
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.COMPONENT_THIN,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0010 START============================');
      let driver: Driver = Driver.create();
      let btn19 = await driver.findComponent(ON.id('button19'));
      await btn19.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.COMPONENT_THIN');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn19.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0010 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0011
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0011
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.COMPONENT_REGULAR,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0011 START============================');
      let driver: Driver = Driver.create();
      let btn20 = await driver.findComponent(ON.id('button20'));
      await btn20.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.COMPONENT_REGULAR');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn20.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0011 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0012
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0012
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.COMPONENT_THICK,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0012 START============================');
      let driver: Driver = Driver.create();
      let btn21 = await driver.findComponent(ON.id('button21'));
      await btn21.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.COMPONENT_THICK');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn21.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0012 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0013
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0013
     * @tc.desc      set mask backgroundBlurStyle is BlurStyle.COMPONENT_ULTRA_THICK,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0013 START============================');
      let driver: Driver = Driver.create();
      let btn22 = await driver.findComponent(ON.id('button22'));
      await btn22.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn22.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0013 END============================");
      done();
    });

    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0014
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0014
     * @tc.desc      set mask backgroundBlurStyle is undefined,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0014 START============================');
      let driver: Driver = Driver.create();
      let btn23 = await driver.findComponent(ON.id('button23'));
      await btn23.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn23.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0014 END============================");
      done();
    });
    /**
     * @tc.number    bindMenu_maskBackgroundBlurStyle_0015
     * @tc.name      bindMenu_maskBackgroundBlurStyle_0015
     * @tc.desc      set mask backgroundBlurStyle is null,
     *               this use case has device differentiation, and some devices do not support this feature
     * @tc.level:    Level 2
     * @tc.type :    TestType.FUNCTION
     * @tc.size :    Size.MEDIUMTEST
     */
    it('bindMenu_maskBackgroundBlurStyle_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('bindMenu_maskBackgroundBlurStyle_0015 START============================');
      let driver: Driver = Driver.create();
      let btn24 = await driver.findComponent(ON.id('button24'));
      await btn24.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree: ESObject = await getInspectorTree();
      let resource = getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parse(resource).$attrs.content);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.backgroundBlurStyle.value);
        expect(JSON.parse(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(tree))
          .$children[CHILD_ONE].$children[CHILD_ZERO].$attrs.mask.mask);
        expect(JSON.parse(text)).assertEqual('false');
      }
      await btn24.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0015 END============================");
      done();
    });
  })
}