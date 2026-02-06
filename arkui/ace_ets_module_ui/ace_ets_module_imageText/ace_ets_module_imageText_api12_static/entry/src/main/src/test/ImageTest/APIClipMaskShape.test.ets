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
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function APIClipMaskShape() {
  describe('APIClipMaskShape', (): void => {
    beforeAll(() => {
      console.info("APIClipMaskShape beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("APIClipMaskShape beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/APIClipMaskShape',
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APIClipMaskShape state pages:" + JSON.stringify(pages));
        if (!("APIClipMaskShape" == pages.name)) {
          console.info("get APIClipMaskShape pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIClipMaskShape page error:" + err);
      }
      console.info("APIClipMaskShape foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIClipMaskShape after each called");
    });
    
    /**
     * @tc.number   APIClipMaskShape_static_001
     * @tc.name     APIClipMaskShape_static_001
     * @tc.desc     APIClipMaskShape_static_001
     * @tc.level    Level.LEVEL0
     */
    it('APIClipMaskShape_static_001',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[APIClipMaskShape_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIClipMaskShape_Image1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIClipMaskShape_001] component obj is: " + JSON.stringify(obj));
      console.info("[APIClipMaskShape_001] component obj attrs is: " + 'width' + obj.getElement('$attrs').getString('width') + 'height:' + obj.getElement('$attrs').getString('height'));
      // 会返回500.00px
      await CommonFunc.sleep(1000);
      let width = obj.getElement('$attrs').getString('width').slice(0,-5) + 'px'
      let height = obj.getElement('$attrs').getString('height').slice(0,-5) + 'px'
      expect(width).assertEqual('500px');
      expect(height).assertEqual('280px');
      console.info('[APIClipMaskShape_001] END');
      done();
    });
    
    /**
     * @tc.number   APIClipMaskShape_static_002
     * @tc.name     APIClipMaskShape_static_002
     * @tc.desc     APIClipMaskShape_static_002
     * @tc.level    Level.LEVEL0
     */
    it('APIClipMaskShape_static_002',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[APIClipMaskShape_002] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIClipMaskShape_Image2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIClipMaskShape_002] component obj is: " + JSON.stringify(obj));
      console.info("[APIClipMaskShape_002] component obj attrs is: " + 'width' + obj.getElement('$attrs').getString('width') + 'height:' + obj.getElement('$attrs').getString('height'));
      await CommonFunc.sleep(1000);
      let width = obj.getElement('$attrs').getString('width').slice(0,-5) + 'px'
      let height = obj.getElement('$attrs').getString('height').slice(0,-5) + 'px'
      expect(width).assertEqual('300px');
      expect(height).assertEqual('300px');
      console.info('[APIClipMaskShape_002] END');
      done();
    });
  })
}
