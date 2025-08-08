/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function ParticleJsunit() {
  describe('ParticleJsunit', () =>{
    beforeEach(async  (done:Function)=> {
      console.info("ParticleJsunit beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Particle/ParticleProperty',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParticleJsunit state pages: " + JSON.stringify(pages));
        if (!("ParticleProperty" == pages.name)) {
          console.info("get ParticleJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParticleJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParticleJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ParticleJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0100] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0100] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0100] type is: " + JSON.stringify(obj.$type));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('Particle');
      console.info('[ParticleJsunit_0100] END');
      done();
    });

    it('ParticleJsunit_0200', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0200] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0200] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0200] borderStyle is: " + JSON.stringify(obj.$attrs.borderStyle));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      console.info('[ParticleJsunit_0200] END');
      done();
    });

    it('ParticleJsunit_0300', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0200] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0300] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0300] borderColor is: " + JSON.stringify(obj.$attrs.borderColor));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.borderColor).assertEqual('#FF000000');
      console.info('[ParticleJsunit_0300] END');
      done();
    });

    it('ParticleJsunit_0400', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0400] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0400] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0400] borderWidth is: " + JSON.stringify(obj.$attrs.borderWidth));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.borderWidth).assertEqual('0.00vp');
      console.info('[ParticleJsunit_0400] END');
      done();
    });

    it('ParticleJsunit_0500', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0500] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0500] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0500] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.backgroundImage).assertEqual('NONE');
      console.info('[ParticleJsunit_0500] END');
      done();
    });

    it('ParticleJsunit_0600', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0600] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0600] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0600] backgroundImageSize is: " + JSON.stringify(obj.$attrs.backgroundImageSize));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.backgroundImageSize).assertEqual('ImageSize.Auto');
      console.info('[ParticleJsunit_0600] END');
      done();
    });

    it('ParticleJsunit_0700', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0700] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0700] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0700] brightness is: " + JSON.stringify(obj.$attrs.brightness));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.brightness).assertEqual(1);
      console.info('[ParticleJsunit_0700] END');
      done();
    });

    it('ParticleJsunit_0800', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0800] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0800] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0800] saturate is: " + JSON.stringify(obj.$attrs.saturate));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.saturate).assertEqual(1);
      console.info('[ParticleJsunit_0800] END');
      done();
    });

    it('ParticleJsunit_0900', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_0900] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_0900] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_0900] contrast is: " + JSON.stringify(obj.$attrs.contrast));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.contrast).assertEqual(1);
      console.info('[ParticleJsunit_0900] END');
      done();
    });

    it('ParticleJsunit_1000', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1000] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1000] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1000] clip is: " + JSON.stringify(obj.$attrs.clip));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.clip).assertEqual('false');
      console.info('[ParticleJsunit_1000] END');
      done();
    });

    it('ParticleJsunit_1100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1100] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1100] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1100] opacity is: " + JSON.stringify(obj.$attrs.opacity));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('[ParticleJsunit_1100] END');
      done();
    });

    it('ParticleJsunit_1200', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1200] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1200] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1200] renderGroup is: " + JSON.stringify(obj.$attrs.renderGroup));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.renderGroup).assertEqual('false');
      console.info('[ParticleJsunit_1200] END');
      done();
    });

    it('ParticleJsunit_1300', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1300] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1300] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1300] renderFit is: " + JSON.stringify(obj.$attrs.renderFit));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.renderFit).assertEqual('RenderFit.TOP_LEFT');
      console.info('[ParticleJsunit_1300] END');
      done();
    });

    it('ParticleJsunit_1400', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1400] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1400] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1400] scrollable is: " + JSON.stringify(obj.$attrs.scrollable));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(false);
      console.info('[ParticleJsunit_1400] END');
      done();
    });
      
    it('ParticleJsunit_1500', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1500] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1500] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1500] width is: " + JSON.stringify(obj.$attrs.width));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('300.00vp');
      console.info('[ParticleJsunit_1500] END');
      done();
    });

    it('ParticleJsunit_1600', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1600] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1600] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1600] height is: " + JSON.stringify(obj.$attrs.height));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.height).assertEqual('300.00vp');
      console.info('[ParticleJsunit_1600] END');
      done();
    });
      
    it('ParticleJsunit_1700', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1700] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1700] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1700] align is: " + JSON.stringify(obj.$attrs.align));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.align).assertEqual('Alignment.Center');
      console.info('[ParticleJsunit_1700] END');
      done();
    });
      
    it('ParticleJsunit_1800', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_1800] START');
      let strJson = getInspectorByKey('Particle_Property');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParticleJsunit_1800] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_1800] flexBasis is: " + JSON.stringify(obj.$attrs.flexBasis));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.flexBasis).assertEqual('auto');
      console.info('[ParticleJsunit_1800] END');
      done();
    });
  })
}
