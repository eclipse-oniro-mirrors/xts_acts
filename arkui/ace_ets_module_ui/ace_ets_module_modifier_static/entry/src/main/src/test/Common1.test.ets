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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';

export default function common1Jsunit() {
  describe('common_part1Test', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("Common1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common1',
      }

      try {
        const alphabetIndexer = AppStorage.get<Router>("router") as Router
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get Common1 state pages: " + JSON.stringify(pages));
        if (!("common1" == pages.name)) {
          console.info("get Common1 state pages.name: " + JSON.stringify(pages.name));
          alphabetIndexer.pushUrl(options);
          console.info("================= pushUrl")
          await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push Common1 page error: " + err);
      }
    });

    

    /**
     * @tc.number   Common1Static001
     * @tc.name     Common1Static001
     * @tc.desc     Common1Static001
     * @tc.level    Level.LEVEL0
     */
it('Common1Static001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static001] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static001] component Common1Static001 is: " + JSON.stringify(objNew.getElement('$attrs')));
      let outlineRadius = objNew.getElement('$attrs').getElement('outlineRadius')
      expect(outlineRadius.getString('topLeft')).assertEqual("10.00vp");
      expect(outlineRadius.getString('topRight')).assertEqual("10.00vp");
      expect(outlineRadius.getString('bottomLeft')).assertEqual("20.00vp");
      expect(outlineRadius.getString('bottomRight')).assertEqual("13.00vp");
      done();
    });



    /**
     * @tc.number   Common1Static002
     * @tc.name     Common1Static002
     * @tc.desc     Common1Static002
     * @tc.level    Level.LEVEL0
     */
it('Common1Static002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static002] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static002] component Common1Static002 is: " + JSON.stringifyJsonElement(objNew.getElement('$attrs')));
      let outlineStyle = objNew.getElement('$attrs').getElement('outlineStyle')
      expect(outlineStyle.getString('left')).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.getString('top')).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.getString('right')).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.getString('bottom')).assertEqual("OutlineStyle.SOLID");
      done();
    });



    /**
     * @tc.number   Common1Static003
     * @tc.name     Common1Static003
     * @tc.desc     Common1Static003
     * @tc.level    Level.LEVEL0
     */
it('Common1Static003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static003] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static003] component Common1Static003 is: " + JSON.stringify(objNew.getElement('$attrs')));
      let outlineWidth = objNew.getElement('$attrs').getElement('outlineWidth')
      expect(outlineWidth.getString('left')).assertEqual("2.00vp");
      expect(outlineWidth.getString('top')).assertEqual("2.00vp");
      expect(outlineWidth.getString('right')).assertEqual("2.00vp");
      expect(outlineWidth.getString('bottom')).assertEqual("2.00vp");
      done();
    });



    /**
     * @tc.number   Common1Static004
     * @tc.name     Common1Static004
     * @tc.desc     Common1Static004
     * @tc.level    Level.LEVEL0
     */
it('Common1Static004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static004] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static004] component Common1Static004 is: " + JSON.stringify(objNew.getElement('$attrs')));
      let outlineColor = objNew.getElement('$attrs').getElement('outlineColor')
      expect(outlineColor.getString('left')).assertEqual("#FFFFC0CB");
      expect(outlineColor.getString('top')).assertEqual("#FFFFC0CB");
      expect(outlineColor.getString('right')).assertEqual("#FFFFC0CB");
      expect(outlineColor.getString('bottom')).assertEqual("#FFFFC0CB");
      done();
    });



    /**
     * @tc.number   Common1Static005
     * @tc.name     Common1Static005
     * @tc.desc     Common1Static005
     * @tc.level    Level.LEVEL0
     */
it('Common1Static005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static005] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static005] component Common1Static005 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      done();
    });



    /**
     * @tc.number   Common1Static006
     * @tc.name     Common1Static006
     * @tc.desc     Common1Static006
     * @tc.level    Level.LEVEL0
     */
it('Common1Static006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static006] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static006] component Common1Static006 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('direction')).assertEqual("Direction.Ltr");
      done();
    });



    /**
     * @tc.number   Common1Static007
     * @tc.name     Common1Static007
     * @tc.desc     Common1Static007
     * @tc.level    Level.LEVEL0
     */
it('Common1Static007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static007] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static007] component Common1Static007 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('backdropBlur')).assertEqual(20);
      done();
    });



    /**
     * @tc.number   Common1Static008
     * @tc.name     Common1Static008
     * @tc.desc     Common1Static008
     * @tc.level    Level.LEVEL0
     */
