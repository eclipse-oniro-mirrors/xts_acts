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
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(():void => {
      resolve("ok")
    }, time * 1000 as Int)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function propJsunit() {

  describe('propTest', () => {

    beforeAll(() => {
      console.info("propTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("propTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/Prop',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get propTest state pages:" + JSON.stringify(pages));
        if (!("Prop" == pages.name)) {
          console.info("get propTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push propTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push propTest page error:" + err);
      }
      console.info("propTest beforeEach end");
    });

    afterEach(async () => {
      await sleep(1)
      console.info("PropRef after each called");
    });

    
    /**
     * @tc.number   propTest_static_001
     * @tc.name     propTest_static_001
     * @tc.desc     propTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('propTest_static_001', Level.LEVEL2, async () => {
      console.info('propTest_static_001 START');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('Text001');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      console.log(JSON.stringify(obj.getString('$type')))
      console.log("cd attrs.conten type1" + typeof ("10"))
      console.log("yr prop0 content-'10'" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
      expect(obj.getElement('$attrs').getString('content')).assertEqual("10");
      console.info('propTest_static_001 END');
    });

    
    /**
     * @tc.number   propTest_static_002
     * @tc.name     propTest_static_002
     * @tc.desc     propTest_static_002
     * @tc.level    Level.LEVEL2
     */
    it('propTest_static_002', Level.LEVEL2, async () => {
      console.info('propTest_static_002 START');
      let strJson = inspector.getInspectorByKey('Text002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("cd attrs.conten type" + typeof (JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))
      console.log("cd attrs.conten type1 " + typeof ("10"))
      expect(obj.getElement('$attrs').getString('content')).assertEqual("10");
      console.log("cd prop0 content-'10'" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))
      console.info('propTest_static_002 END');
    });
  })
}
