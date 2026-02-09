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

import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level,beforeAll } from "../../../../hypium/index";
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

export default function TextfieldSingleTest() {
  describe('TextfieldSingleTest', () => {
    beforeAll(() => {
      console.info("TextfieldSingleTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextfieldSingleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/TextfieldSingle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextfieldSingleTest state pages:" + JSON.stringify(pages));
        if (!("TextfieldSingle" == pages.name)) {
          console.info("get TextfieldSingleTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextfieldSingleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextfieldSingleTest page error:" + err);
      }
      console.info("TextfieldSingleTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0040
     * @tc.name     ArkUX_Text_Visual_static_0040
     * @tc.desc     ArkUX_Text_Visual_static_0040
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0040', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0040 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0040');
          console.info('ArkUX_Text_Visual_static_0040 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0040 obj is: " + JSON.stringify(obj));
          let selectAll  = obj.getElement('$attrs').getBoolean('selectAll');
          expect(selectAll).assertEqual(true);
          console.info('ArkUX_Text_Visual_static_0040 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0050
     * @tc.name     ArkUX_Text_Visual_static_0050
     * @tc.desc     ArkUX_Text_Visual_static_0050
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0050', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0050 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0050');
          console.info('ArkUX_Text_Visual_static_0050 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0050 obj is: " + JSON.stringify(obj));
          let selectAll  = obj.getElement('$attrs').getBoolean('selectAll');
          expect(selectAll).assertEqual(false);
          console.info('ArkUX_Text_Visual_static_0050 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0060
     * @tc.name     ArkUX_Text_Visual_static_0060
     * @tc.desc     ArkUX_Text_Visual_static_0060
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0060', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0060 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0060');
          console.info('ArkUX_Text_Visual_static_0060 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0060 obj is: " + JSON.stringify(obj));
          let selectAll  = obj.getElement('$attrs').getBoolean('selectAll');
          expect(selectAll).assertEqual(false);
          console.info('ArkUX_Text_Visual_static_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });
  })
}