it('Common1Static008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static008] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static008] component Common1Static008 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('invert')).assertEqual(0.5);
      done();
    });



    /**
     * @tc.number   Common1Static009
     * @tc.name     Common1Static009
     * @tc.desc     Common1Static009
     * @tc.level    Level.LEVEL0
     */
it('Common1Static009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static009] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static009] component Common1Static009 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('blur')).assertEqual(15);
      done();
    });



    /**
     * @tc.number   Common1Static010
     * @tc.name     Common1Static010
     * @tc.desc     Common1Static010
     * @tc.level    Level.LEVEL0
     */
it('Common1Static010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static010] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static010] component Common1Static010 is: " + JSON.stringify(objNew.getElement('$attrs')));
      let outline = JSON.parseJsonElement(objNew.getElement('$attrs').getString('outline'));
      expect(outline.getElement('width').getString('left')).assertEqual("10.00vp");
      expect(outline.getElement('width').getString('top')).assertEqual("10.00vp");
      expect(outline.getElement('width').getString('right')).assertEqual("10.00vp");
      expect(outline.getElement('width').getString('bottom')).assertEqual("10.00vp");
      done();
    });



    /**
     * @tc.number   Common1Static011
     * @tc.name     Common1Static011
     * @tc.desc     Common1Static011
     * @tc.level    Level.LEVEL0
     */
it('Common1Static011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static011] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static011] component Common1Static011 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('useShadowBatching')).assertEqual("true");
      done();
    });


    // /**
    //  * @tc.number   Common1Static012
    //  * @tc.name     Common1Static012
    //  * @tc.desc     Common1Static012
    //  * @tc.level    Level.LEVEL0  异常参数
    //  */
    // /*
    //it('Common1Static012', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   console.info('[Common1Static012] START');
    //   let strJsonNew = inspector.getInspectorByKey('common2');
    //   let objNew = JSON.parseJsonElement(strJsonNew);
    //   console.info("[Common1Static012] component Common1Static012 is: " + JSON.stringify(objNew.getElement('$attrs')));
    //   expect(objNew.getElement('$attrs').getArray('obscured')[0]).assertEqual("1");
    //   done();
    // });



    /**
     * @tc.number   Common1Static013
     * @tc.name     Common1Static013
     * @tc.desc     Common1Static013
     * @tc.level    Level.LEVEL0
     */
it('Common1Static013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static013] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static013] component Common1Static013 is: " + JSON.stringify(objNew.getElement('$attrs')));
      let shadow = objNew.getElement('$attrs').getElement('shadow');
      expect(shadow.getString('radius')).assertEqual("10.000000");
      done();
    });



    /**
     * @tc.number   Common1Static014
     * @tc.name     Common1Static014
     * @tc.desc     Common1Static014
     * @tc.level    Level.LEVEL0
     */
it('Common1Static014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static014] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static014] component Common1Static014 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('renderFit')).assertEqual("RenderFit.CENTER");
      done();
    });



    /**
     * @tc.number   Common1Static015
     * @tc.name     Common1Static015
     * @tc.desc     Common1Static015
     * @tc.level    Level.LEVEL0
     */
it('Common1Static015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static015] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static015] component Common1Static015 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('clip')).assertEqual("false");
      done();
    });



    /**
     * @tc.number   Common1Static016
     * @tc.name     Common1Static016
     * @tc.desc     Common1Static016
     * @tc.level    Level.LEVEL0
     */
it('Common1Static016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static016] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static016] component Common1Static016 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('radialGradient').getString('radius')).assertEqual("15.00vp");
      expect(true).assertEqual(true);
      done();
    });



    /**
     * @tc.number   Common1Static017
     * @tc.name     Common1Static017
     * @tc.desc     Common1Static017
     * @tc.level    Level.LEVEL0
     */
it('Common1Static017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static017] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static017] component Common1Static017 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('sweepGradient').getString('start')).assertEqual("100.00px");
      expect(objNew.getElement('$attrs').getElement('sweepGradient').getString('end')).assertEqual("359.00px");
      expect(true).assertEqual(true);
      done();
    });



    /**
     * @tc.number   Common1Static018
     * @tc.name     Common1Static018
     * @tc.desc     Common1Static018
     * @tc.level    Level.LEVEL0
     */
it('Common1Static018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static018] START');
      let strJsonNew = inspector.getInspectorByKey('common3');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static018] component Common1Static018 is: " + JSON.stringifyJsonElement(objNew.getElement('$attrs').getElement('mask')));
      expect(JSON.stringifyJsonElement(objNew.getElement('$attrs').getElement('mask'))).assertEqual("{}");
      done();
    });



    /**
     * @tc.number   Common1Static019
     * @tc.name     Common1Static019
     * @tc.desc     Common1Static019
     * @tc.level    Level.LEVEL0
     */
