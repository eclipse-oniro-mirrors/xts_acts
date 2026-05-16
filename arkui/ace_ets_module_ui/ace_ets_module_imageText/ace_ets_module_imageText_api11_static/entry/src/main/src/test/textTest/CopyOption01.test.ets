'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function copyOptionJsunit() {
  describe('copyOptionTest', () => {

    beforeAll(() => {
      console.info("copyOptionJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("copyOptionJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/copyOption',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get copyOptionJsunit state pages:" + JSON.stringify(pages));
        if (!("copyOption" == pages.name)) {
          console.info("get copyOptionJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push copyOptionJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push copyOptionJsunit page error:" + err);
      }
      console.info("copyOptionJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("copyOption after each called");
    });

    
    /**
     * @tc.number   testcopyOption_static_0001
     * @tc.name     testcopyOption_static_0001
     * @tc.desc     testcopyOption_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('testcopyOption_static_0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('hoverEffect testcopyOption_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('InAppText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testcopyOption_static_0001] component copyOption strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info("[testcopyOption_static_0001] copyOption value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption'));
      done();
    });

    
    /**
     * @tc.number   testcopyOption_static_0002
     * @tc.name     testcopyOption_static_0002
     * @tc.desc     testcopyOption_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('testcopyOption_static_0002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('hoverEffect testcopyOption_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('LocalDeviceText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testcopyOption_static_0002] component copyOption strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info("[testcopyOption_static_0002] copyOption value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption'));
      done();
    });
  })
}