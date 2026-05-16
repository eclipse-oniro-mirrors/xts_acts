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

export default function onAnimationEndUndefinedTest() {
  describe('onAnimationEndUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('onAnimationEndUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/onAnimationEnd',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get onAnimationEndUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('onAnimationEnd' == pages.name)) {
          console.info('get onAnimationEndUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push onAnimationEndUndefinedTest page error:' + err);
      }
      console.info('onAnimationEndUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    onAnimationEndUndefinedTest_0100
     * @tc.name      onAnimationEndUndefinedTest_0100
     * @tc.desc      onAnimationEndUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('onAnimationEndUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('onAnimationEndUndefinedTest_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('swiper_onAnimationEnd');
      let obj = JSON.parseJsonElement(strJson);
      let initialContent = obj.getElement('$attrs').getString('content');
      console.info('[Initial] swiper_onAnimationEnd content: ' + initialContent);
      expect(initialContent).assertEqual("0");

      console.info('Swiping to trigger onAnimationEnd callback...');
      let driver = Driver.create();

      let swiperItem = await driver.findComponent(ON.text('1')) as Component;
      let bounds = await swiperItem.getBounds();

      let width = bounds.right - bounds.left;
      let height = bounds.bottom - bounds.top;

      driver.swipe(
        (bounds.left + width - 50).toInt(),
        (bounds.top + height / 2).toInt(),
        (bounds.left + 50).toInt(),
        (bounds.top + height / 2).toInt(),
        3000
      );
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('swiper_onAnimationEnd');
      let obj2 = JSON.parseJsonElement(strJson2);
      let afterCallbackContent = obj2.getElement('$attrs').getString('content');
      console.info('[After Callback] swiper_onAnimationEnd content: ' + afterCallbackContent);
      expect(afterCallbackContent).assertEqual("1");

      await CommonFunc.sleep(500);
      let btn_change = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('swiper_onAnimationEnd');
      let obj3 = JSON.parseJsonElement(strJson3);
      let afterClickContent = obj3.getElement('$attrs').getString('content');
      console.info('[After Click] swiper_onAnimationEnd content: ' + afterClickContent);
      expect(afterClickContent).assertEqual("1");

      let swiperItem2 = await driver.findComponent(ON.text('2')) as Component;
      let bounds2 = await swiperItem2.getBounds();

      let width2 = bounds2.right - bounds2.left;
      let height2 = bounds2.bottom - bounds2.top;

      driver.swipe(
        (bounds2.left + width2 - 50).toInt(),
        (bounds2.top + height2 / 2).toInt(),
        (bounds2.left + 50).toInt(),
        (bounds2.top + height2 / 2).toInt(),
        3000
      );
      await CommonFunc.sleep(2000);

      let strJson4 = inspector.getInspectorByKey('swiper_onAnimationEnd');
      let obj4 = JSON.parseJsonElement(strJson4);
      let finalContent = obj4.getElement('$attrs').getString('content');
      console.info('[Final] swiper_onAnimationEnd content: ' + finalContent);
      expect(finalContent).assertEqual("1");

      console.info('onAnimationEndUndefinedTest_0100 END');
      done();
    });
  })
}
