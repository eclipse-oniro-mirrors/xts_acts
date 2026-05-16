'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { DisturbanceFieldShape, FieldRegion, RippleFieldOptions, VelocityFieldOptions } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function ParticleTest() {
  describe('ParticleTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ParticleTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.particle.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ParticleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Particle/ParticleIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== "ParticleIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ParticleTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0100
     * @tc.name rippleFieldOptionsConstruct
     * @tc.desc Test RippleFieldOptions construction with all fields and verify field values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('rippleFieldOptionsConstruct', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { shape: DisturbanceFieldShape.RECT, position: { x: 0, y: 0 }, size: { width: 100, height: 100 } };
        let opts: RippleFieldOptions = { amplitude: 10.0, wavelength: 20.0, waveSpeed: 5.0, attenuation: 0.5, center: { x: 50, y: 50 }, region: region };
        expect(opts.amplitude).assertEqual(10.0);
        expect(opts.wavelength).assertEqual(20.0);
        expect(opts.waveSpeed).assertEqual(5.0);
        expect(opts.attenuation).assertEqual(0.5);
        let c = opts.center;
        if (c != null && c != undefined) {
          expect(c.x).assertEqual(50);
        }
        let r = opts.region;
        if (r != null && r != undefined) {
          expect(r.shape).assertEqual(DisturbanceFieldShape.RECT);
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0200
     * @tc.name velocityFieldOptionsConstruct
     * @tc.desc Test VelocityFieldOptions construction with velocity and region fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('velocityFieldOptionsConstruct', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { shape: DisturbanceFieldShape.ELLIPSE, position: { x: 10, y: 10 }, size: { width: 200, height: 200 } };
        let opts: VelocityFieldOptions = { velocity: { x: 1.0, y: 2.0 }, region: region };
        let v = opts.velocity;
        if (v != null && v != undefined) {
          expect(v.x).assertEqual(1.0);
          expect(v.y).assertEqual(2.0);
        }
        let r = opts.region;
        if (r != null && r != undefined) {
          expect(r.shape).assertEqual(DisturbanceFieldShape.ELLIPSE);
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0300
     * @tc.name fieldRegionShape
     * @tc.desc Test DisturbanceFieldShape enum values: RECT=0, CIRCLE=1, ELLIPSE=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fieldRegionShape', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DisturbanceFieldShape.RECT).assertEqual(0);
        expect(DisturbanceFieldShape.CIRCLE).assertEqual(1);
        expect(DisturbanceFieldShape.ELLIPSE).assertEqual(2);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0400
     * @tc.name fieldRegionOptionalFields
     * @tc.desc Test FieldRegion optional fields default to undefined when not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fieldRegionOptionalFields', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = {};
        expect(region.shape).assertEqual(undefined);
        expect(region.position).assertEqual(undefined);
        expect(region.size).assertEqual(undefined);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0500
     * @tc.name particlePageRenders
     * @tc.desc Verify Particle test page renders with root node visible in inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('particlePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('particleRoot'));
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0600
     * @tc.name particleRippleFieldsInspector
     * @tc.desc Verify Particle component with ripple fields renders and has $attrs via inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('particleRippleFieldsInspector', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('particleView'));
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0700
     * @tc.name particleVelocityFieldsInspector
     * @tc.desc Verify Particle component with velocity fields has $attrs via inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('particleVelocityFieldsInspector', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('particleView'));
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0800
     * @tc.name fieldRegionPositionSet
     * @tc.desc Test FieldRegion position field with explicit x/y values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fieldRegionPositionSet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { position: { x: 10.5, y: 20.5 } };
        let pos = region.position;
        expect(pos != null && pos != undefined).assertTrue();
        if (pos != null && pos != undefined) {
          expect(pos.x).assertEqual(10.5);
          expect(pos.y).assertEqual(20.5);
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_0900
     * @tc.name fieldRegionSizeSet
     * @tc.desc Test FieldRegion size field with explicit width/height values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fieldRegionSizeSet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { size: { width: 150.0, height: 250.0 } };
        let sz = region.size;
        expect(sz != null && sz != undefined).assertTrue();
        if (sz != null && sz != undefined) {
          expect(sz.width).assertEqual(150.0);
          expect(sz.height).assertEqual(250.0);
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_1000
     * @tc.name rippleFieldAmplitudeWavelength
     * @tc.desc Test RippleFieldOptions amplitude and wavelength with edge values (0 and negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('rippleFieldAmplitudeWavelength', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: RippleFieldOptions = { amplitude: 0.0, wavelength: 100.0 };
        expect(opts.amplitude).assertEqual(0.0);
        expect(opts.wavelength).assertEqual(100.0);
        let opts2: RippleFieldOptions = { amplitude: -5.0, wavelength: 0.0 };
        expect(opts2.amplitude).assertEqual(-5.0);
        expect(opts2.wavelength).assertEqual(0.0);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_1100
     * @tc.name rippleFieldWaveSpeedAttenuation
     * @tc.desc Test RippleFieldOptions waveSpeed and attenuation with edge values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('rippleFieldWaveSpeedAttenuation', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: RippleFieldOptions = { waveSpeed: 0.0, attenuation: 1.0 };
        expect(opts.waveSpeed).assertEqual(0.0);
        expect(opts.attenuation).assertEqual(1.0);
        let opts2: RippleFieldOptions = { waveSpeed: 99.9, attenuation: 0.0 };
        expect(opts2.waveSpeed).assertEqual(99.9);
        expect(opts2.attenuation).assertEqual(0.0);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_1200
     * @tc.name rippleFieldCenterAndRegion
     * @tc.desc Test RippleFieldOptions center and region fields with CIRCLE shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('rippleFieldCenterAndRegion', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { shape: DisturbanceFieldShape.CIRCLE, position: { x: 0, y: 0 }, size: { width: 50, height: 50 } };
        let opts: RippleFieldOptions = { center: { x: 25, y: 25 }, region: region };
        let c = opts.center;
        if (c != null && c != undefined) {
          expect(c.x).assertEqual(25);
          expect(c.y).assertEqual(25);
        }
        let r = opts.region;
        if (r != null && r != undefined) {
          expect(r.shape).assertEqual(DisturbanceFieldShape.CIRCLE);
          let sz = r.size;
          if (sz != null && sz != undefined) {
            expect(sz.width).assertEqual(50);
          }
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_PARTICLE_1300
     * @tc.name velocityFieldVelocityAndRegion
     * @tc.desc Test VelocityFieldOptions velocity and region with various values including negative/zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('velocityFieldVelocityAndRegion', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let region: FieldRegion = { shape: DisturbanceFieldShape.RECT };
        let opts: VelocityFieldOptions = { velocity: { x: -1.0, y: 3.0 }, region: region };
        let v = opts.velocity;
        if (v != null && v != undefined) {
          expect(v.x).assertEqual(-1.0);
          expect(v.y).assertEqual(3.0);
        }
        let r = opts.region;
        if (r != null && r != undefined) {
          expect(r.shape).assertEqual(DisturbanceFieldShape.RECT);
        }
        let opts2: VelocityFieldOptions = { velocity: { x: 0.0, y: 0.0 } };
        let v2 = opts2.velocity;
        if (v2 != null && v2 != undefined) {
          expect(v2.x).assertEqual(0.0);
        }
        done();
      } catch (error) { expect().assertFail(); done(); }
    });
  });
}
