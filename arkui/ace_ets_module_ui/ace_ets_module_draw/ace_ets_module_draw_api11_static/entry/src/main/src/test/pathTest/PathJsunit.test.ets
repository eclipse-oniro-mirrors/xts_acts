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
import emitter from '@ohos.events.emitter'
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

export default function pathJsunit() {
  describe('pathJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("path beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path/path',
      }
      try {
        const path = AppStorage.get<Router>("router") as Router
        path.clear();
        let pages = path.getState();
        console.info("get path state pages: " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get overlay state pages.name:" + JSON.stringify(pages.name));
          let result = path.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push path page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("path after each called");
    });

    
    /**
     * @tc.number   testPath_static_01
     * @tc.name     testPath_static_01
     * @tc.desc     testPath_static_01
     * @tc.level    Level.LEVEL0
     */
it('testPath_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testPath_static_01_static] START');
      await CommonFunc.sleep(1000);
      let str = inspector.getInspectorByKey('path1');
      const strJson = JSON.parseJsonElement(str)
      console.info("[testPath_static_01_static] strJson is: " + JSON.stringify(strJson));
      expect(strJson.getElement('$attrs').getString('width')).assertEqual('300.00px');
      expect(strJson.getElement('$attrs').getString('height')).assertEqual('10.00px');
      console.info('[testPath_static_01_static] END');
      done();
    });

    
    /**
     * @tc.number   testPath_static_02
     * @tc.name     testPath_static_02
     * @tc.desc     testPath_static_02
     * @tc.level    Level.LEVEL0
     */
it('testPath_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testPath_static_02_static] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "height": '200.00px',
            "commands": "M0 110 L900 0",
            "width": '200.00px',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 151,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("[testPath_static_02_static] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testPath_static_02_static] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let str = inspector.getInspectorByKey('path1');
      const strJson = JSON.parseJsonElement(str)
      console.info("[testPath_static_02_static] strJson is: " + JSON.stringify(strJson));
      expect(strJson.getElement('$attrs').getString('width')).assertEqual('200.00px');
      expect(strJson.getElement('$attrs').getString('height')).assertEqual('200.00px');
      console.info('testPath_static_02_static END');
      done();
    });
  })
}
