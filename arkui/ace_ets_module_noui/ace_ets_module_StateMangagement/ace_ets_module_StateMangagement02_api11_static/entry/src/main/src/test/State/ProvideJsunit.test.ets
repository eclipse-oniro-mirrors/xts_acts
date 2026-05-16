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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

const waitUiReadyMs = 1000;

export default function ProvideJsunit() {
  describe('ProvideJsunit', () => {
    beforeAll(() => {
      console.info("ProvideJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ProvideJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Provide',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ProvideJsunit state pages:" + JSON.stringify(pages));
        if (!("Provide" == pages.name)) {
          console.info("get ProvideJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ProvideJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideJsunit page error:" + err);
      }
      console.info("ProvideJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ProvideA_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number   ProvideJsunit_static_0001
     * @tc.name     ProvideJsunit_static_0001
     * @tc.desc     ProvideJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0001] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAReviewVotes'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 1")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done();
    });

    /**
     * @tc.number   ProvideJsunit_static_0002
     * @tc.name     ProvideJsunit_static_0002
     * @tc.desc     ProvideJsunit_static_0002
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0002] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeA'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0003
     * @tc.name     ProvideJsunit_static_0003
     * @tc.desc     ProvideJsunit_static_0003
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0003] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeB'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 1")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 1")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0004
     * @tc.name     ProvideJsunit_static_0004
     * @tc.desc     ProvideJsunit_static_0004
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0004] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeF'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 1")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 1")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0005
     * @tc.name     ProvideJsunit_static_0005
     * @tc.desc     ProvideJsunit_static_0005
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0005] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBReviewVotes'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 1")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0006
     * @tc.name     ProvideJsunit_static_0006
     * @tc.desc     ProvideJsunit_static_0006
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0006] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeA'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0007
     * @tc.name     ProvideJsunit_static_0007
     * @tc.desc     ProvideJsunit_static_0007
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0007] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeD'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 1")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 1")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0008
     * @tc.name     ProvideJsunit_static_0008
     * @tc.desc     ProvideJsunit_static_0008
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeC'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0009
     * @tc.name     ProvideJsunit_static_0009
     * @tc.desc     ProvideJsunit_static_0009
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeB'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0010
     * @tc.name     ProvideJsunit_static_0010
     * @tc.desc     ProvideJsunit_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0010] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeF'));
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 3")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 3")
      done();
    });

    /**
     * @tc.number   ProvideJsunit_static_0011
     * @tc.name     ProvideJsunit_static_0011
     * @tc.desc     ProvideJsunit_static_0011
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0011] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn_1 = await driver.findComponent(ON.id('ProvideBChangeA'));
      await (btn_1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let btn_2 = await driver.findComponent(ON.id('ProvideBChangeC'));
      await (btn_2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 2")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 2")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 2")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 2")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    /**
     * @tc.number   ProvideJsunit_static_0012
     * @tc.name     ProvideJsunit_static_0012
     * @tc.desc     ProvideJsunit_static_0012
     * @tc.level    Level.LEVEL0
     */
it('ProvideJsunit_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideJsunit_static_0012] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn_1 = await driver.findComponent(ON.id('ProvideBChangeD'));
      await (btn_1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let btn_2 = await driver.findComponent(ON.id('ProvideAChangeB'));
      await (btn_2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await (ProvideA1?.getText() as Promise<string>)
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await (ProvideA2?.getText() as Promise<string>)
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 2")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await (ProvideA3?.getText() as Promise<string>)
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await (ProvideB1?.getText() as Promise<string>)
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await (ProvideB2?.getText() as Promise<string>)
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await (ProvideB3?.getText() as Promise<string>)
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 2")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await (ProvideB4?.getText() as Promise<string>)
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await (ProvideB5?.getText() as Promise<string>)
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await (ProvideB6?.getText() as Promise<string>)
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

  })
}
