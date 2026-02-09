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
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
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
import events_emitter from '@ohos.events.emitter';

export default function list() {
  describe('listTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
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
         await UtilsTest.msSleep(2000);
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

      console.info("[ListJsunit_static_0100] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollSnapAlign')).assertEqual("ScrollSnapAlign.NONE");
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

      console.info("[ListJsunit_static_0101] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lanes')).assertEqual("1");
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

      console.info("[ListJsunit_static_0102] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble("friction")).assertEqual(1);
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

      console.info("[ListJsunit_static_0103] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('[ListJsunit_static_0103] END');
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

      console.info("[ListJsunit_static_0105] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('chainAnimationOptions')).assertEqual(undefined);
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

      console.info("[ListJsunit_static_0106] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignListItem')).assertEqual("ListItemAlign.Start");
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

      console.info("[ListJsunit_static_0107] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('listDirection')).assertEqual("Axis.Vertical");
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

      console.info("[ListJsunit_static_0108] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Off");
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

      console.info("[ListJsunit_static_0109] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.Spring");
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

      console.info("[ListJsunit_static_0110] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual("1.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin')).assertEqual("2.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin')).assertEqual("3.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('color')).assertEqual("#FF00FFFF");
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

      console.info("[ListJsunit_static_0112] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('multiSelectable')).assertEqual(true);
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

      console.info("[ListJsunit_static_0113] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('cachedCount')).assertEqual("2");
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

      console.info("[ListJsunit_static_0114] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('chainAnimation')).assertEqual(true);
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

      console.info("[ListJsunit_static_0115] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual("StickyStyle.Header");
      console.info('[ListJsunit_static_0115] END');
      done();
    });

    
    
    /**
     * @tc.number   ListJsunit_static_0116
     * @tc.name     ListJsunit_static_0116
     * @tc.desc     ListJsunit_static_0116
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0116', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0116] START');
      let strJson = inspector.getInspectorByKey('ListKey1');

      console.info("[ListJsunit_static_0116] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentEndOffset')).assertEqual("1.000000");
      console.info('[ListJsunit_static_0116] END');
      done();
    });

    
    
    /**
     * @tc.number   ListJsunit_static_0117
     * @tc.name     ListJsunit_static_0117
     * @tc.desc     ListJsunit_static_0117
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0117', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListJsunit_static_0117] START');
      let strJson = inspector.getInspectorByKey('ListKey1');

      console.info("[ListJsunit_static_0117] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentStartOffset')).assertEqual("1.000000");
      console.info('[ListJsunit_static_0117] END');
      done();
    });

    
    
    /**
     * @tc.number   ListJsunit_static_0118
     * @tc.name     ListJsunit_static_0118
     * @tc.desc     ListJsunit_static_0118
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0118', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ListJsunit_static_0118 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ListKey1');
      console.info("ListJsunit_static_0118 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('lanes')).assertEqual('1');
      console.info('ListJsunit_static_0118 END');
      done();
    });
  })
}
