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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import touch from 'libtouchndk.so';

export default function MultimodalkeycodeTest() {
  describe('MultimodalkeycodeTest', () => {

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0100
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0100
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0200
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0200
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0300
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0300
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0400
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0400
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0400';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0500
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0500
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0500';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0600
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0600
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0600';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode6();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0700
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0700
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0700';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode7();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0800
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0800
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0800';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode8();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_0900
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_0900
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_0900';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode9();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1000
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1000
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1000';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode10();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1100
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1100
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1100';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode11();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1200
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1200
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1200';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode12();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1300
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1300
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1300';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode13();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1400
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1400
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1400';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode14();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1500
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1500
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1500';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode15();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1600
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1600
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1600';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode16();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1700
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1700
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1700';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode17();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1800
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1800
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1800';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode18();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_1900
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_1900
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_1900';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode19();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2000
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2000
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2000';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode20();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2100
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2100
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2100';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode21();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2200
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2200
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2200';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode22();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2300
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2300
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2300';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode23();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2400
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2400
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2400';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode24();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2500
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2500
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2500';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode25();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyCodeNdk_2600
     * @tc.number SUB_MMI_Input_Api_KeyCodeNdk_2600
     * @tc.desc   KeyCode Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_KeyCodeNdk_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_KeyCodeNdk_2600';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.KeyCode26();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0100
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0100
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0200
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0200
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0300
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0300
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0400
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0400
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0400';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0500
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0500
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0500';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0600
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0600
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0600';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle6();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_PointerStyleNdk_0700
     * @tc.number SUB_MMI_Input_Api_PointerStyleNdk_0700
     * @tc.desc   PointerStyle Enumerated Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_PointerStyleNdk_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_PointerStyleNdk_0700';
      console.info(`${caseName} start to test`);
      try {
        let data = touch.PointerStyle7();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
      console.info(`${caseName} end to test`);
    });
  });
}