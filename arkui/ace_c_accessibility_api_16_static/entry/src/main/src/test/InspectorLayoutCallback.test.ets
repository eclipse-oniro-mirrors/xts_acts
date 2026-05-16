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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
import Utils from './common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from './Util.test'

export default function InspectorLayoutCallbackTest() {

  describe('InspectorLayoutCallbackTest', (): void => {

    let PAGE_TAG = 'InspectorLayoutCallback';
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_inspector_xts_api16.static", "EntryAbility")
    });

    beforeEach(async (done: () => void): Promise<void> => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number   InspectorLayoutCallback001
     * @tc.name     InspectorLayoutCallback001
     * @tc.desc     InspectorLayoutCallback001
     * @tc.level    Level.LEVEL0
     */
    it('InspectorLayoutCallback001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`${PAGE_TAG}`, false);
      console.info("[InspectorLayoutCallback001] start succ");
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(2000);
      let layoutcallback_test01 = await driver.findComponent(ON.id('layoutcallback_test01'));
      await Utils.sleep(2000);
      await (layoutcallback_test01?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('text_node0');
      await Utils.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[InspectorLayoutCallback001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(2000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('layout callback');
      done()
    });

    /**
     * @tc.number   InspectorLayoutCallback002
     * @tc.name     InspectorLayoutCallback002
     * @tc.desc     InspectorLayoutCallback002
     * @tc.level    Level.LEVEL0
     */
    it('InspectorLayoutCallback002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`${PAGE_TAG}`, false);
      console.info("[InspectorLayoutCallback002] start succ");
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(2000);
      let layoutcallback_test01 = await driver.findComponent(ON.id('layoutcallback_test02'));
      await Utils.sleep(2000);
      await (layoutcallback_test01?.click() as Promise<void>);
      await Utils.sleep(2000);
      let callbackJson: string = inspector.getInspectorByKey('text_node0');
      await Utils.sleep(2000);
      let obj = JSON.parseJsonElement(callbackJson);
      console.info("[InspectorLayoutCallback002] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(2000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      done()
    });

    /**
     * @tc.number   InspectorLayoutCallback003
     * @tc.name     InspectorLayoutCallback003
     * @tc.desc     InspectorLayoutCallback003
     * @tc.level    Level.LEVEL0
     */
    it('InspectorLayoutCallback003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`${PAGE_TAG}`, false);
      console.info("[InspectorLayoutCallback003] start succ");
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(2000);
      let layoutcallback_test01 = await driver.findComponent(ON.id('drawcallback_test01'));
      await Utils.sleep(2000);
      await (layoutcallback_test01?.click() as Promise<void>);
      await Utils.sleep(2000);
      let callbackJson: string = inspector.getInspectorByKey('text_node0');
      await Utils.sleep(2000);
      let obj = JSON.parseJsonElement(callbackJson);
      console.info("[InspectorLayoutCallback003] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(2000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('draw callback');
      done()
    });

    /**
     * @tc.number   InspectorLayoutCallback004
     * @tc.name     InspectorLayoutCallback004
     * @tc.desc     InspectorLayoutCallback004
     * @tc.level    Level.LEVEL0
     */
    it('InspectorLayoutCallback004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`${PAGE_TAG}`, false);
      console.info("[InspectorLayoutCallback004] start succ");
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(2000);
      let layoutcallback_test01 = await driver.findComponent(ON.id('drawcallback_test02'));
      await Utils.sleep(2000);
      await (layoutcallback_test01?.click() as Promise<void>);
      await Utils.sleep(2000);
      let callbackJson: string = inspector.getInspectorByKey('text_node0');
      await Utils.sleep(2000);
      let obj = JSON.parseJsonElement(callbackJson);
      console.info("[InspectorLayoutCallback004] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(2000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      done()
    });
  })
}
