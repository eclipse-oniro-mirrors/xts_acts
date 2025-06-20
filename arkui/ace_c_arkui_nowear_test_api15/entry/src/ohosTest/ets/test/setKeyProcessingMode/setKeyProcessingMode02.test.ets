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

import { beforeEach, describe, expect, it,  Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function setKeyProcessingMode02(){

  describe('setKeyProcessingMode02', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0100
     * @tc.name       : setKeyProcessingMode02001
     * @tc.desc       : Setting Out-of-focus
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('setKeyProcessingMode001',  Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'setKeyProcessingMode02';
      await Utils.pushPage(`setKeyProcessingMode/${PAGE_TAG}`);
      console.info("[setKeyProcessingMode001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);

      await driver.triggerKey(2049);
      await Utils.sleep(500);
      await driver.triggerKey(2049);
      await Utils.sleep(500);
      await driver.triggerKey(2049);
      await Utils.sleep(500);
      let strJson = getInspectorByKey('text21');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setKeyProcessingMode001] component obj is: " + JSON.stringify(obj));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj.$attrs.content));
      let strJson2 = getInspectorByKey('text22');
      await Utils.sleep(200);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[setKeyProcessingMode001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj2.$attrs.content));
      let strJson3 = getInspectorByKey('text23');
      await Utils.sleep(200);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[setKeyProcessingMode001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[setKeyProcessingMode001] content is: " + JSON.stringify(obj3.$attrs.content));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('succ');
      expect(obj2.$attrs.content).assertEqual('succ');
      expect(obj3.$attrs.content).assertEqual('succ');

      done()
    })
  })
}