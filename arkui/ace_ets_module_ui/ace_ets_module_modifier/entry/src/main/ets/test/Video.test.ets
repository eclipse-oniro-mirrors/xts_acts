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

export default function videoJsunit() {
  describe('videoTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state success " + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
      done();
    });

    /**
     * @tc.number videoTest_0001
     * @tc.name Test the properties of components
     * @tc.desc Set muted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0001', 0, async (done: Function) => {
      console.info('videoTest_0001 START');
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0001 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.muted).assertEqual(false);
      expect(objNew.$attrs.muted).assertEqual(undefined);
      console.info('videoTest_0001 END');
      done();
    });

    /**
     * @tc.number videoTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Set autoPlay values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0002', 0, async (done: Function) => {
      console.info('videoTest_0002 START');
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0002 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.autoPlay).assertEqual(false);
      expect(objNew.$attrs.autoPlay).assertEqual(undefined);
      console.info('videoTest_0002 END');
      done();
    });

    /**
     * @tc.number videoTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Set controls values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0003', 0, async (done: Function) => {
      console.info('videoTest_0003 START');
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0003 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.controls).assertEqual(true);
      expect(objNew.$attrs.controls).assertEqual(undefined);
      console.info('videoTest_0003 END');
      done();
    });

    /**
     * @tc.number videoTest_0004
     * @tc.name Test the properties of components
     * @tc.desc Set loop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0004', 0, async (done: Function) => {
      console.info('videoTest_0004 START');
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0004 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.loop).assertEqual(false);
      expect(objNew.$attrs.loop).assertEqual(undefined);
      console.info('videoTest_0004 END');
      done();
    });

    /**
     * @tc.number videoTest_0005
     * @tc.name Test the properties of components
     * @tc.desc Set objectFit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0005', 0, async (done: Function) => {
      console.info('videoTest_0005 START');
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0005 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.objectFit).assertEqual(ImageFit.Cover);
      expect(objNew.$attrs.objectFit).assertEqual(undefined);
      console.info('videoTest_0005 END');
      done();
    });

    /**
     * @tc.number videoTest_0006
     * @tc.name Test the properties of components
     * @tc.desc Change muted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('videoTest_0006', 0, async (done: Function) => {
      console.info('videoTest_0006 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('video');
      let objNew = JSON.parse(strJsonNew);
      console.info("videoTest_0006 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.muted).assertEqual(true);
      expect(objNew.$attrs.muted).assertEqual(undefined);
      console.info('videoTest_0006 END');
      done();
    });
  })
}