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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function QueryNavDestinationInfoNavDestinationJsunit() {
  describe('QueryNavDestinationInfoNavDestinationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("QueryNavDestinationInfoNavDestinationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/QueryNavDestinationInfoNavDestination',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QueryNavDestinationInfoNavDestinationJsunit state pages:" + JSON.stringify(pages));
        if (!("QueryNavDestinationInfoNavDestination" == pages.name)) {
          console.info("get QueryNavDestinationInfoNavDestinationJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push QueryNavDestinationInfoNavDestinationJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QueryNavDestinationInfoNavDestinationJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });

    it('QueryNavDestinationInfoNavDestinationJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('QueryNavDestinationInfoNavDestinationText01'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let strcontent = getInspectorByKey('QueryNavDestinationInfoNavDestinationTextObserver');
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0100 component obj.width is: ' + JSON.parse(strcontent)
        .$attrs
        .content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('"QueryNavDestinationInfoNavDestination123"');
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0100 END')
      done();
    });

    it('QueryNavDestinationInfoNavDestinationJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0200 START');
      let strcontent = getInspectorByKey('XXqueryNavDestinationInfoNavDestinationText01');
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0200 component obj.width is: ' + JSON.parse(strcontent)
        .$attrs
        .content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('4');
      console.info('QueryNavDestinationInfoNavDestinationJsunit_0200 END')
      done();
    });
  })
}