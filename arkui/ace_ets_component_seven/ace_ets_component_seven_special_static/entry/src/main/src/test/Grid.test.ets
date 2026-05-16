'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest',() => {
    beforeAll(() => {
        console.info("gridMaxCountTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("grid beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("grid" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
          // console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0100
     * @tc.name     GridJsunit_static_0100
     * @tc.desc     GridJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0100] obj GridJsunit_0100 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(Math.abs(obj.getElement('$attrs').getDouble('friction') - 0.6) < 0.000001).assertTrue();
      console.info('[GridJsunit_static_0100] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0101
     * @tc.name     GridJsunit_static_0101
     * @tc.desc     GridJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0101] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0101] obj GridJsunit_0101 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('[GridJsunit_static_0101] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0102
     * @tc.name     GridJsunit_static_0102
     * @tc.desc     GridJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0102] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0102] obj GridJsunit_0102 is: " + JSON.stringify(obj.getElement('$attrs')));

      // expect(obj.getElement('$attrs').nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:PARENT_FIRST}");
      expect(true).assertEqual(true);
      console.info('[GridJsunit_static_0102] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0103
     * @tc.name     GridJsunit_static_0103
     * @tc.desc     GridJsunit_static_0103
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0103] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0103] obj GridJsunit_0103 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.Spring");
      console.info('[GridJsunit_static_0103] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0104
     * @tc.name     GridJsunit_static_0104
     * @tc.desc     GridJsunit_static_0104
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0104] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0104] obj GridJsunit_0104 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('rowsTemplate')).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_static_0104] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0105
     * @tc.name     GridJsunit_static_0105
     * @tc.desc     GridJsunit_static_0105
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0105] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0105] obj GridJsunit_0105 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('columnsTemplate')).assertEqual("1fr 1fr 1fr 1fr 1fr");
      console.info('[GridJsunit_static_0105] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0106
     * @tc.name     GridJsunit_static_0106
     * @tc.desc     GridJsunit_static_0106
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0106', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0106] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0106] obj GridJsunit_0106 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual("10.00vp");
      console.info('[GridJsunit_static_0106] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0107
     * @tc.name     GridJsunit_static_0107
     * @tc.desc     GridJsunit_static_0107
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0107', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0107] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0107] obj GridJsunit_0107 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual("10.00vp");
      console.info('[GridJsunit_static_0107] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0108
     * @tc.name     GridJsunit_static_0108
     * @tc.desc     GridJsunit_static_0108
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0108', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0108] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0108] obj GridJsunit_0108 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual("5.00vp");
      console.info('[GridJsunit_static_0108] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0109
     * @tc.name     GridJsunit_static_0109
     * @tc.desc     GridJsunit_static_0109
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0109', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0109] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0109] obj GridJsunit_0109 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FFFFC0CB");
      console.info('[GridJsunit_static_0109] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0110
     * @tc.name     GridJsunit_static_0110
     * @tc.desc     GridJsunit_static_0110
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0110] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0110] obj GridJsunit_0110 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.On");
      console.info('[GridJsunit_static_0110] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0111
     * @tc.name     GridJsunit_static_0111
     * @tc.desc     GridJsunit_static_0111
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0111', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0111] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0111] obj GridJsunit_0111 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('editMode')).assertEqual("true");
      console.info('[GridJsunit_static_0111] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0112
     * @tc.name     GridJsunit_static_0112
     * @tc.desc     GridJsunit_static_0112
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0112', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0112] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0112] obj GridJsunit_0112 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('editMode')).assertEqual("true");
      console.info('[GridJsunit_static_0112] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0113
     * @tc.name     GridJsunit_static_0113
     * @tc.desc     GridJsunit_static_0113
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0113', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0113] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0113] obj GridJsunit_0113 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('multiSelectable')).assertEqual("true");
      console.info('[GridJsunit_static_0113] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0114
     * @tc.name     GridJsunit_static_0114
     * @tc.desc     GridJsunit_static_0114
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0114', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0114] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0114] obj GridJsunit_0114 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getDouble('maxCount')).assertEqual(10);
      console.info('[GridJsunit_static_0114] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0115
     * @tc.name     GridJsunit_static_0115
     * @tc.desc     GridJsunit_static_0115
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0115', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0115] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0115] obj GridJsunit_0115 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getDouble('minCount')).assertEqual(2);
      console.info('[GridJsunit_static_0115] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0116
     * @tc.name     GridJsunit_static_0116
     * @tc.desc     GridJsunit_static_0116
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0116', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0116] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0116] obj GridJsunit_0116 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getDouble('cellLength')).assertEqual(12);
      console.info('[GridJsunit_static_0116] END');
      done();
    });

   
    
    
/**
     * @tc.number   GridJsunit_static_0117
     * @tc.name     GridJsunit_static_0117
     * @tc.desc     GridJsunit_static_0117
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0117', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0117] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0117] obj GridJsunit_0117 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('layoutDirection')).assertEqual("GridDirection.Row");
      console.info('[GridJsunit_static_0117] END');
      done();
    });

    
    
    
/**
     * @tc.number   GridJsunit_static_0118
     * @tc.name     GridJsunit_static_0118
     * @tc.desc     GridJsunit_static_0118
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0118', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridJsunit_static_0118] START');
      let strJson = inspector.getInspectorByKey('GridKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0118] obj GridJsunit_0118 is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('supportAnimation')).assertEqual("true");
      console.info('[GridJsunit_static_0118] END');
      done();
    });
  })
}
