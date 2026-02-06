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

export default function imageAddApi3() {
  describe('imageAddApi3', (): void => {
    beforeAll(() => {
      console.info("imageAddApi3 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAddApi3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/imageAddApi3',
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageAddApi3 state pages:" + JSON.stringify(pages));
        if (!("imageAddApi3" == pages.name)) {
          console.info("get imageAddApi3 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageAddApi3 page error:" + err);
      }
      console.info("imageAddApi3 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAddApi3 after each called");
    });

    /**
     * @tc.number   imageAddApi3_static_001
     * @tc.name     imageAddApi3_static_001
     * @tc.desc     imageAddApi3_static_001
     * @tc.level    Level.LEVEL0
     */
    it('imageAddApi3_static_001',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[imageAddApi3_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.TOP_START');
      console.info('[imageAddApi3_001] END');
      done();

    });

    /**
     * @tc.number   imageAddApi3_static_002
     * @tc.name     imageAddApi3_static_002
     * @tc.desc     imageAddApi3_static_002
     * @tc.level    Level.LEVEL0
     */
    it('imageAddApi3_static_002',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[imageAddApi3_002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi32');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.TOP_END');
      console.info('[imageAddApi3_002] END');
      done();

    });

    /**
     * @tc.number   imageAddApi3_static_003
     * @tc.name     imageAddApi3_static_003
     * @tc.desc     imageAddApi3_static_003
     * @tc.level    Level.LEVEL0
     */
    it('imageAddApi3_static_003',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[imageAddApi3_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi33');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.BOTTOM_START');
      console.info('[imageAddApi3_003] END');
      done();

    });

    /**
     * @tc.number   imageAddApi3_static_004
     * @tc.name     imageAddApi3_static_004
     * @tc.desc     imageAddApi3_static_004
     * @tc.level    Level.LEVEL0
     */
    it('imageAddApi3_static_004',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[imageAddApi3_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi34');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.BOTTOM_END');
      console.info('[imageAddApi3_003] END');
      done();

    });

  })
}
