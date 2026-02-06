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

import { expect, describe, it, afterEach,  Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'

export default function keyDispatchTest() {

  describe('keyDispatchTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYDISPATCH_TEST001
     * @tc.name       : SUB_ARKUI_CAPI_KEYDISPATCH_TEST001
     * @tc.desc       : testing the parent and child response when parent commpnent dispatch event to child component 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testkeyDisPatchTest001',  Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'KeydispatchTest';
      await Utils.pushPage(`keydispatchtest/${PAGE_TAG}`);
      await Utils.sleep(3000);
      let driver = await Driver.create();
      await Utils.sleep(1000);

      await driver.triggerKey(2049);
      await Utils.sleep(2000);

      await driver.triggerKey(2049);
      await Utils.sleep(3000);
     
      // test the callbackData;
      let object1:ESObject = nativeRender.GetKeyEventData();
      console.info("keyEventDispatchTest_" + object1.timestamp);
      expect(object1.timestamp > 0).assertTrue();
      expect(object1.type == 1).assertTrue();
      expect(object1.unicode == 0).assertTrue();
      expect(object1.keySource == 4).assertTrue();
      expect(object1.keyText).assertEqual("KEYCODE_TAB");
      expect(object1.keyCode == 2049).assertTrue();
      expect(object1.intentionCode == -1).assertTrue();
      // test Event parent and child reponse when dispath the evnet to child
      let jsonString1:string = JSON.stringify(object1);
      console.info("KeyEventDispatchTest_" + jsonString1);

      // test the dispatch child response
      let strJson1 = getInspectorByKey('keyText1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[KeydispatchTest] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('keyRe');

      let strJson2 = getInspectorByKey('keyText2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[KeydispatchTest] obj is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('ParentC');
      done();
    });
   
  })
}
