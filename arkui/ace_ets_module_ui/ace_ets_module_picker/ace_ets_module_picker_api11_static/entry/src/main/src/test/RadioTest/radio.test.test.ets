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

let emitKey = "emitUserAgent";

export default function radioTest() {
  describe('ActsRadioTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ActsRadioTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/Radio',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsRadioTest state pages:" + JSON.stringify(pages));
        if (!("Radio" == pages.name)) {
          console.info("get ActsRadioTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ActsRadioTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ActsRadioTest after each called");
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0100
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0100
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0100');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0200
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0200
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0200');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0300
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0300
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0300');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0400
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0400
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0400');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FF008000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0500
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0500
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0500');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FFA67D3D");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0600
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0600
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0600');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0700
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0700
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0700');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0800
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0800
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0800');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_0900
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_0900
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0900');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_1000
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_1000
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1000');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_1100
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_1100
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1100');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_CheckedBackgroundColor_1200
     * @tc.name     ArkUX_Stage_Radio_CheckedBackgroundColor_1200
     * @tc.desc     ArkUX_Stage_Radio_CheckedBackgroundColor_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_CheckedBackgroundColor_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1200');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0100
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0100
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0100');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0200
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0200
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0200');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0300
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0300
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0300');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0400
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0400
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0400');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FF0000FF");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0500
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0500
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0500');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0600
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0600
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0600');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0700
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0700
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0700');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FFFFA500");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0800
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0800
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0800');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_0900
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_0900
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0900');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_1000
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_1000
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1000');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_1100
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_1100
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1100');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_UncheckedBorderColor_1200
     * @tc.name     ArkUX_Stage_Radio_UncheckedBorderColor_1200
     * @tc.desc     ArkUX_Stage_Radio_UncheckedBorderColor_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_UncheckedBorderColor_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1200');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0100
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0100
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0100');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FF00FFFF");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0200
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0200
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0200');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0300
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0300
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0300');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FFFF6100");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0400
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0400
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0400');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0500
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0500
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0500');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0600
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0600
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0600');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0600 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0700
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0700
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0700');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FFFFA500");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0800
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0800
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0800');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_0900
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_0900
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0900');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_1000
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_1000
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1000');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_1100
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_1100
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1100');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_IndicatorColor_1200
     * @tc.name     ArkUX_Stage_Radio_IndicatorColor_1200
     * @tc.desc     ArkUX_Stage_Radio_IndicatorColor_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_IndicatorColor_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1200');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_Color_0100
     * @tc.name     ArkUX_Stage_Radio_Color_0100
     * @tc.desc     ArkUX_Stage_Radio_Color_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_Color_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_Color_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_Color_0100');
          console.info('ArkUX_Stage_Radio_Color_0100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_Color_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_Color_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_Color_0100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_Color_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual("#FFFF0000");
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual("#FFDB70DB");
          expect(radioStyle.getString('indicatorColor')).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_Color_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_Color_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Radio_0100
     * @tc.name     ArkUX_Stage_Radio_0100
     * @tc.desc     ArkUX_Stage_Radio_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Radio_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Radio_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Radio_0100');
          console.info('ArkUX_Stage_Radio_0100 START :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Radio_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Radio_0100 component obj.getElement('$attrs').getString('radioStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('radioStyle')));
          let radioStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle'));
          console.info("ArkUX_Stage_Radio_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.getString('checkedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          expect(radioStyle.getString('uncheckedBorderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          expect(radioStyle.getString('indicatorColor')).assertEqual(obj.getElement('$attrs').getString('foregroundColor'));
          console.info('ArkUX_Stage_Radio_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
