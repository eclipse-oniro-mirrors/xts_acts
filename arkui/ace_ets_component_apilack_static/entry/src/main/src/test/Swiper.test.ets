'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function swiperCurveJsunit() {
  describe('swiperCurveTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("swiperCurve after each called");
    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0001
     * @tc.name     testswiperCurve_static_0001
     * @tc.desc     testswiperCurve_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0001', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('curve')).assertEqual("Curves.Linear");
      console.info("[testswiperCurve0001] curve value :" + obj.getElement('$attrs').getString('curve'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0002
     * @tc.name     testswiperCurve_static_0002
     * @tc.desc     testswiperCurve_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0002', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0002] component cachedCount strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(2);
      console.info("[testswiperCurve0002] cachedCount value :" + obj.getElement('$attrs').getDouble('cachedCount'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0003
     * @tc.name     testswiperCurve_static_0003
     * @tc.desc     testswiperCurve_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0003', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0003] component index strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('index')).assertEqual("3");
      console.info("[testswiperCurve0003] index value :" + obj.getElement('$attrs').getString('index'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0004
     * @tc.name     testswiperCurve_static_0004
     * @tc.desc     testswiperCurve_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0004', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0004] component autoPlay strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('autoPlay')).assertEqual("true");
      console.info("[testswiperCurve0004] autoPlay value :" + obj.getElement('$attrs').getString('autoPlay'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0005
     * @tc.name     testswiperCurve_static_0005
     * @tc.desc     testswiperCurve_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0005', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0005] component interval strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('interval')).assertEqual("4000");
      console.info("[testswiperCurve0005] interval value :" + obj.getElement('$attrs').getString('interval'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0006
     * @tc.name     testswiperCurve_static_0006
     * @tc.desc     testswiperCurve_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0006', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0006] component indicator strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      // let testObj = obj.$attrs.indicator;
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual('true');

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0007
     * @tc.name     testswiperCurve_static_0007
     * @tc.desc     testswiperCurve_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0007', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0007] component loop strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('loop')).assertEqual("false");
      console.info("[testswiperCurve0007] loop value :" + obj.getElement('$attrs').getString('loop'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0008
     * @tc.name     testswiperCurve_static_0008
     * @tc.desc     testswiperCurve_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0008', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0008 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0008] component duration strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('duration')).assertEqual("1000");
      console.info("[testswiperCurve0008] duration value :" + obj.getElement('$attrs').getString('duration'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_0009
     * @tc.name     testswiperCurve_static_0009
     * @tc.desc     testswiperCurve_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0009', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve0009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve0009] component vertical strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual("false");
      console.info("[testswiperCurve0009] vertical value :" + obj.getElement('$attrs').getString('vertical'));

    });

    
    
    
    /**
     * @tc.number   testswiperCurve_static_00010
     * @tc.name     testswiperCurve_static_00010
     * @tc.desc     testswiperCurve_static_00010
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_00010', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve00010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve00010] component itemSpace strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('itemSpace')).assertEqual("0.00px");
      console.info("[testswiperCurve00010] itemSpace value :" + obj.getElement('$attrs').getString('itemSpace'));

    });

    
    /***有问题***/
    
    
    /**
     * @tc.number   testswiperCurve_static_00011
     * @tc.name     testswiperCurve_static_00011
     * @tc.desc     testswiperCurve_static_00011
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_00011', Level.LEVEL0, async () => {
      console.info('swiperCurve testswiperCurve00011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve00011] component onChange strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      try {
        let obj1 = obj.getElement('$attrs').getBoolean('isOn')
        obj1 = !obj.getElement('$attrs').getBoolean('isOn') //尝试用isOn的改变来触发Onchange()事件
      } catch (err) {
        console.info("testswiperCurve00011 on event err : " + JSON.stringify(err));
      }
      console.info("[testswiperCurve00011] onChange value :" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').tryGetElement('onChange') ?? {} as jsonx.JsonElement));

    });
  })
}
