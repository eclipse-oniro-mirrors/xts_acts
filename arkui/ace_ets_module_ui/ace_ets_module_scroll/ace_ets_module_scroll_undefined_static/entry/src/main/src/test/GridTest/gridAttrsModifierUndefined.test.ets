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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';


export default function gridAttrsModifierUndefined() {
  describe('gridAttrsModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("gridAttrsModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridDragEventUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/gridAttrsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridAttrsModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("gridAttrsModifierUndefined" == pages.name)) {
          console.info("get gridAttrsModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gridAttrsModifierUndefined page error:" + err);
      }
      console.info("gridAttrsModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   gridAttrsModifierUndefined_static_0001
     * @tc.name     gridAttrsModifierUndefined_static_0001
     * @tc.desc     test alignItems
     * @tc.level    Level.LEVEL1
     */
    it('gridAttrsModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0001] alignItems: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual('GridItemAlignment.Default');

      let changeBtn = await driver.findComponent(ON.id('GridM_alignItemsValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0001] alignItems: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual('GridItemAlignment.Stretch');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual('GridItemAlignment.Default');

      console.info('[gridAttrsModifierUndefined_static_0001] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0002
    * @tc.name     gridAttrsModifierUndefined_static_0002
    * @tc.desc     test cachedCount
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0002] cachedCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')))
        .assertEqual('1');

      let changeBtn = await driver.findComponent(ON.id('GridM_cachedCountValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0002] cachedCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')))
        .assertEqual('2');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')))
        .assertEqual('1');
      console.info('[gridAttrsModifierUndefined_static_0002] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0003
    * @tc.name     gridAttrsModifierUndefined_static_0003
    * @tc.desc     test cellLength
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0003] cellLength: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cellLength')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cellLength')))
        .assertEqual('0');
      let changeBtn = await driver.findComponent(ON.id('GridM_cellLengthValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0003] cellLength: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cellLength')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cellLength')))
        .assertEqual('60');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cellLength')))
        .assertEqual('0');
      console.info('[gridAttrsModifierUndefined_static_0003] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0004
    * @tc.name     gridAttrsModifierUndefined_static_0004
    * @tc.desc     test edgeEffect
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0004] edgeEffect: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
        .assertEqual('EdgeEffect.None');

      let changeBtn = await driver.findComponent(ON.id('GridM_edgeEffectValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0004] edgeEffect: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
        .assertEqual('EdgeEffect.Fade');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
        .assertEqual('EdgeEffect.None');
      console.info('[gridAttrsModifierUndefined_static_0004] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0005
    * @tc.name     gridAttrsModifierUndefined_static_0005
    * @tc.desc     test enableScrollInteraction
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0005] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0003] enableScrollInteraction: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableScrollInteraction')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableScrollInteraction')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('GridM_enableScrollInteractionValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0003] enableScrollInteraction: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableScrollInteraction')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableScrollInteraction')))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableScrollInteraction')))
        .assertEqual('true');
      console.info('[gridAttrsModifierUndefined_static_0005] END');
      done();
    });


    /**
    * @tc.number   gridAttrsModifierUndefined_static_0006
    * @tc.name     gridAttrsModifierUndefined_static_0006
    * @tc.desc     test friction
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0006] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('friction')
      console.info("[gridAttrsModifierUndefined_static_0006] friction: " + res);
      expect(res).assertLessOrEqual(2.00);

      let changeBtn = await driver.findComponent(ON.id('GridM_frictionValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('friction')
      console.info("[gridAttrsModifierUndefined_static_0006] friction: " + res);
      expect(res).assertEqual(1000000);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('friction')
      expect(res).assertLessOrEqual(2.00);

      console.info('[gridAttrsModifierUndefined_static_0006] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0007
    * @tc.name     gridAttrsModifierUndefined_static_0007
    * @tc.desc     test layoutDirection
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0007] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0007] layoutDirection: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('layoutDirection'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('layoutDirection'))
        .assertEqual('GridDirection.Row')

      let changeBtn = await driver.findComponent(ON.id('GridM_layoutDirectionValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0007] layoutDirection: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('layoutDirection'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('layoutDirection'))
        .assertEqual('GridDirection.Column')

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('layoutDirection'))
        .assertEqual('GridDirection.Row')
      console.info('[gridAttrsModifierUndefined_static_0007] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0008
    * @tc.name     gridAttrsModifierUndefined_static_0008
    * @tc.desc     test minCount
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0008] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0006] minCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minCount')))
        .assertEqual('1');

      let changeBtn = await driver.findComponent(ON.id('GridM_minCountValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0006] minCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minCount')))
        .assertEqual('3');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minCount')))
        .assertEqual('1');
      console.info('[gridAttrsModifierUndefined_static_0008] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0009
    * @tc.name     gridAttrsModifierUndefined_static_0009
    * @tc.desc     test nestedScroll
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0009] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0009] nestedScroll: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')))
        .assertEqual('{"scrollForward":"NestedScrollMode.SELF_ONLY","scrollBackward":"NestedScrollMode.SELF_ONLY"}');

      let changeBtn = await driver.findComponent(ON.id('GridM_nestedScrollValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0009] nestedScroll: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')))
        .assertEqual('{"scrollForward":"NestedScrollMode.SELF_FIRST","scrollBackward":"NestedScrollMode.SELF_FIRST"}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')))
        .assertEqual('{"scrollForward":"NestedScrollMode.SELF_ONLY","scrollBackward":"NestedScrollMode.SELF_ONLY"}');
      console.info('[gridAttrsModifierUndefined_static_0009] END');
      done();
    });

    /**
    * @tc.number   gridAttrsModifierUndefined_static_0010
    * @tc.name     gridAttrsModifierUndefined_static_0010
    * @tc.desc     test supportAnimation
    * @tc.level    Level.LEVEL1
    */
    it('gridAttrsModifierUndefined_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridAttrsModifierUndefined_static_0010] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0010] supportAnimation: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('supportAnimation'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('supportAnimation'))
        .assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('GridM_supportAnimationValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      console.info("[gridAttrsModifierUndefined_static_0010] supportAnimation: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('supportAnimation'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('supportAnimation'))
        .assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('GridM');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('supportAnimation'))
        .assertEqual('false');
      console.info('[gridAttrsModifierUndefined_static_0010] END');
      done();
    });
  })
}