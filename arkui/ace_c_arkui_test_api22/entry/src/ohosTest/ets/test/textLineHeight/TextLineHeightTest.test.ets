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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function textLineHeightTest() {

  describe('textLineHeightTest', () => {

    let PAGE_TAG = 'TextLineHeightTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textLineHeight/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   textLineHeightMultiplet_0010
     * @tc.number textLineHeightMultiplet_0010
     * @tc.desc   test lineHeightMultiplet is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textLineHeightMultiplet_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textLineHeightMultiplet_0010] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('testLineHeight1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textLineHeightMultiplet_0010] lineHeightMultiply: ' + obj1.$attrs.lineHeightMultiply);
      expect(obj1.$attrs.lineHeightMultiply).assertEqual('6.000000');
      console.info('[textLineHeightMultiplet_0010] END');
      done();
    })

    /**
     * @tc.name   textMaxLineHeight_0010
     * @tc.number textMaxLineHeight_0010
     * @tc.desc   test maxLineHeight is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textMaxLineHeight_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textMaxLineHeight_0010] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('testLineHeight1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textMaxLineHeight_0010] maxLineHeight: ' + obj1.$attrs.maxLineHeight);
      expect(obj1.$attrs.maxLineHeight).assertEqual('5.00fp');
      console.info('[textMaxLineHeight_0010] END');
      done();
    })

    /**
     * @tc.name   textMinLineHeight_0010
     * @tc.number textMinLineHeight_0010
     * @tc.desc   test minLineHeight is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textMinLineHeight_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textMinLineHeight_0010] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('testLineHeight1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textMinLineHeight_0010] minLineHeight: ' + obj1.$attrs.minLineHeight);
      expect(obj1.$attrs.minLineHeight).assertEqual('3.00fp');
      console.info('[textMinLineHeight_0010] END');
      done();
    })
  })
}