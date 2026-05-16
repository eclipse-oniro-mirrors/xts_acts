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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';

import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
// import Utils from './Utils';

let emitKey = "emitUserAgent";

export default function selectmenuTest() {
  describe('ActsSelectMenuTest', () => {

    beforeAll(() => {
      console.info("SelectMenu beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.select.api12.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SelectMenu",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectMenu state success " + JSON.stringify(pages));
        if (!("SelectMenu" == pages.name)) {
          console.info("get SelectMenu state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push SelectMenu page error " + JSON.stringify(err));
      }
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest1');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0100]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest2');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0200]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Center");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0300
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0300
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest3');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0300]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.End");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0400
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0400
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest4');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0400]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(10);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(10);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0500
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0500
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest5');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0500]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Center");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(-10);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0600
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0600
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0600 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest6');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0600]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.End");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(-20);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(-50);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0700
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0700
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0700 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest7');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0700]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.End");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0800
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0800
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0800 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest8');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0800]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0900
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0900
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0900 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest9');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0900]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1000 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest10');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1000]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest11');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1100]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest12');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1200]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.End");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest13');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1300]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest14');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1400]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Center");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(-5);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(-5);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    
    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_1500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest15');

          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_1500]:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual("MenuAlignType.Start");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dX')).assertEqual(0);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menuAlign')
            .getElement('offset').getInteger('dY')).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_1500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
