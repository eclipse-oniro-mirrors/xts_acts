'use static'
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
  PointerMatrix,
  Point
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

export default function ListAttrsModifierUndefinedTest() {
  describe('ListAttrsModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ListAttrsModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ListAttrsModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listAttrsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ListAttrsModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("listAttrsModifierUndefined" == pages.name)) {
          console.info("get ListAttrsModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push ListEventPage page error:" + err);
      }
      console.info("ListAttrsModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   ListAttrsModifierUndefinedTest_static_0100
     * @tc.name     ListAttrsModifierUndefinedTest_static_0100
     * @tc.desc     ListAttrsModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ListAttrsModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0100] alignListItem: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignListItem')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('alignListItem')))
        .assertEqual('\"ListItemAlign.End\"');

      let changeBtn = await driver.findComponent(ON.id('List_alignListItem'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0100] click List_alignListItem");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignListItem')))
        .assertEqual('\"ListItemAlign.Start\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   ListAttrsModifierUndefinedTest_static_0200
     * @tc.name     ListAttrsModifierUndefinedTest_static_0200
     * @tc.desc     ListAttrsModifierUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ListAttrsModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0200] chainAnimation: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('chainAnimation')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('chainAnimation')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('List_chainAnimation'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0200] click List_chainAnimation");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('chainAnimation')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0200] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0300
      * @tc.name     ListAttrsModifierUndefinedTest_static_0300
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0300
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0300] contentStartOffset: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentStartOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('contentStartOffset')))
        .assertEqual('\"50.000000\"');

      let changeBtn = await driver.findComponent(ON.id('List_contentStartOffset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0300] click List_contentStartOffset");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('contentStartOffset')))
        .assertEqual('\"0.000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0300] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0400
      * @tc.name     ListAttrsModifierUndefinedTest_static_0400
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0400
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0400] contentEndOffset: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentEndOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('contentEndOffset')))
        .assertEqual('\"50.000000\"');

      let changeBtn = await driver.findComponent(ON.id('List_contentEndOffset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0400] click List_contentEndOffset");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('contentEndOffset')))
        .assertEqual('\"0.000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0400] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0500
      * @tc.name     ListAttrsModifierUndefinedTest_static_0500
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0500
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0500] divider: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider')))
        .assertEqual('{"strokeWidth":"2.00vp","startMargin":"20.00vp","endMargin":"20.00vp","color":"#FF000000"}');

      let changeBtn = await driver.findComponent(ON.id('List_divider'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0500] click List_divider");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider')))
        .assertEqual('{}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0500] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0600
      * @tc.name     ListAttrsModifierUndefinedTest_static_0600
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0600
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0600] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0600] edgeEffect: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffect')))
        .assertEqual('\"EdgeEffect.None\"');

      let changeBtn = await driver.findComponent(ON.id('List_edgeEffect'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0600] click List_edgeEffect");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffect')))
        .assertEqual('\"EdgeEffect.Spring\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0600] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0700
      * @tc.name     ListAttrsModifierUndefinedTest_static_0700
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0700
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0700] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0700] edgeEffectOptions : " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffectOptions')))
        .assertEqual('{"alwaysEnabled":true,"effectEdge":"EffectEdge.Start"}');

      let changeBtn = await driver.findComponent(ON.id('List_edgeEffectOptions'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0700] click List_edgeEffectOptions");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffectOptions')))
        .assertEqual('{"alwaysEnabled":true,"effectEdge":"EffectEdge.All"}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0700] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0800
      * @tc.name     ListAttrsModifierUndefinedTest_static_0800
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0800
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0800] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0800] lanes: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lanes')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('lanes')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('List_lanesValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0800] click List_lanesValue");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('lanes')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0800] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_0900
      * @tc.name     ListAttrsModifierUndefinedTest_static_0900
      * @tc.desc     ListAttrsModifierUndefinedTest_static_0900
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_0900] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_0900] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_0900] laneGutter: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('laneGutter')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('laneGutter')))
        .assertEqual('\"50.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('List_lanesGutter'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_0900] click List_lanesGutter");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('laneGutter')))
        .assertEqual('\"0.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_0900] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1000
      * @tc.name     ListAttrsModifierUndefinedTest_static_1000
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1000
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1000] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_1000] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_1000] listDirection: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('listDirection')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('listDirection')))
        .assertEqual('\"Axis.Horizontal\"');

      let changeBtn = await driver.findComponent(ON.id('List_listDirection'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1000] click List_listDirection");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('listDirection')))
        .assertEqual('\"Axis.Vertical\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1000] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1100
      * @tc.name     ListAttrsModifierUndefinedTest_static_1100
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1100
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_1100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_1100] multiSelectable: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('multiSelectable')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('multiSelectable')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('List_multiSelectable'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1100] click List_multiSelectable");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('multiSelectable')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1100] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1200
      * @tc.name     ListAttrsModifierUndefinedTest_static_1200
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1200
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let list = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_toBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_toTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onDidScroll'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1200] click List_onDidScroll");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDidScroll');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1200] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1300
      * @tc.name     ListAttrsModifierUndefinedTest_static_1300
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1300
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let list = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_flingBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_flingTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onWillScroll'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1300] click List_onWillScroll");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onWillScroll');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1300] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1400
      * @tc.name     ListAttrsModifierUndefinedTest_static_1400
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1400
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let waterFlow = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_toBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_toTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World'); //end undefined
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onReachStart'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1400] click List_onReachStart");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachStart');
      await CommonFunc.sleep(1000);

      let changeBtn_end = await driver.findComponent(ON.id('List_onReachEnd'));
      await (changeBtn_end?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1400] click List_onReachEnd");
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachEnd');
      await (changeBtn?.click() as Promise<void>);
      await (changeBtn_end?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1400] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1500
      * @tc.name     ListAttrsModifierUndefinedTest_static_1500
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1500
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let list = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_flingBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_flingTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onScrollFrameBegin'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1500] click List_onScrollFrameBegin");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollFrameBegin');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1500] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1600
      * @tc.name     ListAttrsModifierUndefinedTest_static_1600
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1600
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let list = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_toBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_toTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onScrollIndex'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1600] click List_onScrollIndex");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollIndex');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1600] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1700
      * @tc.name     ListAttrsModifierUndefinedTest_static_1700
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1700
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let waterFlow = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_flingBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_flingTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World'); //end undefined
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onScrollStart'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1700] click List_onScrollStart");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollStart');
      await CommonFunc.sleep(1000);

      let changeBtn_end = await driver.findComponent(ON.id('List_onScrollStop'));
      await (changeBtn_end?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1700] click List_onScrollStop");
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollStop');
      await (changeBtn?.click() as Promise<void>);
      await (changeBtn_end?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1700] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1800
      * @tc.name     ListAttrsModifierUndefinedTest_static_1800
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1800
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('List_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let list = await driver.findComponent(ON.type('MyListAttrsModifier'));
      await CommonFunc.sleep(1000);

      let changeBtn_bottom = await driver.findComponent(ON.id('List_flingBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('List_flingTop'));
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('List_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('List_onScrollVisibleContentChange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1800] click List_onScrollVisibleContentChange");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollVisibleContentChange');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1800] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_1900
      * @tc.name     ListAttrsModifierUndefinedTest_static_1900
      * @tc.desc     ListAttrsModifierUndefinedTest_static_1900
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_1900] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_1900] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_1900] scrollBar: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBar')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('scrollBar')))
        .assertEqual('\"BarState.Off\"');

      let changeBtn = await driver.findComponent(ON.id('List_scrollBar'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_1900] click List_scrollBar");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('scrollBar')))
        .assertEqual('\"BarState.Auto\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_1900] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_2000
      * @tc.name     ListAttrsModifierUndefinedTest_static_2000
      * @tc.desc     ListAttrsModifierUndefinedTest_static_2000
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_2000] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest_static_2000] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest_static_2000] sticky: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('sticky')))
        .assertEqual('\"StickyStyle.Header\"');

      let changeBtn = await driver.findComponent(ON.id('List_sticky'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_2000] click List_sticky");
      strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('sticky')))
        .assertEqual('\"StickyStyle.None\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_2000] END');
      done();
    });

    /**
      * @tc.number   ListAttrsModifierUndefinedTest_static_2100
      * @tc.name     ListAttrsModifierUndefinedTest_static_2100
      * @tc.desc     ListAttrsModifierUndefinedTest_static_2100
      * @tc.level    Level.LEVEL1
      */
    it('ListAttrsModifierUndefinedTest_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest_static_2100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListAttrsModifier');
      await CommonFunc.sleep(1000);
      let changeBtn_top = await driver.findComponent(ON.id('List_toTop'));
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let listItem0 = await driver.findComponent(ON.id('stackFromEnd_0'));
      await CommonFunc.sleep(500);
      let point: Point = await (listItem0?.getBoundsCenter() as Promise<Point>);
      console.log(`[ListAttrsModifierUndefinedTest_static_2100] point{x:${point.x}, y:${point.y}}`);
      let listItem1 = await driver.findComponent(ON.id('stackFromEnd_1'));
      await CommonFunc.sleep(500);
      let point1: Point = await (listItem1?.getBoundsCenter() as Promise<Point>);
      console.log(`[ListAttrsModifierUndefinedTest_static_2100] point1{x:${point1.x}, y:${point1.y}}`);
      expect(point.y < point1.y).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('List_stackFromEnd'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest_static_2100] click List_stackFromEnd");
      listItem0 = await driver.findComponent(ON.id('stackFromEnd_0'));
      await CommonFunc.sleep(500);
      let point2: Point = await (listItem0?.getBoundsCenter() as Promise<Point>);
      console.log(`[ListAttrsModifierUndefinedTest_static_2100] point2{x:${point.x}, y:${point.y}}`);
      listItem1 = await driver.findComponent(ON.id('stackFromEnd_1'));
      await CommonFunc.sleep(500);
      let point3: Point = await (listItem1?.getBoundsCenter() as Promise<Point>);
      console.log(`[ListAttrsModifierUndefinedTest_static_2100] point3{x:${point1.x}, y:${point1.y}}`);
      expect(point2.y < point3.y).assertTrue();
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest_static_2100] END');
      done();
    });

  })
}