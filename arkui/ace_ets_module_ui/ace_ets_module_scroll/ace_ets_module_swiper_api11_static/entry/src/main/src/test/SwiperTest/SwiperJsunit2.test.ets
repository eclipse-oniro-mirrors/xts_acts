'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { $r, Resource, ArrowStyle } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';

import { UtilsTest, startAbility } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;
const uiContext = new UIContext();

function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

//返回首页
async function backToIndex() {
  let backToIndexPromise = new Promise<string>((resolve: (value: string) => void) => {
    console.info('afterEach backToIndexPromise ...');
    setTimeout(() => {
      const router = AppStorage.get<Router>("router") as Router;
      router.back({
        url: 'MainAbility/pages/index'
      });
      resolve("ok")
    }, 500);
  });

  let clearPromise = new Promise<string>((resolve: (value: string) => void) => {
    console.info('afterEach clearPromise ...');
    setTimeout(() => {
      const router = AppStorage.get<Router>("router") as Router;
      router.clear();
      resolve("ok")
    }, 500);
  });
  await backToIndexPromise.then(() => {
    return clearPromise;
  });
}

export default function swiperJsunit2() {

  describe('swiper2Test', () => {
    beforeAll(() => {
      console.info("swiperJsunit2 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper2',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get Swiper state success " + JSON.stringify(pages));
        if (!("Swiper" == pages.name)) {
          console.info("get Swiper state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push Swiper page success ");
        }
      } catch (err) {
        console.error("push Swiper page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async (): Promise<void> => {
      await sleep(1)
      console.info("Swiper after each called");
    });


    
    /**
     * @tc.number   swiperTest_static_001
     * @tc.name     swiperTest_static_001
     * @tc.desc     swiperTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_001', Level.LEVEL0, async (): Promise<void> => {
      console.info('++++++++++++++++ Swiper TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('swiper');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')));
      expect(obj.getString('$type')).assertEqual('Swiper')
      console.log('Swiper‘s index is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')))
      console.log('Swiper‘s autoPlay is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')))
      console.log('Swiper‘s interval is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('interval')))
      console.log('Swiper‘s indicator is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator')))
      console.log('Swiper‘s loop is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')))
      console.log('Swiper‘s duration is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('duration')))
      console.log('Swiper‘s vertical is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')))
      console.log('Swiper‘s itemSpace is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')))
      console.log('Swiper‘s disableSwipe is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('disableSwipe')))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('1')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('true')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('interval')).assertEqual('4000')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator')).assertEqual('true')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('false')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual('false')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('duration')).assertEqual("1000")
      console.info('++++++++++++++++ Swiper TestCase 1 End +++++++++++++++++');
    });
  })
}