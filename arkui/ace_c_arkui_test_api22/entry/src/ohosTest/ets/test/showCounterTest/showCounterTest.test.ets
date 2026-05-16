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
import { beforeAll, expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function ShowCounterTest(){

  describe('ShowCounterTest', () => {
    let PAGE_TAG = 'showCounterTest';
    
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`showCounterTest/${PAGE_TAG}`, done);
    })
    

    /**
     * @tc.name    TextAreaTest_0010
     * @tc.number  TextAreaTest_0010
     * @tc.desc    TextArea ShowCounter test succ
     * @tc.level   LEVEL2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('TextAreaTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTest_0010] START');
      let strJson = getInspectorByKey('textArea_01');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTest_0010] showCounter: ' + JSON.stringify(obj.$attrs.showCounterApi22));
      expect(obj.$attrs.showCounterApi22.options.counterTextColor+'').assertEqual('#FF0000FF');
      expect(obj.$attrs.showCounterApi22.options.counterTextOverflowColor+'').assertEqual('#FFFFFF00');
      console.info("[TextAreaTest_0010] END");
      done();
    });

    /**
     * @tc.name    TextInputTest_0020
     * @tc.number  TextInputTest_0020
     * @tc.desc    TextInputs ShowCounter test succ
     * @tc.level   LEVEL2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('TextInputTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputTest_0020] START');
      let strJson = getInspectorByKey('textInput');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTest_0020] showCounter: ' + JSON.stringify(obj.$attrs.showCounterApi22));
      expect(obj.$attrs.showCounterApi22.options.counterTextColor+'').assertEqual('#FF0000FF');
      expect(obj.$attrs.showCounterApi22.options.counterTextOverflowColor+'').assertEqual('#FFFFFF00');
      console.info("[TextInputTest_0020] END");
      done();
    });
  })
}