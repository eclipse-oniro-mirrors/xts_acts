/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SetGetUserIdTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function SetGetUserIdTest() {
  describe('SetGetUserIdTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testSetGetUserId01
     * @tc.number SUB_DFX_SetGetUserId_0100
     * @tc.desc   验证多次setUserId，用户id名与值合法，getUserId获取userid值与设置一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId01', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId01 start');
      let idName = "";
      for (let i = 0; i < 256; i++) {
        idName += 'a'
      }
      let idValue = "";
      for (let i = 0; i < 256; i++) {
        idValue += 'a'
      }
      try {
        hiAppEvent.setUserId("$", "a");
        let userIdValue1 = hiAppEvent.getUserId("$");
        expect(userIdValue1 == "a").assertTrue()
        hiAppEvent.setUserId("Ab123_$", "123");
        let userIdValue2 = hiAppEvent.getUserId("Ab123_$");
        expect(userIdValue2 == "123").assertTrue()
        hiAppEvent.setUserId(idName, idValue);
        let userIdValue3 = hiAppEvent.getUserId(idName);
        hilog.info(domain, tag, `testSetGetUserId01 > userIdValue2: ${userIdValue3}`);
        expect(userIdValue3 == idValue).assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserId01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId02
     * @tc.number SUB_DFX_SetGetUserId_0200
     * @tc.desc   验证setUserId，用户id名重复，用户id值更新
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId02', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId02 start');
      try {
        hiAppEvent.setUserId("testUserId", "testUserIdValue")
        hiAppEvent.setUserId("testUserId", "testUserIdValue1")
        let userIdValue = hiAppEvent.getUserId("testUserId")
        expect(userIdValue == "testUserIdValue1").assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserId02 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId03
     * @tc.number SUB_DFX_SetGetUserId_0300
     * @tc.desc   验证setUserId，用户id值为空字符，清除用户id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId03', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId03 start');
      try {
        hiAppEvent.setUserId("testUserId", "testUserIdValue")
        hiAppEvent.setUserId("testUserId", "")
        let userIdValue = hiAppEvent.getUserId("testUserId")
        expect(userIdValue == "").assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserId03 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId04
     * @tc.number SUB_DFX_SetGetUserId_0400
     * @tc.desc   验证setUserId，用户id名为空字符串，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId04', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId04 start');
      try {
        hiAppEvent.setUserId("", "testUserIdValue")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId04 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId05
     * @tc.number SUB_DFX_SetGetUserId_0500
     * @tc.desc   验证setUserId，用户id名257字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId05', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId05 start');
      let idName = "";
      for (let i = 0; i < 257; i++) {
        idName += 'a'
      }
      try {
        hiAppEvent.setUserId(idName, "testUserIdValue");
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId05 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId06
     * @tc.number SUB_DFX_SetGetUserId_0600
     * @tc.desc   验证setUserId，用户id名数字开头，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId06', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId06 start');
      let idName = "1testUserId";
      try {
        hiAppEvent.setUserId(idName, "testUserIdValue");
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId06 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId07
     * @tc.number SUB_DFX_SetGetUserId_0700
     * @tc.desc   验证setUserId，用户id值长度为257字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId07', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId07 start');
      let idValue = "";
      for (let i = 0; i < 257; i++) {
        idValue += 'a'
      }
      try {
        hiAppEvent.setUserId("testUserId", idValue);
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId07 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId08
     * @tc.number SUB_DFX_SetGetUserId_0800
     * @tc.desc   验证getUserId，用户id名为空，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId08', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId08 start');
      try {
        hiAppEvent.getUserId("")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId08 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId09
     * @tc.number SUB_DFX_SetGetUserId_0900
     * @tc.desc   验证getUserId，用户id名257字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId09', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId09 start');
      let idName = "";
      for (let i = 0; i < 257; i++) {
        idName += 'a'
      }
      try {
        hiAppEvent.getUserId(idName);
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId09 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserId10
     * @tc.number SUB_DFX_SetGetUserId_1000
     * @tc.desc   验证getUserId，用户id名数字开头，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserId10', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserId10 start');
      let idName = "1testUserId";
      try {
        hiAppEvent.getUserId(idName);
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserId10 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });
  })
  hilog.info(domain, tag, 'SetGetUserIdTest end');
}