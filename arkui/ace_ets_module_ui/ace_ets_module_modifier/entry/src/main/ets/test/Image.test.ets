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

export default function imageJsunit() {
  describe('imageTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get image state success " + JSON.stringify(pages));
        if (!("image" == pages.name)) {
          console.info("get image state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push image page error: " + err);
      }
      done();
    });

    /**
     * @tc.number imageTest_0001
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0001', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0001 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0001 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info('imageTest_0001 END');
      done();
    });

    /**
     * @tc.number imageTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Set colorFilter values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0002 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0002 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.colorFilter)
        .assertEqual("1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ");
      console.info('imageTest_0002 END');
      done();
    });

    /**
     * @tc.number imageTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Set syncLoad values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0003', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0003 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0003 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.syncLoad).assertEqual("true");
      console.info('imageTest_0003 END');
      done();
    });

    /**
     * @tc.number imageTest_0004
     * @tc.name Test the properties of components
     * @tc.desc Set sourceSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0004', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0004 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0004 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.sourceSize).assertEqual('[200.00 x 100.00]');
      console.info('imageTest_0004 END');
      done();
    });

    /**
     * @tc.number imageTest_0005
     * @tc.name Test the properties of components
     * @tc.desc Set interpolation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0005', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0005 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0005 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.interpolation).assertEqual("ImageInterpolation.None");
      console.info('imageTest_0005 END');
      done();
    });

    /**
     * @tc.number imageTest_0006
     * @tc.name Test the properties of components
     * @tc.desc Set renderMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0006', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0006 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0006 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.renderMode).assertEqual("ImageRenderMode.Original");
      console.info('imageTest_0006 END');
      done();
    });

    /**
     * @tc.number imageTest_0007
     * @tc.name Test the properties of components
     * @tc.desc Set autoResize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0007', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0007 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0007 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.autoResize).assertEqual("true");
      console.info('imageTest_0007 END');
      done();
    });

    /**
     * @tc.number imageTest_0008
     * @tc.name Test the properties of components
     * @tc.desc Set objectRepeat values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0008', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0008 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0008 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.objectRepeat).assertEqual("ImageRepeat.NoRepeat");
      console.info('imageTest_0008 END');
      done();
    });

    /**
     * @tc.number imageTest_0009
     * @tc.name Test the properties of components
     * @tc.desc Set objectFit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0009', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0009 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0009 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.objectFit).assertEqual("ImageFit.None");
      console.info('imageTest_0009 END');
      done();
    });

    /**
     * @tc.number imageTest_0010
     * @tc.name Test the properties of components
     * @tc.desc Set fillColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0010 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0010 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.fillColor).assertEqual("#FF182431");
      console.info('imageTest_0010 END');
      done();
    });

    /**
     * @tc.number imageTest_0011
     * @tc.name Test the properties of components
     * @tc.desc Set fitOriginalSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0011', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0011 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0011 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.fitOriginalSize).assertEqual("true");
      console.info('imageTest_0011 END');
      done();
    });

    /**
     * @tc.number imageTest_0012
     * @tc.name Test the properties of components
     * @tc.desc Set matchTextDirection values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0012', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0012 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0012 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.matchTextDirection).assertEqual("true");
      console.info('imageTest_0012 END');
      done();
    });

    /**
     * @tc.number imageTest_0013
     * @tc.name Test the properties of components
     * @tc.desc Set alt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0013', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0013 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0013 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.alt).assertEqual("aaa");
      console.info('imageTest_0013 END');
      done();
    });

    /**
     * @tc.number imageTest_0014
     * @tc.name Test the properties of components
     * @tc.desc Set draggable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0014', Level.LEVEL0, async (done: Function) => {
      console.info('imageTest_0014 START');
      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0014 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.draggable).assertEqual("false");
      console.info('imageTest_0014 END');
      done();
    });

    /**
     * @tc.number imageTest_0015
     * @tc.name Test the properties of components
     * @tc.desc Change syncLoad values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('imageTest_0015', Level.LEVEL0, async (done: Function) => {

      console.info('imageTest_0015 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('image');
      
      console.info("imageTest_0015 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.syncLoad).assertEqual("true");
      console.info('imageTest_0015 END');
      done();
    });
  })
}