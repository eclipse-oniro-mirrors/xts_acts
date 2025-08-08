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

import { describe, it, expect, beforeEach, Level } from '@ohos/hypium';
import Utils from './common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function InspectorLayoutCallbackTest() {

  describe('InspectorLayoutCallbackTest', () => {

    let PAGE_TAG = 'InspectorLayoutCallback';

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
    /*
     * @tc.number     : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_INSPECTOR_CAPI_0001
     * @tc.name       : InspectorLayoutCallback001
     * @tc.desc       : 组件注册布局回调验证
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('InspectorLayoutCallback001', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[InspectorLayoutCallback001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let layoutcallback_test01 = await driver.findComponent(ON.id('layoutcallback_test01'));
      await Utils.sleep(500);
      await layoutcallback_test01.click();
      await Utils.sleep(500);
      let callbackJson = getInspectorByKey('text_node0');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("[InspectorLayoutCallback001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('layout callback');
      done()
    });
    /*
     * @tc.number     : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_INSPECTOR_CAPI_0002
     * @tc.name       : InspectorLayoutCallback002
     * @tc.desc       : 组件注册布局回调验证
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('InspectorLayoutCallback002', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[InspectorLayoutCallback002] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let layoutcallback_test01 = await driver.findComponent(ON.id('layoutcallback_test02'));
      await Utils.sleep(500);
      await layoutcallback_test01.click();
      await Utils.sleep(500);
      let callbackJson = getInspectorByKey('text_node0');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("[InspectorLayoutCallback002] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('0');
      done()
    });
    /*
     * @tc.number     : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_INSPECTOR_CAPI_0003
     * @tc.name       : InspectorLayoutCallback003
     * @tc.desc       : 组件注册布局回调验证
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('InspectorLayoutCallback003', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[InspectorLayoutCallback003] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let layoutcallback_test01 = await driver.findComponent(ON.id('drawcallback_test01'));
      await Utils.sleep(500);
      await layoutcallback_test01.click();
      await Utils.sleep(500);
      let callbackJson = getInspectorByKey('text_node0');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("[InspectorLayoutCallback003] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('draw callback');
      done()
    });
    /*
     * @tc.number     : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_INSPECTOR_CAPI_0004
     * @tc.name       : InspectorLayoutCallback004
     * @tc.desc       : 组件注册布局回调验证
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('InspectorLayoutCallback004', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[InspectorLayoutCallback004] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let layoutcallback_test01 = await driver.findComponent(ON.id('drawcallback_test02'));
      await Utils.sleep(500);
      await layoutcallback_test01.click();
      await Utils.sleep(500);
      let callbackJson = getInspectorByKey('text_node0');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("[InspectorLayoutCallback004] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('0');
      done()
    });
  })
}
