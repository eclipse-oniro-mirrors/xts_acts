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

export default function sideBarContainerJsunit() {
  describe('sideBarContainerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sideBarContainer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sideBarContainer state success " + JSON.stringify(pages));
        if (!("sideBarContainer" == pages.name)) {
          console.info("get sideBarContainer state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push sideBarContainer page error: " + err);
      }
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0002
     * @tc.name Test the properties of components
     * @tc.desc set divider values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0002', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0002 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0002 component is: " + JSON.stringify(objNew.$attrs));
      expect(JSON.parse(objNew.$attrs.divider)?.strokeWidth).assertEqual("100.00vp");
      expect(JSON.parse(objNew.$attrs.divider)?.color).assertEqual("#FFFF0000");
      expect(JSON.parse(objNew.$attrs.divider)?.startMargin).assertEqual("100.00vp");
      expect(JSON.parse(objNew.$attrs.divider)?.endMargin).assertEqual("100.00vp");
      console.info('sideBarContainerTest_0002 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0003
     * @tc.name Test the properties of components
     * @tc.desc set minContentWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0003', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0003 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0003 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.minContentWidth).assertEqual("100.000000");
      console.info('sideBarContainerTest_0003 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0004
     * @tc.name Test the properties of components
     * @tc.desc set sideBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0004', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0004 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0004 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.sideBarWidth).assertEqual("100.000000");
      console.info('sideBarContainerTest_0004 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0005
     * @tc.name Test the properties of components
     * @tc.desc set minSideBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0005', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0005 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0005 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.minSideBarWidth).assertEqual("100.000000");
      console.info('sideBarContainerTest_0005 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0006
     * @tc.name Test the properties of components
     * @tc.desc set maxSideBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0006', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0006 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0006 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.maxSideBarWidth).assertEqual("100.000000");
      console.info('sideBarContainerTest_0006 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0007
     * @tc.name Test the properties of components
     * @tc.desc set showSideBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0007', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0007 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0007 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.showSideBar).assertEqual("true");
      console.info('sideBarContainerTest_0007 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0008
     * @tc.name Test the properties of components
     * @tc.desc set controlButton values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0008', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0008 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0008 component is: " + JSON.stringify(objNew.$attrs));
      expect(JSON.parse(objNew.$attrs.controlButton)?.left).assertEqual("10.000000");
      expect(JSON.parse(objNew.$attrs.controlButton)?.top).assertEqual("10.000000");
      expect(JSON.parse(objNew.$attrs.controlButton)?.width).assertEqual("10.000000");
      expect(JSON.parse(objNew.$attrs.controlButton)?.height).assertEqual("10.000000");
      console.info('sideBarContainerTest_0008 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0009
     * @tc.name Test the properties of components
     * @tc.desc set showControlButton values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0009', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0009 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0009 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.showControlButton).assertEqual("true");
      console.info('sideBarContainerTest_0009 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0010
     * @tc.name Test the properties of components
     * @tc.desc set autoHide values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0010', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0010 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0010 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.autoHide).assertEqual("false");
      console.info('sideBarContainerTest_0010 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0011
     * @tc.name Test the properties of components
     * @tc.desc set sideBarPosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0011', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0011 START');
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0011 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.sideBarPosition).assertEqual("SideBarPosition.Start");
      console.info('sideBarContainerTest_0011 END');
      done();
    });

    /**
     * @tc.number sideBarContainerTest_0012
     * @tc.name Test the properties of components
     * @tc.desc Change autoHide values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sideBarContainerTest_0012', 0, async (done: Function) => {
      console.info('sideBarContainerTest_0012 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('sideBarContainer');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("sideBarContainerTest_0012 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.autoHide).assertEqual("true");
      console.info('sideBarContainerTest_0012 END');
      done();
    });
  })
}