it('Common1Static019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static019] START');
      let strJsonNew = inspector.getInspectorByKey('testid');
      console.info("[Common1Static019] component Common1Static017 is: " + strJsonNew);
      expect(strJsonNew != null).assertTrue();
      done();
    });



    /**
     * @tc.number   Common1Static020
     * @tc.name     Common1Static020
     * @tc.desc     Common1Static020
     * @tc.level    Level.LEVEL0
     */
it('Common1Static020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static020] START');
      let strJsonNew = inspector.getInspectorByKey('testkey');
      expect(strJsonNew != null).assertTrue();
      done();
    });



    /**
     * @tc.number   Common1Static021
     * @tc.name     Common1Static021
     * @tc.desc     Common1Static021
     * @tc.level    Level.LEVEL0
     */
it('Common1Static021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static021] START');
      let strJsonNew = inspector.getInspectorByKey('common3');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static021] component Common1Static021 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('overlay').getString('title')).assertEqual("Winter");
      done();
    });



    /**
     * @tc.number   Common1Static022
     * @tc.name     Common1Static022
     * @tc.desc     Common1Static022
     * @tc.level    Level.LEVEL0
     */
it('Common1Static022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static022] START');
      let strJsonNew = inspector.getInspectorByKey('common3');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static022] component Common1Static022 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('draggable')).assertEqual("true");
      done();
    });



    /**
     * @tc.number   Common1Static023
     * @tc.name     Common1Static023
     * @tc.desc     Common1Static023
     * @tc.level    Level.LEVEL0
     */
it('Common1Static023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static023] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static023] component Common1Static023 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('aspectRatio')).assertEqual(2);
      done();
    });



    /**
     * @tc.number   Common1Static024
     * @tc.name     Common1Static024
     * @tc.desc     Common1Static024
     * @tc.level    Level.LEVEL0
     */
it('Common1Static024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static024] START');
      let strJsonNew = inspector.getInspectorByKey('common3');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static024] component Common1Static024 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      done();
    });



    /**
     * @tc.number   Common1Static025
     * @tc.name     Common1Static025
     * @tc.desc     Common1Static025
     * @tc.level    Level.LEVEL0
     */
it('Common1Static025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static025] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static025] component Common1Static025 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('offset').getString('x')).assertEqual("10.00px");
      expect(objNew.getElement('$attrs').getElement('offset').getString('y')).assertEqual("20.00px");
      done();
    });



    /**
     * @tc.number   Common1Static026
     * @tc.name     Common1Static026
     * @tc.desc     Common1Static026
     * @tc.level    Level.LEVEL0
     */
it('Common1Static026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static026] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static026] component Common1Static026 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual("15.00px");
      expect(objNew.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual("25.00px");
      done();
    });



    /**
     * @tc.number   Common1Static027
     * @tc.name     Common1Static027
     * @tc.desc     Common1Static027
     * @tc.level    Level.LEVEL0
     */
it('Common1Static027', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static027] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static027] component Common1Static027 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('position').getString('x')).assertEqual("20.00px");
      expect(objNew.getElement('$attrs').getElement('position').getString('y')).assertEqual("30.00px");
      done();
    });



    /**
     * @tc.number   Common1Static028
     * @tc.name     Common1Static028
     * @tc.desc     Common1Static028
     * @tc.level    Level.LEVEL0
     */
it('Common1Static028', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static028] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static028] component Common1Static028 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('zIndex')).assertEqual(2);
      done();
    });



    /**
     * @tc.number   Common1Static029
     * @tc.name     Common1Static029
     * @tc.desc     Common1Static029
     * @tc.level    Level.LEVEL0
     */
it('Common1Static029', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static029] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static029] component Common1Static029 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Start");
      done();
    });



    /**
     * @tc.number   Common1Static030
     * @tc.name     Common1Static030
     * @tc.desc     Common1Static030
     * @tc.level    Level.LEVEL0
     */
it('Common1Static030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static030] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static030] component Common1Static030 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('flexBasis')).assertEqual("20.00vp");
      done();
    });



    /**
     * @tc.number   Common1Static031
     * @tc.name     Common1Static031
     * @tc.desc     Common1Static031
     * @tc.level    Level.LEVEL0
     */
it('Common1Static031', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static031] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static031] component Common1Static031 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('flexGrow')).assertEqual(3);
      done();
    });




    /**
     * @tc.number   Common1Static032
     * @tc.name     Common1Static032
     * @tc.desc     Common1Static032
     * @tc.level    Level.LEVEL0
     */
