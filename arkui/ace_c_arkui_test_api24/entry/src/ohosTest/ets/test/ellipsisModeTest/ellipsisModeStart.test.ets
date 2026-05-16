/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';

export default function EllipsisModeStartTest() {

  describe('EllipsisModeStartTest', () => {

    let PAGE_TAG = 'EllipsisModeStartTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`ellipsisModeTest/ellipsisModeStart`, done);
    });

    /**
     * @tc.name   EllipsisModeStartTest_0100
     * @tc.number EllipsisModeStartTest_0100
     * @tc.desc   test EllipsisModeStartTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('EllipsisModeStartTest_0100', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('EllipsisModeStartTest_0100 START');
      let driver = Driver.create();
        console.info('EllipsisModeStartTest_0100 START');
        await Utils.sleep(1000);
        let test1 = getInspectorByKey('text1');
        let obj:ESObject = JSON.parse(test1);
        console.log('EllipsisModeStartTest_0100---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_START");
        console.info("[EllipsisModeStartTest_0100] end");
      done();
    });
	/**
     * @tc.name   EllipsisModeStartTest_0200
     * @tc.number EllipsisModeStartTest_0200
     * @tc.desc   test EllipsisModeStartTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('EllipsisModeStartTest_0200', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('EllipsisModeStartTest_0200 START');
      let driver = Driver.create();
        console.info('EllipsisModeStartTest_0200 START');
        await Utils.sleep(1000);
        let test2 = getInspectorByKey('textInput1');
        let obj:ESObject = JSON.parse(test2);
        console.log('EllipsisModeStartTest_0200---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_START");
        console.info("[EllipsisModeStartTest_0200] end");
      done();
    });
	/**
     * @tc.name   EllipsisModeStartTest_0300
     * @tc.number EllipsisModeStartTest_0300
     * @tc.desc   test EllipsisModeStartTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('EllipsisModeStartTest_0300', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('EllipsisModeStartTest_0300 START');
      let driver = Driver.create();
        console.info('EllipsisModeStartTest_0300 START');
        await Utils.sleep(1000);
        let test3 = getInspectorByKey('textArea1');
        let obj:ESObject = JSON.parse(test3);
        console.log('EllipsisModeStartTest_0300---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_START");
        console.info("[EllipsisModeStartTest_0300] end");
      done();
    });
  })
}