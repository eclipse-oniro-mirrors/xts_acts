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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver } from '@ohos.UiTest';
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

export default function SpanTextShadowTest() {
  describe('SpanTextShadowTest', () => {

    beforeAll(() => {
      console.info("SpanTextShadowTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SpanTextShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/SpanTextShadowTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SpanTextShadowTest state pages:" + JSON.stringify(pages));
        if (!("SpanTextShadowTest" == pages.name)) {
          console.info("get SpanTextShadowTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SpanTextShadowTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanTextShadowTest page error:" + err);
      }
      console.info("SpanTextShadowTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SpanTextShadowTest after each called");
    });

    
    /**
     * @tc.number   SpanTextShadowTest_static_0001
     * @tc.name     SpanTextShadowTest_static_0001
     * @tc.desc     SpanTextShadowTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('SpanTextShadowTest_static_0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('SpanTextShadowTest_static_0001 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('spanTextShadow1');
      let obj = JSON.parseJsonElement(strJson);
      console.log('spanTextShadow1-----' +JSON.stringify(obj.getElement('$attrs').getElement('textShadow')));
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('1.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('type')).assertEqual('0');
      console.info("[SpanTextShadowTest_static_0001] end");
      done();
    });

    
    /**
     * @tc.number   SpanTextShadowTest_static_0002
     * @tc.name     SpanTextShadowTest_static_0002
     * @tc.desc     SpanTextShadowTest_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('SpanTextShadowTest_static_0002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('SpanTextShadowTest_static_0002 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('spanTextShadow2');
      let obj = JSON.parseJsonElement(strJson);
      console.log('spanTextShadow2-----' +JSON.stringify(obj.getElement('$attrs').getElement('textShadow')));
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('-10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('-10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('type')).assertEqual('1');
      console.info("[SpanTextShadowTest_static_0002] end");
      done();
    });

    
    /**
     * @tc.number   SpanTextShadowTest_static_0003
     * @tc.name     SpanTextShadowTest_static_0003
     * @tc.desc     SpanTextShadowTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('SpanTextShadowTest_static_0003', Level.LEVEL1, async (done: ()=>void) => {
      console.info('SpanTextShadowTest_static_0003 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('spanTextShadow3');
      let obj = JSON.parseJsonElement(strJson);
      console.log('spanTextShadow3-----' +JSON.stringify(obj.getElement('$attrs').getElement('textShadow')));
      let item1 = obj.getElement('$attrs').getElement('textShadow')[0]
      let item2= obj.getElement('$attrs').getElement('textShadow')[1]
      expect(item1.getString('radius')).assertEqual('1.000000');
      expect(item1.getString('color')).assertEqual('#FF0000FF');
      expect(item1.getString('offsetX')).assertEqual('10.000000');
      expect(item1.getString('offsetY')).assertEqual('10.000000');
      expect(item1.getString('type')).assertEqual('0');
      expect(item2.getString('radius')).assertEqual('0.000000');
      expect(item2.getString('color')).assertEqual('#FF008000');
      expect(item2.getString('offsetX')).assertEqual('-10.000000');
      expect(item2.getString('offsetY')).assertEqual('-10.000000');
      expect(item2.getString('type')).assertEqual('1');
      console.info("[SpanTextShadowTest_static_0003] end");
      done();
    });
  })
}