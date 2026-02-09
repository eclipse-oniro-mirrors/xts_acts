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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import inspector from '@ohos.arkui.inspector'
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  ImageFit,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function search_center() {
  describe('search_center', () => {
    beforeAll(() => {
      console.info("search_center beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("search_center beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/search_center",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search_center state pages:" + "");
        if (!("search_center" == pages.name)) {
          console.info("get search_center pages.name:" + "");
          console.info("push search_center page 1");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push search_center page 2");
        }
      } catch (err) {
        console.error("push search_center page error:" + err);
      }
      console.info("search_center beforeEach end");
    });


    
    
    
    /**
     * @tc.number   search_center_static_001
     * @tc.name     search_center_static_001
     * @tc.desc     search_center_static_001
     * @tc.level    Level.LEVEL2
     */
  it('search_center_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[search_center_001] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get click before Initial value')
        let search_01 = CommonFunc.getComponentRect('search_center_search_01');
        let y1 = search_01.top

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        driver.click(
          (Math.round(search_01.left + (search_01.right - search_01.left) / 2) as int),
          (Math.round(search_01.top + (search_01.bottom - search_01.top) / 2) as int)
        );
        await CommonFunc.sleep(1000);
        let search_02 = CommonFunc.getComponentRect('search_center_search_01');
        let y2 = search_02.top
        expect(y2).assertLess(y1);

      }
      done();
    });

  })
}
