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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function cachedShowList() {
  describe('cachedShowList', () => {

    beforeAll(() => {
      console.info("cachedShowGrid beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("cachedShowList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/cachedShowList",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear()
        let pages = router.getState();
        console.info("get cachedShowList state pages:" + JSON.stringify(pages));
        if (!("cachedShowList" == pages.name)) {
          console.info("get cachedShowList pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push cachedShowList page error:" + err);
      }
      console.info("cachedShowList beforeEach end");
    });

    
    /**
     * @tc.number   cachedShowList_static_0100
     * @tc.name     cachedShowList_static_0100
     * @tc.desc     cachedShowList_static_0100
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowList_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let strJson = inspector.getInspectorByKey('cachedCount_show_list');
      console.info("[cachedShowList_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[cachedShowList_static_0100] cachedCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('cachedCount')).assertEqual('2');
      await driver.assertComponentExist(ON.text('4'));
      console.info('[cachedShowList_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   cachedShowList_static_0200
     * @tc.name     cachedShowList_static_0200
     * @tc.desc     cachedShowList_static_0200
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowList_static_0200] START');
      try {
        AppStorage.setOrCreate<boolean>('clip1', false);
        AppStorage.setOrCreate<boolean>('show1', false);
      } catch (err: Error) {
        console.log("[cachedShowList_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_list_4'));
      console.info("[cachedShowList_static_0200] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   cachedShowList_static_0400
     * @tc.name     cachedShowList_static_0400
     * @tc.desc     cachedShowList_static_0400
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[cachedShowList_static_0400] START');
          try {
            AppStorage.setOrCreate<boolean>('clip1', true);
            AppStorage.setOrCreate<boolean>('show1', true);
          } catch (err: Error) {
            console.log("[cachedShowList_static_0400] change component data error: " + err.message);
          }
          await CommonFunc.sleep(2000);
          let driver = Driver.create()
          let onText = await driver.findComponent(ON.id('show_list_4')) as Component;
          let text = await onText.getText();
          console.info("[cachedShowList_static_0400'] text is: " + text);
          await driver.assertComponentExist(ON.text('4'));
          console.info('[cachedShowList_static_0400] END');
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   cachedShowList_static_0300
     * @tc.name     cachedShowList_static_0300
     * @tc.desc     cachedShowList_static_0300
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowList_static_0300] START');
      try {
        AppStorage.setOrCreate<boolean>('clip1', true);
        AppStorage.setOrCreate<boolean>('show1', false);
      } catch (err: Error) {
        console.log("[cachedShowGrid_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_list_4'));
      console.info("[cachedShowList_static_0300] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   cachedShowList_static_0500
     * @tc.name     cachedShowList_static_0500
     * @tc.desc     cachedShowList_static_0500
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowList_static_0500] START');
      try {
        AppStorage.setOrCreate<boolean>('clip1', true);
        AppStorage.setOrCreate<boolean | null>('show1', null);
      } catch (err: Error) {
        console.log("[cachedShowList_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_list_4'));
      console.info("[cachedShowList_static_0500] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_static_0500] END');
      done();
    });


    
    /**
     * @tc.number   cachedShowList_static_0600
     * @tc.name     cachedShowList_static_0600
     * @tc.desc     cachedShowList_static_0600
     * @tc.level    Level.LEVEL1
     */
it('cachedShowList_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowList_static_0600] START');
      try {
        AppStorage.setOrCreate<boolean>('clip1', false);
        AppStorage.setOrCreate<boolean | undefined>('show1', undefined);
      } catch (err: Error) {
        console.log("[cachedShowList_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText = await driver.findComponent(ON.id('show_list_4'));
      console.info("[cachedShowList_static_0600] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_static_0600] END');
      done();
    });
  })
}
