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
import emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ellipseJsunit() {
  describe('ellipseTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ellipse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Ellipse/ellipse',
      }
      try {
        const ellipse = AppStorage.get<Router>("router") as Router
        ellipse.clear();
        let pages: router.RouterState = ellipse.getState();
        console.info("get ellipse state pages:" + JSON.stringify(pages));
        if (!("ellipse" == pages.name)) {
          console.info("get ellipse state pages.name:" + JSON.stringify(pages.name));
          // let result = await ellipse.pushUrl(options);
          ellipse.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ellipse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        err = err as BusinessError;
        console.error("push ellipse page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ellipse after each called");
    });


    /**
     * @tc.number   testEllipse_static_01
     * @tc.name     testEllipse_static_01
     * @tc.desc     testEllipse_static_01
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('200.00px');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('200.00px');
      console.info('testEllipse_static_01 END');
      done()
    });


    /**
     * @tc.number   testEllipse_static_02
     * @tc.name     testEllipse_static_02
     * @tc.desc     testEllipse_static_02
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "width": '100px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 92,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse_static_02] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('100.00px');
      console.info('testEllipse_static_02 END');
      done()
    });


    /**
     * @tc.number   testEllipse_static_03
     * @tc.name     testEllipse_static_03
     * @tc.desc     testEllipse_static_03
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_03] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "height": '500px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 92,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse_static_03] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse_static_03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('500.00px');
      console.info('testEllipse_static_03 END');
      done()
    });


    /**
     * @tc.number   testEllipse_static_04
     * @tc.name     testEllipse_static_04
     * @tc.desc     testEllipse_static_04
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_04] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "width": '1111111111111.00px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 907,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse_static_04] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_04] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('1111111111111.00px');
      console.info('testEllipse_static_04 END');
      done()
    });


    /**
     * @tc.number   testEllipse_static_05
     * @tc.name     testEllipse_static_05
     * @tc.desc     testEllipse_static_05
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_05] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "height": '12111111111111.00px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 907,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse_static_05] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse_static_05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_05] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'))
        .assertEqual('12111111111111.00px');
      console.info('testEllipse_static_05 END');
      done()
    });


    /**
     * @tc.number   testEllipse_static_06
     * @tc.name     testEllipse_static_06
     * @tc.desc     testEllipse_static_06
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse_static_06] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "height": '-40.00px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 908,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse_static_06] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse_static_06] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('0.00vp');
      console.info('testEllipse_static_06 END');
      done()
    });


    /**
     * @tc.number   testEllipse07
     * @tc.name     testEllipse07
     * @tc.desc     testEllipse07
     * @tc.level    Level.LEVEL0
     */
    it('testEllipse07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse07_static] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "width": '-10.00px'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 908,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testEllipse07_static] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[testEllipse07_static] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse07_static] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('0.00vp');
      console.info('testEllipse07_static END');
      done()
    });
  })
}