it('Common1Static032', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static032] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static032] component Common1Static032 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('flexShrink')).assertEqual(4);
      done();
    });



    /**
     * @tc.number   Common1Static033
     * @tc.name     Common1Static033
     * @tc.desc     Common1Static033
     * @tc.level    Level.LEVEL0
     */
it('Common1Static033', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static033] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static033] component Common1Static033 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('displayPriority')).assertEqual(2);
      done();
    });



    /**
     * @tc.number   Common1Static034
     * @tc.name     Common1Static034
     * @tc.desc     Common1Static034
     * @tc.level    Level.LEVEL0
     */
it('Common1Static034', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static034] START');
      let strJsonNew = inspector.getInspectorByKey('common3');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static034] component Common1Static034 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual("#FF008000");
      done();
    });



    /**
     * @tc.number   Common1Static035
     * @tc.name     Common1Static035
     * @tc.desc     Common1Static035
     * @tc.level    Level.LEVEL0
     */
it('Common1Static035', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static035] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static035] component Common1Static035 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('transform').getString('type')).assertEqual("matrix");
      done();
    });



    /**
     * @tc.number   Common1Static036
     * @tc.name     Common1Static036
     * @tc.desc     Common1Static036
     * @tc.level    Level.LEVEL0
     */
it('Common1Static036', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static036] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static036] component Common1Static036 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('translate').getString('x')).assertEqual("30.00vp");
      expect(objNew.getElement('$attrs').getElement('translate').getString('y')).assertEqual("10.00vp");
      done();
    });



    /**
     * @tc.number   Common1Static037
     * @tc.name     Common1Static037
     * @tc.desc     Common1Static037
     * @tc.level    Level.LEVEL0
     */
it('Common1Static037', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static037] START');
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static037] component Common1Static037 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('rotate').getString('angle')).assertEqual("10.000000");
      done();
    });



    /**
     * @tc.number   Common1Static038
     * @tc.name     Common1Static038
     * @tc.desc     Common1Static038
     * @tc.level    Level.LEVEL0
     */
it('Common1Static038', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static038] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static038] component Common1Static038 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('renderGroup')).assertEqual("true");
      done();
    });



    /**
     * @tc.number   Common1Static041
     * @tc.name     Common1Static041
     * @tc.desc     Common1Static041
     * @tc.level    Level.LEVEL0
     */
it('Common1Static041', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static041] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static041] component Common1Static041 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('hueRotate')).assertEqual(1);
      done();
    });



    /**
     * @tc.number   Common1Static042
     * @tc.name     Common1Static042
     * @tc.desc     Common1Static042
     * @tc.level    Level.LEVEL0
     */
it('Common1Static042', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static042] START');
      let strJsonNew = inspector.getInspectorByKey('common2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static042] component Common1Static042 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getDouble('sepia')).assertEqual(1);
      done();
    });



    /**
     * @tc.number   Common1Static043
     * @tc.name     Common1Static043
     * @tc.desc     Common1Static043
     * @tc.level    Level.LEVEL0
     */
it('Common1Static043', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static043] START');
      let strJsonNew = inspector.getInspectorByKey('testbutton');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static043] component Common1Static043 is: " + JSON.stringify(objNew.getElement('$attrs').getElement('clickEffect')));
      expect(objNew.getElement('$attrs').getElement('clickEffect').getString('level')).assertEqual("2");
      expect(objNew.getElement('$attrs').getElement('clickEffect').getString('scale')).assertEqual("1.000000");
      done();
    });



    /**
     * @tc.number   Common1Static044
     * @tc.name     Common1Static044
     * @tc.desc     Common1Static044
     * @tc.level    Level.LEVEL0
     */
it('Common1Static044', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static044] START');
      let strJsonNew = inspector.getInspectorByKey('testbutton');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[Common1Static044] hoverEffect obj is: " + JSON.stringify(objNew.getElement('$attrs').getString('hoverEffect')));
      expect(objNew.getElement('$attrs').getString('hoverEffect')).assertEqual("HoverEffect.Auto");
      done();
    });



    /**
     * @tc.number   Common1Static046
     * @tc.name     Common1Static046
     * @tc.desc     Common1Static046
     * @tc.level    Level.LEVEL0
     */
it('Common1Static046', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Common1Static046] START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await UtilsTest.msSleep(2000)
      await button.click();
      await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('common1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      await UtilsTest.msSleep(1000)
      expect(objNew.getElement('$attrs').getDouble('zIndex')).assertEqual(5);
      done();
    });
  })
}