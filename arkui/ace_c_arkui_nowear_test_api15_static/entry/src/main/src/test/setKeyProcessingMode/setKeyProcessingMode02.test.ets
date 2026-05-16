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

import { beforeEach, describe, expect, it,  Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { LibUtil } from '../../../ets/pages/LibUtil';
let libUtil: LibUtil = new LibUtil();
export default function setKeyProcessingMode02(){

  describe('setKeyProcessingMode02', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_nowear_api15_static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    

    /**
     * @tc.number   setKeyProcessingMode001
     * @tc.name     setKeyProcessingMode001
     * @tc.desc     setKeyProcessingMode001
     * @tc.level    Level.LEVEL1
     */
    it('setKeyProcessingMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'setKeyProcessingMode02';
      await Utils.pushPage(`setKeyProcessingMode/${PAGE_TAG}`);
      console.info("[setKeyProcessingMode001] start succ");
      await Utils.sleep(500);
      let driver = Driver.create();
      await Utils.sleep(500);

      await driver.triggerKey(2049);
      await Utils.sleep(500);
      await driver.triggerKey(2049);
      await Utils.sleep(500);
      await driver.triggerKey(2049);
      await Utils.sleep(500);
      let strJson = inspector.getInspectorByKey('text21');
      await Utils.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setKeyProcessingMode001] component obj is: " + JSON.stringify(obj));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      let strJson2 = inspector.getInspectorByKey('text22');
      await Utils.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[setKeyProcessingMode001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      let strJson3 = inspector.getInspectorByKey('text23');
      await Utils.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[setKeyProcessingMode001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      await Utils.sleep(500);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('succ');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('succ');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('succ');

      done()
    })
  })
}