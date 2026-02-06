'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';
import events_emitter from '@ohos.events.emitter';
import { Color,ResourceStr,ResourceColor,Resource } from '@ohos.arkui.component'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function badge3Jsunit() {
  describe('badge3Jsunit', () => {
    beforeAll(() => {
      console.info("badge3Jsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {

      console.info("badge beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/badge3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get badge state pages: " + JSON.stringify(pages));
        if (!("badge3" == pages.name)) {
          console.info("get badge state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push badge page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("badge after each called");
    })

    /**
     * @tc.number   testBadge_static_01
     * @tc.name     testBadge_static_01
     * @tc.desc     testBadge_static_01
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge01] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge');

      console.info("[testBadge01] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Badge');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual('20.00fp');
      done();
    });

    /**
     * @tc.number   testBadge_static_03
     * @tc.name     testBadge_static_03
     * @tc.desc     testBadge_static_03
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge03] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('fontSizeValue',-1)
      } catch (err) {
        console.log("[testBadge03] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge03] component objNew is: " + JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getString('style')) + "--" + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual('10.00vp');
      done();
    });

    /**
     * @tc.number   testBadge_static_02
     * @tc.name     testBadge_static_02
     * @tc.desc     testBadge_static_02
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge02] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('fontSizeValue','30')
      } catch (err) {
        console.log("[testBadge02] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge02] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual('30.00fp');
      done();
    });


    /**
     * @tc.number   testBadge_static_04
     * @tc.name     testBadge_static_04
     * @tc.desc     testBadge_static_04
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge04] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('fontSizeValue','121212121')

      } catch (err) {
        console.log("[testBadge04] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge04] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual('121212121.00fp');
      done();
    });

    /**
     * @tc.number   testBadge_static_05
     * @tc.name     testBadge_static_05
     * @tc.desc     testBadge_static_05
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge05] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('fontSizeValue','121212121vaas')
      } catch (err) {
        console.log("[testBadge05] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge');
      console.info("[testBadge05] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info("[testBadge05] component style is: " + JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getString('style'))));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual('10.00vp');
      done();
    });

    /**
     * @tc.number   testBadge_static_06
     * @tc.name     testBadge_static_06
     * @tc.desc     testBadge_static_06
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge06] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge2');
      console.info("[testBadge06] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Badge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual('new');
      done();
    });

    /**
     * @tc.number   testBadge_static_07
     * @tc.name     testBadge_static_07
     * @tc.desc     testBadge_static_07
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge07] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('badge2');
      console.info("[testBadge07] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Badge');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('color')).assertEqual('#FFFF0000');
      done();
    });

    /**
     * @tc.number   testBadge_static_08
     * @tc.name     testBadge_static_08
     * @tc.desc     testBadge_static_08
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge08] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<ResourceColor | undefined>('colorValue',Color.Blue)

      } catch (err) {
        console.log("[testBadge08] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge08] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('color')).assertEqual('#FF0000FF');
      done();
    });

    /**
     * @tc.number   testBadge_static_09
     * @tc.name     testBadge_static_09
     * @tc.desc     testBadge_static_09
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge09] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('message','test')
      } catch (err) {
        console.log("[testBadge09] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge09] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('test');
      done();
    });

    /**
     * @tc.number   testBadge_static_10
     * @tc.name     testBadge_static_10
     * @tc.desc     testBadge_static_10
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge10] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<undefined>('colorValue',undefined)

      } catch (err) {
        console.log("[testBadge10] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge10] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('color')).assertEqual('#FFFFFFFF');
      done();
    });

    /**
     * @tc.number   testBadge_static_11
     * @tc.name     testBadge_static_11
     * @tc.desc     testBadge_static_11
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_11', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBadge11] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<ResourceColor | undefined>('colorValue',-300)

      } catch (err) {
        console.log("[testBadge11] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('badge2');
      console.info("[testBadge11] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('style')).getString('color')).assertEqual('#FFFFFED4');
      done();
    });
  })
}