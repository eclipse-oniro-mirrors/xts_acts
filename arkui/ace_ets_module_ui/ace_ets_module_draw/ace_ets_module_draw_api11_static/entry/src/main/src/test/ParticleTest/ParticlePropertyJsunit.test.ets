'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ParticleJsunit() {
  describe('ParticleJsunit', () => {
    beforeAll(() => {
      console.info("ParticleJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ParticleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Particle/ParticleProperty',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticleJsunit state pages:" + JSON.stringify(pages));
        if (!("ParticleProperty" == pages.name)) {
          console.info("get ParticleJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParticleJsunit page error: " + err);
        expect().assertFail();
      }
      // done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0100
     * @tc.name     ParticleJsunit_static_0100
     * @tc.desc     ParticleJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0100] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0100] type is: " + JSON.stringify(obj.getString("$type")));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Particle');
      console.info('[ParticleJsunit_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0200
     * @tc.name     ParticleJsunit_static_0200
     * @tc.desc     ParticleJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0200] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0200] borderStyle is: " +
      JSON.stringify(obj.getElement('$attrs').getString('borderStyle')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'))
        .assertEqual('BorderStyle.Solid');
      console.info('[ParticleJsunit_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0300
     * @tc.name     ParticleJsunit_static_0300
     * @tc.desc     ParticleJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0300] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0300] borderColor is: " +
      JSON.stringify(obj.getElement('$attrs').getString('borderColor')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor')).assertEqual('#FF000000');
      console.info('[ParticleJsunit_static_0300] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0400
     * @tc.name     ParticleJsunit_static_0400
     * @tc.desc     ParticleJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0400] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0400] borderWidth is: " +
      JSON.stringify(obj.getElement('$attrs').getString('borderWidth')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      console.info('[ParticleJsunit_static_0400] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0500
     * @tc.name     ParticleJsunit_static_0500
     * @tc.desc     ParticleJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0500] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0500] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0500] backgroundImage is: " +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundImage')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImage')).assertEqual('NONE');
      console.info('[ParticleJsunit_static_0500] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0600
     * @tc.name     ParticleJsunit_static_0600
     * @tc.desc     ParticleJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0600] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0600] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0600] backgroundImageSize is: " +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundImageSize')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImageSize'))
        .assertEqual('ImageSize.Auto');
      console.info('[ParticleJsunit_static_0600] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0700
     * @tc.name     ParticleJsunit_static_0700
     * @tc.desc     ParticleJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0700] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0700] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0700] brightness is: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('brightness')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('brightness')).assertEqual(1);
      console.info('[ParticleJsunit_static_0700] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0800
     * @tc.name     ParticleJsunit_static_0800
     * @tc.desc     ParticleJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0800] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0800] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0800] saturate is: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('saturate')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('saturate')).assertEqual(1);
      console.info('[ParticleJsunit_static_0800] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_0900
     * @tc.name     ParticleJsunit_static_0900
     * @tc.desc     ParticleJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_0900] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_0900] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_0900] contrast is: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('contrast')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('contrast')).assertEqual(1);
      console.info('[ParticleJsunit_static_0900] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1000
     * @tc.name     ParticleJsunit_static_1000
     * @tc.desc     ParticleJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1000] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1000] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1000] clip is: " +
      JSON.stringify(obj.getElement('$attrs').getString('clip')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip')).assertEqual('false');
      console.info('[ParticleJsunit_static_1000] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1100
     * @tc.name     ParticleJsunit_static_1100
     * @tc.desc     ParticleJsunit_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1100] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1100] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1100] opacity is: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('opacity')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('[ParticleJsunit_static_1100] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1200
     * @tc.name     ParticleJsunit_static_1200
     * @tc.desc     ParticleJsunit_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1200] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1200] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1200] renderGroup is: " +
      JSON.stringify(obj.getElement('$attrs').getString('renderGroup')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('renderGroup')).assertEqual('false');
      console.info('[ParticleJsunit_static_1200] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1300
     * @tc.name     ParticleJsunit_static_1300
     * @tc.desc     ParticleJsunit_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1300] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1300] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1300] renderFit is: " +
      JSON.stringify(obj.getElement('$attrs').getString('renderFit')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('renderFit'))
        .assertEqual('RenderFit.TOP_LEFT');
      console.info('[ParticleJsunit_static_1300] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1400
     * @tc.name     ParticleJsunit_static_1400
     * @tc.desc     ParticleJsunit_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1400] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1400] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1400] scrollable is: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('scrollable')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('[ParticleJsunit_static_1400] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1500
     * @tc.name     ParticleJsunit_static_1500
     * @tc.desc     ParticleJsunit_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1500] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1500] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1500] width is: " +
      JSON.stringify(obj.getElement('$attrs').getString('width')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('300.00vp');
      console.info('[ParticleJsunit_static_1500] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1600
     * @tc.name     ParticleJsunit_static_1600
     * @tc.desc     ParticleJsunit_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1600] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1600] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1600] height is: " +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('300.00vp');
      console.info('[ParticleJsunit_static_1600] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1700
     * @tc.name     ParticleJsunit_static_1700
     * @tc.desc     ParticleJsunit_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1700] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1700] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1700] align is: " +
      JSON.stringify(obj.getElement('$attrs').getString('align')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual('Alignment.Center');
      console.info('[ParticleJsunit_static_1700] END');
      done();
    });

    
    /**
     * @tc.number   ParticleJsunit_static_1800
     * @tc.name     ParticleJsunit_static_1800
     * @tc.desc     ParticleJsunit_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ParticleJsunit_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Particle component
      console.info('[ParticleJsunit_static_1800] START');
      let strJson = inspector.getInspectorByKey('Particle_Property');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParticleJsunit_static_1800] obj is: " + JSON.stringify(obj));
      console.info("[ParticleJsunit_static_1800] flexBasis is: " +
      JSON.stringify(obj.getElement('$attrs').getString('flexBasis')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('flexBasis')).assertEqual('auto');
      console.info('[ParticleJsunit_static_1800] END');
      done();
    });
  })
}
