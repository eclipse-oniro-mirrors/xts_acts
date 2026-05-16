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
import events_emitter from '@ohos.events.emitter';
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


export default function sliderTest() {
  describe('ActsAbilityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TimePickerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/Index',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sliderTest state pages:" + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get sliderTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sliderTest page error: " + err);
        expect().assertFail();
      }
    });




    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0200
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0200
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0300
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0300
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0400
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0400
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0500
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0500
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done()
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0600
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0600
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0600 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0700
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0700
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0700 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0800
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0800
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0800 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0900
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0900
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0900 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_1000
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_1000
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1000 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_1100
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_1100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_1200
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_1200
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_1300
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_1300
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0200
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0200
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("5.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0300
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0300
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("7.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0400
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0400
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(parseFloat(obj.getElement('$attrs').getString('blockBorderWidth'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0500
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0500
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0600
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0600
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0600 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0700
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0700
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0700 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0800
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0800
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0800 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })





    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0900
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0900
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0900 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_1000
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_1000
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_1000 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("7.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_1100
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_1100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(parseFloat(obj.getElement('$attrs').getString('blockBorderWidth'))).assertEqual(0);
          expect(obj.getElement('$attrs').getString('blockBorderWidth').substr(obj.getElement('$attrs').getString('blockBorderWidth').length-2, 2)).assertEqual("px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_1200
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_1200
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_1200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(parseFloat(obj.getElement('$attrs').getString('blockBorderWidth'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_1300
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_1300
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_1300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0200
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0200
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0300
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0300
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0400
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0400
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0500
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0500
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 opacity is" + objSample.getElement('$attrs').getDouble('opacity'));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 is",1111)
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 is",2222)
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          console.info("----ArkUX_Stage_Slider_stepColor_static_0500 is",33333)
          done()
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0600
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0600
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0600 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0700
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0700
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0700 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Slider_stepColor_static_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0800
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0800
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0800 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0800 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_0800 is" + JSON.stringify(objSample.getElement('$attrs').getDouble('opacity')));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0900
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0900
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0900 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0900 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_0900 is" + JSON.stringify(objSample.getElement('$attrs').getDouble('opacity')));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_1000
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_1000
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1000 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1000 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_1000 is" + JSON.stringify(objSample.getElement('$attrs').getDouble('opacity')));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_1100
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_1100
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1100 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_1100 is" + JSON.stringify(objSample.getElement('$attrs').getDouble('opacity')));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })





    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_1200
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_1200
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1200 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_1300
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_1300
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepColor_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1300 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          let strJsonSample = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha');
          let objSample = JSON.parseJsonElement(strJsonSample);
          console.info("----ArkUX_Stage_Slider_stepColor_static_1300 is" + JSON.stringify(objSample.getElement('$attrs').getString('backgroundColor')));
          console.info("----ArkUX_Stage_Slider_stepColor_static_1300 is" + JSON.stringify(objSample.getElement('$attrs').getDouble('opacity')));
          let opacity= Math.floor(Number((parseInt(((objSample.getElement('$attrs').getString('backgroundColor')).substring(1, 3)), 16)*
          (objSample.getElement('$attrs').getDouble('opacity'))).toString(16)))
          expect(opacity.toString()).assertEqual((obj.getElement('$attrs').getString('stepColor')).substring(1, 3));
          expect((obj.getElement('$attrs').getString('stepColor')).substr((obj.getElement('$attrs').getString('stepColor')).length-4, 4)).
          assertEqual((objSample.getElement('$attrs').getString('backgroundColor')).substr((objSample.getElement('$attrs').getString('backgroundColor')).length-4, 4));
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0100] START');
      setTimeout(() => {
        let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0100');
        let obj = JSON.parseJsonElement(strJson);
        console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
        expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("0.00vp");
        done();
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0200
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0200
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0300
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0300
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("60.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0400
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0400
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("120.00%");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0500
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0500
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("50.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0600
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0600
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0600 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0700
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0700
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0700 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0800
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0800
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0800 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0900
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0900
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0900 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_1000
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_1000
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_1000 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_1100
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_1100
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("40.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_1200
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_1200
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_1200 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })


    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_1300
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_1300
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_1300 is" + JSON.stringify(obj.getElement('$attrs').tryGetElement('trackBorderRadius')));
          expect(obj.getElement('$attrs').tryGetElement('trackBorderRadius')).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_1400
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_1400
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_1400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_1400 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0100  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width') ;
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height') ;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0200
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0200
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0200  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(5);
          expect(parseFloat(height)).assertEqual(5);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0300
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0300
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0300  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(15);
          expect(parseFloat(height)).assertEqual(20);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0400
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0400
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0400  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0500
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0500
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0500  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(20);
          expect(parseFloat(height)).assertEqual(20);
          expect(width.substr(width.length-2, 2)).assertEqual("px");
          expect(height.substr(height.length-2, 2)).assertEqual("px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0600
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0600
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0600  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(120);
          expect(parseFloat(height)).assertEqual(120);
          expect(width.substr(width.length-1, 1)).assertEqual("%");
          expect(height.substr(height.length-1, 1)).assertEqual("%");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0700
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0700
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0700  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(50);
          expect(parseFloat(height)).assertEqual(50);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0800
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0800
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0800  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0900
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0900
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0900  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1000
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1000
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1000  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1100
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1100
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1100  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1200
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1200
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1200  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1300
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1300
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1300  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1400
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1400
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1400] START');
      setTimeout(() => {
        try {
          let obj = JSON.parseJsonElement(inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1400'));
          console.info("----ArkUX_Stage_Slider_blockSize_static_1400  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          obj = JSON.parseJsonElement(inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSizeOutSet_1400'));
          console.info("----ArkUX_Stage_Slider_blockSizeOutSet_1400  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          width = obj.getElement('$attrs').getElement('blockSize').getString('width') ;
          height = obj.getElement('$attrs').getElement('blockSize').getString('height') ;
          expect(parseFloat(width)).assertEqual(16);
          expect(parseFloat(height)).assertEqual(16);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1500
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1500
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1500  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(20);
          expect(parseFloat(height)).assertEqual(25);
          expect(width.substr(width.length-2, 2)).assertEqual("fp");
          expect(height.substr(height.length-2, 2)).assertEqual("fp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1600
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1600
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1600  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1700
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1700
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1700  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_1800
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_1800
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockSize_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_1800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_1800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_1800  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(20);
          expect(parseFloat(height)).assertEqual(20);
          expect(width.substr(width.length-3, 3)).assertEqual("lpx");
          expect(height.substr(height.length-3, 3)).assertEqual("lpx");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_1800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0200
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0200
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0300
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0300
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("60.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0400
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0400
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("120.00%");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0500
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0500
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("50.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0600
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0600
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0600 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(parseFloat(obj.getElement('$attrs').getString('stepSize'))).assertEqual(4);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0700
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0700
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0700 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0800
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0800
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0800 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0900
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0900
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0900 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_1000
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_1000
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_1000 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_1100
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_1100
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("40.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_1200
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_1200
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_1200 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(parseFloat(obj.getElement('$attrs').getString('stepSize'))).assertEqual(4);
          expect(obj.getElement('$attrs').getString('stepSize').substr(obj.getElement('$attrs').getString('stepSize').length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_1300
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_1300
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_1300 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(parseFloat(obj.getElement('$attrs').getString('stepSize'))).assertEqual(4);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_1400
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_1400
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_stepSize_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_1400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_1400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_1400 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_static_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0200
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0200
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0300
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0300
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.IMAGE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0400
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0400
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0400 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0500
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0500
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0500] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0500 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0600
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0600
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0600] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0600 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0600  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0700
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0700
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0700] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0700 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0700  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0800
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0800
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0800] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0800 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0800  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0900
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0900
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0900] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0900 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0900  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_1000
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_1000
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_1000 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_1000  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_1100
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_1100
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_1100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_1200
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_1200
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_1200 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_1200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_1300
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_1300
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_1300 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_1400
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_1400
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_blockStyle_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_1400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_1400 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_Test_static_0100
     * @tc.name     ArkUX_Stage_Slider_Test_static_0100
     * @tc.desc     ArkUX_Stage_Slider_Test_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_Test_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_Test_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_Test_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("-->ArkUX_Stage_Slider_Test_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("-->ArkUX_Stage_Slider_Test_static_0100 obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 blockSize is" + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 blockBorderColor is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 blockBorderWidth is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 stepColor is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 trackBorderRadius is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          console.info("----ArkUX_Stage_Slider_Test_static_0100 stepSize is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width');
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height');
          expect(parseFloat(width)).assertEqual(10);
          expect(parseFloat(height)).assertEqual(10);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("10.00vp")
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFC709E9")
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFF10202")
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("15.00vp")
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("10.00vp")
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_Test_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_sliderInteractionMode_static_1000
     * @tc.name     ArkUX_Stage_Slider_sliderInteractionMode_static_1000
     * @tc.desc     ArkUX_Stage_Slider_sliderInteractionMode_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_sliderInteractionMode_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_static_1000] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_static_1000 is " + JSON.stringify(obj.getElement('$attrs').getString('sliderInteractionMode')));
          expect(obj.getElement('$attrs').getString('sliderInteractionMode')).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_static_1000  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_sliderInteractionMode_static_1102
     * @tc.name     ArkUX_Stage_Slider_sliderInteractionMode_static_1102
     * @tc.desc     ArkUX_Stage_Slider_sliderInteractionMode_static_1102
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_sliderInteractionMode_static_1102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_static_1102] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1102');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_static_1102 is " + JSON.stringify(obj.getElement('$attrs').getString('sliderInteractionMode')));
          expect(obj.getElement('$attrs').getString('sliderInteractionMode')).assertEqual("SliderInteraction.SLIDE_ONLY");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_static_1102  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_sliderInteractionMode_static_1103
     * @tc.name     ArkUX_Stage_Slider_sliderInteractionMode_static_1103
     * @tc.desc     ArkUX_Stage_Slider_sliderInteractionMode_static_1103
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_sliderInteractionMode_static_1103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_static_1103] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1103');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_static_1103 is " + JSON.stringify(obj.getElement('$attrs').getString('sliderInteractionMode')));
          expect(obj.getElement('$attrs').getString('sliderInteractionMode')).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_static_1103  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })






    
    /**
     * @tc.number   ArkUX_Stage_Slider_sliderInteractionMode_static_1300
     * @tc.name     ArkUX_Stage_Slider_sliderInteractionMode_static_1300
     * @tc.desc     ArkUX_Stage_Slider_sliderInteractionMode_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_sliderInteractionMode_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_static_1300 is " + JSON.stringify(obj.getElement('$attrs').getString('sliderInteractionMode')));
          expect(obj.getElement('$attrs').getString('sliderInteractionMode')).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_static_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_sliderInteractionMode_static_1400
     * @tc.name     ArkUX_Stage_Slider_sliderInteractionMode_static_1400
     * @tc.desc     ArkUX_Stage_Slider_sliderInteractionMode_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_sliderInteractionMode_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_sliderInteractionMode_static_1400] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_sliderInteractionMode_static_1400 is " + JSON.stringify(obj.getElement('$attrs').getString('sliderInteractionMode')));
          expect(obj.getElement('$attrs').getString('sliderInteractionMode')).assertEqual("SliderInteraction.SLIDE_AND_CLICK");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_sliderInteractionMode_static_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100
     * @tc.name     ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100
     * @tc.desc     ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_sliderInteractionMode_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100 is " + JSON.stringify(obj.getElement('$attrs').getString('minResponsiveDistance')));
          expect(Number(obj.getElement('$attrs').getString('minResponsiveDistance'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_static_def_static_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_minResponsiveDistance_static_1100
     * @tc.name     ArkUX_Stage_Slider_minResponsiveDistance_static_1100
     * @tc.desc     ArkUX_Stage_Slider_minResponsiveDistance_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_minResponsiveDistance_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_static_1100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_static_1100 is " + JSON.stringify(obj.getElement('$attrs').getString('minResponsiveDistance')));
          expect(Number(obj.getElement('$attrs').getString('minResponsiveDistance'))).assertEqual(10);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_static_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_minResponsiveDistance_static_1101
     * @tc.name     ArkUX_Stage_Slider_minResponsiveDistance_static_1101
     * @tc.desc     ArkUX_Stage_Slider_minResponsiveDistance_static_1101
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_minResponsiveDistance_static_1101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_static_1101] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1101');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_static_1101 is " + JSON.stringify(obj.getElement('$attrs').getString('minResponsiveDistance')));
          expect(Number(obj.getElement('$attrs').getString('minResponsiveDistance'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_static_1101  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_minResponsiveDistance_static_1200
     * @tc.name     ArkUX_Stage_Slider_minResponsiveDistance_static_1200
     * @tc.desc     ArkUX_Stage_Slider_minResponsiveDistance_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_minResponsiveDistance_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_static_1200] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_static_1200 is " + JSON.stringify(obj.getElement('$attrs').getString('minResponsiveDistance')));
          expect(Number(obj.getElement('$attrs').getString('minResponsiveDistance'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_static_1200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })




    
    /**
     * @tc.number   ArkUX_Stage_Slider_minResponsiveDistance_static_1300
     * @tc.name     ArkUX_Stage_Slider_minResponsiveDistance_static_1300
     * @tc.desc     ArkUX_Stage_Slider_minResponsiveDistance_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Slider_minResponsiveDistance_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_minResponsiveDistance_static_1300] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_minResponsiveDistance_1300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_minResponsiveDistance_static_1300 is " + JSON.stringify(obj.getElement('$attrs').getString('minResponsiveDistance')));
          expect(Number(obj.getElement('$attrs').getString('minResponsiveDistance'))).assertEqual(0);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_minResponsiveDistance_static_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

  })
}
