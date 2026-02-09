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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function badgeTest() {
  describe('ActsBadgeTest', () => {
    beforeAll(() => {
      console.info("ActsBadgeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Badge/BadgeIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get badgeTest state success " + JSON.stringify(pages));
        if (!("BadgeIndex" == pages.name)) {
          console.info("get badgeTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push badgeTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("badgeTest beforeEach start");
    })

    
    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0100
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0100
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0100');
          console.info('ArkUX_Stage_Badge_FontWeight_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0200
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0200
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0200');
          console.info('ArkUX_Stage_Badge_FontWeight_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g"), "")).assertEqual("400");
          console.info('ArkUX_Stage_Badge_FontWeight_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0300
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0300
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0300 START');
      setTimeout(() => {
        let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0300');
        console.info('ArkUX_Stage_Badge_FontWeight_0300 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj is: " + JSON.stringify(obj));
        console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
        console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj.$attrs.style is: " +
        JSON.stringify(obj.getElement('$attrs').getString('style')));
        let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
        expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("100");
        console.info('ArkUX_Stage_Badge_FontWeight_0300 END ');
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0400
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0400
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0400');
          console.info('ArkUX_Stage_Badge_FontWeight_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("800");
          console.info('ArkUX_Stage_Badge_FontWeight_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0500
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0500
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0500');
          console.info('ArkUX_Stage_Badge_FontWeight_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("200");
          console.info('ArkUX_Stage_Badge_FontWeight_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0600
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0600
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0600');
          console.info('ArkUX_Stage_Badge_FontWeight_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("900");
          console.info('ArkUX_Stage_Badge_FontWeight_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0700
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0700
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0700');
          console.info('ArkUX_Stage_Badge_FontWeight_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Badge_FontWeight_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0800
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0800
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0800');
          console.info('ArkUX_Stage_Badge_FontWeight_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_0900
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_0900
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0900');
          console.info('ArkUX_Stage_Badge_FontWeight_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1000
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1000
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1000');
          console.info('ArkUX_Stage_Badge_FontWeight_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1100
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1100
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1100');
          console.info('ArkUX_Stage_Badge_FontWeight_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1200
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1200
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1200');
          console.info('ArkUX_Stage_Badge_FontWeight_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1300
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1300
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1300');
          console.info('ArkUX_Stage_Badge_FontWeight_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1400
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1400
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1400');
          console.info('ArkUX_Stage_Badge_FontWeight_1400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("500");
          console.info('ArkUX_Stage_Badge_FontWeight_1400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1500
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1500
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1500');
          console.info('ArkUX_Stage_Badge_FontWeight_1500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_FontWeight_static_1600
     * @tc.name     ArkUX_Stage_Badge_FontWeight_static_1600
     * @tc.desc     ArkUX_Stage_Badge_FontWeight_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_FontWeight_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_1600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1600');
          console.info('ArkUX_Stage_Badge_FontWeight_1600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g") ,"")).assertEqual("600");
          console.info('ArkUX_Stage_Badge_FontWeight_1600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0100
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0100
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0100');
          console.info('ArkUX_Stage_Badge_BorderColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_Badge_BorderColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0200
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0200
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0200');
          console.info('ArkUX_Stage_Badge_BorderColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0300
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0300
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0300');
          console.info('ArkUX_Stage_Badge_BorderColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Badge_BorderColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0400
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0400
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0400');
          console.info('ArkUX_Stage_Badge_BorderColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Badge_BorderColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0500
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0500
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0500');
          console.info('ArkUX_Stage_Badge_BorderColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0600
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0600
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0600');
          console.info('ArkUX_Stage_Badge_BorderColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0700
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0700
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0700');
          console.info('ArkUX_Stage_Badge_BorderColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0800
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0800
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0800');
          console.info('ArkUX_Stage_Badge_BorderColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_0900
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_0900
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0900');
          console.info('ArkUX_Stage_Badge_BorderColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Badge_BorderColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_1000
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_1000
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1000');
          console.info('ArkUX_Stage_Badge_BorderColor_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_1100
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_1100
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1100');
          console.info('ArkUX_Stage_Badge_BorderColor_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderColor_static_1200
     * @tc.name     ArkUX_Stage_Badge_BorderColor_static_1200
     * @tc.desc     ArkUX_Stage_Badge_BorderColor_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderColor_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1200');
          console.info('ArkUX_Stage_Badge_BorderColor_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderColor')).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_Badge_BorderColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0100
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0100
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0100');
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("5.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0200
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0200
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0200');
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("5.00px");
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0300
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0300
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0300');
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("7.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0400
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0400
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0400');
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0500
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0500
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0500');
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0600
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0600
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0600');
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0700
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0700
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0700');
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component style.getString('borderWidth') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("7.00fp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0800
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0800
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0800');
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj.getElement('$attrs').getString('style') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_0900
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_0900
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0900');
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_1000
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_1000
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1000');
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("5.00lpx");
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_1100
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_1100
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1100');
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_1200
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_1200
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1200');
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("5.00vp");
          expect(style.getString('fontWeight').replace(new RegExp("[^\\d]", "g")  ,"")).assertEqual("600");
          expect(style.getString('borderColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Badge_BorderWidth_static_1300
     * @tc.name     ArkUX_Stage_Badge_BorderWidth_static_1300
     * @tc.desc     ArkUX_Stage_Badge_BorderWidth_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Badge_BorderWidth_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1300');
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj.$attrs.style is: " +
          JSON.stringify(obj.getElement('$attrs').getString('style')));
          let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
          expect(style.getString('borderWidth')).assertEqual("1.00vp");
          expect(style.getString('fontWeight')).assertEqual("FontWeight.Normal");
          expect(style.getString('borderColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}