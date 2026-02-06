/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function swiperJsunit() {
  describe('swiperTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
      done();
    });

    /**
     * @tc.number swiperTest_0001
     * @tc.name Test the properties of components
     * @tc.desc Set nextMargin values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0001 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.nextMargin).assertEqual('10.00vp');
      console.info('swiperTest_0001 END');
      done();
    });

    /**
     * @tc.number swiperTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Set prevMargin values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0002 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0002 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.prevMargin).assertEqual('2.00vp');
      console.info('swiperTest_0002 END');
      done();
    });

    /**
     * @tc.number swiperTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Set displayCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0003', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0003 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0003 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.displayCount).assertEqual(2);
      console.info('swiperTest_0003 END');
      done();
    });

    /**
     * @tc.number swiperTest_0004
     * @tc.name Test the properties of components
     * @tc.desc Set disableSwipe values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0004', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0004 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0004 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.disableSwipe).assertEqual('true');
      console.info('swiperTest_0004 END');
      done();
    });

    /**
     * @tc.number swiperTest_0005
     * @tc.name Test the properties of components
     * @tc.desc Set effectMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0005', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0005 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0005 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.effectMode).assertEqual('EdgeEffect.Spring');
      console.info('swiperTest_0005 END');
      done();
    });

    /**
     * @tc.number swiperTest_0000
     * @tc.name Test the properties of components
     * @tc.desc Set cachedCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0006', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0006 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0006 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.cachedCount).assertEqual(2);
      console.info('swiperTest_0006 END');
      done();
    });

    /**
     * @tc.number swiperTest_0007
     * @tc.name Test the properties of components
     * @tc.desc Set displayMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0007', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0007 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0007 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.displayMode).assertEqual('SwiperDisplayMode.Stretch');
      console.info('swiperTest_0007 END');
      done();
    });

    /**
     * @tc.number swiperTest_0008
     * @tc.name Test the properties of components
     * @tc.desc Set itemSpace values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0008', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0008 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0008 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.itemSpace).assertEqual('10.00vp');
      console.info('swiperTest_0008 END');
      done();
    });

    /**
     * @tc.number swiperTest_0009
     * @tc.name Test the properties of components
     * @tc.desc Set loop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0009', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0009 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0009 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.loop).assertEqual('true');
      console.info('swiperTest_0009 END');
      done();
    });

    /**
     * @tc.number swiperTest_0010
     * @tc.name Test the properties of components
     * @tc.desc Set interval values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0010 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0010 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.interval).assertEqual('4000');
      console.info('swiperTest_0010 END');
      done();
    });

    /**
     * @tc.number swiperTest_0011
     * @tc.name Test the properties of components
     * @tc.desc Set vertical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0011', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0011 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0011 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.vertical).assertEqual('true');
      console.info('swiperTest_0011 END');
      done();
    });

    /**
     * @tc.number swiperTest_0012
     * @tc.name Test the properties of components
     * @tc.desc Set autoPlay values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0012', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0012 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0012 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.autoPlay).assertEqual('true');
      console.info('swiperTest_0012 END');
      done();
    });

    /**
     * @tc.number swiperTest_0013
     * @tc.name Test the properties of components
     * @tc.desc Set index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0013', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0013 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0013 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.index).assertEqual('1');
      console.info('swiperTest_0013 END');
      done();
    });

    /**
     * @tc.number swiperTest_0014
     * @tc.name Test the properties of components
     * @tc.desc Set indicator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_0014', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_0014 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_0014 component  is: " + JSON.stringify(objNew.$attrs));
      let indicator: ESObject = JSON.parse(objNew.$attrs.indicator);
      expect(indicator.color).assertEqual("#FF123456");
      console.info('swiperTest_0014 END');
      done();
    });

    /**
     * @tc.number swiperTest_015
     * @tc.name Test the properties of components
     * @tc.desc Set curve values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_015', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_015 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_015 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.curve).assertEqual('Curves.Linear');
      console.info('swiperTest_015 END');
      done();
    });

    /**
     * @tc.number swiperTest_016
     * @tc.name Test the properties of components
     * @tc.desc Set duration values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_016', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_016 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_016 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.duration).assertEqual('300');
      console.info('swiperTest_016 END');
      done();
    });

    /**
     * @tc.number swiperTest_017
     * @tc.name Test the properties of components
     * @tc.desc Set displayArrow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_017', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_017 START');
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_017 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.displayArrow).assertEqual('false');
      console.info('swiperTest_017 END');
      done();
    });

    /**
     * @tc.number swiperTest_018
     * @tc.name Test the properties of components
     * @tc.desc Change index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_018', Level.LEVEL0, async (done: Function) => {
      console.info('swiperTest_018 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('swiper');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("swiperTest_018 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.index).assertEqual('5');
      console.info('swiperTest_018 END');
      done();
    });
  })
}