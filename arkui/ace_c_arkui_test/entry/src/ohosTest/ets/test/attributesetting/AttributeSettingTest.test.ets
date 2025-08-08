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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function attributeSettingTest() {

  describe('AttributeSettingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0100
     * @tc.name: testAttributeSetting001
     * @tc.desc: testing setAttribute with nomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0200
     * @tc.name: testAttributeSetting002
     * @tc.desc: testing getAttribute with nomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0300
     * @tc.name: testAttributeSetting003
     * @tc.desc: testing resetAttribute with nomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0400
     * @tc.name: testAttributeSetting004
     * @tc.desc: testing setAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0500
     * @tc.name: testAttributeSetting005
     * @tc.desc: testing getAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0600
     * @tc.name: testAttributeSetting006
     * @tc.desc: testing resetAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0700
     * @tc.name: testAttributeSetting007
     * @tc.desc: testing setAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0800
     * @tc.name: testAttributeSetting008
     * @tc.desc: testing resetAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_0900
     * @tc.name: testAttributeSetting009
     * @tc.desc: testing setAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_ATTRIBUTE_SETTING_1000
     * @tc.name: testAttributeSetting010
     * @tc.desc: testing resetAttribute with abnomral value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAttributeSetting010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAttributeSetting010()).assertEqual(0)
      done()
    })
  })
}