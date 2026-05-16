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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}
export default function checkBoxGroupTest() {
  describe('ActsCheckBoxGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/checkboxGroup/CheckBoxGroup1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckBoxGroup state pages:" + JSON.stringify(pages));
        if (!("CheckBoxGroup1" == pages.name)) {
          console.info("get CheckBoxGroup pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CheckBoxGroup page error " + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    

    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200
     * @tc.name     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 component obj.getElement('$attrs').getString('unselectedColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 component obj.getElement('$attrs').strokeColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          expect(markObj.getString('strokeColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("10.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("60.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("50.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("40.00fp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("10.00lpx");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('size')).assertEqual("-1.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkSize_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("1.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("60.00px");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("50.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("5.00fp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("40.00lpx");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(markObj.getString('strokeWidth')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component markObj.getString('strokeColor') is: " +
          JSON.stringify(markObj.getString('strokeColor')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 component markObj.getString('size') is: " +
          JSON.stringify(markObj.getString('size')));
          expect(markObj.getString('strokeWidth')).assertEqual("40.00vp");
          expect(markObj.getString('strokeColor')).assertEqual("#FF00FF00");
          expect(markObj.getString('size')).assertEqual("40.00vp");
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('checkboxNO');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 component markObj.getString('strokeWidth') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('unselectedColor')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 component obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('mark')));
          let markObj = JSON.parseJsonElement(obj.getElement('$attrs').getString('mark'));
          expect(markObj.getString('strokeWidth')).assertEqual("2.00vp");
          expect(markObj.getString('size')).assertEqual("0.00vp");
          expect(markObj.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          let strJsonGroup = inspector.getInspectorByKey('checkboxGroupNO');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 strJsonGroup  :' + JSON.stringify(strJsonGroup));
          let objGroup = JSON.parseJsonElement(strJsonGroup);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 objGroup markObj.getString('strokeWidth') is: " +
          JSON.stringify(objGroup.getElement('$attrs').getString('unselectedColor')));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 objGroup obj.getElement('$attrs').getString('mark') is: " +
          JSON.stringify(objGroup.getElement('$attrs').getString('mark')));
          let markObjGroup = JSON.parseJsonElement(objGroup.getElement('$attrs').getString('mark'));
          expect(markObjGroup.getString('strokeWidth')).assertEqual("2.00vp");
          expect(markObjGroup.getString('size')).assertEqual("0.00vp");
          expect(markObjGroup.getString('strokeColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          expect(objGroup.getElement('$attrs').getString('unselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
