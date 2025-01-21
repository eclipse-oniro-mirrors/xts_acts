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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function imageAnimatorJsunit() {
  describe('imageAnimatorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageAnimator',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageAnimator state success " + JSON.stringify(pages));
        if (!("imageAnimator" == pages.name)) {
          console.info("get imageAnimator state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push imageAnimator page error: " + err);
      }
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0001
     * @tc.name Test the properties of components
     * @tc.desc Set iterations values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0001', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0001 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0001 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.iterations).assertEqual("1");
      console.info('imageAnimatorTest_0001 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Set fillMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0002', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0002 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0002 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.fillMode).assertEqual('FillMode.None');
      console.info('imageAnimatorTest_0002 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Set fixedSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0003', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0003 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0003 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.fixedSize).assertEqual('true');
      console.info('imageAnimatorTest_0003 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0004
     * @tc.name Test the properties of components
     * @tc.desc Set reverse values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0004', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0004 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0004 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.reverse).assertEqual('true');
      console.info('imageAnimatorTest_0004 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0005
     * @tc.name Test the properties of components
     * @tc.desc Set duration values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0005', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0005 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0005 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.duration).assertEqual("2000");
      console.info('imageAnimatorTest_0005 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0006
     * @tc.name Test the properties of components
     * @tc.desc Set state values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0006', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0006 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0006 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.state).assertEqual('AnimationStatus.Initial');
      console.info('imageAnimatorTest_0006 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0007
     * @tc.name Test the properties of components
     * @tc.desc Set images values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0007', 0, async (done: Function) => {
      console.info('imageAnimatorTest_0007 START');
      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0007 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.images)
        .assertEqual('[{\"src\":\"resource:///16777256.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777257.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777258.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777259.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"}]');
      console.info('imageAnimatorTest_0007 END');
      done();
    });

    /**
     * @tc.number imageAnimatorTest_0008
     * @tc.name Test the properties of components
     * @tc.desc Change iterations values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageAnimatorTest_0008', 0, async (done: Function) => {

      console.info('imageAnimatorTest_0008 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('imageAnimator');
      
      console.info("imageAnimatorTest_0008 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.iterations).assertEqual("1");
      console.info('imageAnimatorTest_0008 END');
      done();
    });
  })
}