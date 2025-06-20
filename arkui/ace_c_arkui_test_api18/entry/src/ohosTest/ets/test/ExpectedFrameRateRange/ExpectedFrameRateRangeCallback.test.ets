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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function expectedFrameRateRangeCallback(){

  describe('ExpectedFrameRateRangeCallback', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.name       : testFrameRateRangeCallback001
     * @tc.desc       : testing Post Frame Callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('ExpectedFrameRateRangeCallback001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ExpectedFrameRateRangeCallback';
      await Utils.pushPage(`ExpectedFrameRateRange/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('onClick1'));
      await button1.click();
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('onClick3'));
      await button3.click();
      await Utils.sleep(16000)

      let strJson1 = getInspectorByKey('text_id');
      await Utils.sleep(200);
      let obj1: ESObject = JSON.parse(strJson1);

      console.info("[ExpectedFrameRateRangeCallback001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ExpectedFrameRateRangeCallback001] content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('正常值')

      let button2 = await driver.findComponent(ON.id('onClick2'));
      await button2.click();
      await Utils.sleep(1000)

      await button3.click();
      await Utils.sleep(16000)

      let strJson2 = getInspectorByKey('text_id');
      await Utils.sleep(200);
      let obj2: ESObject = JSON.parse(strJson2);

      console.info("[ExpectedFrameRateRangeCallback001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ExpectedFrameRateRangeCallback001] content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('异常值')
    
      done();
    });

  })
}