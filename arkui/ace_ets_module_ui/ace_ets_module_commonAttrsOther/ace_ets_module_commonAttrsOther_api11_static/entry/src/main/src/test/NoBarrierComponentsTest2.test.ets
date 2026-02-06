'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from './Util.test';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();

export default function noBarrierComponentsTest() {
  describe('noBarrierComponentsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("noBarrierComponentsTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("noBarrierComponentsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/noBarrierComponents',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get noBarrierComponentsTest state pages:" + JSON.stringify(pages));
        if (!("noBarrierComponents" == pages.name)) {
          console.info("get noBarrierComponentsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push noBarrierComponentsTest page error:" + err);
      }
      console.info("noBarrierComponentsTest beforeEach end");
    });


    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll(async (): Promise<void> => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(() => {
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
/**
     * @tc.number   noBarrierComponents_static_001
     * @tc.name     noBarrierComponents_static_001
     * @tc.desc     noBarrierComponents_static_001
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents001 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign1");
          await CommonFunc.sleep(2000);
          console.info('noBarrierComponents001 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_002
     * @tc.name     noBarrierComponents_static_002
     * @tc.desc     noBarrierComponents_static_002
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents002 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign2");
          await CommonFunc.sleep(2000);
          console.info('noBarrierComponents002 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_003
     * @tc.name     noBarrierComponents_static_003
     * @tc.desc     noBarrierComponents_static_003
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents003 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign3");
          await CommonFunc.sleep(2000);
          console.info('noBarrierComponents003 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_004
     * @tc.name     noBarrierComponents_static_004
     * @tc.desc     noBarrierComponents_static_004
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents004 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("list");
          await CommonFunc.sleep(2000);
          console.info('noBarrierComponents004 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("List");
          console.info('noBarrierComponents004 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents004 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_005
     * @tc.name     noBarrierComponents_static_005
     * @tc.desc     noBarrierComponents_static_005
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents005 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Grid");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Grid");
          console.info('noBarrierComponents005 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents005 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_006
     * @tc.name     noBarrierComponents_static_006
     * @tc.desc     noBarrierComponents_static_006
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("AlphabetIndexer");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Stack");
          console.info('noBarrierComponents006 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents006 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_007
     * @tc.name     noBarrierComponents_static_007
     * @tc.desc     noBarrierComponents_static_007
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Blank");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarrierComponents007 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents007 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_008
     * @tc.name     noBarrierComponents_static_008
     * @tc.desc     noBarrierComponents_static_008
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents008 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Button");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Button");
          console.info('noBarrierComponents008 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents008 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_010
     * @tc.name     noBarrierComponents_static_010
     * @tc.desc     noBarrierComponents_static_010
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents010 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Checkbox");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Checkbox");
          console.info('noBarrierComponents010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_011
     * @tc.name     noBarrierComponents_static_011
     * @tc.desc     noBarrierComponents_static_011
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("DataPanel");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("DataPanel");
          console.info('noBarrierComponents011 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents011 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_012
     * @tc.name     noBarrierComponents_static_012
     * @tc.desc     noBarrierComponents_static_012
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("DatePicker");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("DatePicker");
          console.info('noBarrierComponents012 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents012 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_013
     * @tc.name     noBarrierComponents_static_013
     * @tc.desc     noBarrierComponents_static_013
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents013 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("FormComponent");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("FormComponent");
          console.info('noBarrierComponents013 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents013 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_014
     * @tc.name     noBarrierComponents_static_014
     * @tc.desc     noBarrierComponents_static_014
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents014 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Divider");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Divider");
          console.info('noBarrierComponents014 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents014 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_015
     * @tc.name     noBarrierComponents_static_015
     * @tc.desc     noBarrierComponents_static_015
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents015 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Gauge");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Gauge");
          console.info('noBarrierComponents015 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents015 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_016
     * @tc.name     noBarrierComponents_static_016
     * @tc.desc     noBarrierComponents_static_016
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents016 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Image");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Image");
          console.info('noBarrierComponents016 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents016 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_017
     * @tc.name     noBarrierComponents_static_017
     * @tc.desc     noBarrierComponents_static_017
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents017 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Marquee");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Marquee");
          console.info('noBarrierComponents017 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents017 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_018
     * @tc.name     noBarrierComponents_static_018
     * @tc.desc     noBarrierComponents_static_018
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents018 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("PatternLock");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("PatternLock");
          console.info('noBarrierComponents018 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents018 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_019
     * @tc.name     noBarrierComponents_static_019
     * @tc.desc     noBarrierComponents_static_019
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents019 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Progress");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Progress");
          console.info('noBarrierComponents019 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents019 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_009
     * @tc.name     noBarrierComponents_static_009
     * @tc.desc     noBarrierComponents_static_009
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents009 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("QRCode");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("QRCode");
          console.info('noBarrierComponents009 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents009 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_020
     * @tc.name     noBarrierComponents_static_020
     * @tc.desc     noBarrierComponents_static_020
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents020 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Radio");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Radio");
          console.info('noBarrierComponents020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents020 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_021
     * @tc.name     noBarrierComponents_static_021
     * @tc.desc     noBarrierComponents_static_021
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents021 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Rating");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Rating");
          console.info('noBarrierComponents021 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents021 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    
/**
     * @tc.number   noBarrierComponents_static_023
     * @tc.name     noBarrierComponents_static_023
     * @tc.desc     noBarrierComponents_static_023
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents023 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("RichText");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Web");
          console.info('noBarrierComponents023 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents023 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_024
     * @tc.name     noBarrierComponents_static_024
     * @tc.desc     noBarrierComponents_static_024
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents024 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Search");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Search");
          console.info('noBarrierComponents024 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents024 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_026
     * @tc.name     noBarrierComponents_static_026
     * @tc.desc     noBarrierComponents_static_026
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents026 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Slider");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Slider");
          console.info('noBarrierComponents026 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents026 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_027
     * @tc.name     noBarrierComponents_static_027
     * @tc.desc     noBarrierComponents_static_027
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_027', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents027 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Toggle");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Toggle");
          console.info('noBarrierComponents027 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents027 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_028
     * @tc.name     noBarrierComponents_static_028
     * @tc.desc     noBarrierComponents_static_028
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_028', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents028 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("TimePicker");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("TimePicker");
          console.info('noBarrierComponents028 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents028 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
    
/**
     * @tc.number   noBarrierComponents_static_030
     * @tc.name     noBarrierComponents_static_030
     * @tc.desc     noBarrierComponents_static_030
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents_static_030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents030 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("XComponent");
          await CommonFunc.sleep(2000);
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("XComponent");
          console.info('noBarrierComponents030 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
  })
}