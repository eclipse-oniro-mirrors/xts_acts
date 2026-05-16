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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listOffsetJsunit() {
  describe('listOffsetJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listOffset",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listOffsetJsunit state pages:" + JSON.stringify(pages));
        if (!("listOffset" == pages.name)) {
          console.info("get listOffsetJsunit pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await UtilsTest.msSleep(2000)
        }
      } catch (err: Error) {
        console.error("push listOffsetJsunit page error:" + err);
      }
      console.info("listOffsetJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listOffsetJsunit after each called");
    });


    
    /**
     * @tc.number   listOffsetJsunit_001
     * @tc.name     listOffsetJsunit_001
     * @tc.desc     listOffsetJsunit_001
     * @tc.level    Level.LEVEL1
     */
it('listOffsetJsunit_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listOffsetJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('offset_list');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("listOffsetJsunit_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.7)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('list_offset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listOffsetJsunit_001] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ScrollResult: 10');
      console.info('[listOffsetJsunit_001] END');
      done();
    });
  })
}
