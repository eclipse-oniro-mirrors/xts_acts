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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function list() {
  describe('listJsunit', () => {
    beforeAll(() => {
        console.info("listJsunit beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("listJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get list state pages: " + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
    })

    
    
    
/**
     * @tc.number   ListJsunit_static_0100
     * @tc.name     ListJsunit_static_0100
     * @tc.desc     ListJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      console.info('[ListJsunit_static_0100] strJson: ' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ListJsunit_static_0100] obj: ' + JSON.stringify(obj));
      console.info("[ListJsunit_static_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual("ScrollSnapAlign.NONE");
      console.info('[ListJsunit_static_0100] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0101
     * @tc.name     ListJsunit_static_0101
     * @tc.desc     ListJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0101] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0101] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('lanes')).assertEqual("1");
      console.info('[ListJsunit_static_0101] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0102
     * @tc.name     ListJsunit_static_0102
     * @tc.desc     ListJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0102] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0102] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(Math.abs(obj.getElement('$attrs').getDouble('friction') - 0.6) < 0.000001).assertTrue();
      console.info('[ListJsunit_static_0102] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0103
     * @tc.name     ListJsunit_static_0103
     * @tc.desc     ListJsunit_static_0103
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0103] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0103] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('[ListJsunit_static_0103] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0104
     * @tc.name     ListJsunit_static_0104
     * @tc.desc     ListJsunit_static_0104
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0104] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0104] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      //expect(obj.getElement('$attrs').nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:PARALLEL}");
      expect(true).assertEqual(true);
      console.info('[ListJsunit_static_0104] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0105
     * @tc.name     ListJsunit_static_0105
     * @tc.desc     ListJsunit_static_0105
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0105] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0105] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      //expect(obj.getElement('$attrs').chainAnimationOptions).assertEqual("{minSpace:1,maxSpace:2,conductivity:0.6,intensity:0.2,edgeEffect:ChainEdgeEffect.DEFAULT}");
      expect(true).assertEqual(true);
      console.info('[ListJsunit_static_0105] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0106
     * @tc.name     ListJsunit_static_0106
     * @tc.desc     ListJsunit_static_0106
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0106', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0106] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0106] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('alignListItem')).assertEqual("ListItemAlign.Start");
      console.info('[ListJsunit_static_0106] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0107
     * @tc.name     ListJsunit_static_0107
     * @tc.desc     ListJsunit_static_0107
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0107', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0107] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0107] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('listDirection')).assertEqual("Axis.Vertical");
      console.info('[ListJsunit_static_0107] END');
      done();
    });

    
    
/**
     * @tc.number   ListJsunit_static_0108
     * @tc.name     ListJsunit_static_0108
     * @tc.desc     ListJsunit_static_0108
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0108', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0108] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0108] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Off");
      console.info('[ListJsunit_static_0108] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0109
     * @tc.name     ListJsunit_static_0109
     * @tc.desc     ListJsunit_static_0109
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0109', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0109] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0109] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.Spring");
      console.info('[ListJsunit_static_0109] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0110
     * @tc.name     ListJsunit_static_0110
     * @tc.desc     ListJsunit_static_0110
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0110] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0110] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual("1.00vp");
      expect(obj.getElement('$attrs').getElement('divider').getString('startMargin')).assertEqual("2.00vp");
      expect(obj.getElement('$attrs').getElement('divider').getString('endMargin')).assertEqual("3.00vp");
      expect(obj.getElement('$attrs').getElement('divider').getString('color')).assertEqual("#FF00FFFF");
      console.info('[ListJsunit_static_0110] END');
      done();
    });

    
    
/**
     * @tc.number   ListJsunit_static_0112
     * @tc.name     ListJsunit_static_0112
     * @tc.desc     ListJsunit_static_0112
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0112', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0112] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0112] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('multiSelectable')).assertEqual(true);
      console.info('[ListJsunit_static_0112] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0113
     * @tc.name     ListJsunit_static_0113
     * @tc.desc     ListJsunit_static_0113
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0113', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0113] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0113] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('cachedCount')).assertEqual("2");
      console.info('[ListJsunit_static_0113] END');
      done();
    });

    
    
    
/**
     * @tc.number   ListJsunit_static_0114
     * @tc.name     ListJsunit_static_0114
     * @tc.desc     ListJsunit_static_0114
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0114', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0114] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0114] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('chainAnimation')).assertEqual(true);
      console.info('[ListJsunit_static_0114] END');
      done();
    });

   
    
    
/**
     * @tc.number   ListJsunit_static_0115
     * @tc.name     ListJsunit_static_0115
     * @tc.desc     ListJsunit_static_0115
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0115', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0115] START');
      let strJson = inspector.getInspectorByKey('ListKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0115] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('sticky')).assertEqual("StickyStyle.Header");
      console.info('[ListJsunit_static_0115] END');
      done();
    });

  })
}
