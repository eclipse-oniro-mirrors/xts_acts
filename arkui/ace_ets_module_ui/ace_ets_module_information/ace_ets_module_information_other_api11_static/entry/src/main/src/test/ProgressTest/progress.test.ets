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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function progressTest() {
  describe('ActsProgressTest', () => {
    beforeAll(() => {
      console.info("progressTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.other.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("progressTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/Progress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progressTest state success " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get progressTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push progressTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("progressTest after each called");
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0100
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0100
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0100 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0200
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0200
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0200 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0200 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0300
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0300
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0300 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0300 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Progress_updateColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0300', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0400
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0400
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0400 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0400 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0500
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0500
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0500 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0500 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0600
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0600
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0600 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0700
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0700
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0700 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0700 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0800
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0800
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0800 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0800 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#CC006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0800', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_0900
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_0900
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_0900 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_0900 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


//     /**
//      * @tc.number   ArkUX_Stage_Progress_updateColor_static_1000
//      * @tc.name     ArkUX_Stage_Progress_updateColor_static_1000
//      * @tc.desc     ArkUX_Stage_Progress_updateColor_static_1000
//      * @tc.level    Level.LEVEL0
//      */
// it('ArkUX_Stage_Progress_updateColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('ArkUX_Stage_Progress_updateColor_1000 START');
//       setTimeout(async () => {
//         try {
//           let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
//           let obj_default = JSON.parseJsonElement(strJson_default);
//           let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
//           console.info('ArkUX_Stage_Progress_updateColor_1000 START  :' + JSON.stringify(strJson));
//           let obj = JSON.parseJsonElement(strJson);
//           console.info("ArkUX_Stage_Progress_updateColor_1000 component obj is: " + JSON.stringify(obj));
//           console.info("ArkUX_Stage_Progress_updateColor_1000 component obj.$attrs is: " +
//           JSON.stringify(obj.getElement('$attrs')));
//           console.info("ArkUX_Stage_Progress_updateColor_1000 component obj.$attrs.updateColor is: " +
//           JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
//           expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
//           console.info('ArkUX_Stage_Progress_updateColor_1000 END ');
//         } catch (err) {
//           expect().assertFail();
//           console.info('ArkUX_Stage_Progress_updateColor_1000 ERR  ' + JSON.stringify(err));
//         }
//         done();
//       }, 3000)
//       setTimeout(async () => {
//         let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1000', 10, '')
//         expect(result).assertEqual(true);
//       }, 1000)
//     });
//
//
//     /**
//      * @tc.number   ArkUX_Stage_Progress_updateColor_static_1300
//      * @tc.name     ArkUX_Stage_Progress_updateColor_static_1300
//      * @tc.desc     ArkUX_Stage_Progress_updateColor_static_1300
//      * @tc.level    Level.LEVEL0
//      */
// it('ArkUX_Stage_Progress_updateColor_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('ArkUX_Stage_Progress_updateColor_1300 START');
//       setTimeout(async () => {
//         try {
//           let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
//           let obj_default = JSON.parseJsonElement(strJson_default);
//           let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
//           console.info('ArkUX_Stage_Progress_updateColor_1300 START  :' + JSON.stringify(strJson));
//           let obj = JSON.parseJsonElement(strJson);
//           console.info("ArkUX_Stage_Progress_updateColor_1300 component obj is: " + JSON.stringify(obj));
//           console.info("ArkUX_Stage_Progress_updateColor_1300 component obj.$attrs is: " +
//           JSON.stringify(obj.getElement('$attrs')));
//           console.info("ArkUX_Stage_Progress_updateColor_1300 component obj.$attrs.updateColor is: " +
//           JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
//           expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
//           console.info('ArkUX_Stage_Progress_updateColor_1300 END ');
//         } catch (err) {
//           expect().assertFail();
//           console.info('ArkUX_Stage_Progress_updateColor_1300 ERR  ' + JSON.stringify(err));
//         }
//         done();
//       }, 3000)
//       setTimeout(async () => {
//         let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1300', 10, '')
//         expect(result).assertEqual(true);
//       }, 1000)
//     });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_1400
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_1400
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_1400 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_1400 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });



    /**
     * @tc.number   ArkUX_Stage_Progress_updateColor_static_1600
     * @tc.name     ArkUX_Stage_Progress_updateColor_static_1600
     * @tc.desc     ArkUX_Stage_Progress_updateColor_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateColor_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_1600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_1600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_1600 component obj.$attrs.updateColor is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_1600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_1600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0100
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0100
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0100 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0200
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0200
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0200 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0200 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0500
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0500
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0500 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0500 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0600
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0600
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0600 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0700
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0700
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0700 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0700 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_0900
     * @tc.name     ArkUX_Stage_Progress_updateProgress_0900
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_0900 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_0900 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(1);
          console.info('ArkUX_Stage_Progress_updateProgress_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_1000
     * @tc.name     ArkUX_Stage_Progress_updateProgress_1000
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_1000 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_1000 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1000', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Stage_Progress_updateProgress_1100
     * @tc.name     ArkUX_Stage_Progress_updateProgress_1100
     * @tc.desc     ArkUX_Stage_Progress_updateProgress_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Progress_updateProgress_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_1100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_1100 component obj.$attrs.updateProgress is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });
  })
}