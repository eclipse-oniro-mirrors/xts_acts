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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function selectmenuTest() {
  describe('ActsSelectMenuTest', () => {
    beforeAll(() => {
      console.info("ActsSelectMenuTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/SelectMenu",
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectMenu state pages:" + JSON.stringify(pages));
        if (!("SelectMenu" == pages.name)) {
          console.info("get SelectMenu pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SelectMenu page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectMenu page error " + JSON.stringify(err));
      }
      // done()
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0100 start");
      // setTimeout(() => {
      //   try {
      let strJson = inspector.getInspectorByKey('selectTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0100]:" +
      JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
      expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
        .assertEqual("MenuAlignType.Start");
      done();
      //   } catch (err) {
      //     expect().assertFail();
      //     console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0100 ERR ' + JSON.stringify(err));
      //     done();
      //   }
      // }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest2');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0200]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Center");
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest3');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0300]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.End");
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest4');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0400]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(10);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(10);
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest5');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0500]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Center");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(-10);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0600 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest6');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0600]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.End");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(-20);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(-50);
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0700 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest7');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0700]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.End");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0800 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest8');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0800]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
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
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_0900 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest9');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_0900]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1000
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1000
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1000 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest10');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1000]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1100
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1100
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest11');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1100]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1200
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1200
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest12');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1200]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.End");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1300
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1300
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest13');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1300]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1400
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1400
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest14');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1400]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Center");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(-5);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(-5);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUXII_Stage_Select_Menu_MenuAlign_static_1500
     * @tc.name     ArkUXII_Stage_Select_Menu_MenuAlign_static_1500
     * @tc.desc     ArkUXII_Stage_Select_Menu_MenuAlign_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_Select_Menu_MenuAlign_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_Select_Menu_MenuAlign_static_1500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('selectTest15');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_Select_Menu_MenuAlign_static_1500]:" +
          JSON.stringify(obj.getElement('$attrs').getElement('menuAlign')));
          expect(obj.getElement('$attrs').getElement('menuAlign').getString("alignType"))
            .assertEqual("MenuAlignType.Start");
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dX'))
            .assertEqual(0);
          expect(obj.getElement('$attrs').getElement('menuAlign').getElement('offset').getInteger('dY'))
            .assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_Select_Menu_MenuAlign_static_1500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
