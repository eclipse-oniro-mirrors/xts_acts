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
let tag: string = 'SetGetUserPropertyTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function SetGetUserPropertyTest() {
  describe('SetGetUserPropertyTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testSetGetUserProperty01
     * @tc.number SUB_DFX_SetGetUserProperty_0100
     * @tc.desc   验证多次setUserProperty，userproperty名与值合法，getUserProperty获取userproperty值与设置一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty01', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty01 start');
      let propertyName = "";
      for (let i = 0; i < 256; i++) {
        propertyName += 'a'
      }
      let propertyValue = "";
      for (let i = 0; i < 1024; i++) {
        propertyValue += 'a'
      }
      try {
        hiAppEvent.setUserProperty("$", "a");
        let userPropertyValue1 = hiAppEvent.getUserProperty("$");
        expect(userPropertyValue1 == "a").assertTrue()
        hiAppEvent.setUserProperty("Ab123_$", "123");
        let userPropertyValue2 = hiAppEvent.getUserProperty("Ab123_$");
        expect(userPropertyValue2 == "123").assertTrue()
        hiAppEvent.setUserProperty(propertyName, propertyValue);
        let userPropertyValue3 = hiAppEvent.getUserProperty(propertyName);
        hilog.info(domain, tag, `testSetGetUserProperty01 > userPropertyValue3: ${userPropertyValue3}`);
        expect(userPropertyValue3 == propertyValue).assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserProperty01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty02
     * @tc.number SUB_DFX_SetGetUserProperty_0200
     * @tc.desc   验证多次setUserProperty，userproperty名重复，userproperty值更新
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty02', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty02 start');
      try {
        hiAppEvent.setUserProperty("testName", "testUserProperty")
        hiAppEvent.setUserProperty("testName", "testUserProperty1")
        let userPropertyValue = hiAppEvent.getUserProperty("testName")
        expect(userPropertyValue == "testUserProperty1").assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserProperty02 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty03
     * @tc.number SUB_DFX_SetGetUserProperty_0300
     * @tc.desc   验证setUserProperty，userproperty值为空字符，清除userproperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty03', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty03 start');
      try {
        hiAppEvent.setUserProperty("testName", "testUserProperty")
        hiAppEvent.setUserProperty("testName", "")
        let userPropertyValue = hiAppEvent.getUserProperty("testName")
        expect(userPropertyValue == "").assertTrue()
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testSetGetUserProperty03 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty04
     * @tc.number SUB_DFX_SetGetUserProperty_0400
     * @tc.desc   验证setUserProperty，userproperty名为空，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty04', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty04 start');
      try {
        hiAppEvent.setUserProperty("", "userPropertyValue")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty04 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty05
     * @tc.number SUB_DFX_SetGetUserProperty_0500
     * @tc.desc   验证setUserProperty，userproperty名257字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty05', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty05 start');
      let propertyName = "";
      for (let i = 0; i < 257; i++) {
        propertyName += 'a'
      }
      try {
        hiAppEvent.setUserProperty(propertyName, "userPropertyValue")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty05 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty06
     * @tc.number SUB_DFX_SetGetUserProperty_0600
     * @tc.desc   验证setUserProperty，userproperty名数字开头，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty06', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty06 start');
      let propertyName = "1testName";
      try {
        hiAppEvent.setUserProperty(propertyName, "userPropertyValue")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty06 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty07
     * @tc.number SUB_DFX_SetGetUserProperty_0700
     * @tc.desc   验证setUserProperty，userproperty值长度为1025字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty07', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty07 start');
      let propertyValue = "";
      for (let i = 0; i < 1025; i++) {
        propertyValue += 'a'
      }
      try {
        hiAppEvent.setUserProperty("testName", propertyValue)
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty07 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty08
     * @tc.number SUB_DFX_SetGetUserProperty_0800
     * @tc.desc   验证getUserProperty，userproperty名为空，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty08', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty08 start');
      try {
        hiAppEvent.getUserProperty("")
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty08 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty09
     * @tc.number SUB_DFX_SetGetUserProperty_0900
     * @tc.desc   验证getUserProperty，userproperty名长度为257字节，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty09', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty09 start');
      let propertyName = "";
      for (let i = 0; i < 257; i++) {
        propertyName += 'a'
      }
      try {
        hiAppEvent.getUserProperty(propertyName)
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty09 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });

    /**
     * @tc.name   testSetGetUserProperty10
     * @tc.number SUB_DFX_SetGetUserProperty_1000
     * @tc.desc   验证getUserProperty，userproperty名数字开头，返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGetUserProperty10', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testSetGetUserProperty10 start');
      let propertyName = "1testName";
      try {
        hiAppEvent.getUserProperty(propertyName)
        expect(false).assertTrue()
        done()
      }
      catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `testSetGetUserProperty10 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    });
  })
  hilog.info(domain, tag, 'SetGetUserPropertyTest end');
}