/*
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativerender.so'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';

export default function HasAxisTest(){

  describe('HasAxisTest', () => {
    let PAGE_TAG = 'HasAxisTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`hasAxisTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   HasAxisTest_001
     * @tc.number SUB_ARKUI_CAPI_HasAxisTest_001
     * @tc.desc   Test RegisterCommonEvent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasAxisTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[HasAxisTest_001] START'); 
      await Utils.sleep(1000);
       let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBoundsCenter();
      await Utils.sleep(1000);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      await Utils.sleep(1000);
      console.info('HasAxisTest_001 5NavigationExample_0100 START');
      let strJson1: string = getInspectorByKey('has1');
      let strJson2: string = getInspectorByKey('has2');
      let strJson3: string = getInspectorByKey('has3');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info('HasAxisTest_001 component obj is: ' + JSON.stringify(obj1));
      console.info('HasAxisTest_001 content obj is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('true');
      console.info('HasAxisTest_001 component obj2 is: ' + JSON.stringify(obj2));
      console.info('HasAxisTest_001 content obj2 is: ' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('true');
      console.info('HasAxisTest_001 component obj3 is: ' + JSON.stringify(obj3));
      console.info('HasAxisTest_001 content obj3 is: ' + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('true');
      console.info('[HasAxisTest_001] END');
      done();
    })
  })
}