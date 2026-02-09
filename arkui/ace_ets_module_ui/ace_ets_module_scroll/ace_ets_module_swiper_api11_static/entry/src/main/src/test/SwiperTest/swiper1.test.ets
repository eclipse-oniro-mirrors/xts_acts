'use static';
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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { UtilsTest, startAbility } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function swiperCurveJsunit() {
  describe('swiperCurveTest', () => {
    beforeAll(() => {
      console.info("swiperCurveJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperNew",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        if (!("swiper1" == pages.name)) {
          router.replaceUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error(`Swiper1_1 beforeEach error:` + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperCurve after each called");
    });

    
    /**
     * @tc.number   testswiperCurve_static_0003
     * @tc.name     testswiperCurve_static_0003
     * @tc.desc     testswiperCurve_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0003', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0003 START');
      await CommonFunc.sleep(10000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0003] component index strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('index')).assertEqual("3");
      console.info("[testswiperCurve_static_0003] index value :" + obj.getElement('$attrs').getString('index'));

    });
    
    /**
     * @tc.number   testswiperCurve_static_0001
     * @tc.name     testswiperCurve_static_0001
     * @tc.desc     testswiperCurve_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('curve')).assertEqual("Curves.Linear");
      console.info("[testswiperCurve_static_0001] curve value :" + obj.getElement('$attrs').getString('curve'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_0002
     * @tc.name     testswiperCurve_static_0002
     * @tc.desc     testswiperCurve_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0002] component cachedCount strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(2);
      console.info("[testswiperCurve_static_0002] cachedCount value :" +
      obj.getElement('$attrs').getDouble('cachedCount'));

    });





    
    /**
     * @tc.number   testswiperCurve_static_0004
     * @tc.name     testswiperCurve_static_0004
     * @tc.desc     testswiperCurve_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0004', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0004] component autoPlay strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual("true");
      console.info("[testswiperCurve_static_0004] autoPlay value :" + obj.getElement('$attrs').getString('autoPlay'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_0005
     * @tc.name     testswiperCurve_static_0005
     * @tc.desc     testswiperCurve_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0005', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0005] component interval strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('interval')).assertEqual("4000");
      console.info("[testswiperCurve_static_0005] interval value :" + obj.getElement('$attrs').getString('interval'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_0006
     * @tc.name     testswiperCurve_static_0006
     * @tc.desc     testswiperCurve_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0006', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0006] component indicator strJson:" + strJson);
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
it('testswiperCurve_static_0007', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0007 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0007] component loop strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual("false");
      console.info("[testswiperCurve_static_0007] loop value :" + obj.getElement('$attrs').getString('loop'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_0008
     * @tc.name     testswiperCurve_static_0008
     * @tc.desc     testswiperCurve_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0008', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0008 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0008] component duration strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('duration')).assertEqual("1000");
      console.info("[testswiperCurve_static_0008] duration value :" + obj.getElement('$attrs').getString('duration'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_0009
     * @tc.name     testswiperCurve_static_0009
     * @tc.desc     testswiperCurve_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_0009', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_0009 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_0009] component vertical strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual("false");
      console.info("[testswiperCurve_static_0009] vertical value :" + obj.getElement('$attrs').getString('vertical'));

    });


    
    /**
     * @tc.number   testswiperCurve_static_00010
     * @tc.name     testswiperCurve_static_00010
     * @tc.desc     testswiperCurve_static_00010
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_00010', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_00010 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_00010] component itemSpace strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual("0.00px");
      console.info("[testswiperCurve_static_00010] itemSpace value :" +
      obj.getElement('$attrs').getString('itemSpace'));

    });


    /***有问题***/
    
    /**
     * @tc.number   testswiperCurve_static_00011
     * @tc.name     testswiperCurve_static_00011
     * @tc.desc     testswiperCurve_static_00011
     * @tc.level    Level.LEVEL0
     */
it('testswiperCurve_static_00011', Level.LEVEL0, async (): Promise<void> => {
      console.info('swiperCurve testswiperCurve_static_00011 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper');
      console.info("[testswiperCurve_static_00011] component onChange strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Swiper');
      try {
        obj.getElement('$attrs').getElement('isOn').setBoolean(!obj.getElement('$attrs').getBoolean('isOn'))
        //尝试用isOn的改变来触发Onchange()事件
      } catch (err: Error) {
        console.info("testswiperCurve_static_00011 on event err : " + JSON.stringify(err));
      }
      console.info("[testswiperCurve_static_00011] onChange value :" + obj.getElement('$attrs').tryGetElement('onChange'));

    });
  })
}