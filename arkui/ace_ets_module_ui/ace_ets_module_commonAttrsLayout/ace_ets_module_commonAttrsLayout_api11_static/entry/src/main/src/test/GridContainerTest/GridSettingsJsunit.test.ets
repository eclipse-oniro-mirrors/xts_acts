'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function gridSettingsJsunit() {
  describe('gridSettingsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("gridSettingsTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("gridSettingsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridContainer/gridSettings',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gridSettings state pages:" + JSON.stringify(pages));
        if (!("gridSettings" == pages.name)) {
          console.info("get gridSettings state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err: BusinessError) {
        console.error("push gridSettings page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("gridSettings after each called");
    });

    
    /**
     * @tc.number   testGridSettings000_static
     * @tc.name     testGridSettings000_static
     * @tc.desc     testGridSettings000_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings000_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings000] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('gridContainer');
      console.info("[testGridSettings000] component strJson:" + strJson);
      expect(true).assertEqual(true);
      done()
    });

    
    /**
     * @tc.number   testGridSettings001_static
     * @tc.name     testGridSettings001_static
     * @tc.desc     testGridSettings001_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings001_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings001] START');
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridRow');
      console.info("[testGridSettings001] component strJson:" + strJson);

      console.info("[testGridSettings001] gridRow useSizeType: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('useSizeType')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('span')).assertEqual(2);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('offset')).assertEqual(1);
      done()
    });

    
    /**
     * @tc.number   testGridSettings002_static
     * @tc.name     testGridSettings002_static
     * @tc.desc     testGridSettings002_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings002_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings002] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "span": 1,
            "offset": 2
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 9,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings002] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings002] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('gridRow');
      console.info("[testGridSettings002] component strJson:" + strJson);

      console.info("[testGridSettings002] gridRow useSizeType: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('span')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('offset')).assertEqual(2);
      done()
    });

    
    /**
     * @tc.number   testGridSettings003_static
     * @tc.name     testGridSettings003_static
     * @tc.desc     testGridSettings003_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings003_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings003] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "span": 0x80000000,
            "offset": 0x80000000
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 9,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings003] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings003] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridRow');
      console.info("[testGridSettings003] component strJson:" + strJson);

      console.info("[testGridSettings003] gridRow useSizeType: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('useSizeType')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('span')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('offset')).assertEqual(-2147483648);
      done()
    });

    
    /**
     * @tc.number   testGridSettings004_static
     * @tc.name     testGridSettings004_static
     * @tc.desc     testGridSettings004_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings004_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings004] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "span": 0x7FFFFFFF,
            "offset": 0x7FFFFFFF
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 9,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings004] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings004] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridRow');
      console.info("[testGridSettings004] component strJson:" + strJson);

      console.info("[testGridSettings004] gridRow useSizeType: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('useSizeType')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('span')).assertEqual(0x7FFFFFFF);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('offset')).assertEqual(0x7FFFFFFF);
      done()
    });

    
    /**
     * @tc.number   testGridSettings005_static
     * @tc.name     testGridSettings005_static
     * @tc.desc     testGridSettings005_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings005_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings005] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "span": 'error',
            "offset": 'error'
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 9,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings005] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings005] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridRow');
      console.info("[testGridSettings005] component strJson:" + strJson);

      console.info("[testGridSettings005] gridRow useSizeType: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('useSizeType')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('span')).assertEqual(0);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('useSizeType')
        .getElement('sm')
        .getInteger('offset')).assertEqual(0);
      done()
    });

    
    /**
     * @tc.number   testGridSettings006_static
     * @tc.name     testGridSettings006_static
     * @tc.desc     testGridSettings006_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings006_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings006] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('gridOffset');
      console.info("[testGridSettings006] component strJson:" + strJson);

      console.info("[testGridSettings006] gridOffset: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')).assertEqual(0);
      done()
    });

    
    /**
     * @tc.number   testGridSettings007_static
     * @tc.name     testGridSettings007_static
     * @tc.desc     testGridSettings007_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings007_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings007] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridOffset": 1
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 10,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings007] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings007] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridOffset');
      console.info("[testGridSettings007] component strJson:" + strJson);

      console.info("[testGridSettings007] gridOffset: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')).assertEqual(1);
      done()
    });

    
    /**
     * @tc.number   testGridSettings008_static
     * @tc.name     testGridSettings008_static
     * @tc.desc     testGridSettings008_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings008_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings008] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridOffset": 0x80000000
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 10,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings008] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings008] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridOffset');
      console.info("[testGridSettings008] component strJson:" + strJson);

      console.info("[testGridSettings008] gridOffset: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')).assertEqual(-2147483648);
      done()
    });

    
    /**
     * @tc.number   testGridSettings009_static
     * @tc.name     testGridSettings009_static
     * @tc.desc     testGridSettings009_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings009_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings009] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridOffset": 0x7FFFFFFF
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 10,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings009] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings009] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridOffset');
      console.info("[testGridSettings009] component strJson:" + strJson);

      console.info("[testGridSettings009] gridOffset: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')).assertEqual(0x7FFFFFFF);
      done()
    });

    
    /**
     * @tc.number   testGridSettings010_static
     * @tc.name     testGridSettings010_static
     * @tc.desc     testGridSettings010_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings010_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings010] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridOffset": 'error'
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 10,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings010] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings010] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridOffset');
      console.info("[testGridSettings010] component strJson:" + strJson);
      console.info("[testGridSettings010] gridOffset: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridOffset')).assertEqual(0);
      done()
    });

    
    /**
     * @tc.number   testGridSettings011_static
     * @tc.name     testGridSettings011_static
     * @tc.desc     testGridSettings011_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings011_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings011] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('gridSpan');
      console.info("[testGridSettings011] component strJson:" + strJson);
      console.info("[testGridSettings011] gridSpan: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')).assertEqual(1);
      done()
    });

    
    /**
     * @tc.number   testGridSettings012_static
     * @tc.name     testGridSettings012_static
     * @tc.desc     testGridSettings012_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings012_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings012] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridSpan": 2
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 11,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings012] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings012] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridSpan');
      console.info("[testGridSettings012] component strJson:" + strJson);
      console.info("[testGridSettings012] gridSpan: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')).assertEqual(2);
      done()
    });

    
    /**
     * @tc.number   testGridSettings013_static
     * @tc.name     testGridSettings013_static
     * @tc.desc     testGridSettings013_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings013_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings013] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridSpan": 0x80000000
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 11,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings013] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings013] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridSpan');
      console.info("[testGridSettings013] component strJson:" + strJson);
      console.info("[testGridSettings013] gridSpan: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')).assertEqual(2);
      done()
    });

    
    /**
     * @tc.number   testGridSettings014_static
     * @tc.name     testGridSettings014_static
     * @tc.desc     testGridSettings014_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings014_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings014] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridSpan": 0x7FFFFFFF
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 11,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings014] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testGridSettings014] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridSpan');
      console.info("[testGridSettings014] component strJson:" + strJson);
      console.info("[testGridSettings014] gridSpan: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')).assertEqual(0x7FFFFFFF);
      done()
    });

    
    /**
     * @tc.number   testGridSettings015_static
     * @tc.name     testGridSettings015_static
     * @tc.desc     testGridSettings015_static
     * @tc.level    Level.LEVEL0
     */
it('testGridSettings015_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridSettings015] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "gridSpan": 'error'
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 11,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testGridSettings015] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testGridSettings015] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('gridSpan');
      console.info("[testGridSettings015] component strJson:" + strJson);
      console.info("[testGridSettings015] gridSpan: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('gridSpan')).assertEqual(1);
      done()
    });
  });
}