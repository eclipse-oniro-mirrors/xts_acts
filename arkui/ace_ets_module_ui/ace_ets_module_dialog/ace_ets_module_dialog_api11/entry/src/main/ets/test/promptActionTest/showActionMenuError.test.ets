/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';



export default function showActionMenuError() {
  describe('showActionMenuError', () => {
    beforeEach(async (done: Function) => {
      console.info("showActionMenuError beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showActionMenuError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionMenuError state pages: " + JSON.stringify(pages));
        if (!("showActionMenuError" == pages.name)) {
          console.info("get showActionMenuError state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showActionMenuError success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuError page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   showActionMenuError_0100
     * @tc.number SUB_ACE_showActionMenuError_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('showActionMenuError_0100', Level.LEVEL2, async (done: Function) => {
      console.info('showActionMenuError_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('showActionMenuError'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('errorCode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let errorCode: string = obj.$attrs.content
      expect(errorCode).assertEqual('401');
      console.info('[showActionMenuError_0100] END');
      done();
    });
  })
}

