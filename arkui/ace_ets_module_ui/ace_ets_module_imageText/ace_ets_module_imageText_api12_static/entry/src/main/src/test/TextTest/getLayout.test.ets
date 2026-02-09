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
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function getLayout() {
  describe('getLayout', () => {
    beforeAll(() => {
      console.info("getLayout beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("getLayout beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/getLayout",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getLayout state pages:" + JSON.stringify(pages));
        if (!("getLayout" == pages.name)) {
          console.info("get getLayout pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getLayout page error:" + err);
      }
      console.info("getLayout beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getLayout after each called");
    });

    

    /**
     * @tc.number   getLayout_static_001
     * @tc.name     getLayout_static_001
     * @tc.desc     getLayout_static_001
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout1');
      console.info('[getLayout_001] strJson');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);

      console.info("[getLayout_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_001] END');
      done();
    });

    /**
     * @tc.number   getLayout_static_002
     * @tc.name     getLayout_static_002
     * @tc.desc     getLayout_static_002
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getLayout_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_002] END');
      done();
    });

    /**
     * @tc.number   getLayout_static_003
     * @tc.name     getLayout_static_003
     * @tc.desc     getLayout_static_003
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getLayout_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_003] END');
      done();
    });

    /**
     * @tc.number   getLayout_static_004
     * @tc.name     getLayout_static_004
     * @tc.desc     getLayout_static_004
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_004] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getLayout_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_004] END');
      done();
    });

    /**
     * @tc.number   getLayout_static_005
     * @tc.name     getLayout_static_005
     * @tc.desc     getLayout_static_005
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_005] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout5');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getLayout_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_005] END');
      done();
    });

    /**
     * @tc.number   getLayout_static_006
     * @tc.name     getLayout_static_006
     * @tc.desc     getLayout_static_006
     * @tc.level   Level.LEVEL0
     */
    it('getLayout_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getLayout_006] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getLayout6');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getLayout_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[getLayout_006] END');
      done();
    });

  })
}
