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

export default function MarqueeApi() {
  describe('MarqueeApi', (): void => {
    beforeAll(() => {
      console.info("FontSettingOptions beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("FontSettingOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/MarqueeApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FontSettingOptions state pages:" + JSON.stringify(pages));
        if (!("MarqueeApi" == pages.name)) {
          console.info("get FontSettingOptions pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FontSettingOptions page");
        }
      } catch (err) {
        console.error("push FontSettingOptions page error:" + err);
      }
      console.info("FontSettingOptions beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("MarqueeApi after each called");
    });

    

    /**
     * @tc.number   MarqueeApi_static_001
     * @tc.name     MarqueeApi_static_001
     * @tc.desc     MarqueeApi_static_001
     * @tc.level   Level.LEVEL0
     */
    it('MarqueeApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[MarqueeApi_static_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MarqueeApi');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MarqueeApi_static_001] component obj is: " + String(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('marqueeUpdateStrategy')).assertEqual('MarqueeUpdateStrategy.PRESERVE_POSITION');
      expect(obj !== null).assertTrue();
      console.info('[MarqueeApi_static_001] END');
      done();
    });
  })
}
