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

export default function MenuJsunit() {
  describe('menuTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("Menu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menu',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Menu state pages: " + JSON.stringify(pages));
        if (!("menu" == pages.name)) {
          console.info("get Menu state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push Menu page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Menu_attrs_static_0100
     * @tc.name     ArkUX_Stage_Menu_attrs_static_0100
     * @tc.desc     ArkUX_Stage_Menu_attrs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Menu_attrs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_static_0100 START');
        let strJson = inspector.getInspectorByKey('MenuKey1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Stage_Menu_attrs_static_0100 component obj is: " + JSON.stringify(obj));
        expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF123654");
        console.info('ArkUX_Stage_Menu_attrs_static_0100 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_static_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Menu_attrs_static_0101
     * @tc.name     ArkUX_Stage_Menu_attrs_static_0101
     * @tc.desc     ArkUX_Stage_Menu_attrs_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Menu_attrs_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_static_0101 START');
        let strJson = inspector.getInspectorByKey('MenuKey1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Stage_Menu_attrs_static_0101 component obj is: " + JSON.stringify(obj));
        expect(obj.getElement('$attrs').getElement('font')?.getString('size')).assertEqual("20.00fp");
        expect(obj.getElement('$attrs').getElement('font')?.getString('weight')).assertEqual("FontWeight.Normal");
        expect(obj.getElement('$attrs').getElement('font')?.getString('style')).assertEqual("FontStyle.Normal");
        expect(obj.getElement('$attrs').getElement('font')?.getString('family')).assertEqual("medium");
        console.info('ArkUX_Stage_Menu_attrs_static_0101 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_static_0101 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Menu_attrs_static_0102
     * @tc.name     ArkUX_Stage_Menu_attrs_static_0102
     * @tc.desc     ArkUX_Stage_Menu_attrs_static_0102
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Menu_attrs_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_static_0102 START');
        let strJson = inspector.getInspectorByKey('MenuKey1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Stage_Menu_attrs_static_0102 component obj is: " + JSON.stringify(obj));
        expect(obj.getElement('$attrs').getElement('borderRadius')?.getString('topLeft')).assertEqual("12.00vp");
        expect(obj.getElement('$attrs').getElement('borderRadius')?.getString('topRight')).assertEqual("12.00vp");
        expect(obj.getElement('$attrs').getElement('borderRadius')?.getString('bottomLeft')).assertEqual("12.00vp");
        expect(obj.getElement('$attrs').getElement('borderRadius')?.getString('bottomRight')).assertEqual("12.00vp");
        console.info('ArkUX_Stage_Menu_attrs_static_0102 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_static_0102 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Menu_attrs_static_0103
     * @tc.name     ArkUX_Stage_Menu_attrs_static_0103
     * @tc.desc     ArkUX_Stage_Menu_attrs_static_0103
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Menu_attrs_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUX_Stage_Menu_attrs_static_0103 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('MenuKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Menu_attrs_static_0103 component  is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('borderRadius')?.getString('topLeft')).assertEqual("20.00vp");
      expect(objNew.getElement('$attrs').getElement('borderRadius')?.getString('topRight')).assertEqual("20.00vp");
      expect(objNew.getElement('$attrs').getElement('borderRadius')?.getString('bottomLeft')).assertEqual("20.00vp");
      expect(objNew.getElement('$attrs').getElement('borderRadius')?.getString('bottomRight')).assertEqual("20.00vp");
      console.info('ArkUX_Stage_Menu_attrs_static_0103 END');
      done();
    });

  })
}