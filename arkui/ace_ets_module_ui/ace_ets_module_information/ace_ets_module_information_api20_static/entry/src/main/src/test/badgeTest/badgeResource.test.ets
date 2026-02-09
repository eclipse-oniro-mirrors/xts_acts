/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import Utils from '../../../ets/MainAbility/common/Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

const SLEEP_TIME = 1000;

export default function badgeTest() {
  describe('badgeTest', () => {
    beforeAll(() => {
      console.info("badgeTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.information.api20.static", "EntryAbility");
    });
     beforeEach(async (): Promise<void> => {
      console.info('BadgeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/badge/badgeResource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get badgeResourceTest state pages:' + JSON.stringify(pages));
        if (!('badgeResource' === pages.name)) {
          console.info('get badgeResourceTest pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

          // console.info('push badgeResourceTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push badgeResourceTest page error:' + err);
      }
      console.info('badgeResourceTest beforeEach end');
    });

    
    /**
     * @tc.number   badgeResourceTest_static_001
     * @tc.name     badgeResourceTest_static_001
     * @tc.desc     badgeResourceTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_001 START');
      let strJson = inspector.getInspectorByKey('key_ badge_001');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.log("[badgeResourceTest_001] style.fontSize" + style.getString('fontSize'));
      expect(style.getString('fontSize')).assertEqual('10.00vp');
      console.info('[badgeResourceTest_001] END');
      done();
    });

    
    /**
     * @tc.number   badgeResourceTest_static_002
     * @tc.name     badgeResourceTest_static_002
     * @tc.desc     badgeResourceTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_002 START');
      let strJson = inspector.getInspectorByKey('key_ badge_002');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_002] style.fontWeight is: ' + style.getString('fontWeight'));
      expect(style.getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_002] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_003
     * @tc.name     badgeResourceTest_static_003
     * @tc.desc     badgeResourceTest_static_003
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_003 START');
      let strJson = inspector.getInspectorByKey('key_ badge_003');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_003] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('text');
      console.info('[badgeResourceTest_003] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_004
     * @tc.name     badgeResourceTest_static_004
     * @tc.desc     badgeResourceTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_004 START');
      let strJson = inspector.getInspectorByKey('key_ badge_004');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_004] style.badgeSize is: ' + style.getString('badgeSize'));
      expect(style.getString('badgeSize')).assertEqual('30.00px');
      console.info('[badgeResourceTest_004] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_005
     * @tc.name     badgeResourceTest_static_005
     * @tc.desc     badgeResourceTest_static_005
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_005 START');
      let strJson = inspector.getInspectorByKey('key_ badge_005');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_005] style.fontSize is: ' + style.getString('fontSize'));
      expect(style.getString('fontSize')).assertEqual('10.00vp');
      console.info('[badgeResourceTest_005] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_006
     * @tc.name     badgeResourceTest_static_006
     * @tc.desc     badgeResourceTest_static_006
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_006 START');
      let strJson = inspector.getInspectorByKey('key_ badge_006');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_006] style.fontWeight is: ' + style.getString('fontWeight'));
      expect(style.getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_006] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_007
     * @tc.name     badgeResourceTest_static_007
     * @tc.desc     badgeResourceTest_static_007
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_007 START');
      let strJson = inspector.getInspectorByKey('key_ badge_007');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_007] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('');
      console.info('[badgeResourceTest_007] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_008
     * @tc.name     badgeResourceTest_static_008
     * @tc.desc     badgeResourceTest_static_008
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_008 START');
      let strJson = inspector.getInspectorByKey('key_ badge_008');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      await Utils.sleep(SLEEP_TIME);
      console.info('[badgeResourceTest_008] style.badgeSize is: ' + style.getString('badgeSize'));
      expect(style.getString('badgeSize')).assertEqual('16.00vp');
      console.info('[badgeResourceTest_008] END');
      done();
    });



    /**
     * @tc.number   badgeResourceTest_static_011
     * @tc.name     badgeResourceTest_static_011
     * @tc.desc     badgeResourceTest_static_011
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_011 START');
      let strJson = inspector.getInspectorByKey('key_ badge_011');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_011] style.fontSize is: ' + style.getString('fontSize'));
      expect(style.getString('fontSize')).assertEqual('10.00vp');
      console.info('[badgeResourceTest_011] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_012
     * @tc.name     badgeResourceTest_static_012
     * @tc.desc     badgeResourceTest_static_012
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_012 START');
      let strJson = inspector.getInspectorByKey('key_ badge_012');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_012] style.fontWeight is: ' + style.getString('fontWeight'));
      expect(style.getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_012] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_013
     * @tc.name     badgeResourceTest_static_013
     * @tc.desc     badgeResourceTest_static_013
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_013 START');
      let strJson = inspector.getInspectorByKey('key_ badge_013');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_013] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('text');
      console.info('[badgeResourceTest_013] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_014
     * @tc.name     badgeResourceTest_static_014
     * @tc.desc     badgeResourceTest_static_014
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_014 START');
      let strJson = inspector.getInspectorByKey('key_ badge_014');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_014] style.badgeSize is: ' + style.getString('badgeSize'));
      expect(style.getString('badgeSize')).assertEqual('30.00px');
      console.info('[badgeResourceTest_014] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_015
     * @tc.name     badgeResourceTest_static_015
     * @tc.desc     badgeResourceTest_static_015
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_015 START');
      let strJson = inspector.getInspectorByKey('key_ badge_015');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_015] style.fontSize is: ' + style.getString('fontSize'));
      expect(style.getString('fontSize')).assertEqual('10.00vp');
      console.info('[badgeResourceTest_015] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_016
     * @tc.name     badgeResourceTest_static_016
     * @tc.desc     badgeResourceTest_static_016
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_016 START');
      let strJson = inspector.getInspectorByKey('key_ badge_016');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_016] style.fontWeight is: ' + style.getString('fontWeight'));
      expect(style.getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[badgeResourceTest_016] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_017
     * @tc.name     badgeResourceTest_static_017
     * @tc.desc     badgeResourceTest_static_017
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_017 START');
      let strJson = inspector.getInspectorByKey('key_ badge_017');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_017] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('');
      console.info('[badgeResourceTest_017] END');
      done();
    });


    /**
     * @tc.number   badgeResourceTest_static_018
     * @tc.name     badgeResourceTest_static_018
     * @tc.desc     badgeResourceTest_static_018
     * @tc.level    Level.LEVEL1
     */
it('badgeResourceTest_static_018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_018 START');
      let strJson = inspector.getInspectorByKey('key_ badge_018');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info('[badgeResourceTest_018] style.badgeSize is: ' + style.getString('badgeSize'));
      expect(style.getString('badgeSize')).assertEqual('16.00vp');
      console.info('[badgeResourceTest_018] END');
      done();
    });
  })
}
