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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function onSelected_ModifierStartUndefinedTest() {
  describe('onSelected_ModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('onSelected_ModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/onSelected_Modifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get onSelected_ModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('onSelected_Modifier' == pages.name)) {
          console.info('get onSelected_ModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push onSelected_ModifierUndefinedTest page error:' + err);
      }
      console.info('onSelected_ModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    onSelected_ModifierUndefinedTest_0100
     * @tc.name      onSelected_ModifierUndefinedTest_0100
     * @tc.desc      onSelected_ModifierUndefinedTest_0100
     * @tc.level     0
     */
    it('onSelected_ModifierUndefinedTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onSelected_ModifierUndefinedTest_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      //点击跳转索引触发回调
      let goBtn = await driver.findComponent(ON.id('go2Modifier')) as Component;
      await (goBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      //判断回调更新后结果
      let strJson = inspector.getInspectorByKey('testTextModifier');
      let obj = JSON.parseJsonElement(strJson);
      let testText = obj.getElement('$attrs').getString('content');
      console.info('[Initial] swiper_onSelected_Modifier content: ' + testText);
      expect(testText).assertEqual("swiperIndex2");

      //点击动态改成undefined
      let undefinedBtn = await driver.findComponent(ON.id('undefinedBtnModifier')) as Component;
      await (undefinedBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      //点击跳转索引不触发回调
      await (goBtn.click() as Promise<void>);
      await CommonFunc.sleep(500);

      //判断回调更新后结果
      let strJson2 = inspector.getInspectorByKey('testTextModifier');
      let obj2 = JSON.parseJsonElement(strJson2);
      let testText2 = obj2.getElement('$attrs').getString('content');
      console.info('[Initial] swiper_onSelected_Modifier content: ' + testText2);
      expect(testText2).assertEqual("isUndefined");

      console.info('onSelected_ModifierUndefinedTest_0100 END');
      done();
    });
  })
}
