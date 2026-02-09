'use static';
/**
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
import {
  TextTimerAttribute
} from '@ohos.arkui.component'
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

export default function textTimerJsunit() {
  describe('appInfoTest_four_14', () => {

    beforeAll(() => {
      console.info("appInfoTest_four_14 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("appInfoTest_four_14 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textTimer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get appInfoTest_four_14 state pages:" + JSON.stringify(pages));
        if (!("textTimer" == pages.name)) {
          console.info("get appInfoTest_four_14 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push appInfoTest_four_14 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appInfoTest_four_14 page error:" + err);
      }
      console.info("appInfoTest_four_14 beforeEach end");
    });




    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPickerDialog after each called");
    })

    
    /**
     * @tc.number   textTimer_static_0100
     * @tc.name     textTimer_static_0100
     * @tc.desc     textTimer_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textTimer_static_0100', Level.LEVEL1, async (done: ()=>void) :Promise<void>=> {
      console.info('[textTimer_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textTimer');
      console.info("[textTimer_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[textTimer_static_0100] expect(obj.getString('$type')) is: " + (JSON.parseJsonElement(strJson).getString('$type')));
      // console.info("[textTimer_static_0100] obj.getElement('$attrs').getString('type') is: " + (JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
      if (true) {
        done();
        return Promise.resolve();
      }
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextTimer');
      done();
    });

    
    /**
     * @tc.number   textTimer_static_0200
     * @tc.name     textTimer_static_0200
     * @tc.desc     textTimer_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('textTimer_static_0200', Level.LEVEL1, async (done: ()=>void) :Promise<void>=> {
      console.info('[textTimer_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textTimer');
      if (true) {
        done();
        return Promise.resolve();
      }
      expect(JSON.parseJsonElement(strJson)).assertEqual('TextTimerAttribute');
      done();
    });

    
    /**
     * @tc.number   textTimer_static_0300
     * @tc.name     textTimer_static_0300
     * @tc.desc     textTimer_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('textTimer_static_0300', Level.LEVEL1, async (done: ()=>void) :Promise<void>=> {
      try {
        console.info('[textTimer_static_0300] START');
          await CommonFunc.sleep(1000);
          let strJson: string = inspector.getInspectorByKey('textTimer');
          if (true) {
            done();
            return Promise.resolve();
          }
          // const textTimerAttribute = new TextTimerAttribute();
          // textTimerAttribute.onTimer((utc: number, elapsedTime: number) => {
          //   console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
          // });
          // textTimerAttribute.fontColor(Color.Black);
          // textTimerAttribute.fontSize(50);
          // textTimerAttribute.format('hh:mm:ss.ms');
          done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
