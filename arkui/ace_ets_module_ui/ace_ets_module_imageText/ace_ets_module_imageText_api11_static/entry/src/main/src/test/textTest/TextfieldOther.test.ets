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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { beforeEach, describe, expect,it, Level,beforeAll } from "../../../../hypium/index";
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

export default function TextfieldOtherTest() {
  describe('TextfieldOtherTest', () => {
    beforeAll(() => {
      console.info("TextfieldOtherTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextfieldOtherTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/TextfieldOther',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextfieldOtherTest state pages:" + JSON.stringify(pages));
        if (!("TextfieldOther" == pages.name)) {
          console.info("get TextfieldOtherTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextfieldOtherTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextfieldOtherTest page error:" + err);
      }
      console.info("TextfieldOtherTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0070
     * @tc.name     ArkUX_Text_Visual_static_0070
     * @tc.desc     ArkUX_Text_Visual_static_0070
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0070', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0070 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0070');
          console.info('ArkUX_Text_Visual_static_0070 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0070 obj is: " + JSON.stringify(obj));
          let showCounter  = obj.getElement('$attrs').getElement('showCounter');
          let value  = showCounter.getBoolean('value');
          let options  = showCounter.getElement('options');
          let thresholdPercentage  = options.getDouble('thresholdPercentage');
          let highlightBorder  = options.getBoolean('highlightBorder');
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_static_0070 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0080
     * @tc.name     ArkUX_Text_Visual_static_0080
     * @tc.desc     ArkUX_Text_Visual_static_0080
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0080', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0080 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0080');
          console.info('ArkUX_Text_Visual_static_0080 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0080 obj is: " + JSON.stringify(obj));
          let showCounter  = obj.getElement('$attrs').getElement('showCounter');
          let value  = showCounter.getBoolean('value');
          let options  = showCounter.getElement('options');
          let thresholdPercentage  = options.getDouble('thresholdPercentage');
          let highlightBorder  = options.getBoolean('highlightBorder');
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_static_0080 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0080 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0090
     * @tc.name     ArkUX_Text_Visual_static_0090
     * @tc.desc     ArkUX_Text_Visual_static_0090
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0090', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0090 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0090');
          console.info('ArkUX_Text_Visual_static_0090 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0090 obj is: " + JSON.stringify(obj));
          let showCounter  = obj.getElement('$attrs').getElement('showCounter');
          let value  = showCounter.getBoolean('value');
          let options  = showCounter.getElement('options');
          let thresholdPercentage  = options.getDouble('thresholdPercentage');
          let highlightBorder  = options.getBoolean('highlightBorder');
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_static_0090 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });


    
    /**
     * @tc.number   ArkUX_Text_Visual_static_0010
     * @tc.name     ArkUX_Text_Visual_static_0010
     * @tc.desc     ArkUX_Text_Visual_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0010', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0010 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0010');
          console.info('ArkUX_Text_Visual_static_0010 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0010 obj is: " + JSON.stringify(obj));
          let showCounter  = obj.getElement('$attrs').getElement('showCounter');
          let value  = showCounter.getBoolean('value');
          let options  = showCounter.getElement('options');
          let thresholdPercentage  = options.getDouble('thresholdPercentage');
          let highlightBorder  = options.getBoolean('highlightBorder');
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(-1);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_static_0010 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });
  })
}